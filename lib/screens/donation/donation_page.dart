import 'package:flutter/material.dart';
import 'package:sweden_roleplay/utils/constants.dart';
import 'package:sweden_roleplay/screens/donation/item_detail_page.dart';

class DonationItem {
  final String name;
  final String imagePath;
  final double price;
  final String description;

  const DonationItem({required this.name, required this.imagePath, required this.price, required this.description});
}

const List<DonationItem> donationItems = [
  DonationItem(name: "Vapen", imagePath: "assets/images/vapen.png", price: 100, description: "Beskrivning av vapen"),
  DonationItem(name: "Krim", imagePath: "assets/images/krimmenu.png", price: 150, description: "Beskrivning av krim"),
  DonationItem(name: "Ammo", imagePath: "assets/images/ammo.png", price: 50, description: "Beskrivning av ammo"),
  DonationItem(name: "Kläder", imagePath: "assets/images/klader.png", price: 200, description: "Beskrivning av kläder"),
  DonationItem(name: "Unban", imagePath: "assets/images/unban.png", price: 500, description: "Beskrivning av unban"),
];

class DonationPage extends StatelessWidget {
  const DonationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        title: const Text('Donationer'),
        backgroundColor: kSecondaryColor,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: donationItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetailPage(item: donationItems[index]),
                ),
              );
            },
            child: Card(
              color: Colors.grey[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.asset(
                        donationItems[index].imagePath,
                        fit: BoxFit.cover,
                        width: 90,
                        height: 90,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    donationItems[index].name,
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${donationItems[index].price} SEK',
                    style: TextStyle(color: Colors.grey[400], fontSize: 14),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}