// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', // Startseite festlegen
      routes: {
        '/': (context) => HomeScreen(),
        '/details': (context) => const DetailsScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<String> products = [
    'Produkt 1',
    'Produkt 2',
    'Produkt 3',
    'Produkt 4',
    'Produkt 5'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4, // Schatten-Effekt für das Card-Widget
            margin: const EdgeInsets.all(16), // Abstand um das Card-Widget
            child: ListTile(
              leading: const Icon(Icons.shopping_cart), // Icon vor dem Text
              title: Text(products[index]), // Text des Produkts
              tileColor: Colors.white, // Hintergrundfarbe des Listenelements
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Abgerundete Ecken
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/details',
                  arguments: products[index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String product = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ausgewähltes Produkt: $product'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Zurücknavigation zum HomeScreen
              },
              child: const Text('Zurück zum Home Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
