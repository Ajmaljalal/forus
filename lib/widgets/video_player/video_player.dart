import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forus/controllers/video_player_controllers/video_controller.dart';
import 'package:forus/widgets/responsive.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:forus/widgets/video_player/video_player_base.dart';

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
    Get.put(VideoContoller());
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final VideoContoller ctl = Get.find();
    return Responsive.isDesktop(context)
        ? MouseRegion(
            onHover: (_) {
              ctl.changeShowOverlay(show: true);
            },
            onExit: (_) {
              ctl.changeShowOverlay(show: false);
            },
            child: VideoPlayerBase(
              ctl: ctl,
              initializeVideoPlayerFuture: _initializeVideoPlayerFuture,
              controller: _controller,
            ),
          )
        : VideoPlayerBase(
            ctl: ctl,
            initializeVideoPlayerFuture: _initializeVideoPlayerFuture,
            controller: _controller,
          );
  }
}
