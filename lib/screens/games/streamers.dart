import 'package:flutter/material.dart';
import 'package:sweden_roleplay/utils/constants.dart';
import 'package:sweden_roleplay/utils/data.dart';
import 'package:sweden_roleplay/screens/profile/profile.dart';

class Streamers extends StatefulWidget {
  const Streamers({super.key});

  @override
  State<Streamers> createState() => _StreamersState();
}

class _StreamersState extends State<Streamers> {
  late List<Streamer> streamers;

  @override
  void initState() {
    super.initState();
    streamers = getStreamers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        title: Text("Streamers"),
        backgroundColor: kSecondaryColor,
      ),
      body: ListView.builder(
        itemCount: streamers.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(streamers[index].imageUrl),
            ),
            title: Text(
              streamers[index].name,
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              "${streamers[index].visningar} visningar",
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(streamer: streamers[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}