import 'package:flutter/material.dart';
import 'package:forus/configs/color_palette.dart';
import 'package:forus/models/models.dart';
import 'package:forus/widgets/circled_button.dart';
import 'package:forus/widgets/user_card.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomAppBar({
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
      height: 65.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          const BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: const Text(
              'forus',
              style: const TextStyle(
                color: ColorPalette.primary,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
          ),
          // Container(
          //   height: double.infinity,
          //   width: 600.0,
          //   child: CustomTabBar(
          //     icons: icons,
          //     selectedIndex: selectedIndex,
          //     onTap: onTap,
          //     isBottomIndicator: true,
          //   ),
          // ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UserCard(user: currentUser),
                const SizedBox(width: 12.0),
                CircleButton(
                  icon: Icons.search,
                  iconSize: 20.0,
                  onPressed: () => print('Search'),
                ),
                const SizedBox(width: 3.0),
                CircleButton(
                  icon: Icons.notifications,
                  iconSize: 20.0,
                  onPressed: () => print('Messenger'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
