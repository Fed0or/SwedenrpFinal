import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  List<Map<String, dynamic>> _events = [];
  String? _currentUser; // Store current Discord username

  @override
  void initState() {
    super.initState();
    _fetchEvents();
  }

  Future<void> _fetchEvents() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('events')
          .orderBy('createdAt', descending: true)
          .get();

      final events = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return {
          'id': doc.id,
          'content': data['content'] ?? 'Ingen beskrivning tillgänglig',
          'createdAt': data['createdAt']?.toDate() ?? DateTime.now(),
          'bookedBy': data['bookedBy'] ?? [],
        };
      }).toList();

      if (mounted) {
        setState(() {
          _events = events;
        });
      }
    } catch (e) {
      print('Fel vid hämtning av events: $e');
      _showErrorDialog('Kunde inte hämta events. Kontrollera din internetanslutning och försök igen.');
    }
  }

  Future<void> _bookEvent(String eventId, String eventContent) async {
    String? discordUsername = await _showDiscordUsernameDialog();
    if (discordUsername == null || discordUsername.isEmpty) {
      return;
    }

    _currentUser = discordUsername;

    try {
      final eventDoc = await FirebaseFirestore.instance.collection('events').doc(eventId).get();
      final bookedBy = List<String>.from(eventDoc.data()?['bookedBy'] ?? []);

      if (bookedBy.contains(discordUsername)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Du har redan bokat detta event!')),
        );
        return;
      }

      await FirebaseFirestore.instance.collection('events').doc(eventId).update({
        'bookedBy': FieldValue.arrayUnion([discordUsername]),
        'newBooking': true
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Event bokat!')),
      );

      _fetchEvents(); // Uppdatera listan med events
    } catch (e) {
      print('Fel vid bokning av event: $e');
      _showErrorDialog('Ett fel uppstod vid bokning av event. Försök igen senare.');
    }
  }

  Future<String?> _showDiscordUsernameDialog() {
    final controller = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Ange ditt Discord-användarnamn', style: TextStyle(color: Colors.white)),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: "Användarnamn#0000",
            hintStyle: TextStyle(color: Colors.grey),
          ),
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            child: Text('Avbryt'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text('Boka'),
            onPressed: () => Navigator.of(context).pop(controller.text),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Fel', style: TextStyle(color: Colors.white)),
        content: Text(message, style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      body: _events.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _events.length,
              itemBuilder: (context, index) {
                final event = _events[index];
                final bookedBy = event['bookedBy'] as List;
                final isBooked = _currentUser != null && bookedBy.contains(_currentUser);

                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(event['content']),
                    subtitle: Text('Skapad: ${event['createdAt'].toString()}'),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isBooked ? Colors.red : Colors.green, // Change button color
                      ),
                      child: Text('Boka'),
                      onPressed: () => _bookEvent(event['id'], event['content']),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchEvents,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
