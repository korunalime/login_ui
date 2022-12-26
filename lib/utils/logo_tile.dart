import 'package:flutter/material.dart';

class LogoTile extends StatelessWidget {
  final String imagePath;
  const LogoTile({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white70,
      ),
      child: Image.asset(
        imagePath,
        height: 50,
      ),
    );
  }
}
