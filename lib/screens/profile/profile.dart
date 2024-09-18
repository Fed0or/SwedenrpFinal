import 'package:flutter/material.dart';
import 'package:sweden_roleplay/utils/constants.dart';
import 'package:sweden_roleplay/shared/broadcast_item.dart';
import 'package:sweden_roleplay/shared/rounded_label.dart';
import 'package:sweden_roleplay/utils/data.dart';
import 'package:sweden_roleplay/screens/games/streamer_detail.dart';

class Profile extends StatelessWidget {
  final Streamer streamer;

  const Profile({Key? key, required this.streamer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Stack(
        children: [
          Container(
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(streamer.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 350,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.transparent,
                  kSecondaryColor,
                ],
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                        RoundedLabel(
                          small: true,
                          color: Colors.grey[200]!,
                          text: "Donate",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(streamer.imageUrl),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    streamer.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "${streamer.visningar} Followers",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StreamerDetail(
                                  streamer: streamer,
                                  isSpotify: false,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          child: Text("Live"),
                        ),
                        if (streamer.name.toLowerCase() == "1.cuz") ...[
                          const SizedBox(width: 12),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StreamerDetail(
                                    streamer: streamer,
                                    isSpotify: true,
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                            child: Text("Spotify"),
                          ),
                        ],
                        const SizedBox(width: 12),
                        RoundedLabel(
                          small: false,
                          color: Colors.grey[200]!,
                          text: "Previous broadcasts",
                        ),
                      ],
                    ),
                  ),
                  const BroadcastItem(
                    live: true,
                    title: "Verdansk is mine! Follow on discord and twitch too",
                    users: "690",
                    imageUrl: "assets/images/broadcast_1.jpg",
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.replay,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Previous broadcasts",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const BroadcastItem(
                    live: false,
                    title: "90 kills on solos WarZone",
                    users: "389",
                    imageUrl: "assets/images/broadcast_2.jpg",
                  ),
                  const BroadcastItem(
                    live: false,
                    title: "My first FIFA 20 tournament",
                    users: "596",
                    imageUrl: "assets/images/broadcast_3.jpg",
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