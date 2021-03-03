import 'package:flutter/material.dart';

class RightSideBar extends StatefulWidget {
  RightSideBar({Key key}) : super(key: key);

  @override
  _RightSideBarState createState() => _RightSideBarState();
}

class _RightSideBarState extends State<RightSideBar> {
  String currentWall = 'Home';

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 300.0,
        minWidth: 200.0,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 0.92,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              _buildNavItem(item: 'Home', icon: Icons.home),
              _buildNavItem(
                  item: 'My Wallet', icon: Icons.monetization_on_rounded),
              _buildNavItem(item: 'Friends', icon: Icons.people_alt_rounded),
              _buildNavItem(item: 'Pages', icon: Icons.pages),
              _buildNavItem(item: 'Channels', icon: Icons.video_library),
              _buildNavItem(item: 'Groups', icon: Icons.group_work_sharp),
              _buildNavItem(item: 'Schools', icon: Icons.school_rounded),
              _buildNavItem(item: 'Marketplace', icon: Icons.shopping_cart),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'Sponsered',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _buildAd(),
                    _buildAd(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({String item, IconData icon}) {
    return ListTile(
      onTap: () {
        setState(() {
          currentWall = item;
        });
      },
      selectedTileColor: Colors.white,
      selected: currentWall == item ? true : false,
      horizontalTitleGap: 5.0,
      leading: Icon(
        icon,
        size: 30.0,
      ),
      title: Text(item),
    );
  }

  Widget _buildAd() {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          child: Text(
              'An ad here for earning more mony you will be good. An ad here for earning more mony you will be good. An ad here for earning more mony you will be good.An ad here for earning more mony you will be good.'),
        ),
      ),
    );
  }
}
