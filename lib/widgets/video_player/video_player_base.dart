import 'dart:math';
import 'package:flutter/material.dart';
import 'package:forus/configs/color_palette.dart';
import 'package:forus/controllers/video_player_controllers/video_controller.dart';
import 'package:forus/widgets/video_player/video_player_controls.dart';
import 'package:forus/widgets/responsive.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPlayerBase extends StatelessWidget {
  const VideoPlayerBase({
    Key? key,
    required this.ctl,
    required Future<void> initializeVideoPlayerFuture,
    required VideoPlayerController controller,
  })   : _initializeVideoPlayerFuture = initializeVideoPlayerFuture,
        _controller = controller,
        super(key: key);

  final VideoContoller ctl;
  final Future<void> _initializeVideoPlayerFuture;
  final VideoPlayerController _controller;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (ctl.videoPosition != null) {
            _controller.seekTo(ctl.videoPosition);
          }
          return Stack(
            children: [
              VisibilityDetector(
                key: Key(Random().nextDouble().toString()),
                onVisibilityChanged: (visibilityInfo) {
                  var visiblePercentage = visibilityInfo.visibleFraction * 100;
                  if (visiblePercentage > 60.0) {
                    _controller.play();
                  }
                  // if (visibilityInfo.visibleFraction == 0) {
                  //   _controller.pause();
                  // }
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
              VideoPlayerControls(controller: _controller),
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
