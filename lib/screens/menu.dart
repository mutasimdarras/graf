import 'package:flutter/material.dart';
import 'package:lottie_animation/screens/login.dart';
import 'package:lottie_animation/screens/profile.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          color: Color(0xFFE9EAEC),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                 decoration: BoxDecoration(
                   shape:BoxShape.circle,
                    border: Border.all(
                      width: 3,
                      color: Color(0xFF333652)
                    ),
                    image: DecorationImage(
                        fit: BoxFit.contain,
                      image: AssetImage('assets/logo_2.png'),
                    ),
                ), child: null,
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                title: Text('Profile'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()),);
                },
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text('OrderHistory'),
                onTap: () => {Navigator.of(context).pop()},
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log out'),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()),);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}