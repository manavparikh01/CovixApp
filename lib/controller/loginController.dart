import 'package:abcd/controller/allUrls.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> userRegister({Map<String, String> userData}) async {
    final databaseReference = FirebaseDatabase.instance.reference();
    var onlyNeededData = {
      'email': userData['email'],
      'name': userData['name'],
      'docID': userData['docID']
    };
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userData['email'], password: userData['password']);

      databaseReference
          .child('Doctors')
          .child(auth.currentUser.uid)
          .set(onlyNeededData);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        databaseReference
            .child('Doctors')
            .child(auth.currentUser.uid)
            .set(onlyNeededData);
        // print(auth.currentUser.uid);

      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> userLogin({String email, String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: "$email", password: "$password");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
