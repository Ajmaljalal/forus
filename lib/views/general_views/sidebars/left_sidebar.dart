import 'package:flutter/material.dart';
import 'package:forus/controllers/home_controllers/Left_menu_controller.dart';
import 'package:forus/models/ui_models.dart';
import 'package:get/get.dart';

class LeftSideBar extends StatefulWidget {
  final String currentWall;
  final List<LeftSideMenuItem> items;

  LeftSideBar({
    Key? key,
    required this.items,
    required this.currentWall,
  }) : super(key: key);

  @override
  _LeftSideBarState createState() => _LeftSideBarState();
}

class _LeftSideBarState extends State<LeftSideBar>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('built left side menue');
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 300.0,
        minWidth: 250.0,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 1 - 58.0,
        child: Scrollbar(
          child: ListView(
            children: [
              ..._buildNavItems(),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: const Text('Sponsered',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildNavItems() {
    return widget.items
        .asMap()
        .map(
          (index, item) => MapEntry(
              index, _buildNavItem(item: item, wall: widget.currentWall)),
        )
        .values
        .toList();
  }

  Widget _buildNavItem({
    required LeftSideMenuItem item,
    required String wall,
  }) {
    return GetBuilder<LeftMenueController>(
      init: LeftMenueController(),
      builder: (ctl) {
        return ListTile(
          onTap: () {
            ctl.changeRout(rout: item.text);
          },
          selectedTileColor: Colors.white,
          hoverColor: Colors.white,
          horizontalTitleGap: 5.0,
          leading: Icon(
            item.icon,
            size: 30.0,
            color: Colors.indigo,
          ),
          title: Text(
            item.text,
            overflow: TextOverflow.ellipsis,
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
