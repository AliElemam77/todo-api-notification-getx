import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle(Color color, double size, FontWeight fontweight) {
  return GoogleFonts.nunito(
    fontSize: size,
    fontWeight: fontweight,
    color: color,
  );
}
