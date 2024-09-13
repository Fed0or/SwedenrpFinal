import 'package:flutter/material.dart';
import 'package:sweden_roleplay/utils/constants.dart';
import 'package:sweden_roleplay/utils/data.dart';
import 'package:sweden_roleplay/screens/games/streamer_item.dart';

class StreamersAll extends StatelessWidget {
  final Function onPress;

  const StreamersAll({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 32,
                    child: Image.asset(
                      "assets/icons/joystick.png",
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Alla Streamers",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: getStreamers()
                      .map((item) => StreamerItem(
                            streamer: item,
                            onPress: () {
                              onPress(item);
                            },
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}