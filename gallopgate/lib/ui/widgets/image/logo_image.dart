import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({
    super.key,
    this.height = 100.0,
    this.width = 100.0,
    this.scale = 30.0,
  });

  final double height, width, scale;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Image.asset(
        'assets/images/logo/png/logo_light.png',
        height: height,
        width: width,
        scale: scale,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
