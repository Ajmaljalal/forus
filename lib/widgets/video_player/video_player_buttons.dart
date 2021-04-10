import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forus/configs/color_palette.dart';
import 'package:forus/controllers/video_player_controllers/video_controller.dart';
import 'package:forus/widgets/customIconButton.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerOverlayButtons extends StatelessWidget {
  const VideoPlayerOverlayButtons({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    List<Color> _colors = [
      ColorPalette.primary.withOpacity(0.8),
      ColorPalette.primary.withOpacity(0.005)
    ];
    List<double> _stops = [0.0, 1.0];
    return GetBuilder<VideoContoller>(
        init: VideoContoller(),
        builder: (ctl) {
          return Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                ctl.changeShowOverlay(show: !ctl.showOverlay);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox.shrink(),
                  Container(
                    height: 35.0,
                    decoration: ctl.showOverlay
                        ? BoxDecoration(
                            gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: _colors,
                            stops: _stops,
                          ))
                        : null,
                    // color: ctl.showOverlay
                    //     ? ColorPalette.primary.withOpacity(0.3)
                    //     : Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 8.0),
                      child: _buildBottomControllers(ctl),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildBottomControllers(ctl) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildPlayPauseButtons(ctl),
        Card(
          color: ColorPalette.primary.withOpacity(0.8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 1.0),
            child: Text(
              controller.value.duration.toString().split('.')[0],
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPlayPauseButtons(ctl) {
    return ctl.showOverlay
        ? Row(
            children: [
              CustomIconButton(
                onTap: () {
                  ctl.playPause(controller: controller);
                },
                icon: ctl.isPlaying
                    ? CupertinoIcons.pause_fill
                    : CupertinoIcons.play_fill,
                color: Colors.white70,
              ),
              const SizedBox(width: 8.0),
              CustomIconButton(
                onTap: () {
                  ctl.changeMute(controller: controller);
                },
                icon: ctl.isMute
                    ? CupertinoIcons.speaker_fill
                    : CupertinoIcons.speaker_2_fill,
                color: Colors.white70,
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
