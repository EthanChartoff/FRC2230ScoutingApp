import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/form_generator.dart';


Builder scoutingFormGeneratorBuilder(BuilderOptions options) =>
  SharedPartBuilder([ScoutingFormGenerator()], 'scouting_form');