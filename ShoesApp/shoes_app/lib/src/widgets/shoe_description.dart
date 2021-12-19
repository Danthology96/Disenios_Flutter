import 'package:flutter/material.dart';

class ShoeDescription extends StatelessWidget {
  const ShoeDescription(
      {Key? key, required this.title, required this.description})
      : super(key: key);
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            description,
            style: const TextStyle(color: Colors.black54, height: 1.6),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
