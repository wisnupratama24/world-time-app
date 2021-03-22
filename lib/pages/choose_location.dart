import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(country: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(country: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(country: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(
        country: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(country: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(
        country: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(
        country: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(
        location: 'Jakarta', flag: 'indonesia.png', country: 'Asia/Jakarta')
  ];

  void updateTime(index) async {
    WorldTime worldTime = locations[index];
    await worldTime.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
      'isDayTime': worldTime.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Choose Location'),
        backgroundColor: Colors.blue[800],
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
