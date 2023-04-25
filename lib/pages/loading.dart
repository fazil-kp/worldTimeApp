import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}
class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    try {
      WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin',time: '',isDayTime: true);
      await instance.getTime();
      Navigator.pushReplacementNamed(context, '/home',arguments:{
        'location':instance.location,
        'flag':instance.flag,
        'time':instance.time,
        'isDayTime':instance.isDayTime,
      });
    } catch (e) {
      print('Error occurred: $e');
      // Show error message to user and handle error appropriately
    }
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}