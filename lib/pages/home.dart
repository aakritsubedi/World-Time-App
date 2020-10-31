import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    // set background
    String bgImage = data['isDay'] ? 'day.jpeg' : 'night.jpg';
    Color bgColor = data['isDay'] ? Colors.blue[200] : Colors.grey[50];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Center(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton.icon(
                        onPressed: () async {
                          dynamic result =
                              await Navigator.pushNamed(context, '/location');
                          if (result != null) {
                            setState(() {
                              data = {
                                'time': result['time'],
                                'location': result['location'],
                                'isDay': result['isDay'],
                                'flag': result['flag']
                              };
                            });
                          }
                        },
                        icon:
                            Icon(Icons.edit_location, color: Colors.grey[200]),
                        label: Text(
                          'Edit Location',
                          style: TextStyle(color: Colors.grey[200]),
                        ))
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      '${data['time']}',
                      style: TextStyle(
                          fontSize: 66,
                          color: data['isDay']
                              ? Colors.grey[800]
                              : Colors.grey[50]),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${data['location']}',
                          style: TextStyle(
                              fontSize: 24,
                              letterSpacing: 2,
                              color: data['isDay']
                                  ? Colors.grey[800]
                                  : Colors.grey[50]),
                        ),
                      ],
                    )
                  ],
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
