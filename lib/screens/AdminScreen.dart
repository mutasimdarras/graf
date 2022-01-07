// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie_animation/components/rounded_button.dart';
import 'package:lottie_animation/models/Constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: Admin()));
}




class Admin extends StatefulWidget {


  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final User user = auth.currentUser;
    final userEmail = user.email;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF90ADC6),
          title: Align(
            alignment: Alignment.center,
            child: Text('Available Cars'),
          )
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('CompleteProfile').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              return ListView.builder(
                  padding: new EdgeInsets.all(8.0),
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot info = snapshot.data.docs[index];
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(children: <Widget>[
                        ListTile(
                          title: Text( info['name'], style: kHeadingStyle),
                          subtitle: Text(
                           'email: '+userEmail,
                            style: TextStyle(
                              color: greyColor,
                            ),
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                                'IDnumber: '+info['idnumber']
                          ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text('licensenumber: '+info['licensenumber']),
                        Row(
                          //Divider line
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                                child: Divider(color: greyColor),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.0, left: 20.0, right: 20.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    // Container(
                                    //   // padding: EdgeInsets.all(8.0),
                                    //   child: Text(
                                    //     info['Price'].toString(),
                                    //     textAlign: TextAlign.right,
                                    //     style: TextStyle(
                                    //         fontSize: 22.0, fontWeight: FontWeight.bold),
                                    //   ),
                                    // ),
                                    RoundedButton(title: 'Delete User', colour:Color(0xFFFAD02C) , onPressed:(){
                                    } ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        ]),
                    );
                  });
            }),
      ),

    );
  }
}
