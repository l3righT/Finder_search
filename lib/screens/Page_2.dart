import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:finder_search/utils/database_helper.dart';
import 'package:finder_search/screens/Page_1.dart';

class pagetwo extends StatefulWidget {
  @override
  _pagetwoState createState() => _pagetwoState();
}

class _pagetwoState extends State<pagetwo> {
  TextStyle myStyle2 = TextStyle(fontSize: 35.0,fontWeight: FontWeight.bold);
  TextStyle descrip = TextStyle(fontSize: 20.0,color: Colors.grey);
  DatabaseHelper databaseHelper = DatabaseHelper.internal();
  List members = [];

 
  Future getMembers() async {
    var res = await databaseHelper.getList();
    print(res);
    setState(() {
      members = res;
    });
  }
  Future removeMembers(int id) async {
    await databaseHelper.remove(id);
    getMembers();
  }

  @override
  //control
  PageController _pageController;

  @override
  void initState(){
    super.initState();
    _pageController = PageController(initialPage: 1,viewportFraction: 0.8);
    // TODO: implement initState
    getMembers();
  }

  _people(int index){
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );

      },
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0.0, 4.0),
                    blurRadius: 10.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  //facebook
  _facebookURL(String $profileName) async {
    var url = 'https://facebook.com/'+ $profileName;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
//Wiki
  _WikiURL(String $profileName) async {
    var url = 'https://th.wikipedia.org/wiki/' + $profileName;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.pinkAccent.shade100,
        elevation: 0.0,
        title:Container(
          padding: EdgeInsets.only(left: 150),
          child: Text('Finder',style: myStyle2,),
        ),
          actions: <Widget>[
          IconButton(
            padding : EdgeInsets.only(right: 30.0),
            onPressed: (){},
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.black,
          )
        ],

      ),

       body: Container(
         margin: EdgeInsets.symmetric(vertical: 20.0),
         child: ListView(
           scrollDirection: Axis.horizontal,
          children: <Widget>[
            Stack(

              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 150),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: 350,
                        height: 350,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white
                        ),
                        child: Hero(
                          tag: 'dash',
                          child: Container(child: Column(

                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.bottomCenter,
                                height: 170,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('ประยุทธ์  จันทร์โอชา',style: myStyle2,),
                                  ],
                                ),
                              ),
                              SizedBox(height: 30,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      InkWell(
                                        child: Icon(FontAwesomeIcons.facebook,size: 55,color: Colors.blueAccent,),
                                        onTap: (){
                                          _facebookURL("prayutofficial");
                                        },
                                      ),
                                      SizedBox(height: 5,),
                                      Text('Fackbook',style: descrip,)
                                    ],

                                  ),
                                  Column(
                                    children: <Widget>[
                                      InkWell(
                                        child: Icon(FontAwesomeIcons.wikipediaW,size: 55,color: Colors.grey,),
                                        onTap: (){
                                          _WikiURL("ประยุทธ์_จันทร์โอชา");
                                        },
                                      ),
                                      SizedBox(height: 5,),
                                      Text('  Wikipidia',style: descrip,)
                                    ],

                                  ),
                                ],
                              ),


                            ],
                          )

                          ),
                        ),
                      ),
                    ),
                  ),
                ),


                Positioned(
                  top: 20,

                  child: Container(
                    width: 240,
                    height: 240,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,image: AssetImage('assests/images/Tu.jpg')
                        ),
                        border: Border.all(
                            color: Colors.white,
                            width: 8
                        )
                    ),
                  ),
                ),
              ],
            ),
            Stack(

              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 150),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: 350,
                        height: 350,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white
                        ),
                        child: Hero(
                          tag: 'dash',
                          child: Container(child: Column(

                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.bottomCenter,
                                height: 170,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('ปารีณา  ไกรคุปต์',style: myStyle2,),
                                  ],
                                ),
                              ),
                              SizedBox(height: 30,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      InkWell(
                                        child: Icon(FontAwesomeIcons.facebook,size: 55,color: Colors.blueAccent,),
                                        onTap: (){
                                          _facebookURL("pareena.k");
                                        },
                                      ),
                                      SizedBox(height: 5,),
                                      Text('Fackbook',style: descrip,)
                                    ],

                                  ),
                                  Column(
                                    children: <Widget>[
                                      InkWell(
                                        child: Icon(FontAwesomeIcons.wikipediaW,size: 55,color: Colors.grey,),
                                        onTap: (){
                                          _WikiURL("ปารีณา_ไกรคุปต์");
                                        },
                                      ),
                                      SizedBox(height: 5,),
                                      Text('  Wikipidia',style: descrip,)
                                    ],

                                  ),
                                ],
                              ),


                            ],
                          )

                          ),
                        ),
                      ),
                    ),
                  ),
                ),


                Positioned(
                  top: 20,

                  child: Container(
                    width: 240,
                    height: 240,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,image: AssetImage('assests/images/Eae.jpg')
                        ),
                        border: Border.all(
                            color: Colors.white,
                            width: 8
                        )
                    ),
                  ),
                ),
              ],
            ),
            Stack(

              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 150),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: 350,
                        height: 350,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white
                        ),
                        child: Hero(
                          tag: 'dash',
                          child: Container(child: Column(

                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.bottomCenter,
                                height: 170,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('ธนาธร จึงรุ่งเรืองกิจ',style: myStyle2,),
                                  ],
                                ),
                              ),
                              SizedBox(height: 30,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      InkWell(
                                        child: Icon(FontAwesomeIcons.facebook,size: 55,color: Colors.blueAccent,),
                                        onTap: (){
                                          _facebookURL("ThanathornOfficial");
                                        },
                                      ),
                                      SizedBox(height: 5,),
                                      Text('Fackbook',style: descrip,)
                                    ],

                                  ),
                                  Column(
                                    children: <Widget>[
                                      InkWell(
                                        child: Icon(FontAwesomeIcons.wikipediaW,size: 55,color: Colors.grey,),
                                        onTap: (){
                                          _WikiURL("ธนาธร_จึงรุ่งเรืองกิจ");
                                        },
                                      ),
                                      SizedBox(height: 5,),
                                      Text('  Wikipidia',style: descrip,)
                                    ],

                                  ),
                                ],
                              ),


                            ],
                          )

                          ),
                        ),
                      ),
                    ),
                  ),
                ),


                Positioned(
                  top: 20,

                  child: Container(
                    width: 240,
                    height: 240,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,image: NetworkImage(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Thanatorn_cropped_2018.jpg/230px-Thanatorn_cropped_2018.jpg')
                        ),
                        border: Border.all(
                            color: Colors.white,
                            width: 8
                        )
                    ),
                  ),
                ),
              ],
            ),

          ],

      ),
        // itemCount: members != null ? members.length : 0,
       ),

    );
  }
}
//alignment: Alignment.bottomCenter, Stack(
//              alignment: Alignment.bottomCenter,
//              children: <Widget>[
//                ListView.builder(itemBuilder: (context,int index){
//                        Container(
//                           padding: EdgeInsets.only(top: 150),
//                           child: Center(
//                           child: Padding(
//                           padding: const EdgeInsets.all(16.0),
//                                 child: Container(
//                                 width: 350,
//                                 height: 350,
//                                 decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12.0),
//                                 color: Colors.white
//                                 ),
//                                 child: Hero(
//                                 tag: 'dash',
//                                 child: Container(child: Column(
//
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: <Widget>[
//                                 Container(
//                                 alignment: Alignment.bottomCenter,
//                                 height: 170,
//                                 child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: <Widget>[
//                                 Text('${members[index]['user_name']}',style: myStyle2,),
//                                 ],
//                                 ),
//                                 ),
//                                 SizedBox(height: 30,),
//
//                                 Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 children: <Widget>[
//                                 Column(
//                                 children: <Widget>[
//                                 InkWell(
//                                 child: Icon(FontAwesomeIcons.facebook,size: 55,color: Colors.blueAccent,),
//                                 onTap: (){
//                                 _facebookURL("${members[index]['facebook']}");
//                                 },
//                                 ),
//                                 SizedBox(height: 5,),
//                                 Text('Fackbook',style: descrip,)
//                                 ],
//
//                                 ),
//                                 Column(
//                                 children: <Widget>[
//                                 InkWell(
//                                 child: Icon(FontAwesomeIcons.wikipediaW,size: 55,color: Colors.grey,),
//                                 onTap: (){
//                                 _WikiURL("${members[index]['wiki']}");
//                                 },
//                                 ),
//                                 SizedBox(height: 5,),
//                                 Text('  Wikipidia',style: descrip,)
//                                 ],
//
//                                 ),
//                                 IconButton(
//                                 icon: Icon(Icons.delete),
//                                 onPressed: () => removeMembers(members[index]['id'])
//                                 )
//                                 ],
//                                 ),
//
//
//                                 ],
//                                 )
//
//                                 ),
//                                 ),
//                                 ),
//                                 ),
//                                 ),
//                                 );
//
//       },itemCount: members != null ? members.length : 1,
//
//                ),
//
//
//                Positioned(
//                  top: 20,
//
//                  child: Container(
//                    width: 240,
//                    height: 240,
//                    decoration: new BoxDecoration(
//                        shape: BoxShape.circle,
//                        image: new DecorationImage(
//                            fit: BoxFit.cover,image: NetworkImage(
//                            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Thanatorn_cropped_2018.jpg/230px-Thanatorn_cropped_2018.jpg')
//                        ),
//                        border: Border.all(
//                            color: Colors.white,
//                            width: 8
//                        )
//                    ),
//                  ),
//                ),
//              ],
//            ),