import 'package:flutter/material.dart';
import 'package:finder_search/screens/P_home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class openp extends StatefulWidget {
  @override
  _openpState createState() => _openpState();
}

class _openpState extends State<openp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 6),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      },
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(image: new DecorationImage(
                image: AssetImage('assests/images/finderr.jpg'),fit: BoxFit.fill)
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height:420,
              ),




              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    LinearProgressIndicator(backgroundColor: Colors.white,),
                    Padding(padding: EdgeInsets.only(top: 20.0),),
                    Text('... Finding ...',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0,color: Colors.pink),)
                  ],
                ),
              )
            ],
          )
        ],
      ),

    );
  }
}
//Expanded(
//                flex: 2,
//                child: Container(
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      CircleAvatar(
//                        backgroundColor: Colors.white,
//                        radius: 60.0,
//                        child: Icon(FontAwesomeIcons.researchgate,color: Colors.pinkAccent,size: 50.0,),
//                      ),
//
//
//
//                      Padding(padding: EdgeInsets.only(top: 30.0),),
//                      Text('Finder',style: TextStyle(color: Colors.pink,fontSize: 50.0,fontWeight: FontWeight.bold),)
//
//                    ],
//                  ),
//                ),
//              ),