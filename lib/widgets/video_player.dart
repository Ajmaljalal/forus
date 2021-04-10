import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forus/widgets/responsive.dart';
import 'package:video_player/video_player.dart';
import 'package:forus/widgets/customIconButton.dart';
import 'package:visibility_detector/visibility_detector.dart';

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

    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_controller.value.size.height);
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
                  if (visiblePercentage > 70.0 &&
                      !_controller.value.isPlaying) {
                    _controller.play();
                  }
                },
                child: AspectRatio(
                  aspectRatio: Responsive.isMobile(context)
                      ? _controller.value.aspectRatio
                      : 16 / 9,
                  child: VideoPlayer(_controller),
                ),
              ),
              Positioned(
                bottom: 5.0,
                right: 5.0,
                child: CustomIconButton(
                  onTap: () {
                    _controller.value.volume > 0.0
                        ? _controller.setVolume(0.0)
                        : _controller.setVolume(1.0);
                  },
                  icon: CupertinoIcons.speaker_fill,
                  color: Colors.white,
                ),
              )
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
