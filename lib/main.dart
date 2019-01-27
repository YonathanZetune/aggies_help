import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'requests.dart';

import 'package:aggiewalk/form.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    // home: MyApp(),
    // Start the app with the "/" named route. In our case, the app will start
    // on the FirstScreen Widget
    initialRoute: '/',
    routes: {
      // When we navigate to the "/" route, build the FirstScreen Widget
   
      '/form': (context) => FormSubmission(),
    
      //'/AllEvents': (BuildContext context) => new Eventslist()
      // When we navigate to the "/second" route, build the SecondScreen Widget
      //'/second': (context) => TeamViewData()
    },
    debugShowCheckedModeBanner: false,
      title: 'Aggie Help',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Aggie Help'),
    );
  }
}
 
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    static GoogleMapController myController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child:
    Scaffold(
        appBar: AppBar(
            centerTitle: true,
            actions: <Widget>[
                
                IconButton(icon: Icon(Icons.refresh),onPressed: (){
                    myController.clearMarkers();
                    populateMarkers();
                },),
                IconButton(icon: Icon(Icons.forum),onPressed: (){
                    Navigator.pushNamed(context, '/form');
                },)
            ],
         
            backgroundColor: Color.fromRGBO(128, 0, 0, 1.0),
            title: Text("Aggies Help"),
        ),
       // This trailing comma makes auto-formatting nicer for build methods.
       body: 
               Container(
                   height: MediaQuery.of(context).size.height -100,
                   width: MediaQuery.of(context).size.width,
                   child: GoogleMap(
                       //gestureRecognizers: gestorre,
                       onMapCreated: (controller) {
                           setState(() {
                            myController = controller; 
                                   
                           });
                       },
                       options: GoogleMapOptions(
                           mapType: MapType.satellite,
                           zoomGesturesEnabled: true,
                           rotateGesturesEnabled: true,
                           tiltGesturesEnabled: false,
                           scrollGesturesEnabled: true,
                           cameraPosition: CameraPosition(
                               target:  LatLng(30.614665, -96.342327),
                               bearing: 270,
                               zoom: 16.0,
                               tilt: 0
                           )
                       ),
                   ),
               ),
                
           
       
       //FormSubmission(),

       
       
   
    ),
    );
  }
  var events = [];
  void initState() {
 
    super.initState();
    
    populateMarkers();
    print('INIT');

  }
  populateMarkers(){
      events = [];
      Firestore.instance.collection('Events').getDocuments().then((docs){
          if(docs.documents.isNotEmpty){
              for(int i = 0; i<docs.documents.length; ++i){
                    events.add(docs.documents[i].data);
                    initMarker(docs.documents[i].data);
              }
              
          }
      });
  }

  initMarker(event){
      myController.clearMarkers().then((val) {
          myController.addMarker(MarkerOptions(icon: BitmapDescriptor.fromAsset('assets/study.png'),position: LatLng(event['Location'].latitude, event['Location'].longitude
          ),
          draggable: false,
          infoWindowText: InfoWindowText(event['Event Name'], event['Description'])));
          
      });


  }

}
