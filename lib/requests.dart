import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Requests {
    static Stream getAllEvents() async* {
        var eventDocs = await Firestore.instance.collection('Events').snapshots();
        print(eventDocs.toString());
        //return eventDocs;
        //var events = EventList.fromJson(parsedJson)
    }
   
    static Future getResult(String path) async {
        var request = await HttpClient().getUrl(Uri.parse('http://transport.tamu.edu/BusRoutesFeed$path')); // produces a request object
        var response = await request.close(); // sends the request
        // transforms and prints the response
        var contents = await response.transform(utf8.decoder).transform(json.decoder).single;{
        return contents;
        }
        
    }
}

