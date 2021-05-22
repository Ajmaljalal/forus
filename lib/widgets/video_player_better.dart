import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:forus/configs/color_palette.dart';

class VideoBetterPlayer extends StatefulWidget {
  final String source;
  const VideoBetterPlayer({
    Key? key,
    required this.source,
  }) : super(key: key);

  @override
  _VideoBetterPlayerState createState() => _VideoBetterPlayerState();
}

class _VideoBetterPlayerState extends State<VideoBetterPlayer> {
  late BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    super.initState();
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.source,
    );
    _betterPlayerController = BetterPlayerController(
      BetterPlayerConfiguration(
          autoPlay: true,
          looping: true,
          fit: BoxFit.contain,
          showPlaceholderUntilPlay: true,
          aspectRatio: 2 / 1,
          controlsConfiguration: BetterPlayerControlsConfiguration(
              controlBarHeight: 30.0,
              controlBarColor: ColorPalette.primary.withOpacity(0.3),
              enableSkips: false,
              qualitiesIcon: Icons.high_quality_outlined,
              playbackSpeedIcon: Icons.speed_outlined,
              subtitlesIcon: Icons.subtitles,
              audioTracksIcon: Icons.audiotrack_outlined)),
      betterPlayerDataSource: betterPlayerDataSource,
    );
    _betterPlayerController.setVolume(0.0);
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 1,
      child: Container(
        color: ColorPalette.primary,
        child: BetterPlayer(
          controller: _betterPlayerController,
        ),
      ),
    );
  }
}
