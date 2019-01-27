import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'requests.dart';
import 'package:aggiewalk/markers.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
            actions: <Widget>[
                IconButton(icon: Icon(Icons.refresh),onPressed: (){
                    myController.clearMarkers();
                    populateMarkers();
                },)
            ],
           bottom:  TabBar(
        tabs: [
          Tab(icon: Icon(Icons.map)),
          Tab(icon: Icon(Icons.list)),
          Tab(icon: Icon(Icons.forum)),
        ]),
            backgroundColor: Color.fromRGBO(128, 0, 0, 1.0),
            title: Text("Aggies Help"),
        ),
       // This trailing comma makes auto-formatting nicer for build methods.
       body: 
       TabBarView(
           children: <Widget>[
                   Stack(
           alignment: AlignmentDirectional.bottomStart,
           children: <Widget>[
               Container(
                   height: MediaQuery.of(context).size.height -100,
                   width: MediaQuery.of(context).size.width,
                   child: GoogleMap(
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
        
           ],
       ),

           ],
       )
       
       
   
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
