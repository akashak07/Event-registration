import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NumberList {
  String number;
  int index;
  NumberList({this.number, this.index});

}

class Mech extends StatefulWidget {
  Mech({Key key,this.uid}):super(key:key);
  final String uid;
  @override
  _MechState createState() => _MechState();
}

class _MechState extends State<Mech> {
  TextEditingController nameInputController=new TextEditingController();
  TextEditingController mobileInputController=new TextEditingController();
  TextEditingController mailInputController=new TextEditingController();
  TextEditingController departmentInputController=new TextEditingController();
  TextEditingController collegeInputController=new TextEditingController();
  TextEditingController year=new TextEditingController();
  String radioItemHolder;
  int id = 1;

  List<NumberList> nList = [
    NumberList(
      index: 1,
      number: "Test Event1",
    ),
    NumberList(
      index: 2,
      number: "Test Event2",
    ),
    NumberList(
      index: 3,
      number: "Test Event3",
    ),
    NumberList(
      index: 4,
      number: "Test Event4",
    ),
    NumberList(
      index: 5,
      number: "Test Event5",
    ),
  ];
  radiobutton(){
    return Container(
      height: 350.0,
      child: Column(
        children:
        nList.map((data) => RadioListTile(
          title: Text("${data.number}"),
          groupValue: id,
          value: data.index,
          onChanged: (val) {
            setState(() {
              radioItemHolder = data.number ;
              id = data.index;
            });
          },
        )).toList(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MEQNZO",style: TextStyle(color: Colors.black,fontSize: 25),),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,size: 30,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20)
            )
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              height: 1300,
              width: double.maxFinite,
              child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 15,
                  margin: EdgeInsets.all(10),
                  child: Stack(
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
                          child: Column(
                            children: [
                              Container(
                                child: Text("MEQNZO' 2021",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white)) ,
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.all(10),
                              ),

                              //Name
                              Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.all(10),
                                child: Text("Name:",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.white)) ,
                              ),
                              Container(
                                padding: EdgeInsets.all(5.0),
                                child: Card(
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 5,
                                  margin: EdgeInsets.all(1),
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Enter Name",
                                          hintStyle: TextStyle(color: Colors.grey[400])
                                      ),
                                      controller: nameInputController,
                                    ),
                                  ),
                                ),
                              ),

                              //mobile number
                              Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.all(10),
                                child: Text("Mobile no:",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.white)) ,
                              ),
                              Container(
                                padding: EdgeInsets.all(5.0),
                                child: Card(
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 5,
                                  margin: EdgeInsets.all(1),
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Enter Mobile No",
                                          hintStyle: TextStyle(color: Colors.grey[400])
                                      ),
                                      controller: mobileInputController,
                                    ),
                                  ),
                                ),
                              ),

                              //mail
                              Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.all(10),
                                child: Text("E-Mail:",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.white)) ,
                              ),
                              Container(
                                padding: EdgeInsets.all(5.0),
                                child: Card(
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 5,
                                  margin: EdgeInsets.all(1),
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Enter E-Mail",
                                          hintStyle: TextStyle(color: Colors.grey[400])
                                      ),
                                      controller: mailInputController,
                                    ),
                                  ),
                                ),
                              ),

                              //deprtment
                              Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.all(10),
                                child: Text("Department:",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)) ,
                              ),
                              Container(
                                padding: EdgeInsets.all(5.0),
                                child: Card(
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 5,
                                  margin: EdgeInsets.all(1),
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Enter Department",
                                          hintStyle: TextStyle(color: Colors.grey[400])
                                      ),
                                      controller: departmentInputController,
                                    ),
                                  ),
                                ),
                              ),

                              //year
                              Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.all(10),
                                child: Text("Year:",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)) ,
                              ),
                              Container(
                                padding: EdgeInsets.all(5.0),
                                child: Card(
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 5,
                                  margin: EdgeInsets.all(1),
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Enter your Year",
                                          hintStyle: TextStyle(color: Colors.grey[400])
                                      ),
                                      controller: year,
                                    ),
                                  ),
                                ),
                              ),

                              //college name
                              Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.all(10),
                                child: Text("College Name:",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)) ,
                              ),
                              Container(
                                padding: EdgeInsets.all(5.0),
                                child: Card(
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 5,
                                  margin: EdgeInsets.all(1),
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Enter College Name",
                                          hintStyle: TextStyle(color: Colors.grey[400])
                                      ),
                                      controller: collegeInputController,
                                    ),
                                  ),
                                ),
                              ),

                              Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.all(10),
                                child: Text("Select Event:",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)) ,
                              ),
                              Container(
                                padding: EdgeInsets.all(5.0),
                                child: Card(
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 5,
                                    margin: EdgeInsets.all(1),
                                    child: radiobutton()
                                ),
                              ),

                              //button
                              Container(
                                padding: EdgeInsets.all(10),
                                child: ElevatedButton(
                                  child: Text("Click To Register",style: TextStyle(fontSize: 18),),
                                  onPressed: () {
                                    Firestore.instance.collection('users').document(
                                        widget.uid).collection('mech').add({
                                      "name":nameInputController.text,
                                      "mobile":mobileInputController.text,
                                      "mail":mailInputController.text,
                                      "department":departmentInputController.text,
                                      "college":collegeInputController.text,
                                      "year":year.text,
                                      "event":radioItemHolder
                                    }).then((value) =>
                                    {
                                      Navigator.pop(context),
                                      nameInputController.clear(),
                                      mobileInputController.clear(),
                                      mailInputController.clear(),
                                      departmentInputController.clear(),
                                      collegeInputController.clear(),
                                      year.clear()
                                    }).catchError((err) => print(err));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red,
                                    onPrimary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                  ),
                                ),
                              ),



                            ],
                          )
                      ),

                    ],
                  )
              ),
            ),

            //Events
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>Mechevent()),
                );
              },
              child: Container(
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
                                    0.1,
                                    0.4,
                                    0.6,
                                    0.9
                                  ],
                                  colors: [
                                    Colors.yellow,
                                    Colors.red,
                                    Colors.indigo,
                                    Colors.teal
                                  ])),
                        ),
                        GestureDetector(
                          onTap: (){},
                          child: Container(
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.topLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Events",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
                                Icon(Icons.arrow_forward_ios,color: Colors.black,)
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                ),
              ),
            ),

            //Coordinators
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>Mechcod()),
                );
              },
              child: Container(
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
                                    0.1,
                                    0.4,
                                    0.6,
                                    0.9
                                  ],
                                  colors: [
                                    Colors.yellow,
                                    Colors.red,
                                    Colors.indigo,
                                    Colors.teal
                                  ])),
                        ),
                        GestureDetector(
                          onTap: (){},
                          child: Container(
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.topLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Coordinators",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
                                Icon(Icons.arrow_forward_ios,color: Colors.black,)
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
class Mechevent extends StatefulWidget {
  @override
  _CivileventState createState() => _CivileventState();
}

class _CivileventState extends State<Mechevent> {
  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK",style: TextStyle(color: Colors.white),),
      color: Colors.pinkAccent,
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Event Name",overflow: TextOverflow.ellipsis),
      content: SingleChildScrollView(child: Column(
        children: <Widget>[
          Align(
              alignment: Alignment.topLeft,
              child: Text("Date:01/01/2020",style: TextStyle(fontWeight: FontWeight.bold))),
          Align(
              alignment: Alignment.topLeft,
              child: Text("Venue:SRM Valliammai Engineering college",overflow: TextOverflow.ellipsis
                  ,style: TextStyle(fontWeight: FontWeight.bold))),
          Align(
              alignment: Alignment.topLeft,
              child: Text("Instruction:",style: TextStyle(fontWeight: FontWeight.bold),)),
          Align(
              alignment: Alignment.topLeft,
              child: Text("Lorem ipsum, or lipsum as it is sometimes known, "
                  "is dummy text used in laying out print, graphic or web designs. "
                  "The passage is attributed to an unknown typesetter in the 15th "
                  "century who is thought to have scrambled parts of Cicero's De Finibus "
                  "Bonorum et Malorum for use in a type specimen book."
                ,overflow: TextOverflow.ellipsis,
                maxLines: 15,
              )),
        ],
      )),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event's",style: TextStyle(color: Colors.black,fontSize: 25),),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,size: 30,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20)
            )
        ),
      ),
      //
      body: Column(
        children: [
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
                      child: Text("Event's Information",style: TextStyle(color: Colors.white,fontSize: 25),),
                    )
                  ],
                )
            ),

          ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context,int index){
                  return  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: (){
                        showAlertDialog(context);
                      },
                      child: Container(
                        height: 60,
                        width: double.maxFinite,
                        child: Card(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Center(child: Icon(Icons.build,color: Colors.black,))),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Center(
                                      child: Text("Event Name",overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
//coordinators
class Mechcod extends StatefulWidget {
  @override
  _CivilcodState createState() => _CivilcodState();
}

class _CivilcodState extends State<Mechcod> {
  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK",style: TextStyle(color: Colors.white),),
      color: Colors.pinkAccent,
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Coordinators",overflow: TextOverflow.ellipsis),
      content: SingleChildScrollView(child: Column(
        children: <Widget>[
          Align(
              alignment: Alignment.topLeft,
              child: Image.asset('assets/logo.png')),
          Align(
              alignment: Alignment.topLeft,
              child: Text("xxxxxxx",style: TextStyle(fontWeight: FontWeight.bold))),
          Align(
              alignment: Alignment.topLeft,
              child: Text("President",overflow: TextOverflow.ellipsis
                  ,style: TextStyle(fontWeight: FontWeight.bold))),
          Align(
              alignment: Alignment.topLeft,
              child: Text("Mobile:1234567890",overflow: TextOverflow.ellipsis
                  ,style: TextStyle(fontWeight: FontWeight.bold))),
          Align(
              alignment: Alignment.topLeft,
              child: Text("Mail:testmail@gmail.com",overflow: TextOverflow.ellipsis
                  ,style: TextStyle(fontWeight: FontWeight.bold))),
        ],
      )),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coordinator's",style: TextStyle(color: Colors.black,fontSize: 25),),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,size: 30,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20)
            )
        ),
      ),
      body: Column(
        children: [
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
                      child: Text("Coordinators Information",style: TextStyle(color: Colors.white,fontSize: 25),),
                    )
                  ],
                )
            ),

          ),

          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context,int index){
                  return  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: (){
                        showAlertDialog(context);
                      },
                      child: Container(
                        height: 60,
                        width: double.maxFinite,
                        child: Card(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Image.asset('assets/logo.png')),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Center(
                                      child: Text("Coordinator Name",overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                                    )),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
        ],
      ),

    );
  }
}
