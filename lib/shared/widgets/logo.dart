import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double logoHeight;
  final double innerHeight;

  const LogoWidget({
    Key? key,
    required this.logoHeight,
    required this.innerHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        height: logoHeight,
        decoration: const BoxDecoration(
          color: Color(0xFFFFC82C),
          shape: BoxShape.circle,
        ),
        child: Container(
          height: innerHeight,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
