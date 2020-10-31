import 'package:flutter/material.dart';
import 'package:WorldClock/services/worldTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Kathmandu', flag: 'nepal.png', url: 'Asia/Kathmandu');
    await instance.getTime();

    // Redirect to other routes
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag
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
          child: SpinKitChasingDots(
        color: Colors.grey[400],
        size: 50.0,
      )),
    );
  }
}
