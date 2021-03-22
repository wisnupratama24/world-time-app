import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading...';

  void setUpTime() async {
    WorldTime worldTime = WorldTime(
        location: 'Jakarta', flag: 'jakarta.png', country: 'Asia/Jakarta');
    await worldTime.getTime();
    setState(() {
      time = worldTime.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setUpTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Text(time),
      ),
    );
  }
}
