import 'package:flutter/material.dart';
import 'package:sweden_roleplay/screens/search/channel_item_result.dart';
import 'package:sweden_roleplay/screens/search/game_item_result.dart';
import 'package:sweden_roleplay/screens/search/other_item_result.dart';
import 'package:sweden_roleplay/utils/constants.dart';
import 'package:sweden_roleplay/shared/rounded_button.dart';
import 'package:sweden_roleplay/shared/custom_filled_field.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: CustomFilledField(
                  label: "Search games, channels...",
                  iconData: Icons.search,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: const [
                      GameItemResult(
                        imageUrl: "assets/images/game_1.jpg",
                        name: "Fortnite",
                        morePadding: true,
                      ),
                      ChannelItemResult(
                        live: true,
                        name: "ForeverYoungGaming",
                      ),
                      ChannelItemResult(
                        live: true,
                        name: "FortniteWorld",
                      ),
                      ChannelItemResult(
                        live: true,
                        name: "vegeta777",
                      ),
                      OtherItemResult(
                        name: "Fortnite",
                      ),
                      OtherItemResult(
                        name: "Fortnite customs",
                      ),
                      OtherItemResult(
                        name: "Fortnite fashion show",
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: RoundedButton(
                  text: "All results",
                  color: Colors.white12,
                  onPress: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
