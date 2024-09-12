import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:streamingapp/shared/popular_channel_item.dart';
import 'package:streamingapp/shared/rounded_label.dart';
import 'package:streamingapp/utils/data.dart';
import 'package:streamingapp/screens/games/streamer_detail.dart';

class ExploreAll extends StatefulWidget {
  final Function onPress;
  const ExploreAll({super.key, required this.onPress});

  @override
  State<ExploreAll> createState() => _ExploreAllState();
}

class _ExploreAllState extends State<ExploreAll> {
  int currentPage = 0;
  int totalPages = 3;
  late Future<List<String>> discordUpdates;
  late List<Streamer> streamers;

  @override
  void initState() {
    super.initState();
    discordUpdates = fetchDiscordUpdates();
    streamers = getStreamers();
  }

  Future<List<String>> fetchDiscordUpdates() async {
    try {
      print("Fetching Discord updates..."); // Debug print
      final response = await http.get(Uri.parse(
          'https://swedenrpupdates-7ef4b9385555.herokuapp.com/api/updates'));
      print("API Response status code: ${response.statusCode}"); // Debug print
      print("API Response body: ${response.body}"); // Debug print
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        return jsonResponse.map((item) {
          String author = item['author'] ?? 'Unknown';
          String content = item['content'] ?? '';
          return "$author : $content";
        }).toList();
      } else {
        throw Exception('Failed to load updates');
      }
    } catch (e) {
      print("Error fetching updates: $e");
      return [];
    }
  }

  List<Widget> buildPageIndicator() {
    List<Widget> list = [];
    for (var i = 0; i < totalPages; i++) {
      list.add(buildIndicator(i == currentPage));
    }
    return list;
  }

  Widget buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.grey[600],
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "SwedenRP",
                          style: TextStyle(
                            color: Color(0xFFCB6CE6),
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        RoundedLabel(
                          small: true,
                          color: Colors.red,
                          text: "Live",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: PageView(
                      physics: const BouncingScrollPhysics(),
                      onPageChanged: (int page) {
                        setState(() {
                          currentPage = page;
                        });
                      },
                      children: [
                        buildPage(
                            "assets/images/user_1.jpg",
                            "assets/images/explore_1.jpg",
                            "Sweden Roleplay",
                            "1.Cuz"),
                        buildPage(
                            "assets/images/user_2.jpg",
                            "assets/images/explore_2.jpg",
                            "Live Warzone Chill",
                            "DropShot4Ever"),
                        buildPage(
                            "assets/images/user_3.jpg",
                            "assets/images/explore_3.jpg",
                            "Live Fall Guys contest",
                            "N00bGamer5829"),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: buildPageIndicator(),
                    ),
                  ),
                  // Discord updates section
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      "Server Updates",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200, // Adjust this height as needed
                    child: FutureBuilder<List<String>>(
                      future: discordUpdates,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          print("Error: ${snapshot.error}"); // Debug print
                          return Center(
                              child: Text('Error: ${snapshot.error}',
                                  style: TextStyle(color: Colors.white)));
                        } else if (snapshot.hasData &&
                            snapshot.data!.isNotEmpty) {
                          print(
                              "Number of updates: ${snapshot.data!.length}"); // Debug print
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/botfetch.jpg'),
                                ),
                                title: Text(
                                  snapshot.data![index],
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            },
                          );
                        } else {
                          print("No data available"); // Debug print
                          return Center(
                              child: Text('No updates available',
                                  style: TextStyle(color: Colors.white)));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Popular channels section moved to the bottom
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Vår Streamers",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.onPress();
                      },
                      child: Text(
                        "Se alla",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16,
                  left: 16,
                  right: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: GestureDetector(
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
                        child: PopularChannelItem(
                          imageUrl: "assets/images/user_1.jpg",
                          name: "1.Cuz",
                          variation: true,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: GestureDetector(
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
                        child: PopularChannelItem(
                          imageUrl: "assets/images/user_2.jpg",
                          name: "GhostAlby",
                          variation: true,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: GestureDetector(
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
                        child: PopularChannelItem(
                          imageUrl: "assets/images/user_3.jpg",
                          name: "Huncho",
                          variation: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPage(
      String userImage, String gameImage, String title, String subTitle) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(gameImage),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(userImage),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          subTitle,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}