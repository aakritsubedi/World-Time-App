import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location; //Location name for UI
  String time; //time in that location
  String flag; //url to an asset flag icon
  String url; //Location URL for API endpoint

  WorldTime({ this.location, this.flag, this.url });

  Future<void> getTime() async {
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
    time = now.toString();
  }
}
