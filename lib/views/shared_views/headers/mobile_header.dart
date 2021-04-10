import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:forus/configs/color_palette.dart';
import 'package:forus/views/new_post_views/create_new_post_mobile.dart';
import 'package:forus/widgets/customIconButton.dart';
import 'package:get/get.dart';

class MobileHeader extends StatelessWidget {
  const MobileHeader({
    Key? key,
  }) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.3,
      centerTitle: false,
      title: const Text(
        'pywast',
        style: const TextStyle(
          color: ColorPalette.primary,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          letterSpacing: -1.2,
        ),
      ),
      actions: [
        CustomIconButton(
          icon: CupertinoIcons.plus_app,
          onTap: () {
            Get.to(() => CreateNewPostMobile());
          },
        ),
        const SizedBox(width: 5.0),
        CustomIconButton(
          icon: CupertinoIcons.search,
          onTap: () => print('Search'),
        ),
        CustomIconButton(
          icon: CupertinoIcons.money_dollar,
          onTap: () => print('set preferences'),
        ),
        const SizedBox(width: 8.0),
      ],
    );
  }
}
