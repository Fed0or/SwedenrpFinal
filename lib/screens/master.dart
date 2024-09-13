import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sweden_roleplay/screens/explore/explore.dart';
import 'package:sweden_roleplay/screens/games/streamers.dart';
import 'package:sweden_roleplay/screens/profile/profile.dart';
import 'package:sweden_roleplay/screens/search/search.dart';
import 'package:sweden_roleplay/utils/constants.dart';

class Master extends StatefulWidget {
  const Master({super.key});

  @override
  State<Master> createState() => _MasterState();
}

class _MasterState extends State<Master> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: getBody(),
      ),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: page,
      children: const [Explore(), Streamers(), Search(), Profile()],
    );
  }

  Widget getBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: kBottomNavigationBar,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey[600],
      currentIndex: page,
      onTap: (index) {
        setState(
          () {
            page = index;
          },
        );
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Hem',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.live_tv),
          label: 'Live',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.attach_money),
          label: 'Donation',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle),
          label: 'Profile',
        ),
      ],
      type: BottomNavigationBarType.fixed,
    );
  }
}