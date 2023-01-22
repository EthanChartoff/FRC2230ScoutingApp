import 'package:flutter/material.dart';


/// Text field for strategy form. 
class StrategyExpandableTextField extends StatefulWidget {

  StrategyExpandableTextField({
    required this.title,
    this.hint,
    this.pastInfo
  });

  final String title;

  /// Should display the last value of type of scouting data entered.
  /// 
  /// For example, if at round 1 strategy typed 'robot can climb' at round 2 the 
  /// same card will have a hint 'robot can climb'. 
  final String? hint;

  final TextEditingController controller = TextEditingController();

  String? get getControllerText => controller.text;

  /// All of the strategy data entered for this specific team and data type.
  final List<String>? pastInfo;
  
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
          hoverColor: null,
        ),
    
        child: ExpansionTile(
          title: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 20,
              )
            ),
          ),
    
          children: [
            widget.pastInfo != null ? SizedBox(
              height: 30,
              child: PageView(
                children: widget.pastInfo!.map((e) => 
                  Center(child: Text(e))
                ).toList()
              ),
            ) : const Text('no past informaton'),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: widget.controller,
                onChanged: (value) => setState(() {}),
                maxLines: 5,
                minLines: 1,
                decoration: InputDecoration(
                  hintText: widget.hint,
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 16,
                  ),
                  border: const OutlineInputBorder()
                ),
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

} 