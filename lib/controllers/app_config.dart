import 'dart:ui';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class AppConfig {
  double w = double.infinity;
  double h = double.infinity;
  //variables
  final Color _colorText = HexColor('#393a3a');
  final Color _backColor = HexColor('#F7F7F7');
  final Color _colorMain = HexColor('#30a84c');
  final String _imagePath = 'assets/images/';
  final String _iconPath = 'assets/icons/';
  //getter
  Color get colorText => _colorText;

  Color get backColor => _backColor;

  Color get colorMain => _colorMain;
  String get imagePath => _imagePath;
  String get iconPath => _iconPath;
}

AppConfig appConfig = AppConfig();
