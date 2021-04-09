import 'package:flutter/material.dart';
import 'package:video_viewer/video_viewer.dart';

class VideoPlayer extends StatefulWidget {
  VideoPlayer({
    Key? key,
  }) : super(key: key);

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  final VideoViewerController controller = VideoViewerController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: VideoViewer(
        controller: controller,
        style: VideoViewerStyle(
          thumbnail: Image.network(
            "https://play-lh.googleusercontent.com/aA2iky4PH0REWCcPs9Qym2X7e9koaa1RtY-nKkXQsDVU6Ph25_9GkvVuyhS72bwKhN1P",
          ),
        ),
        source: {
          "SubRip Text": VideoSource(
            video: VideoPlayerController.network(
                "https://www.speechpad.com/proxy/get/marketing/samples/standard-captions-example.mp4"),
          ),
        },
      ),
    );
  }
}
