import 'package:flutter/material.dart';
import 'package:responsive_dash_board/utils/responsive_font_size.dart';

abstract class AppStyles {
  static TextStyle styleRegular16 = TextStyle(
    color: Color(0xff064060),
    fontSize: getResponsiveFontSize(fontSize: 16),
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
  );

  static TextStyle styleBold16 = TextStyle(
    color: Color(0xff4eb7f2),
    fontSize: getResponsiveFontSize(fontSize: 16),
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w700,
  );

  static TextStyle styleMedium14 = TextStyle(
    color: Color(0xff064061),
    fontSize: getResponsiveFontSize(fontSize: 14),
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
  );

  static TextStyle styleMedium16 = TextStyle(
    color: Color(0xff064061),
    fontSize: getResponsiveFontSize(fontSize: 16),
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w500,
  );

  static TextStyle styleMedium20 = TextStyle(
    color: Color(0xffffffff),
    fontSize: getResponsiveFontSize(fontSize: 20),
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w500,
  );

  static TextStyle styleSemiBold16 = TextStyle(
    color: Color(0xff064061),
    fontSize: getResponsiveFontSize(fontSize: 16),
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
  );

  static TextStyle styleSemiBold20 = TextStyle(
    color: Color(0xff064061),
    fontSize: getResponsiveFontSize(fontSize: 16),
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
  );

  static TextStyle styleSemiBold24 = TextStyle(
    color: Color(0xff064061),
    fontSize: getResponsiveFontSize(fontSize: 24),
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
  );

  static TextStyle styleRegular12 = TextStyle(
    color: Color(0xff064061),
    fontSize: getResponsiveFontSize(fontSize: 12),
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
  );

  static TextStyle styleRegular14 = TextStyle(
    color: Color(0xffaaaaaa),
    fontSize: getResponsiveFontSize(fontSize: 14),
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
  );

  static TextStyle styleSemiBold18 = TextStyle(
    color: Color(0xff4eb7f2),
    fontSize: getResponsiveFontSize(fontSize: 18),
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
  );
}
