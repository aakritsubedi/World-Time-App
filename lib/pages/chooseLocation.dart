import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  void getData() async {
    // Simulate network request 
    String name= await Future.delayed(Duration(seconds: 4), () {
      return 'AAkrit';
    });

    await Future.delayed(Duration(seconds: 2), () {
      print('$name Subedi');
    });

    print('BCT, Kantipur Engineering College'); 
  }

  @override
  void initState() {
    super.initState();
    print('initState Invoked');
    getData();
  }

  @override
  Widget build(BuildContext context) {
    print('build function Invoked');
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
            RaisedButton(
              onPressed: () {
                setState(() {
                  counter += 1;
                });
              },
              child: Text('The counter is $counter'),
            ),
          ],
        )));
  }
}
