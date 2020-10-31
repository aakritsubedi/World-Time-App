import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {
  String location; //Location name for UI
  String time; //time in that location
  String flag; //url to an asset flag icon
  String url; //Location URL for API endpoint
  bool isDay; // true of false if day

  WorldTime({ this.location, this.flag, this.url });

  Future<void> getTime() async {
    try {
      // Make a request
    Response response =
        await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);

    // get properties from data
    String datetime = data['datetime'];
    String offsetHrs = data['utc_offset'].substring(1, 3);
    String offsetMin = data['utc_offset'].substring(4, 6);

    // Create a date time object
    DateTime now = DateTime.parse(datetime);
    now = now.add(
        Duration(hours: int.parse(offsetHrs), minutes: int.parse(offsetMin)));

    // Set the time
    isDay = (now.hour > 6 && now.hour < 20) ? true : false;
    time = DateFormat.jm().format(now);
    }
    catch (e) {
      print('Caught Error $e');
      time = "Can't fetch time date.";
    }
  }
}
