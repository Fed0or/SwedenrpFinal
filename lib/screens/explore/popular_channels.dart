import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:streamingapp/shared/custom_filled_field.dart';
import 'package:streamingapp/shared/popular_channel_item.dart';
import 'package:streamingapp/utils/data.dart';
import 'package:streamingapp/screens/games/streamer_detail.dart';

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
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StreamerDetail(
                            streamer: streamers.firstWhere((s) => s.name == "1.cuz"),
                            onPress: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      );
                    },
                    child: const PopularChannelItem(
                      imageUrl: "assets/images/user_1.jpg",
                      name: "1.Cuz",
                      variation: false,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StreamerDetail(
                            streamer: streamers.firstWhere((s) => s.name == "GhostAlby"),
                            onPress: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      );
                    },
                    child: const PopularChannelItem(
                      imageUrl: "assets/images/user_2.jpg",
                      name: "GhostAlby",
                      variation: false,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StreamerDetail(
                            streamer: streamers.firstWhere((s) => s.name == "Huncho"),
                            onPress: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      );
                    },
                    child: const PopularChannelItem(
                      imageUrl: "assets/images/user_3.jpg",
                      name: "Huncho",
                      variation: false,
                    ),
                  ),
                  const PopularChannelItem(
                    imageUrl: "assets/images/avatar_4.jpg",
                    name: "RFGust",
                    variation: false,
                  ),
                  const PopularChannelItem(
                    imageUrl: "assets/images/avatar_5.jpg",
                    name: "xLinux",
                    variation: false,
                  ),
                  const PopularChannelItem(
                    imageUrl: "assets/images/avatar_6.jpg",
                    name: "mgpotonaxx",
                    variation: false,
                  ),
                  const PopularChannelItem(
                    imageUrl: "assets/images/avatar_7.jpg",
                    name: "mian",
                    variation: false,
                  ),
                  const PopularChannelItem(
                    imageUrl: "assets/images/avatar_8.jpg",
                    name: "Aquiles20",
                    variation: false,
                  ),
                  const PopularChannelItem(
                    imageUrl: "assets/images/avatar_9.jpg",
                    name: "timothy",
                    variation: false,
                  ),
                  const PopularChannelItem(
                    imageUrl: "assets/images/avatar_10.jpg",
                    name: "lunaticoo",
                    variation: false,
                  ),
                  const PopularChannelItem(
                    imageUrl: "assets/images/avatar_11.jpg",
                    name: "Tsukii",
                    variation: false,
                  ),
                  const PopularChannelItem(
                    imageUrl: "assets/images/avatar_12.jpg",
                    name: "Searinox",
                    variation: false,
                  ),
                  const PopularChannelItem(
                    imageUrl: "assets/images/avatar_13.jpg",
                    name: "xDeathWing",
                    variation: false,
                  ),
                  const PopularChannelItem(
                    imageUrl: "assets/images/avatar_14.jpg",
                    name: "xJaina",
                    variation: false,
                  ),
                  const PopularChannelItem(
                    imageUrl: "assets/images/avatar_15.jpg",
                    name: "Ka3l",
                    variation: false,
                  ),
                  const PopularChannelItem(
                    imageUrl: "assets/images/avatar_16.jpg",
                    name: "Malygos",
                    variation: false,
                  ),
                  const PopularChannelItem(
                    imageUrl: "assets/images/avatar_17.jpg",
                    name: "PLUT0N",
                    variation: false,
                  ),
                  const PopularChannelItem(
                    imageUrl: "assets/images/avatar_18.jpg",
                    name: "jashirama",
                    variation: false,
                  ),
                  const PopularChannelItem(
                    imageUrl: "assets/images/avatar_19.jpg",
                    name: "ESL",
                    variation: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}