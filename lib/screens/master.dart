import 'package:flutter/material.dart';
import 'package:sweden_roleplay/screens/explore/explore.dart';
import 'package:sweden_roleplay/screens/games/streamers.dart';
import 'package:sweden_roleplay/screens/donation/donation_page.dart';
import 'package:sweden_roleplay/screens/events/event_page.dart'; // Import the new EventPage
import 'package:sweden_roleplay/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Explore(),
    Streamers(),
    DonationPage(),
    EventPage(), // Replace Profile with EventPage
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
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
            icon: Icon(Icons.event), // Change icon to event
            label: 'Event', // Change label to Event
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