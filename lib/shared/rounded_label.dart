import 'package:flutter/material.dart';

class RoundedLabel extends StatelessWidget {
  final bool small;
  final Color color;
  final String text;

  const RoundedLabel(
      {super.key,
      required this.small,
      required this.color,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: small ? 10 : 16, vertical: small ? 4 : 8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(
          width: 2,
          color: color,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
