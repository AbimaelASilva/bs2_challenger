import 'package:flutter/material.dart';

import '../../../core.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDefaultCard(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Brasileirão Série A",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Flamengo_braz_logo.svg/1655px-Flamengo_braz_logo.svg.png',
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Flamengo",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Text(
                  "vs",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Column(
                  children: [
                    Image.network(
                      'https://logodetimes.com/times/bahia/logo-bahia-256.png',
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Bahia",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                SizedBox(width: 4),
                Text("28 Nov"),
                SizedBox(width: 16),
                Icon(Icons.access_time, size: 16, color: Colors.grey),
                SizedBox(width: 4),
                Text("13:00"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
