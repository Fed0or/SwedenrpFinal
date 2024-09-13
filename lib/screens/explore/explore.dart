import 'package:flutter/material.dart';
import 'package:sweden_roleplay/utils/constants.dart';
import 'package:sweden_roleplay/screens/explore/explore_all.dart';
import 'package:sweden_roleplay/screens/explore/popular_channels.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  Widget currentWidgetView = ExploreAll(
    onPress: () {},
  );

  @override
  void initState() {
    super.initState();
    switchTo("explore_all");
  }

  switchTo(String widgetName) {
    setState(() {
      switch (widgetName) {
        case "explore_all":
          currentWidgetView = ExploreAll(onPress: () {
            switchTo("popular_channels");
          });
          break;
        case "popular_channels":
          currentWidgetView = PopularChannels(onPress: () {
            switchTo("explore_all");
          });
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: currentWidgetView,
      ),
    );
  }
}