// lib/utils/data.dart

class Streamer {
  String name;
  String username;
  String description;
  String imageUrl;
  String followers;
  String viewers;

  Streamer(this.name, this.username, this.description, this.imageUrl, this.followers, this.viewers);
}

List<Streamer> getStreamers() {
  return <Streamer>[
    Streamer(
      "1.cuz",
      "1.cuz",
      "Pro Fortnite player streaming daily. Come join the fun!",
      "assets/images/user_1.jpg",
      "16890",
      "101.646"
    ),
    Streamer(
      "GhostAlby",
      "GhostAlby",
      "Variety streamer playing the latest and greatest games!",
      "assets/images/user_2.jpg",
      "95433",
      "186.255"
    ),
    Streamer(
      "JDevise",
      "JDevise",
      "Kick streamer showcasing amazing content!",
      "assets/images/user_3.jpg",
      "34521",
      "68.255"
    ),
  ];
}