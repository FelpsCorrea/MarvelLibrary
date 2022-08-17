import 'package:flutter/cupertino.dart';

class MarvelTheme {
  static const Color white = Color(0xFFFFFFFF);
  static const Color dark = Color(0xFF000000);
  static const burgundy = <int, Color>{
    8: Color(0xFF8d150c),
    16: Color(0xFF840704),
    24: Color(0xFF770000),
    40: Color(0xFF770000),
    64: Color(0xFF770000),
    100: Color(0xFF5f0b16),
    120: Color(0xFF3f070f),
    150: Color.fromARGB(255, 31, 2, 6)
  };

  ////// Neutral Colors
  static const Color neutralHighPure = Color(0xFFFFFFFF);
  static const Color neutralHighLight = Color(0xFFF6F6FA);
  static const Color neutralHighMedium = Color(0xFFF1F1F5);
  static const Color neutralHighDark = Color(0xFFE2E2EA);
  static const Color neutralHighDarker = Color(0xFF92929D);

  static const Color neutralLowPure = Color(0xFF000000);
  static const Color neutralLowExtra = Color(0xFF4F4F5A);
  static const Color neutralLowLightest = Color(0xFF41414B);
  static const Color neutralLowLight = Color(0xFF292932);
  static const Color neutralLowMedium = Color(0xFF1C1C24);
  static const Color neutralLowDark = Color(0xFF13131A);

  static const Color lowDarkGray = Color(0xFF444C54);
  static const Color mediumDarkGray = Color(0xFF343A40);
  static const Color highDarkGray = Color(0xFF23272b);
  static const Color superDarkGray = Color(0xFF121517);
  static const Color ultraDarkGray = Color(0xFF070809);
  static const Color hyperDarkGray = Color(0xFF020202);
}
