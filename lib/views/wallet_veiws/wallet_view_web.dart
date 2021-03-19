import 'package:flutter/material.dart';
import 'package:forus/controllers/tabbars_controllers/left_side_bar_controller.dart';
import 'package:forus/models/ui_models.dart';
import 'package:forus/views/general_views/sidebars/left_side_nav_bar.dart';
import 'package:get/get.dart';

class WalletScreenWeb extends StatefulWidget {
  const WalletScreenWeb({
    Key? key,
  }) : super(key: key);

  @override
  _WalletScreenWebState createState() => _WalletScreenWebState();
}

class _WalletScreenWebState extends State<WalletScreenWeb>
    with AutomaticKeepAliveClientMixin {
  final _menuItems = const [
    LeftSideMenuItem(
      text: 'My Earnings',
      icon: Icons.attach_money,

    ),
    LeftSideMenuItem(
      text: 'Tips',
      icon: Icons.money_rounded,
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('wallte web build');
    return Row(
      children: [
        _buildLeft(),
        const SizedBox(width: 10.0),
        _buildMiddle(),
        const SizedBox(width: 10.0),
        _buildRight(),
      ],
    );
  }

  Widget _buildLeft() {
    return Expanded(
      flex: 1,
      child: Align(
        alignment: Alignment.centerLeft,
        child: LeftSideBar(
          items: _menuItems,
          innerRout: true,
        ),
      ),
    );
  }

  Widget _buildMiddle() {
    return Expanded(
      flex: 2,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.only(top: 8.0),
          width: 700.0,
          child: GetBuilder<LeftSideBarController>(
            init: LeftSideBarController(),
            builder: (ctl) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(ctl.innerRout),
                ],
              );
            },
          ),
        ),
      ),
      // ),
    );
  }

  Widget _buildRight() {
    return Expanded(
      flex: 1,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          constraints: const BoxConstraints(
            maxWidth: 300.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              left: BorderSide(
                color: Colors.grey.shade700,
                width: 0.2,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Hot Topics',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(),
              Expanded(
                child: Text(
                  'Promotions',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(),
              Expanded(
                flex: 1,
                child: Text('bottom section'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
