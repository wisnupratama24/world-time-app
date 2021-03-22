import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String country;
  bool isDayTime;

  WorldTime({this.location, this.flag, this.country});

  Future<void> getTime() async {
    try {
      var url = Uri.parse('http://worldtimeapi.org/api/timezone/$country');
      var response = await http.get(url);
      Map responseJson = convert.jsonDecode(response.body);

      String datetime = responseJson['datetime'];
      String offset = responseJson['utc_offset'].substring(1, 3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDayTime = now.hour > 6 && now.hour < 22 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'could not update data, please try again';
    }
  }
}
