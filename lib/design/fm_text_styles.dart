import 'package:flutter/material.dart';
import 'package:fm_music/design/fm_colors.dart';
import 'package:fm_music/design/fm_dimens.dart';

class FmTextStyles {


  static TextStyle title({Color color = FmColors.primaryText}) {
    return TextStyle(
        color: color, fontSize: FmDimens.hugeText, fontWeight: FontWeight.w700);
  }

  static TextStyle body({Color color = FmColors.primaryText}) {
    return TextStyle(
        color: color,
        fontSize: FmDimens.normalText,
        fontWeight: FontWeight.w500);
  }
}
