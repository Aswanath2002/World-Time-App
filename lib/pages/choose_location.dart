import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<World_time> locations = [
    World_time(location: 'London', flag: 'uk.jpg', url: 'Europe/London'),
    World_time(location: 'Athens', flag: 'greece.jpg', url: 'Europe/Berlin'),
    World_time(location: 'Cairo', flag: 'egypt.jpg', url: 'Africa/Cairo'),
    World_time(location: 'Nairobi', flag: 'kenya.jpg', url: 'Africa/Nairobi'),
    World_time(location: 'Chicago', flag: 'usa.jpg', url: 'America/Chicago'),
    World_time(location: 'New York', flag: 'usa.jpg', url: 'America/New_York'),
    World_time(location: 'Seoul', flag: 'south_korea.jpg', url: 'Asia/Seoul'),
    World_time(location: 'Jakarta', flag: 'indonesia.jpg', url: 'Asia/Jakarta')
  ];

  void updateTime(index) async{
    World_time instance=locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
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
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 5.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
