import 'package:flutter/material.dart';

class BuyNowButton extends StatelessWidget {
  const BuyNowButton(
      {Key? key,
      required this.text,
      this.width = 120,
      this.height = 50,
      this.color = Colors.orange})
      : super(key: key);

  final String text;
  final double? width;
  final double? height;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
