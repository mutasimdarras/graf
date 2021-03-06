import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie_animation/models/user.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  AppUser user = AppUser();
  @override
  Widget build(BuildContext context) {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    return Scaffold(
      backgroundColor: Color(0xFFE9EAEC),
      appBar: AppBar(
        backgroundColor: Color(0xFF90ADC6),
        title: Align(
            alignment: Alignment(
              -0.3,
              0.0,
            ),
            child: Text("KingProfile")),
      ),

      body: StreamBuilder (
        stream:  FirebaseFirestore.instance
            .collection('CompleteProfile').where('Uid',isEqualTo: uid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text('no data');
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context,index){
                DocumentSnapshot info = snapshot.data!.docs[index];
              return SafeArea(
                child: Column(
                  children: <Widget>[
                    Text(
                      info["name"] ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 70.0,
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Align(
                      alignment: Alignment(-0.9, 0.0),
                      child: Text(
                        'Your Account',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    SizedBox(
                      height: 25.0,
                      child: Text('Phone Number',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(20, 0, 30, 0),
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: 22,
                                  width: 22,
                                  child: Icon(
                                    Icons.phone_android,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ),
                                SizedBox(width: 10.0,),
                                Align(
                                  alignment: Alignment(-0.5, 0.0),
                                  child: Text(
                                    info["phone_number"] ?? "",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 30.0,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Container(
                          height: 70,
                          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                      child: Text(
                        'ID number',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(20, 0, 30, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              height: 22,
                              width: 22,
                              child: Icon(
                                Icons.person,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                            SizedBox(width: 10.0,),
                            Align(
                              alignment: Alignment(-0.8, 0.0),
                              child: Text(
                                info["idnumber"] ?? "",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 30.0,
                                ),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 30.0,
                    ),
                    SizedBox(
                      height: 30.0,
                      child: Text('License Number',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),),
                    ),
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(20, 0, 30, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              height: 22,
                              width: 22,
                              child: Icon(
                                Icons.directions_car,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                            SizedBox(width: 10.0,),
                            Align(
                              alignment: Alignment(-0.8, 0.0),
                              child: Text(
                                info["licensenumber"] ?? "",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 30.0,
                                ),
                              ),
                            ),
                          ],
                        )),
                    Container(
                      height: 70,
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                    ),
                  ],
                ),
              );
            });
        },
      ),
    );
  }
}