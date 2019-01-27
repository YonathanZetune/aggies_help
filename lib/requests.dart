import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';


class Requests {
    static Stream getAllEvents() async* {
        var eventDocs = await Firestore.instance.collection('Events').snapshots();
        print(eventDocs.toString());
        //return eventDocs;
        //var events = EventList.fromJson(parsedJson)
    }
   
    static Future getResult(String path) async {
       
}
}
