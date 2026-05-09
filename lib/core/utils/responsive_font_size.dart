import 'package:finDashBoard/core/utils/size_config.dart';
import 'package:flutter/material.dart';

double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // another solution ....
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width =
  //     physicalWidth /
  //     devicePixelRatio; // this width is equal to width from MediaQuery ...

  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 900;
  } else if (width < SizeConfig.desktop) {
    return (width / 1000).clamp(0.9, 1.1);
  } else {
    return width / 1920;
  }
}
