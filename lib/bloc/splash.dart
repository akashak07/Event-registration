import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vecsympo/home.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  initState() {
    FirebaseAuth.instance
        .currentUser()
        .then((currentUser) => {
      if (currentUser == null)
        {Navigator.pushReplacementNamed(context, "/login")}
      else
        {
          Firestore.instance
              .collection("users")
              .document(currentUser.uid)
              .get()
              .then((DocumentSnapshot result) =>
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home(
                        title: result["fname"] ,
                        email:result['email'],
                        uid: currentUser.uid,
                      ))))
              .catchError((err) => print(err))
        }
    })
        .catchError((err) => print(err));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset('assets/logo.png',height: 700,width: 700,),
        ),
      ),
    );
  }
}