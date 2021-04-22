
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:vecsympo/mech.dart';
import 'package:vecsympo/civil.dart';
import 'package:vecsympo/cse.dart';
import 'package:vecsympo/ece.dart';
import 'package:vecsympo/eee.dart';
import 'package:vecsympo/eandi.dart';
import 'package:vecsympo/it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vecsympo/bloc/event.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title, this.uid,this.email}) : super(key: key); //update this to include the uid in the constructor
  final String title;
  final String uid;
  final String email;
  @override
  _HomeState createState() => _HomeState(uid,email,title);
}

class _HomeState extends State<Home> {
  final String uid,email,title;

  _HomeState(this.uid,this.email,this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          title: Text("VEC-Sympo",style: TextStyle(color: Colors.white,fontSize: 25),),
          backgroundColor: Colors.black45,
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20)
              )
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 200,
              width: 250,
              child: Stack(
                children:<Widget> [
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: ClipOval(
                              child: Image.asset(
                                'assets/logo1.png',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          padding: EdgeInsets.fromLTRB(5, 15, 0, 10),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(5, 0, 0, 10),
                            child: Text(widget.title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(5, 0, 0, 10),
                            child: Text(widget.email,style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [
                        0.060,
                        0.4,
                        0.6,
                        0.9
                      ],
                      colors: [
                        Colors.purple,
                        Colors.red,
                        Colors.indigo,
                        Colors.teal
                      ])),
            ),
            ListTile(
              title:  Text("Events"),
              leading:  Icon(Icons.event_rounded,color: Colors.black,),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Events()),
                );
              },
            ),
            Divider(),
            ListTile(
              title:  Text("Logout"),
              leading:  Icon(Icons.logout,color: Colors.black,),
              onTap: (){
                FirebaseAuth.instance
                    .signOut()
                    .then((result) =>
                    Navigator.pushReplacementNamed(context, "/login"))
                    .catchError((err) => print(err));
              },
            ),
            Divider(),
          ],
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children:<Widget> [

              //department section
              Container(
                // padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                padding: EdgeInsets.all(5),
                height: 100,
                width: double.maxFinite,
                child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 15,
                    margin: EdgeInsets.all(10),
                    child:
                    Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  stops: [
                                    0.060,
                                    0.4,
                                    0.6,
                                    0.9
                                  ],
                                  colors: [
                                    Colors.purple,
                                    Colors.red,
                                    Colors.indigo,
                                    Colors.teal
                                  ])),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text("DEPARTMENT'S",style: TextStyle(color: Colors.white,fontSize: 40),),
                        )
                      ],
                    )
                ),

              ),


              //Cared view
              //Civil
              Container(
                // padding: EdgeInsets.fromLTRB(10, 3, 10, 10),
                padding: EdgeInsets.all(5),
                height: 220,
                width: double.maxFinite,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 15,
                  margin: EdgeInsets.all(10),
                  child:
                  Stack(
                      children: <Widget>[

                        Container(
                          decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: new ExactAssetImage('assets/civil.jpeg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: new BackdropFilter(
                            filter: new ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                            child: new Container(
                              decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Text('CIVIL',style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                  alignment: Alignment.bottomRight,
                                  child:
                                  ElevatedButton(
                                    child: Text("Register"),
                                    onPressed: () {

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Civil(uid:uid)),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                      onPrimary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32.0),
                                      ),
                                    ),
                                  )
                              ),
                            ),

                          ],
                        )
                      ]
                  ),
                  // Container(
                  //   height: 10,
                  //   width: double.maxFinite,
                  //   color: Colors.white,
                  // )
                ),
              ),

              //cse
              Container(
                // padding: EdgeInsets.fromLTRB(10, 3, 10, 10),
                padding: EdgeInsets.all(5),
                height: 220,
                width: double.maxFinite,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 15,
                  margin: EdgeInsets.all(10),
                  child:
                  Stack(
                      children: <Widget>[

                        Container(
                          decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: new ExactAssetImage('assets/it.jpeg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: new BackdropFilter(
                            filter: new ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                            child: new Container(
                              decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Text('CSE',style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child:
                              Container(
                                  alignment: Alignment.bottomRight,
                                  child:
                                  ElevatedButton(
                                    child: Text("Register"),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Cse(uid:uid)),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                      onPrimary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32.0),
                                      ),
                                    ),
                                  )
                              ),
                            )
                          ],
                        )
                      ]
                  ),
                  // Container(
                  //   height: 10,
                  //   width: double.maxFinite,
                  //   color: Colors.white,
                  // )
                ),
              ),

              //ece
              Container(
                // padding: EdgeInsets.fromLTRB(10, 3, 10, 10),
                padding: EdgeInsets.all(5),
                height: 220,
                width: double.maxFinite,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 15,
                  margin: EdgeInsets.all(10),
                  child:
                  Stack(
                      children: <Widget>[

                        Container(
                          decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: new ExactAssetImage('assets/ece.jpeg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: new BackdropFilter(
                            filter: new ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                            child: new Container(
                              decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Text('ECE',style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child:
                              Container(
                                  alignment: Alignment.bottomRight,
                                  child:
                                  ElevatedButton(
                                    child: Text("Register"),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Ece(uid:uid)),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                      onPrimary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32.0),
                                      ),
                                    ),
                                  )
                              ),
                            )
                          ],
                        )
                      ]
                  ),
                  // Container(
                  //   height: 10,
                  //   width: double.maxFinite,
                  //   color: Colors.white,
                  // )
                ),
              ),

              //eee
              Container(
                // padding: EdgeInsets.fromLTRB(10, 3, 10, 10),
                padding: EdgeInsets.all(5),
                height: 220,
                width: double.maxFinite,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 15,
                  margin: EdgeInsets.all(10),
                  child:
                  Stack(
                      children: <Widget>[

                        Container(
                          decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: new ExactAssetImage('assets/eee.jpeg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: new BackdropFilter(
                            filter: new ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                            child: new Container(
                              decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Text('EEE',style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child:
                              Container(
                                  alignment: Alignment.bottomRight,
                                  child:
                                  ElevatedButton(
                                    child: Text("Register"),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Eee(uid:uid)),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                      onPrimary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32.0),
                                      ),
                                    ),
                                  )
                              ),
                            )
                          ],
                        )
                      ]
                  ),
                  // Container(
                  //   height: 10,
                  //   width: double.maxFinite,
                  //   color: Colors.white,
                  // )
                ),
              ),

              //eandi
              Container(
                // padding: EdgeInsets.fromLTRB(10, 3, 10, 10),
                padding: EdgeInsets.all(5),
                height: 220,
                width: double.maxFinite,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 15,
                  margin: EdgeInsets.all(10),
                  child:
                  Stack(
                      children: <Widget>[

                        Container(
                          decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: new ExactAssetImage('assets/eandi.jpeg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: new BackdropFilter(
                            filter: new ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                            child: new Container(
                              decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Text('E&I',style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child:
                              Container(
                                  alignment: Alignment.bottomRight,
                                  child:
                                  ElevatedButton(
                                    child: Text("Register"),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Eandi(uid:uid)),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                      onPrimary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32.0),
                                      ),
                                    ),
                                  )
                              ),
                            )
                          ],
                        )
                      ]
                  ),
                  // Container(
                  //   height: 10,
                  //   width: double.maxFinite,
                  //   color: Colors.white,
                  // )
                ),
              ),

              //mech
              Container(
                // padding: EdgeInsets.fromLTRB(10, 3, 10, 10),
                padding: EdgeInsets.all(5),
                height: 220,
                width: double.maxFinite,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation:15,
                  margin: EdgeInsets.all(10),
                  child:
                  Stack(
                      children: <Widget>[

                        Container(
                          decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: new ExactAssetImage('assets/mech.jpeg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: new BackdropFilter(
                            filter: new ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                            child: new Container(
                              decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Text('MECH',style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child:
                              Container(
                                  alignment: Alignment.bottomRight,
                                  child:
                                  ElevatedButton(
                                    child: Text("Register"),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Mech(uid:uid)),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                      onPrimary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32.0),
                                      ),
                                    ),
                                  )
                              ),
                            )
                          ],
                        )
                      ]
                  ),
                  // Container(
                  //   height: 10,
                  //   width: double.maxFinite,
                  //   color: Colors.white,
                  // )
                ),
              ),

              //it
              Container(
                // padding: EdgeInsets.fromLTRB(10, 3, 10, 10),
                padding: EdgeInsets.all(5),
                height: 220,
                width: double.maxFinite,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 15,
                  margin: EdgeInsets.all(10),
                  child:
                  Stack(
                      children: <Widget>[

                        Container(
                          decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: new ExactAssetImage('assets/it.jpeg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: new BackdropFilter(
                            filter: new ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                            child: new Container(
                              decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Text('IT',style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child:
                              Container(
                                  alignment: Alignment.bottomRight,
                                  child:
                                  ElevatedButton(
                                    child: Text("Register"),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => It(uid:uid)),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                      onPrimary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32.0),
                                      ),
                                    ),
                                  )
                              ),
                            )
                          ],
                        )
                      ]
                  ),
                  // Container(
                  //   height: 10,
                  //   width: double.maxFinite,
                  //   color: Colors.white,
                  // )
                ),
              ),
            ],
          ),
        ),
      ),



    );
  }
}
