import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:forus/configs/color_palette.dart';
import 'package:forus/controllers/tabbars_controllers/left_side_bar_controller.dart';
import 'package:forus/models/ui_models.dart';
import 'package:get/get.dart';

class LeftSideBar extends StatefulWidget {
  final List<LeftSideMenuItem> items;
  final bool innerRout;

  LeftSideBar({Key? key, required this.items, required this.innerRout})
      : super(key: key);

  @override
  _LeftSideBarState createState() => _LeftSideBarState();
}

class _LeftSideBarState extends State<LeftSideBar>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('built left side menue');
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(
            color: Colors.grey.shade700,
            width: 0.2,
          ),
        ),
      ),
      constraints: const BoxConstraints(
        maxWidth: 280.0,
      ),
      child: Scrollbar(
        child: ListView(
          children: [
            ..._buildNavItems(),
            const Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                    'Sponsered',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildNavItems() {
    return widget.items
        .asMap()
        .map(
          (index, item) => MapEntry(index, _buildNavItem(item: item)),
        )
        .values
        .toList();
  }

  Widget _buildNavItem({required LeftSideMenuItem item}) {
    return GetBuilder<LeftSideBarController>(
      init: LeftSideBarController(),
      builder: (ctl) {
        final isDeActive =
            item.text == 'Pages' || item.text == 'Rooms' || item.text == 'Store'
                ? true
                : false;
        return Material(
          color: Colors.white,
          child: ListTile(
            onTap: () {
              widget.innerRout == true
                  ? ctl.changeInnerRout(rout: item.text)
                  : ctl.changeRout(rout: item.text);
            },
            mouseCursor: !isDeActive
                ? SystemMouseCursors.click
                : SystemMouseCursors.forbidden,
            enabled: !isDeActive,
            selected: ctl.currentRout == item.text ? true : false,
            trailing: isDeActive
                ? Text(
                    'Coming Soon...',
                    style: TextStyle(
                      color: ColorPalette.secondary.withOpacity(0.5),
                    ),
                  )
                : const SizedBox.shrink(),
            horizontalTitleGap: 5.0,
            leading: Icon(
              item.icon,
              size: 30.0,
              color: isDeActive
                  ? ColorPalette.primary.withOpacity(0.2)
                  : item.text == ctl.currentRout
                      ? ColorPalette.secondary
                      : ColorPalette.primary,
            ),
            title: Text(
              item.text,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: isDeActive
                    ? ColorPalette.primary.withOpacity(0.3)
                    : item.text == ctl.currentRout
                        ? ColorPalette.secondary
                        : ColorPalette.primary,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
