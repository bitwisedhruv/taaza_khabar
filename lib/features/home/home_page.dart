import 'package:flutter/material.dart';
import 'package:taaza_khabar/features/home/wudgets/news_card.dart';
import 'package:taaza_khabar/palette.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.lightGreyColor,
      appBar: AppBar(
        backgroundColor: AppPalette.blueColor,
        title: const Text(
          'MyNews',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          ElevatedButton.icon(
            onPressed: () {},
            label: const Text(
              'data',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            icon: const Icon(
              Icons.location_on_outlined,
              color: Colors.white,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Top Headlines',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            NewsCard()
          ],
        ),
      ),
    );
  }
}
