import 'package:flutter/material.dart';
import '../data/animals_data.dart';
import '../widgets/animal_card.dart';
import 'animal_detail_page.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animals List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () => _logout(context),
          ),
        ],
      ),
            body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 220,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          mainAxisExtent: 258,
        ),
        itemCount: dummyAnimals.length,
        itemBuilder: (context, index) {
          final animal = dummyAnimals[index];
          return AnimalCard(
            animal: animal,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnimalDetailPage(animal: animal),
                ),
              );
            },
          );
        },
      ),
    );
  }
}