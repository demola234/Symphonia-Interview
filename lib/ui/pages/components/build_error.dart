import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildError(String error) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
        child: Text(
          error.toString(),
          style: GoogleFonts.poppins(),
        ),
      ),
    ],
  );
}
