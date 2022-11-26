
import 'package:flutter/material.dart';

import 'package:scoute_prime/api/dart/insert/new_scouting_data_table.dart';

import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/items/checkbox.dart';
import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/items/counter.dart';
import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/items/dropdown_with_items.dart';
import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/items/textfield.dart';
import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/items/timed_button.dart';

part 'generated.g.dart';

const String ScoutingFormBody = '''
      class ScoutingForm extends StatefulWidget {

        final void Function() exit;

        const ScoutingForm({
          required this.exit
        });

        @override
        State<StatefulWidget> createState() => _ScoutingFormState();
      }
    ''';

class lol {}
