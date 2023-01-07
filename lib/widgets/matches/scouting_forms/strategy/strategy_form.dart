import 'package:flutter/material.dart';

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

  Future test() => Future.value("done");

  late StrategyExpandableTextField wxpandlol;

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
        future: test(),
        builder: ((context, snapshot) {
          if(snapshot.hasData) {
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