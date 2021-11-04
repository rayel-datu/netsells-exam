import 'package:flutter/material.dart';

extension StringExtension on String {
  Color toColor() {
    return Color(int.parse(replaceAll('#', '0xFF')));
  }
}
