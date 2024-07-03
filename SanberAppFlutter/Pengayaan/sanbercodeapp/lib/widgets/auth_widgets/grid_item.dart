import 'package:flutter/material.dart';

Widget buildGridItem(String imagePath) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10.0),
    child: Image.asset(
      imagePath,
      fit: BoxFit.cover,
    ),
  );
}
