import 'package:flutter/material.dart';
import 'package:sweden_roleplay/screens/explore/explore.dart';
import 'package:sweden_roleplay/screens/games/streamers.dart';
import 'package:sweden_roleplay/screens/donation/donation_page.dart';
import 'package:sweden_roleplay/screens/profile/profile.dart';
import 'package:sweden_roleplay/utils/constants.dart';
import 'package:sweden_roleplay/utils/data.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late List<Streamer> streamers;
  late Streamer defaultStreamer;

  @override
  void initState() {
    super.initState();
    streamers = getStreamers();
    defaultStreamer = streamers.first; // Use the first streamer as default
  }

  Widget _getSelectedWidget(int index) {
    switch (index) {
      case 0:
        return const Explore();
      case 1:
        return const Streamers();
      case 2:
        return const DonationPage();
      case 3:
        return Profile(streamer: defaultStreamer);
      default:
        return const Explore();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _getSelectedWidget(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
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
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}