import 'package:flutter/material.dart';
import 'package:finder_search/screens/Page_2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:finder_search/utils/database_helper.dart';

//import 'package:image_picker/image_picker.dart';
//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:path/path.dart';

class pageone extends StatefulWidget {
  @override
  _pageoneState createState() => _pageoneState();
}

class _pageoneState extends State<pageone> {
  final _formKey = GlobalKey<FormState>();
  DatabaseHelper databaseHelper = DatabaseHelper.internal();
  TextStyle myStyle2 = TextStyle(fontSize: 35.0,fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    TextEditingController myName = TextEditingController();
    TextEditingController myfacebook = TextEditingController();
    TextEditingController mywikipidia = TextEditingController();

    bool isActive = true;

    Future<Null> saveData() async {
      print(myName.text);
      print(myfacebook.text);
      print(mywikipidia.text);
      print(isActive);

      if (_formKey.currentState.validate()) {
        Map member = {
          'userName': myName.text,
          'fackbook': myfacebook.text,
          'wikipidia': mywikipidia.text
        };
        await databaseHelper.saveData(member);
        print('OK');
      } else {
        print('Failed!!!');
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent.shade100,
        elevation: 0.0,
        title:Container(
          padding: EdgeInsets.only(left: 150),
          child: Text('Finder',style: myStyle2,),
        ),

      ),
      body: Builder(
        builder: (context)=>Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: SizedBox(
                           width: 180,
                          height: 180,
                          child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Thanatorn_cropped_2018.jpg/230px-Thanatorn_cropped_2018.jpg'
                            ,fit: BoxFit.fill,),
                      ),
                    ),
                  ),
                ),
                  Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: IconButton(
                      icon: Icon(FontAwesomeIcons.camera,size: 30,color: Colors.white,),
                      onPressed: (){

                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Name',
                                  labelStyle: TextStyle(fontSize: 20.0)),
                              controller: myName,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'กรุณากรอกข้อมูล';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                        ],
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Facebook',
                            labelStyle: TextStyle(fontSize: 20.0)),
                        controller: myfacebook,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'กรุณากรอกข้อมูล';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Wikipidia',
                            labelStyle: TextStyle(fontSize: 20.0)),
                        controller: mywikipidia,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'กรุณากรอกข้อมูล';
                          }
                          return null;
                        },
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    color: Colors.amber,
                    icon: Icon(FontAwesomeIcons.solidSave,size: 30,),
                    onPressed: ()=> saveData(),
                    splashColor: Colors.blueGrey,

                  ),

                ],
              )



            ],
          ),

        ),
      ),




    );
  }
}
