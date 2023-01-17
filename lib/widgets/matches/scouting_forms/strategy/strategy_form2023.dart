import 'package:flutter/material.dart';
import 'package:scoute_prime/api/2230_database/dart/get/get_strategy_table.dart';

import 'package:scoute_prime/widgets/matches/scouting_forms/strategy/items/expandable_textfield.dart';


class StrategyForm extends StatefulWidget {

  ///
  final void Function() exit;

  const StrategyForm({
    required this.exit
  });
  
  @override
  State<StatefulWidget> createState() => _StrategyFormState();
}

class _StrategyFormState extends State<StrategyForm>{

  @override
  Widget build(BuildContext context) {
    // final TextEditingController _auto = TextEditingController();
    // final TextEditingController _controller = TextEditingController();
    // final TextEditingController _controller = TextEditingController();
    // final TextEditingController _controller = TextEditingController();
    // final TextEditingController _controller = TextEditingController();
    // final TextEditingController _controller = TextEditingController();
    // final TextEditingController _controller = TextEditingController();
    // final TextEditingController _controller = TextEditingController();
    // final TextEditingController _controller = TextEditingController();
    
    
    return Container(
      color: Theme.of(context).backgroundColor,
      child: FutureBuilder(
        future: GetStrategyData.ofTeam('2230'),
        builder: ((context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            wxpandlol = StrategyExpandableTextField(
              title: 'lol'
            );
            return Column(
              children: List.generate(6, (index) => wxpandlol)
            );
          }
          else {
            return const CircularProgressIndicator();
          }
        }), 
      ),
    );

  }

}