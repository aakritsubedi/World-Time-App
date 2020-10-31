import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
          title: Text('Choose a location'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Center(
            child: Column(
          children: [
            Text('Choose location ...'),
          ],
        )));
  }
}
