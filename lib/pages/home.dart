import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey[200] ,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 300),
          child: Center(
            child: Column(
              children: [
                OutlinedButton.icon(onPressed: (){
                  Navigator.pushNamed(context, '/location');
                },
                  icon: Icon(Icons.edit_location),
                  label: Text('Edit Location'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
