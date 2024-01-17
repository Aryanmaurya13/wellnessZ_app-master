import 'package:flutter/material.dart';


Widget buildFullscreenImage(String assetName) {
  return Image.asset(
    'assets/PNG/$assetName',
    fit: BoxFit.cover,
    height: double.infinity,
    width: double.infinity,
    alignment: Alignment.center,
  );
}