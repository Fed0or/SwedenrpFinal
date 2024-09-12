import 'package:flutter/material.dart';

class TagPill extends StatelessWidget {
  final String tag;
  const TagPill({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Text(
        tag,
        style: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.bold),
      ),
    );
  }
}
