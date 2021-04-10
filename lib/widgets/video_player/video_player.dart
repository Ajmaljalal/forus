import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forus/widgets/video_player/video_player_buttons.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:video_player/video_player.dart';
import 'package:forus/configs/color_palette.dart';
import 'package:forus/widgets/responsive.dart';

class VideoPlayerUtil extends StatefulWidget {
  final String source;
  VideoPlayerUtil({
    Key? key,
    required this.source,
  }) : super(key: key);

  @override
  _VideoPlayerUtilState createState() => _VideoPlayerUtilState();
}

class _VideoPlayerUtilState extends State<VideoPlayerUtil> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    if (!mounted) return;
    _controller = VideoPlayerController.network(widget.source);
    _controller.setVolume(0.0);
    _controller.setLooping(true);
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            children: [
              VisibilityDetector(
                key: Key(Random().nextDouble().toString()),
                onVisibilityChanged: (visibilityInfo) {
                  var visiblePercentage = visibilityInfo.visibleFraction * 100;
                  if (visiblePercentage > 60.0) {
                    _controller.play();
                  }
                },
                child: AspectRatio(
                  aspectRatio: Responsive.isMobile(context)
                      ? _controller.value.aspectRatio
                      : 16 / 9,
                  child: Container(
                    color: ColorPalette.primary,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
              VideoPlayerOverlayButtons(controller: _controller)
            ],
          );
        } else {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
