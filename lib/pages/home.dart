import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic>? data;
  @override
  Widget build(BuildContext context) {
    if (data == null || data!.isEmpty) {
      data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    }
    print(data);
    // TODO: Return a widget that makes use of `data`.

    // set background
    String bgImage =data?['isDayTime'] ? 'day.jpg' : 'nyt.jpg';
    Color? bgColor = data?['isDayTime']? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Center(
              child: Column(
                children: [
                  OutlinedButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data={
                          'time': result ['time'],
                          'location': result ['location'],
                          'isDayTime': result ['isDayTime'],
                          'flag': result ['flag'],
                        };
                      });
                    },
                    icon: Icon(
                        Icons.edit_location,
                      color: Colors.grey[300],

                    ),
                    label: Text(
                      'Edit Location',
                      style: TextStyle(
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data?['location'] ?? '',
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        data?['time'] ?? '',
                        style: TextStyle(
                          fontSize: 66.0,
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
