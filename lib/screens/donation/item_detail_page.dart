import 'package:flutter/material.dart';
import 'package:sweden_roleplay/utils/constants.dart';
import 'package:sweden_roleplay/screens/donation/donation_page.dart';

class ItemDetailPage extends StatelessWidget {
  final DonationItem item;

  const ItemDetailPage({Key? key, required this.item}) : super(key: key);

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
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(item.imagePath, height: 200),
              ),
              SizedBox(height: 16),
              Text(
                '${item.price} SEK',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                item.description,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                child: Text('Köp'),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        color: kSecondaryColor,
                        child: Wrap(
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.credit_card, color: Colors.white),
                              title: Text('Betala med kort', style: TextStyle(color: Colors.white)),
                              onTap: () {
                                // Implement card payment
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.payment, color: Colors.white),
                              title: Text('Betala med PayPal', style: TextStyle(color: Colors.white)),
                              onTap: () {
                                // Implement PayPal payment
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.phone_android, color: Colors.white),
                              title: Text('Betala med Swish', style: TextStyle(color: Colors.white)),
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