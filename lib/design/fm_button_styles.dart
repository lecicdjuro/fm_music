import 'package:flutter/material.dart';
import 'package:fm_music/design/fm_colors.dart';

class FmButtonStyles {
  static ButtonStyle primaryButtonStyle(
      {Color color = FmColors.primaryButton}) {
    return ElevatedButton.styleFrom(
      onPrimary: Colors.black87,
      primary: Colors.grey[300],
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );
  }
}
