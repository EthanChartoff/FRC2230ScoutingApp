import 'package:flutter/material.dart';

class AllTeamsPage extends StatefulWidget {
  const AllTeamsPage({Key? key}) : super(key: key);
  
  @override
  State<StatefulWidget> createState() => _AllTeamsPageState();
}

class _AllTeamsPageState extends State<AllTeamsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Center(
        child: Text('All Teams Page'),
      ),
    );
  }
}