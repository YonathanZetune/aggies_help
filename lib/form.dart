import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart';
class FormSubmission extends StatelessWidget {
    static Map<String, dynamic> myForm; 

    Future<Map<String, dynamic>> getCurrentLocation() async{
        var currentLocation = <String, double>{};
        var location = Location();
        try {
        currentLocation = await location.getLocation().then((value){
            myForm['Location'].latitude = value[0];
            print(value[0]);
            myForm['Location'].longitude = value[1];
        });
        } on PlatformException {
        currentLocation = null;
        }
        
        return currentLocation;
    }
    @override
    Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(128, 0, 0, 1.0),
            title: Text('Event/Walk Submission'),
        ),
        body: SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Enter your name',
                      labelText: 'Name',
                    ),
                    onSaved: (input){ 
                  myForm['Person'] = input;
                  },
                  ),
                     new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.description),
                      hintText: 'Enter your event description',
                      labelText: 'Description',
                    ),
                    onSaved: (input){ 
                  myForm['Description'] = input;
                  },
                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.phone),
                      hintText: 'Enter a phone number',
                      labelText: 'Phone',
                    ),
                     onSaved: (input){ 
                  myForm['Phone'] = input;
                  },
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                  ),
                  new TextFormField(
                       onSaved: (input){ 
                  myForm['Event Name'] = input;
                  },
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.title),
                      hintText: 'Enter a name for event',
                      labelText: 'Event title',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  new 
                  Row(children: [
                      Icon(Icons.info),
                      Padding(padding: EdgeInsets.all(10)),
                      Text('All events will stay posted for 3 hours\nYour current location will be used'),

                  ]
                  ),
                  new Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      
                          child:new RaisedButton(
                        child: const Text('Submit'),
                        onPressed: (){
                            
                            //var myLoc = getCurrentLocation();
                            
                            Firestore.instance.collection('Events').document().setData(myForm);

                        }),
                      ),
                  
                      
                ],
              )
              )
              
    )
    );
  }
}
