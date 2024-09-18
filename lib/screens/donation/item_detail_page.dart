import 'package:flutter/material.dart';
import 'package:sweden_roleplay/utils/constants.dart';
import 'package:sweden_roleplay/screens/donation/donation_page.dart';

class ItemDetailPage extends StatelessWidget {
  final DonationItem item;

  const ItemDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        title: Text(item.name),
        backgroundColor: kSecondaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(item.imagePath, height: 200),
              ),
              const SizedBox(height: 16),
              Text(
                '${item.price} SEK',
                style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                item.description,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                child: const Text('Köp'),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        color: kSecondaryColor,
                        child: Wrap(
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(Icons.credit_card, color: Colors.white),
                              title: const Text('Betala med kort', style: TextStyle(color: Colors.white)),
                              onTap: () {
                                // Implement card payment
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.payment, color: Colors.white),
                              title: const Text('Betala med PayPal', style: TextStyle(color: Colors.white)),
                              onTap: () {
                                // Implement PayPal payment
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.phone_android, color: Colors.white),
                              title: const Text('Betala med Swish', style: TextStyle(color: Colors.white)),
                              onTap: () {
                                // Implement Swish payment
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}