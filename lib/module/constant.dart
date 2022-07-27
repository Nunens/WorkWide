import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

String faPrimaryFontFamily = 'IranYekan';
const Color kpink = Color.fromARGB(255, 220, 34, 174);
const Color kwhite = Color.fromARGB(255, 248, 234, 234);
const Color kwhitemeloo = Color(0xFFFFFFFF);
const Color kblack = Color.fromARGB(255, 0, 0, 0);
const Color kred = Color.fromARGB(255, 158, 4, 4);
const Color kyellow = Color.fromARGB(255, 227, 212, 6);
const Color klightgrean = Color.fromARGB(255, 214, 226, 44);
const Color kblackappbar = Color.fromARGB(255, 0, 0, 0);
const Color kblue = Color.fromARGB(255, 2, 27, 248);
const Color korange = Color.fromARGB(255, 252, 109, 0);
const Color grey = Color.fromARGB(255, 107, 106, 106);
const Color kpurple = Color.fromARGB(255, 57, 0, 68);
const Color kgreen = Color.fromARGB(255, 0, 96, 3);
const kViolet = Color(0xFF7E13C6);
const Color kgrey300 = Color.fromARGB(255, 120, 118, 118);
const Color kgrey800 = Color.fromARGB(255, 92, 91, 91);

const IconData arrowdownleft = CupertinoIcons.arrow_down_left;
const IconData arrowupright = CupertinoIcons.arrow_up_right;

class Constans {
  static const String projectId = "APP_WRITE_PROJECTID";
  static const String endpoint = 'http://localhost:8001/v1';

  static const double defultpadding = 20;
  static const double fontButtonSisze = 14;

  static const double smallpadding = 10;
  static const double normalPadding = 20;

  static const double defualtIconSize = 30;

  static const double smallBorderRadios = 10;
  static const double mediumBorderRadios = 18;
  static const double bigBorderRadios = 30;

  static const double smallSizedBox = 10;

  static const double smallIconSize = 16;
  static const double mediumsize = 24;

  static const textStyleFavoriteAndCartGrayStyle =
      TextStyle(color: grey, fontSize: 14);
  static const textStyleFavoriteViewAndBuy =
      TextStyle(color: kyellow, fontSize: 14);

  static Color navyblueshade1 = HexColor('#1C223A');
  static Color navyblueshade2 = HexColor('#1E233E');
  static Color navyblueshade3 = HexColor('#161A2C');
  static Color navyblueshade4 = HexColor('#20263F');
  static Color whiteShade1 = HexColor('#C7D8EB');
  static Color lightBlueShade = HexColor('#98B6C9');
}
