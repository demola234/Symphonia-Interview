import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:symfonia/utils/images.dart';

Widget customAppBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "History",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              SvgPicture.asset(ImagesAsset.filter),
              SizedBox(width: 8.0),
              Text(
                "Sort/Filter",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      )
    ],
  );
}
