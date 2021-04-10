import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoContoller extends GetxController {
  bool isMute = true;
  bool isPlaying = true;
  bool showOverlay = false;

  changeMute({required VideoPlayerController controller}) {
    controller.value.volume > 0.0
        ? controller.setVolume(0.0)
        : controller.setVolume(1.0);
    isMute = controller.value.volume > 0.0 ? false : true;
    update();
  }

  playPause({required VideoPlayerController controller}) {
    controller.value.isPlaying ? controller.pause() : controller.play();
    isPlaying = controller.value.isPlaying;
    update();
  }

  changeShowOverlay({required bool show}) {
    showOverlay = show;
    update();
  }
}
