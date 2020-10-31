import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            Row(
              children: [
                FlatButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/location');
                    },
                    icon: Icon(Icons.edit_location),
                    label: Text('Edit Location'))
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.watch_later,
                  size: 100,
                ),
                SizedBox(height: 10),
                Text(
                  '${widget.title}',
                  style: TextStyle(fontSize: 32),
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
