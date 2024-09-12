import 'package:flutter/material.dart';
import 'package:streamingapp/utils/data.dart';
import 'package:streamingapp/shared/rounded_label.dart';
import 'package:streamingapp/shared/broadcast_item.dart';

class StreamerItem extends StatelessWidget {
  final Streamer streamer;
  final Function onPress;

  const StreamerItem({super.key, required this.streamer, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    streamer.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                const RoundedLabel(
                  small: true,
                  color: Colors.red,
                  text: "Live",
                ),
              ],
            ),
          ),
          BroadcastItem(
            live: true,
            title: streamer.username,
            users: streamer.followers,
            imageUrl: streamer.imageUrl,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
            child: Text(
              streamer.description,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}