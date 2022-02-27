import 'package:flutter/material.dart';
import 'package:symfonia/utils/images.dart';

Widget buildLoading() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(ImagesAsset.ripples),
    ],
  );
}
