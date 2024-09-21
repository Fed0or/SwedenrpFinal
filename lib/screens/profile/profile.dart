import 'package:flutter/material.dart';
import 'package:sweden_roleplay/utils/constants.dart';
import 'package:sweden_roleplay/shared/broadcast_item.dart';
import 'package:sweden_roleplay/utils/data.dart';
import 'package:sweden_roleplay/screens/games/streamer_detail.dart';
import 'package:sweden_roleplay/screens/games/TikTokWebView.dart';

class Profile extends StatelessWidget {
  final Streamer streamer;

  const Profile({super.key, required this.streamer});

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
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                        _buildButton(
                          "Donate",
                          Colors.white.withOpacity(0.5),
                          Colors.black,
                          () {
                            // Implement donation functionality
                          },
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
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "${streamer.visningar} Följare",
                    style: const TextStyle(
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
                        _buildButton(
                          "Live",
                          const Color(0xFFCB6CE6).withOpacity(0.5),
                          Colors.white,
                          () {
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
                        ),
                        const SizedBox(width: 12),
                        if (streamer.name.toLowerCase() == "1.cuz")
                          _buildButton(
                            "Spotify",
                            const Color(0xFFCB6CE6).withOpacity(0.5),
                            Colors.white,
                            () {
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
                          ),
                        const SizedBox(width: 12),
                        _buildButton(
                          "TikTok",
                          const Color(0xFFCB6CE6).withOpacity(0.5),
                          Colors.white,
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TikTokWebView(streamer: streamer),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "About Me",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          streamer.info,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const BroadcastItem(
                    live: true,
                    title: "Använd KOD 1CUZ10%",
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
                    title: "HELLCASE CSGO CASE OPENING",
                    users: "",
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

  Widget _buildButton(String text, Color backgroundColor, Color textColor, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}