import 'package:flutter/material.dart';
import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/items/checkbox.dart';
import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/items/counter.dart';
import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/items/dropdown_with_items.dart';
import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/items/textfield.dart';
import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/items/timed_button.dart';


/// TODO
class ScoutingForm extends StatefulWidget {

  final void Function() exit;

  const ScoutingForm({
    required this.exit
  });

  @override
  State<StatefulWidget> createState() => _ScoutingFormState();
}

class _ScoutingFormState extends State<ScoutingForm>{
  bool z = true;
  String x = 'lol';
  int y = 0;

  final TextEditingController _controller = TextEditingController();



  void paramEquelGivenVal(String? value) {
    setState(() {
      x = value!;
    });
  }

  void _counterFunc(int value) {
    setState(() {
      y = value;
    });
  }

  void _boolFunc(bool? value) {
    setState(() {
      z = value!;
    });
  }

  @override
  void initState() {
    _controller.addListener(() { 
      final String _controllerText = _controller.text;
      _controller.value = _controller.value.copyWith(
        text: _controllerText,
        selection: TextSelection(
          baseOffset: _controllerText.length, 
          extentOffset: _controllerText.length
        ),
        composing: TextRange.empty
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [

          Text(z.toString()),

          ScoutingDropdownButtonFormField(
            items: const [
              DropdownMenuItem(value: 'comp 1', child: Text('comp 1')),
              DropdownMenuItem(value: 'comp 2', child: Text('comp 2')),
            ], 
            onChanged: paramEquelGivenVal, 
          ),

          ScoutingTextFormField(
            controller: _controller,
            onChanged: (value) => setState(() {})
          ),

          ScoutingShotCounter(
            onChange: _counterFunc,
            //counter: widget.y,
            title: 'lol',
          ),

          ScoutingCheckbox(
            value: z,
            onChanged: _boolFunc
          ),

          SizedBox(
            width: 200,
            height: 200,
            child: ScoutingButtonTimer()
          ),
    
          ElevatedButton(
            onPressed: widget.exit,
            child: null
          )
        ],
      ),
    );
  }
}