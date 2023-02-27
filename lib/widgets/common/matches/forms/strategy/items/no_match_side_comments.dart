import 'package:flutter/material.dart';
import 'package:scoute_prime/misc/constants.dart';

class NoMatchSideComments extends StatelessWidget {
  const NoMatchSideComments({
    required this.data,
    required this.showCategory,
  });

  final List<dynamic> data;
  final Map<String, bool> showCategory;

  @override
  Widget build(BuildContext context) {
    if(data.isEmpty) {
      return const Center(
        child: Text(
          'No data',
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, dataIndex) => Column(
          children: List.generate(
            DB_ACCURATE_STRATEGY_CATEGORIES2023.length,
            (categorieIndex) {
              final category = DB_ACCURATE_STRATEGY_CATEGORIES2023[categorieIndex];
              if (showCategory[category]!) {
                return Row(
                  children: [
                    Text(
                      '$category: ',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data[dataIndex][category],
                      style: const TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      )
    );
  }
}