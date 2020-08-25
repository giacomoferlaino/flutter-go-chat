import 'package:flutter/material.dart';

const int _primaryValue = 0xFF62BDC0;
const int _accentValue = 0xFF1D3557;
const int _errorValue = 0xFFE63946;

const MaterialColor primary = const MaterialColor(
  _primaryValue,
  <int, Color>{
    50: Color(0xFFF4FAFB),
    100: Color(0xFFE9F6F6),
    200: Color(0xFFC8E8E9),
    300: Color(0xFFB2DFE0),
    400: Color(0xFF85CCCE),
    500: Color(_primaryValue),
    600: Color(0xFF45AAAD),
    700: Color(0xFF37888B),
    800: Color(0xFF296668),
    900: Color(0xFF1C4445),
  },
);

const MaterialColor accent = const MaterialColor(
  _accentValue,
  <int, Color>{
    50: Color(0xFFDAE4F3),
    100: Color(0xFFB5CAE6),
    200: Color(0xFF91AFDA),
    300: Color(0xFF3663A2),
    400: Color(0xFF2A4C7D),
    500: Color(_accentValue),
    600: Color(0xFF1A2F4D),
    700: Color(0xFF162842),
    800: Color(0xFF122237),
    900: Color(0xFF0F1B2C),
  },
);

const MaterialColor error = const MaterialColor(
  _errorValue,
  <int, Color>{
    50: Color(0xFFFCE6E8),
    100: Color(0xFFF9CDD1),
    200: Color(0xFFF0828B),
    300: Color(0xFFEC6974),
    400: Color(0xFFE9505D),
    500: Color(_errorValue),
    600: Color(0xFFDE1B2C),
    700: Color(0xFFBF1825),
    800: Color(0xFF9F141F),
    900: Color(0xFF7F1019),
  },
);
