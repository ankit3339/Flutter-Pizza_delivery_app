import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{

  final FirebaseAuth _auth;

  AuthServices(this._auth);

  Stream<User?> get authStateChange => _auth.authStateChanges();

  Future login({ required String email, required String password}) async{
    try{
      await  _auth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseException catch(e){
      return e.message;
    }
  }

  Future signUp({ required String email, required String password, String? fullname, String? location}) async {
    try{
      UserCredential userCredential =  await _auth.createUserWithEmailAndPassword(email: email, password: password);

      CollectionReference user = FirebaseFirestore.instance.collection("userData");
      String uid = userCredential.user!.uid;
      user.doc(
        uid
      ).set({
        "Fullname" : fullname,
        "Location" : location,
        "Email" : email,
        "Password" : password,
      });
    }on FirebaseException catch(e){
      return e.message;
    }
  }

  Future signOut() async{
    try{
      await _auth.signOut();
    } on FirebaseException catch(e){
      return e.message;
    }
  }

  Future getData({String? fullname, String? location, String? email, String? password}) async{
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection("userData").doc(firebaseUser!.uid).get().then((value){
      return value.data();
    });
  }

  getPizzaDetails() async {
    return await FirebaseFirestore.instance.collection("pizzaDetails").get();
  }

}