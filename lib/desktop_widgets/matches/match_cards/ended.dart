import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EndedMatchCard extends StatelessWidget{

  /// ongoing matches information, filtered from all matches
  List<dynamic> matches;  

  EndedMatchCard({
    required this.matches
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: ((context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.0),
          child: Card(
            color: Theme.of(context).primaryColorDark,
            child: Theme(
              data: ThemeData(hoverColor: Theme.of(context).hoverColor.withOpacity(0.1)),
              child: const ExpansionTile(
                textColor: Colors.black,
                iconColor: Colors.black,
                title: Text("lol"),
                children: [
                  Text('lol')
                ],
              ),
            ),
          ),
        );
      }),
      itemCount: matches.length,
    );
  }

}