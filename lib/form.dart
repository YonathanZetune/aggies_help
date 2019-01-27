import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart';


class FormPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(128, 0, 0, 1.0),
            title: Text('Event/Walk Submission'),
        ),
        body: FormSubmission(),
    );
  }
}
   
  class FormSubmission extends StatefulWidget {
      //FormSubmission({Key key}) : super(key: key);
  @override
  FormSubmissionState createState() {
    return FormSubmissionState();
  }
}
  

  

  class FormSubmissionState extends State<FormSubmission> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
   static Map<String, dynamic> myForm = Map<String, dynamic>();
  // Note: This is a `GlobalKey<FormState>`, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return Form(
      key: _formKey,
      child: SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  new TextFormField(
                      validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }else{
                  myForm['Person'] = value;
              }
            },
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Enter your name',
                      labelText: 'Name',
                    ),
                  ),
                     new TextFormField(
                    validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }else{
                  myForm['Description'] = value;
              }
            },
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.description),
                      hintText: 'Enter your event description',
                      labelText: 'Description',
                    ),
                  
                  ),
                  new TextFormField(
                      validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }else{
                  myForm['Phone'] = value;
              }
            },
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.phone),
                      hintText: 'Enter a phone number',
                      labelText: 'Phone',
                    ),
                     
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                  ),
                  new TextFormField(
                      validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }else{
                  myForm['Event Name'] = value;
              }
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
                            if (_formKey.currentState.validate()) {
                  // If the form is valid, we want to show a Snackbar
                        getCurrentLocation(false);
                            
                        Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                      Navigator.pop(context);
                }
                         }),
                      ),
                new Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      
                        child:new RaisedButton(
                        child: const Text('Request a walk'),
                        onPressed: (){
                            if (_formKey.currentState.validate()) {
                  // If the form is valid, we want to show a Snackbar
                        getCurrentLocation(true);
                            
                        Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                      Navigator.pop(context);
                }
                         }),
                      ),
                  
                      
                ],
              )
              )
              
    )
    );
  }
}
    Future<void> getCurrentLocation(bool isWalk) async{
        var currentLocation;
        var location = Location();
        try {
        currentLocation = await location.getLocation().then((value){
             FormSubmissionState.myForm['Location'] =  GeoPoint((value.values.toList()[2]), (value.values.toList()[3]));
             FormSubmissionState.myForm['isWalk'] = isWalk;
            print('VAL:' + value.toString());
            print('FORM:' + value.toString());
 
            Firestore.instance.collection('Events').document().setData(FormSubmissionState.myForm);
        });
        } on PlatformException {
        //currentLocation = null;
        }
        
        //return currentLocation;
    }
    

