import 'package:flutter/material.dart';

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
    return Container(
      child: Center(child: Text('Friends')),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
