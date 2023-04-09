import 'package:flutter/material.dart';

class PngIcon extends StatelessWidget {
  final String path;

  final double size;

  const PngIcon({required this.path, required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
    );
  }
}
