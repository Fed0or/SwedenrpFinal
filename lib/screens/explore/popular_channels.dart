import 'package:flutter/material.dart';
import 'package:sweden_roleplay/shared/custom_filled_field.dart';
import 'package:sweden_roleplay/shared/popular_channel_item.dart';
import 'package:sweden_roleplay/utils/data.dart';
import 'package:sweden_roleplay/screens/profile/profile.dart';

class PopularChannels extends StatelessWidget {
  final Function onPress;
  const PopularChannels({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    List<Streamer> streamers = getStreamers();

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    onPress();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                const Expanded(
                  child: CustomFilledField(
                    label: "Search games, channels...",
                    iconData: Icons.tune_outlined,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Vår Streamers",
                  style: TextStyle(
                    color: Color(0xFFCB6CE6),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Language: Swedish/English",
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 15,
                children: streamers.map((streamer) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Profile(streamer: streamer),
                        ),
                      );
                    },
                    child: PopularChannelItem(
                      imageUrl: streamer.imageUrl,
                      name: streamer.name,
                      variation: false,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}