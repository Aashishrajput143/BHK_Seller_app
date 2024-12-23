import 'package:flutter/cupertino.dart';

class SizeConfig {

  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  static double? _safeAreaHorizontal;
  static double? _safeAreaVertical;
  static double? safeBlockHorizontal;
  static double? safeBlockVertical;
  static Orientation? orientation;
  static double? defaultSize;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData?.size.width;
    screenHeight = _mediaQueryData?.size.height;
    orientation = _mediaQueryData?.orientation;
    defaultSize = orientation == Orientation.portrait
        ? screenWidth! * 0.03
        : screenHeight! * 0.03;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;

    _safeAreaHorizontal =
        (_mediaQueryData?.padding.left??0.0 + _mediaQueryData!.padding.right);
    _safeAreaVertical =
        _mediaQueryData?.padding.top??0.0 + _mediaQueryData!.padding.bottom;
    safeBlockHorizontal = (screenWidth! - _safeAreaHorizontal!) / 100;
    safeBlockVertical = (screenHeight! - _safeAreaVertical!) / 100;
  }
}