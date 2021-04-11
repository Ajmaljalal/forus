import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forus/configs/color_palette.dart';
import 'package:forus/controllers/video_player_controllers/video_controller.dart';
import 'package:forus/widgets/customIconButton.dart';
import 'package:forus/widgets/video_player/video_player.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:video_player/video_player.dart';
import 'package:forus/utils/video_duration_formater.dart';

class VideoPlayerControls extends StatefulWidget {
  const VideoPlayerControls({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final VideoPlayerController controller;

  @override
  _VideoPlayerControlsState createState() => _VideoPlayerControlsState();
}

class _VideoPlayerControlsState extends State<VideoPlayerControls> {
  int _currentPosition = 0;

  @override
  void initState() {
    if (mounted) {
      setState(() {
        _currentPosition = widget.controller.value.position.inMilliseconds;
      });
    }
    _attachListenerToController();
    super.initState();
  }

  _attachListenerToController() {
    widget.controller.addListener(
      () {
        if (widget.controller.value.duration == null ||
            widget.controller.value.position == null) {
          return;
        }
        if (mounted) {
          setState(() {
            _currentPosition = widget.controller.value.position.inMilliseconds;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    widget.controller.removeListener(_attachListenerToController);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  Column(
                    children: [
                      _buildVideoProgressBar(ctl),
                      _buildBottomOverlay(ctl),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildBottomOverlay(ctl) {
    List<Color> _colors = [
      ColorPalette.primary.withOpacity(0.8),
      ColorPalette.primary.withOpacity(0.005)
    ];
    List<double> _stops = [0.0, 1.0];
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
        child: _buildBottomControllers(ctl),
      ),
    );
  }

  Widget _buildBottomControllers(ctl) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildPlayPauseButtonsAndDuration(ctl),
        _buildFullScreenOptions(ctl),
      ],
    );
  }

  Widget _buildVideoProgressBar(ctl) {
    return ctl.showOverlay
        ? SizedBox(
            height: 10.0,
            child: VideoProgressIndicator(
              widget.controller,
              allowScrubbing: true,
              colors: VideoProgressColors(
                bufferedColor: Colors.white70,
                backgroundColor: Colors.grey,
              ),
            ),
          )
        : const SizedBox.shrink();
  }

  Widget _buildPlayPauseButtonsAndDuration(ctl) {
    final duration =
        '${durationFormatter(_currentPosition)} / ${durationFormatter(widget.controller.value.duration.inMilliseconds)}';
    return ctl.showOverlay
        ? Row(
            children: [
              CustomIconButton(
                onTap: () {
                  ctl.playPause(controller: widget.controller);
                },
                icon: ctl.isPlaying
                    ? CupertinoIcons.pause_fill
                    : CupertinoIcons.play_fill,
                color: Colors.white70,
              ),
              const SizedBox(width: 8.0),
              CustomIconButton(
                onTap: () {
                  ctl.changeMute(controller: widget.controller);
                },
                icon: ctl.isMute
                    ? CupertinoIcons.speaker_fill
                    : CupertinoIcons.speaker_2_fill,
                color: Colors.white70,
              ),
              const SizedBox(width: 5.0),
              Card(
                color: ColorPalette.primary.withOpacity(0.8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 3.0, vertical: 1.0),
                  child: Text(
                    duration,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
            ],
          )
        : const SizedBox.shrink();
  }

  Widget _buildFullScreenOptions(ctl) {
    return ctl.showOverlay
        ? CustomIconButton(
            onTap: () {
              // save the current position of the video to the controller
              ctl.setCurrentVideoPosition(
                  currentPosition: widget.controller.value.position);
              // if fullScreen then close it, if not open full screen
              ctl.isFullScreen
                  ? ctl.exitFullScreen()
                  : _openVideoInFullScreen(ctl);

            },
            icon: ctl.isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
            color: Colors.white70,
          )
        : const SizedBox.shrink();
  }

  _openVideoInFullScreen(ctl) {
    widget.controller.pause();
    ctl.goToFullScreen();
    return Get.dialog(
      Scaffold(
        body: Center(
          child: VideoPlayerUtil(
            source: widget.controller.dataSource,
          ),
        ),
      ),
    );
  }
}
