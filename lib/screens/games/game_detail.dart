import 'package:flutter/material.dart';
import 'package:streamingapp/screens/search/game_item_result.dart';
import 'package:streamingapp/shared/rounded_label.dart';
import 'package:streamingapp/utils/data.dart';
import 'package:streamingapp/utils/constants.dart';
import 'package:streamingapp/shared/tag_pill.dart';

class GameDetail extends StatelessWidget {
  final Game game;
  final Function onPress;

  const GameDetail({super.key, required this.game, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Column(
        children: [
          Container(
            height: 300,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/egames.jpg"),
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
                                    game.users,
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
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/avatar_19.jpg"),
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
                              game.subTitle,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${game.viewers} viewers",
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
                        text: "Subscribe",
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey[800],
                  ),
                  Text(
                    game.description,
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
                    imageUrl: game.imageUrl,
                    name: game.title,
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
                      TagPill(tag: "eng"),
                      TagPill(tag: "esport"),
                      TagPill(tag: "csgo"),
                      TagPill(tag: "esl"),
                      TagPill(tag: "fps"),
                      TagPill(tag: "shooters"),
                      TagPill(tag: "tournaments"),
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
