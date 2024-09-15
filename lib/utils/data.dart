class Streamer {
  String name;
  String visningar;
  String info;
  String imageUrl;

  Streamer(this.name, this.visningar, this.info, this.imageUrl);
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
    ),
    Streamer(
      "Huncho",
      "68.255",
      "Kick streamer showcasing amazing content!",
      "assets/images/user_3.jpg",
    ),
  ];
}