import 'package:flutter/material.dart';
import 'requests.dart';
import 'main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class EventMarker{
    
    // static Marker buildMarkers(BuildContext context) {
    //        StreamBuilder(
    //         stream: Firestore.instance.collection('Events').snapshots(),
    //         builder: (context, snapshot){
    //         if (!snapshot.hasData) return Text('loading...');
    //         var itemCount = snapshot.data.documents.length;
    //         for (int n in itemCount-1)
    //         //return Marker(_options: MarkerOptions(position: ))
    //         MyHomePage.addEventMarkers(context, snapshot.data.documents[n]['location'], snapshot.data.documents[n]['description']);
           
    //         }
          
    //     );
    // }
  }