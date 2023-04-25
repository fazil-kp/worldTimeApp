import 'package:http/http.dart' ;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;  // location name for the UI
  String time;      // the time in that location
  String flag;      // url to an asset flag icon
  String url;       // location url for api endpoint
  bool isDayTime;   // true if it's daytime, false if it's nighttime

  WorldTime({required this.location, required this.flag, required this.url, required this.time, required this.isDayTime});



  Future<void> getTime() async {

    try{
      // make the request

      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);


      // get properties from data
      String datetime = data['datetime'];
      String offset =data ['utc_offset'].substring(1,3);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set the time property
      isDayTime = now.hour>6 && now.hour <20 ? true:false;
      time = DateFormat.jm().format(now);


    }
    catch(e){
      print('caught errr :$e');
      time ='could not get time data';

    }

  }


}

WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin', time: '',isDayTime: true);
