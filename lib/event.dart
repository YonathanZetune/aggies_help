import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventList {
  final List<Event> buslist;
  EventList({
    this.buslist,
  });
factory EventList.fromJson(List<dynamic> parsedJson) {
    List<Event> buses = new List<Event>();
    buses = (parsedJson).map((i)=>Event.fromJson(i)).toList();
    return new EventList(
       buslist: buses,
    );
  }

}

class Event {
   
    String description;
    String name;
    LatLng location;
    Event({this.description, this.name, this.location});
    
    factory Event.fromJson(Map<String, dynamic> json) {
        

    return new Event(
       
    );
  }
}

