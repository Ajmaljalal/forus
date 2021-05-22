import 'package:chewie/chewie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forus/configs/color_palette.dart';
import 'package:forus/widgets/responsive.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerUtil extends StatefulWidget {
  // This will contain the URL/asset path which we want to play
  final String source;

  VideoPlayerUtil({
    required this.source,
    Key? key,
  }) : super(key: key);

  @override
  _VideoPlayerUtilState createState() => _VideoPlayerUtilState();
}

class _VideoPlayerUtilState extends State<VideoPlayerUtil> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayerFuture = initVideoPlayer();
  }

  Future<void> initVideoPlayer() async {
    _controller = VideoPlayerController.network(widget.source);
    _controller.setVolume(0.0);
    await _controller.initialize();
    setState(() {
      _chewieController = ChewieController(
        videoPlayerController: _controller,
        deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
        aspectRatio: _controller.value.aspectRatio,
        autoPlay: true,
        looping: true,
        autoInitialize: true,
        //TODO: need to change this in the future
        allowFullScreen: kIsWeb ? false : true,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(
              errorMessage,
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      );
      _chewieController.addListener(() {
        if (!_chewieController.isFullScreen) {
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: Responsive.isMobile(context)
                  ? _controller.value.aspectRatio
                  : 16 / 9,
              child: Container(
                color: ColorPalette.primary,
                child: Chewie(
                  controller: _chewieController,
                ),
              ),
            );
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const CircularProgressIndicator(),
              ),
            );
          }
        });
  }

  @override
  void dispose() {
    super.dispose();
    // IMPORTANT to dispose of all the used resources
    _controller.dispose();
    _chewieController.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
}
