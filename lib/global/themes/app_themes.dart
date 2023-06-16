import 'package:flutter/material.dart';

const Color primaryColor = Color.fromRGBO(255, 255, 255, 1);
const Color accentColor = Color.fromRGBO(237, 46, 73, 1);
const Color backgroundColor = Color.fromRGBO(243, 243, 243, 1);
const Color secondaryColor = Color.fromRGBO(236, 165, 175, 1);

LinearGradient accentGradient = getGradient([
  const Color.fromRGBO(226, 38, 64, 0.75),
  const Color.fromRGBO(237, 46, 73, 0.82),
]);

LinearGradient getGradient(List<Color> colors) {
  return LinearGradient(
    colors: colors,
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

const String fontFamily = 'Ruda';

const bodyBold = TextStyle(
  fontSize: 16,
  fontFamily: fontFamily,
  fontWeight: FontWeight.w700,
  letterSpacing: 0.5,
);

const bodyMedium = TextStyle(
  fontSize: 16,
  fontFamily: fontFamily,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.5,
);

const bodyRegular = TextStyle(
  fontSize: 16,
  fontFamily: fontFamily,
  letterSpacing: 0.5,
);

const bodySemiBold = TextStyle(
  fontSize: 16,
  fontFamily: fontFamily,
  fontWeight: FontWeight.w600,
  letterSpacing: 0.5,
);

const button = TextStyle(
  fontSize: 14,
  fontFamily: fontFamily,
  fontWeight: FontWeight.w600,
  letterSpacing: 0.4,
);

const button2 = TextStyle(
  fontSize: 14,
  fontFamily: fontFamily,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.4,
);

const callout = TextStyle(
  fontSize: 10,
  fontFamily: fontFamily,
  fontWeight: FontWeight.w700,
  letterSpacing: 0.5,
);

const captionBold = TextStyle(
  fontSize: 12,
  fontFamily: fontFamily,
  fontWeight: FontWeight.w700,
  letterSpacing: 0.4,
);

const captionMedium = TextStyle(
  fontSize: 12,
  fontFamily: fontFamily,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.4,
);

const captionRegular = TextStyle(
  fontSize: 12,
  fontFamily: fontFamily,
  letterSpacing: 0.4,
);

const headlineBold = TextStyle(
  fontSize: 20,
  fontFamily: fontFamily,
  fontWeight: FontWeight.w700,
);

const headlineMedium = TextStyle(
  fontSize: 20,
  fontFamily: fontFamily,
  fontWeight: FontWeight.w500,
);

const headlineRegular = TextStyle(
  fontSize: 24,
  fontFamily: fontFamily,
);

const overline = TextStyle(
  fontSize: 8,
  fontFamily: fontFamily,
  fontWeight: FontWeight.w500,
  letterSpacing: -0.2,
);

const overline2 = TextStyle(
  fontSize: 10,
  fontFamily: fontFamily,
  fontWeight: FontWeight.w600,
  letterSpacing: -0.2,
);

const subheadRegular = TextStyle(
  fontSize: 18,
  fontFamily: fontFamily,
  letterSpacing: 0.1,
);

const subtitleMedium = TextStyle(
  fontSize: 18,
  fontFamily: fontFamily,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.15,
);

const highlighted = TextStyle(
  fontSize: 16,
  fontFamily: fontFamily,
  letterSpacing: 0.4,
  fontWeight: FontWeight.w700,
  color: accentColor,
);

const longText = TextStyle(
  fontSize: 16,
  fontFamily: fontFamily,
  letterSpacing: 0.4,
  fontWeight: FontWeight.normal,
);

const longTextAccent = TextStyle(
  fontSize: 16,
  fontFamily: fontFamily,
  letterSpacing: 0.4,
  fontWeight: FontWeight.normal,
  color: accentColor,
);

const headlineBoldLarge = TextStyle(
  fontSize: 26,
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: fontFamily,
  letterSpacing: 0.4,
);
