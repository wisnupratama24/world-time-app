import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class WorldTime {
  String location;
  String time;
  String flag;
  String country;

  WorldTime({this.location, this.flag, this.country});

  Future<void> getTime() async {
    try {
      var url = Uri.parse('http://worldtimeapi.org/api/timezone/$country');
      var response = await http.get(url);
      Map responseJson = convert.jsonDecode(response.body);

      String datetime = responseJson['datetime'];
      String offset =
          responseJson['utc_offset'].replaceAll(RegExp('[^1-9]'), '');
      DateTime now = DateTime.parse(datetime);

      now = now.add(Duration(hours: int.parse(offset)));

      time = now.toString();
    } catch (e) {
      time = 'could not update data, please try again';
    }
  }
}
