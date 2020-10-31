import 'package:flutter/material.dart';
import 'package:WorldClock/services/worldTime.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Kathmandu', flag: 'nepal.png', url:'Asia/Kathmandu');
    await instance.getTime();

    setState(() {
      time = instance.time;
    });

  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text('Time is $time'),
        )
      ),
    );
  }
}
