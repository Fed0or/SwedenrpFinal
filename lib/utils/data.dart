// lib/utils/data.dart

class Streamer {
  String name;
  String visningar;
  String info;
  String imageUrl;
  bool hasIcon;

  Streamer(this.name, this.visningar, this.info, this.imageUrl, {this.hasIcon = false});
}

List<Streamer> getStreamers() {
  return <Streamer>[
    Streamer(
      "1.cuz",
      "101.646",
      "Pro Fortnite player streaming daily. Come join the fun!",
      "assets/images/user_1.jpg",
    ),
    Streamer(
      "GhostAlby 👻",
      "1400",
      "PODCAST GHOST TALKS",
      "assets/images/user_2.jpg",
      hasIcon: true,
    ),
    Streamer(
      "Huncho",
      "68.255",
      "Kick streamer showcasing amazing content!",
      "assets/images/user_3.jpg",
    ),
  ];
}