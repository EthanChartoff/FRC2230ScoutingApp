import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:reorderables/reorderables.dart';
import 'package:scoute_prime/api/2230_database/dart/get/teams.dart';
import 'package:scoute_prime/misc/teams_data.dart';


class PickListPage extends StatefulWidget {
  const PickListPage({
    super.key,
    required this.TeamsFromDb,
    this.teams,
  });

  /// future that gets all the teams from a db that stores the teams positions. 
  final Future<List> Function() TeamsFromDb;

  /// all teams in the page. each team has a card that can be reordered.
  final List<TeamsData>? teams;

  @override
  State<StatefulWidget> createState() => _PickListPageState();
}

class _PickListPageState extends State<PickListPage> {

  List? _teamsPos;
  final _pageController = PageController();

  GlobalKey key = GlobalKey();

  Widget sideButton({
    required Icon icon,
    required void Function() onPressed,
    required double height
  }) => SizedBox(
    height: height,
    width: 50,
    child: Material(
      color: Theme.of(context).canvasColor,
      child: IconButton(
        hoverColor: Theme.of(context).canvasColor.withOpacity(0.1),
        onPressed: onPressed,
        icon: icon,
      ),
    ),
  );

  Text title(var team, int pageNum) => widget.teams != null ?
    Text('${team['id']} - ${widget.teams!.firstWhere(
        (element) => element.number.toString() == team['id']).name}') :
    Text('${team['id']} - ${TeamsData.allTeams.firstWhere(
      (element) => element.number.toString() == team['id']).name}');

  @override
  Widget build(BuildContext context) {    
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      color: Theme.of(context).backgroundColor,
      
      child: FutureBuilder(
        future: widget.TeamsFromDb(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            _teamsPos ??= snapshot.data!;

            return Theme(
              data: ThemeData(
                canvasColor: Colors.transparent,
                primaryColorDark: Theme.of(context).primaryColorDark,
                hintColor: Theme.of(context).canvasColor,
                textTheme: TextTheme(
                  headline2: Theme.of(context).textTheme.headline2
                )
              ),
              child: PageView.builder(
                controller: _pageController,
                itemCount: 2,
                itemBuilder: (context, pageIndex) {
                  return SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 400,
                          child: ReorderableListView.builder(
                            key: key,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _teamsPos!.length,
                            header: Text('Pick $pageIndex',
                              style: Theme.of(context).textTheme.headline2,
                            ),
            
                            itemBuilder: (context, index) => ReorderableWidget(
                              reorderable: true,
                              key: ValueKey(index),
                              child: Card(
                                color: Theme.of(context).primaryColorDark,
                                child: ListTile(
                                  title: title(_teamsPos![index], pageIndex),
                                  textColor: Theme.of(context).hintColor,
                                  leading: Switch(
                                    value: false,
                                    onChanged: (value) {
                                      
                                    },
                                  ),
                                ),
                              ),
                            ),
                            onReorder: (oldIndex, newIndex) => setState(() {
                              var team = _teamsPos!.removeAt(oldIndex);
                              _teamsPos!.insert(newIndex, team);
                            }),
                            onReorderEnd: (index) => print(_teamsPos![0]['id']),
                          ),
                        ),
                
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                
                            Text('Best Option',
                              style: Theme.of(context).textTheme.headline2,  
                            )
                          ],
                        ),
                        
                        pageIndex % 2 == 0 ? 
                          sideButton(
                            icon: const Icon(Icons.arrow_forward_ios),
                            onPressed: () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 400), 
                                curve: Curves.fastOutSlowIn
                              );
                            },
                            height: key.currentContext != null ? 
                              key.currentContext!.size!.height :
                              1000
                          ) : 
                          LayoutBuilder(
                            builder: (_, constraints) {
                              double height = key.currentContext != null ? 
                                key.currentContext!.size!.height :
                                1000;
                              print(height);
                              return sideButton(
                                icon: const Icon(Icons.arrow_back_ios),
                                onPressed: () {
                                  _pageController.previousPage(
                                    duration: const Duration(milliseconds: 400), 
                                    curve: Curves.fastOutSlowIn
                                  );
                                },
                                height: min(constraints.maxHeight, height)
                              );
                            }
                          ),
                      ],
                    ),
                  );
                } 
              ),
            );
          }
          else {
            return const CircularProgressIndicator();
          }
        }
      ),
    );
  }

}