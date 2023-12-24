import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension StringConverts on String {
  String get toPng => "assets/img/$this.png";

  String get toImg => "assets/img/$this";

  String get toSvg => "assets/img/$this.svg";

  double get toDouble => double.tryParse(this) ?? 0;

  int get toInt => int.tryParse(this) ?? 0;
}

extension NumConverts on int {
  Color get toColor => Color(this);

  BorderRadiusGeometry get toCircular => BorderRadius.circular(this.r);
}

