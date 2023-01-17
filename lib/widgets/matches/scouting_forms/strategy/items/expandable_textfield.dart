import 'package:flutter/material.dart';


/// Text field for strategy form. 
class StrategyExpandableTextField extends StatefulWidget {

  final String title;

  /// Should display the last value of type of scouting data entered.
  /// 
  /// For example, if at round 1 strategy typed 'robot can climb' at round 2 the 
  /// same card will have a hint 'robot can climb'. 
  final String? hint;

  final TextEditingController controller = TextEditingController();

  StrategyExpandableTextField({
    required this.title,
    this.hint
  });

  String? get getControllerText => controller.text;
  
  @override
  State<StatefulWidget> createState() => _StrategyExpandableTextFieldState();
}

class _StrategyExpandableTextFieldState extends State<StrategyExpandableTextField>{
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColorDark,
      child: Theme(
        data: ThemeData(
          hoverColor: null
        ),
    
        child: ExpansionTile(
          title: Center(
            child: Text(widget.title),
          ),
    
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: widget.controller,
                onChanged: (value) => setState(() {}),
                maxLines: 5,
                minLines: 1,
                decoration:  const InputDecoration(
                  border: OutlineInputBorder()
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

} 