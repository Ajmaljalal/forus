import 'package:flutter/material.dart';
import 'package:forus/data_models/ui_models.dart';

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
    return ListTile(
      onTap: item.onTap,
      selectedTileColor: Colors.white,
      selected: wall == item.text ? true : false,
      horizontalTitleGap: 5.0,
      leading: Icon(
        item.icon,
        size: 30.0,
      ),
      title: Text(
        item.text,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
