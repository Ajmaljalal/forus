import 'package:flutter/material.dart';
import 'package:forus/configs/color_palette.dart';
import 'package:forus/views/wallet_veiws/wallet_view_mobile.dart';
import 'package:forus/views/wallet_veiws/wallet_view_web.dart';
import 'package:forus/widgets/responsive.dart';

class Wallet extends StatelessWidget {
  const Wallet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('Wallet build');
    return Scaffold(
      backgroundColor: ColorPalette.scaffold,
      body: Responsive(
        mobile: WalletScreenMobile(),
        desktop: WalletScreenWeb(),
      ),
    );
  }
}
