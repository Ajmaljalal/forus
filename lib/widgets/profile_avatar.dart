import 'package:flutter/material.dart';
import 'package:forus/configs/color_palette.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool hasBorder;

  const ProfileAvatar({
    Key? key,
    required this.imageUrl,
    this.isActive = false,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.grey[200],
          backgroundImage: NetworkImage(imageUrl),
        ),
        isActive
            ? Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  height: 15.0,
                  width: 15.0,
                  decoration: const BoxDecoration(
                    color: ColorPalette.online,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
