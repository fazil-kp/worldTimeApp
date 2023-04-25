import 'package:flutter/material.dart';

import '../services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations =[

    WorldTime(location: 'London', flag: 'lo.jpg', url: 'Europe/London', time: '', isDayTime: true),
    WorldTime(location: 'Athens', flag: 'at.jpg', url: 'Europe/Berlin', time: '', isDayTime: true),
    WorldTime(location: 'Cairo', flag: 'ca.jpg', url: 'Africa/Cairo', time: '', isDayTime: true),
    WorldTime(location: 'Nairobi', flag: 'na.jpg', url: 'Africa/Nairobi', time:'', isDayTime: true),
    WorldTime(location: 'Chicago', flag: 'ch.jpg', url: 'America/Chicago', time: '', isDayTime: true),
    WorldTime(location: 'New York', flag: 'ne.jpg', url: 'America/New_York', time:'', isDayTime:true ),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen

    Navigator.pop(context, {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime,
    });
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
          itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
          }
      ),
    );
  }
}
