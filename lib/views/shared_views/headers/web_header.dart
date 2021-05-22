import 'package:flutter/material.dart';
import 'package:forus/configs/color_palette.dart';
import 'package:forus/controllers/tabbars_controllers/left_side_bar_controller.dart';
import 'package:forus/models/models.dart';
import 'package:forus/views/shared_views/tab_bars/custom_tab_bar.dart';
import 'package:forus/widgets/circled_button.dart';
import 'package:forus/widgets/user_card.dart';
import 'package:get/get.dart';

class WebHeader extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const WebHeader({
    Key? key,
    required this.currentUser,
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 52.0,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                final LeftSideBarController ctl = Get.find();
                ctl.changeRout(rout: 'Home');
              },
              child: const Text(
                'pywast',
                style: const TextStyle(
                  color: ColorPalette.primary,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: 400.0,
            child: CustomTabBar(
              icons: icons,
              selectedIndex: selectedIndex,
              onTap: onTap,
              isBottomIndicator: true,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UserCard(user: currentUser),
                const SizedBox(width: 12.0),
                CircleButton(
                  icon: Icons.notifications,
                  iconSize: 20.0,
                  onPressed: () => print('notifications'),
                ),
                const SizedBox(width: 3.0),
                CircleButton(
                  icon: Icons.more_vert,
                  iconSize: 20.0,
                  onPressed: () => print('more'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
