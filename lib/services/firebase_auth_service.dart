import 'package:firebase_auth/firebase_auth.dart';
import 'package:randevuuygulamasi/model/user_model.dart';
import 'package:randevuuygulamasi/services/auth_base.dart';

class FirebaseAuthService implements AuthBase{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User> currentUser() async {
    try{
      FirebaseUser user = await _firebaseAuth.currentUser();
      return _userFromFirebase(user);
    }catch(e){
      print("Hata current user" + e.toString());
      return null;
    }
  }

  User _userFromFirebase(FirebaseUser user){
    if(user == null)
      return null;
    return User(userID: user.uid);
  }

  @override
  Future<User> signInAnonymously() async {
    try{
      AuthResult sonuc = await _firebaseAuth.signInAnonymously();
      return _userFromFirebase(sonuc.user);
    }
    catch(e){
      print("Anonim giris hata" + e.toString());
      return null;
    }
  }

  @override
  Future<bool> signOut() async {
    try{
      await _firebaseAuth.signOut();
      return true;
    }catch(e){
      print("Error sign out" + e.toString());
      return false;
    }
  }

  @override
  Future<User> signInWithGmail() {
    // TODO: implement signInWithGmail
    throw UnimplementedError();
  }

}