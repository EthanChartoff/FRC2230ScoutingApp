import 'package:flutter/material.dart';
import 'package:scoute_prime/misc/constants.dart';

class StrategySideComment extends StatelessWidget {
  const StrategySideComment({
    required this.roundData,
    required this.showCategory
  });

  final Map<String, dynamic> roundData;
  final Map<String, bool> showCategory;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Round ${roundData['round']}',
            style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              fontSize: 24
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            children: [
              for (var category in DB_ACCURATE_STRATEGY_CATEGORIES2023)
                if (showCategory[category]!)
                  Row(
                    children: [
                      Text(
                        '$category: ',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        roundData['strategy'][category],
                        style: const TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
            ],
          ),
        ),
      ],
    );
  }
}