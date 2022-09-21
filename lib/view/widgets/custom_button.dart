import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String textButton;
  final double height;
  final double width;
  final Color color;

  const CustomButton(
      {super.key,
      required this.textButton,
      this.height = 50,
      this.width = 150, this.color = Colors.orange});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        textButton,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
