// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  //final String uid;

  //DatabaseService( { this.uid});

  //final CollectionReference userCollection =
  //FirebaseFirestore.instance.collection('CompleteProfile');

  deleteData(docId) {
    FirebaseFirestore.instance
        .collection('CompleteProfile')
        .doc(docId)
        .delete()
        .catchError((e) {
      print(e);
    });
  }
  deletedata(docId){
    FirebaseFirestore.instance
        .collection('Cars')
        .doc(docId)
        .delete()
        .catchError((e) {
      print(e);
    });
  }
}
/*
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future deleteUser(String email, String password) async {
    try {
      User user = _auth.currentUser;
      AuthCredential credentials =
          EmailAuthProvider.credential(email: email, password: password);
      print(user);
      UserCredential result =
          await user.reauthenticateWithCredential(credentials);
      await DatabaseService()
          .deleteData(result.user.uid); // called from database class
      await result.user.delete();
      return true;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

 */
