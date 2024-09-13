import 'package:flutter/material.dart';
import 'package:sweden_roleplay/screens/search/game_item_result.dart';
import 'package:sweden_roleplay/shared/rounded_label.dart';
import 'package:sweden_roleplay/utils/constants.dart';
import 'package:sweden_roleplay/shared/tag_pill.dart';
import 'package:sweden_roleplay/utils/data.dart';

class StreamerDetail extends StatelessWidget {
  final Streamer streamer;
  final Function onPress;

  const StreamerDetail({super.key, required this.streamer, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Column(
        children: [
          Container(
            height: 300,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(streamer.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Row(
                          children: [
                            Container(
                              height: 36,
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                color: Colors.black.withOpacity(0.6),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.supervisor_account_rounded,
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    streamer.followers,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
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
                            const SizedBox(
                              width: 16,
                            ),
                            const Icon(
                              Icons.dashboard,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Icon(
                        Icons.fullscreen,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(streamer.imageUrl),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              streamer.username,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${streamer.viewers} viewers",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      RoundedLabel(
                        small: true,
                        color: Colors.grey[200]!,
                        text: "Donate",
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey[800],
                  ),
                  Text(
                    streamer.description,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey[800],
                  ),
                  GameItemResult(
                    imageUrl: streamer.imageUrl,
                    name: streamer.name,
                    morePadding: false,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Wrap(
                    alignment: WrapAlignment.start,
                    runSpacing: 12,
                    spacing: 12,
                    children: [
                      TagPill(tag: "SWE"),
                      TagPill(tag: "Gaming"),
                      TagPill(tag: "Pro"),
                      TagPill(tag: "Streamer"),
                      TagPill(tag: "Roleplay"),
                      TagPill(tag: "Typ?"),
                      TagPill(tag: "?"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        child: const Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
    );
  }
}