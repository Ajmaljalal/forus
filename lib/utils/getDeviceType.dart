import 'package:flutter/cupertino.dart';

getDeviceType({required ctx}) {
  String deviceType;
  final double width = MediaQuery.of(ctx).size.width;

  print(width);

  if (width > 1000) {
    deviceType = 'desktop';
  } else if (width > 600) {
    deviceType = 'tablet';
  } else {
    deviceType = 'mobile';
  }
  return deviceType;
}
