import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFontWeight {
  AppFontWeight._();

  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}

TextStyle openSans(double fontSize, Color color, FontWeight fontWeight,
    {bool underline = false,
    bool overLine = false,
    Color decorationColor = Colors.black}) {
  return GoogleFonts.openSans(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    decoration: underline != false
        ? TextDecoration.underline
        : overLine != false
            ? TextDecoration.lineThrough
            : TextDecoration.none,
    decorationColor: decorationColor,
  );
}

TextStyle holtwoodOneSc(double fontSize, Color color, FontWeight fontWeight,
    {bool underline = false,
    bool overLine = false,
    Color decorationColor = Colors.black}) {
  return GoogleFonts.holtwoodOneSc(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    decoration: underline != false
        ? TextDecoration.underline
        : overLine != false
            ? TextDecoration.lineThrough
            : TextDecoration.none,
    decorationColor: decorationColor,
  );
}

TextStyle seymourOne(double fontSize, Color color, FontWeight fontWeight,
    {bool underline = false,
    bool overLine = false,
    Color decorationColor = Colors.black}) {
  return GoogleFonts.holtwoodOneSc(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    decoration: underline != false
        ? TextDecoration.underline
        : overLine != false
            ? TextDecoration.lineThrough
            : TextDecoration.none,
    decorationColor: decorationColor,
  );
}

TextStyle sFProDisplay(double fontSize, Color color, FontWeight fontWeight,
    {bool underline = false,
    bool overLine = false,
    Paint? foreground,
    double? height,
    Color decorationColor = Colors.black,
    List<Shadow>? shadows}) {
  return TextStyle(
    fontFamily: "SFProDisplay",
    fontSize: fontSize,
    color: color,
    shadows: shadows,
    fontWeight: fontWeight,
    foreground: foreground,
    height: height,
    decoration: underline != false
        ? TextDecoration.underline
        : overLine != false
            ? TextDecoration.lineThrough
            : TextDecoration.none,
  );
}

TextStyle notoKufiArabic(double fontSize, Color color, FontWeight fontWeight,
    {bool underline = false,
    bool overLine = false,
    Color decorationColor = Colors.black}) {
  return GoogleFonts.notoKufiArabic(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    decoration: underline != false
        ? TextDecoration.underline
        : overLine != false
            ? TextDecoration.lineThrough
            : TextDecoration.none,
    decorationColor: decorationColor,
  );
}

TextStyle satisfy(double fontSize, Color color, FontWeight fontWeight,
    {bool underline = false,
    bool overLine = false,
    List<Shadow>? shadows,
    Paint? foreground,
    Color decorationColor = Colors.black}) {
  return TextStyle(
    fontFamily: "Satisfy",
    fontSize: fontSize,
    color: color,
    shadows: shadows,
    fontWeight: fontWeight,
    foreground: foreground,
    decoration: underline != false
        ? TextDecoration.underline
        : overLine != false
            ? TextDecoration.lineThrough
            : TextDecoration.none,
  );
}

TextStyle droidArabicKufi(double fontSize, Color color, FontWeight fontWeight,
    {bool underline = false,
    bool overLine = false,
    Color decorationColor = Colors.black}) {
  return GoogleFonts.notoKufiArabic(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    decoration: underline != false
        ? TextDecoration.underline
        : overLine != false
            ? TextDecoration.lineThrough
            : TextDecoration.none,
    decorationColor: decorationColor,
  );
}

TextStyle hallelujah(double fontSize, Color color, FontWeight fontWeight,
    {bool underline = false,
    bool overLine = false,
    Color decorationColor = Colors.black}) {
  return GoogleFonts.gloriaHallelujah(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    decoration: underline != false
        ? TextDecoration.underline
        : overLine != false
            ? TextDecoration.lineThrough
            : TextDecoration.none,
    decorationColor: decorationColor,
  );
}

TextStyle roboto(double fontSize, Color color, FontWeight fontWeight,
    {bool underline = false,
    bool overLine = false,
    Color decorationColor = Colors.black}) {
  return GoogleFonts.roboto(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    decoration: underline != false
        ? TextDecoration.underline
        : overLine != false
            ? TextDecoration.lineThrough
            : TextDecoration.none,
    decorationColor: decorationColor,
  );
}

//SFProDisplay
TextStyle raleway(double fontSize, Color color, FontWeight fontWeight,
    {bool underline = false,
    bool overLine = false,
    Color decorationColor = Colors.black}) {
  return GoogleFonts.raleway(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    decoration: underline != false
        ? TextDecoration.underline
        : overLine != false
            ? TextDecoration.lineThrough
            : TextDecoration.none,
    decorationColor: decorationColor,
  );
}

TextStyle mCSJalySUAdorn(double fontSize, Color color, FontWeight fontWeight,
    {bool underline = false,
    bool overLine = false,
    Color decorationColor = Colors.black}) {
  return TextStyle(
    fontFamily: "MCSJalySUAdorn",
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    decoration: underline != false
        ? TextDecoration.underline
        : overLine != false
            ? TextDecoration.lineThrough
            : TextDecoration.none,
  );
}

TextStyle ubuntu(double fontSize, Color color, FontWeight fontWeight,
    {bool underline = false,
    bool overLine = false,
    Color decorationColor = Colors.black}) {
  return GoogleFonts.ubuntu(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    decoration: underline != false
        ? TextDecoration.underline
        : overLine != false
            ? TextDecoration.lineThrough
            : TextDecoration.none,
    decorationColor: decorationColor,
  );
}

TextStyle cairo(double fontSize, Color color, FontWeight fontWeight,
    {bool underline = false,
    bool overLine = false,
    Color decorationColor = Colors.black}) {
  return GoogleFonts.cairo(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    decoration: underline != false
        ? TextDecoration.underline
        : overLine != false
            ? TextDecoration.lineThrough
            : TextDecoration.none,
    decorationColor: decorationColor,
  );
}

TextStyle getFont(
    String font, double fontSize, Color color, FontWeight fontWeight,
    {bool underline = false,
    bool overLine = false,
    List<Shadow>? shadows,
    Color decorationColor = Colors.black}) {
  if (font == 'SFProDisplay') {
    return TextStyle(
      fontFamily: "SFProDisplay",
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      decoration: underline != false
          ? TextDecoration.underline
          : overLine != false
              ? TextDecoration.lineThrough
              : TextDecoration.none,
    );
  }
  return GoogleFonts.getFont(font,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      decoration: underline != false
          ? TextDecoration.underline
          : overLine != false
              ? TextDecoration.lineThrough
              : TextDecoration.none,
      decorationColor: decorationColor,
      shadows: shadows);
}
