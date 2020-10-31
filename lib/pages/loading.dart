import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async {
    // Make a request
    Response response = await get('http://worldtimeapi.org/api/timezone/Asia/Kathmandu');
    Map data = jsonDecode(response.body);
    
    // get properties from data
    String datetime = data['datetime'];
    String offsetHrs = data['utc_offset'].substring(1,3);
    String offsetMin = data['utc_offset'].substring(4,6);

    // Create a date time object 
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offsetHrs), minutes: int.parse(offsetMin)));
    print(now);

  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Text('loading screen...')),
    );
  }
}
