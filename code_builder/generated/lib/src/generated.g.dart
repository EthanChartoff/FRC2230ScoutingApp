// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generated.dart';

// **************************************************************************
// ScoutingFormGenerator
// **************************************************************************

class ScoutingForm extends StatefulWidget {
  final void Function() exit;

  const ScoutingForm({required this.exit});

  @override
  State<StatefulWidget> createState() => _ScoutingFormState();
}

// **************************************************************************
// ScoutingFormStateGenerator
// **************************************************************************

class _ScoutingFormState extends State<ScoutingForm> {
  final ValueNotifier<int> _shotCounterController = ValueNotifier<int>(0);

  final ValueNotifier<int> _shotCounter1Controller = ValueNotifier<int>(0);

  final ValueNotifier<int> _shotCounter2Controller = ValueNotifier<int>(0);

  final ValueNotifier<String> _dropdownButtonController =
      ValueNotifier<String>('');

  final TextEditingController _textfieldController = TextEditingController();

  final ValueNotifier<bool> _checkboxController = ValueNotifier<bool>(false);

  final ValueNotifier<double> _buttonTimerController = ValueNotifier<double>(0);

  final ValueNotifier<bool> _checkbox1Controller = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    /*
TODO: delete /**/
    _shotCounterController.dispose();
    _shotCounter1Controller.dispose();
    _shotCounter2Controller.dispose();
    _dropdownButtonController.dispose();
    _textfieldController.dispose();
    _checkboxController.dispose();
    _buttonTimerController.dispose();
    _checkbox1Controller.dispose();

    super.dispose();
*/
  }
  @override
  Widget build(BuildContext context) {
    /*
    return Material(
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
            ///TODO: format children to here
      ScoutingShotCounter(
        controller: _shotCounterController,
      ),
    
      ScoutingShotCounter(
        controller: _shotCounter1Controller,
      ),
    
      ScoutingShotCounter(
        controller: _shotCounter2Controller,
      ),
    
      ScoutingDropdownButtonFormField(
        items: const [
          //DropdownMenuItem(value: '1', child: Text('comp 1')),
          //DropdownMenuItem(value: '2', child: Text('comp 2')),
          //DropdownMenuItem(value: '3', child: Text('comp 3')),
          //DropdownMenuItem(value: '4', child: Text('comp 4')),
          //DropdownMenuItem(value: '5', child: Text('comp 5')),
        ],
        controller: _dropdownButtonController,
      ),
    
      ScoutingTextFormField(
        controller: _textfieldController,
        onChanged: (value) => setState(() {}),
        hint: 'input something',
        labelText: 'idk',
      ),
    
      ScoutingCheckbox(
        controller: _checkboxController,
        value: _checkboxController.value,
        onChanged: (value) => setState(() {
          _checkboxController.value = value;
        })
      ),
    
      ScoutingButtonTimer(
        controller: _buttonTimerController,
      ),
    
      ScoutingCheckbox(
        controller: _checkbox1Controller,
        value: _checkbox1Controller.value,
        onChanged: (value) => setState(() {
          _checkbox1Controller.value = value;
        })
      ),
    
      ElevatedButton(
        onPressed: widget.exit,
        child: null
      ),
  
      ElevatedButton(
        onPressed: (() => InsertScoutingDataTable.newTable(
          ///shotCounter: _shotCounterController.value,
          ///shotCounter1: _shotCounter1Controller.value,
          ///shotCounter2: _shotCounter2Controller.value,
          ///dropdownButton: _dropdownButtonController.value,
          ///textfield: _textfieldController.value,
          ///checkbox: _checkboxController.value,
          ///buttonTimer: _buttonTimerController.value,
          ///checkbox1: _checkbox1Controller.value,

        )),
        child: null
      )
    
        ]
      )
    );
  */
  }
}
