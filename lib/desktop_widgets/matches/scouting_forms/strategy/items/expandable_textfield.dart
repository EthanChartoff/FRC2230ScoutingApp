import 'package:flutter/material.dart';


/// TODO
class StrategyExpandableTextField extends StatefulWidget {

  final String title;

  final TextEditingController controller = TextEditingController();

  StrategyExpandableTextField({
    required this.title,
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