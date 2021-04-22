import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vecsympo/home.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  TextEditingController emailInputController;
  TextEditingController pwdInputController;


  @override
  initState() {
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    super.initState();
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(60),
      //   child: AppBar(
      //     title: Text("Login",style: TextStyle(color: Colors.black,fontSize: 25),),
      //     backgroundColor: Colors.white,
      //     centerTitle: true,
      //     shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.vertical(
      //             bottom: Radius.circular(20)
      //         )
      //     ),
      //   ),
      // ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(0,50, 0, 0),
                  child: Image.asset('assets/logo.png'),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                    padding: EdgeInsets.fromLTRB(15,10, 0, 0),
                    child:Text('Hello There,',style: TextStyle(color: Colors.black,fontSize: 30,),)
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                    padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                    child:Text('Welcome Back!',style: TextStyle(color: Colors.black,fontSize: 30,),)
                ),
              ),
              Container(
                // color: Colors.white,
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                      child: Form(
                        key: _loginFormKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Email', ),
                              controller: emailInputController,
                              keyboardType: TextInputType.emailAddress,
                              validator: emailValidator,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Password', ),
                              controller: pwdInputController,
                              obscureText: true,
                              validator: pwdValidator,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: RaisedButton(
                                child: Text("Login"),
                                color:Colors.pinkAccent,
                                textColor: Colors.white,
                                onPressed: () {
                                  if (_loginFormKey.currentState.validate()) {
                                    FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                        email: emailInputController.text,
                                        password: pwdInputController.text)
                                        .then((currentUser) => Firestore.instance
                                        .collection("users")
                                        .document(currentUser.user.uid)
                                        .get()
                                        .then((DocumentSnapshot result) =>
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Home(
                                                  title: result["fname"],
                                                  email: emailInputController.text,
                                                  uid: currentUser.user.uid,
                                                ))))
                                        .catchError((err) => print(err)))
                                        .catchError((err) => print(err));
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Don't have an account yet?"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                color: Colors.pinkAccent,
                                child: Text("Register here!",style: TextStyle(color: Colors.white),),
                                onPressed: () {
                                  Navigator.pushNamed(context, "/register");
                                },
                              ),
                            )
                          ],
                        ),
                      ))),
            ],
          ),
        ),
      ),


    );
  }
}
