import 'package:flutter/material.dart';
import 'package:sparkle_sphere/widgets/left_drawer.dart';
import 'package:sparkle_sphere/widgets/shop_card.dart'; // Import ShopCard and ShopItem from shop_card.dart

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist, const Color.fromARGB(255, 236, 147, 176)),
    ShopItem("Tambah Item", Icons.add_shopping_cart, const Color.fromARGB(255, 234, 102, 146)),
    ShopItem("Logout", Icons.logout, Color.fromARGB(255, 220, 80, 127))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sparkle Sphere',
        ),
        backgroundColor: const Color.fromARGB(255, 236, 147, 176),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Sparkle Sphere Shop',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
