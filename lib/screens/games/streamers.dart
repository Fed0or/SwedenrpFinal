import 'package:flutter/material.dart';
import 'package:sweden_roleplay/utils/constants.dart';
import 'package:sweden_roleplay/utils/data.dart';
import 'package:sweden_roleplay/screens/games/streamer_detail.dart';
import 'package:sweden_roleplay/screens/games/streamers_all.dart';

class Streamers extends StatefulWidget {
  const Streamers({super.key});

  @override
  State<Streamers> createState() => _StreamersState();
}

class _StreamersState extends State<Streamers> {
  Widget currentWidgetView = StreamersAll(
    onPress: () {},
  );

  @override
  void initState() {
    super.initState();
    switchTo("streamers_all", null);
  }

  switchTo(String widgetName, Streamer? streamer) {
    setState(() {
      switch (widgetName) {
        case "streamers_all":
          currentWidgetView = StreamersAll(onPress: (streamer) {
            switchTo("streamer_detail", streamer);
          });
          break;
        case "streamer_detail":
          currentWidgetView = StreamerDetail(
              streamer: streamer!,
              onPress: () {
                switchTo("streamers_all", null);
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