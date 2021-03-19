import 'package:flutter/material.dart';
import 'package:forus/configs/color_palette.dart';
import 'package:forus/widgets/circled_button.dart';

class WalletScreenMobile extends StatefulWidget {
  const WalletScreenMobile({
    Key? key,
  }) : super(key: key);

  @override
  _WalletScreenMobileState createState() => _WalletScreenMobileState();
}

class _WalletScreenMobileState extends State<WalletScreenMobile>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('mobile home');
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: const Text(
            'Wallet',
            style: const TextStyle(
              color: ColorPalette.primary,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),
          centerTitle: false,
          floating: true,
          actions: [
            CircleButton(
              icon: Icons.search,
              iconSize: 20.0,
              onPressed: () => print('Search'),
            ),
            CircleButton(
              icon: Icons.notifications,
              iconSize: 20.0,
              onPressed: () => print('Messenger'),
            ),
            const SizedBox(width: 12.0),
          ],
        ),
        SliverToBoxAdapter(
          child: Center(child: Text('Friends')),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
