import 'package:flutter/material.dart';

final int kMyVersion = 0;
final int kMinimumVersionIfError = 9999;

const double kDefaultMargin = 25.0;
const double kDefaultPadding = 25.0;

const kPrimaryColor = appBlue;
const kSecondaryColor = Color(0xff797979);
const kBlack = Color(0xff555555);
const kGrey = Color(0xffcccccc);
const kGreyLight = Color(0xffe2e2e2);
const kBlueCupertino = Color(0xff3092C3);
const kGreyCupertino = Color(0xff717071);

const white = Colors.white;
const deepBlue = Color(0xff01548E);
const blueGrey = Color(0xff405364);
// const darkBlue = Color(0xff222F37);
const black = Colors.black;
// const grey = Color(0xffC4C4C4);
const brownForWood = Color(0xff66431a);
const appBlue = Colors.blue;
const appSkyblue = Color(0xffDAEBF7);
const appBackgroundGrey = Color(0xffF2F2F2);
const appButtonGrey = Color(0xffB5B5B5);
const appTextGrey = Color(0xffB5B5B5);
const appDividerGrey = Color(0xffe5e5e5);
const appBarIconGrey = Color(0xff858585);
const appBottomGrey = Color(0xfff2f2f2);
const appSliderGrey = Color(0xffCCCCCC);
const textColorForWood = brownForWood;

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
