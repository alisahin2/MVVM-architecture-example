import 'package:randevuuygulamasi/model/user_model.dart';
import 'package:randevuuygulamasi/services/auth_base.dart';

class FakeAuthenticationService implements AuthBase{

  String userID = "12345";

  @override
  Future<User> currentUser() async {
    return await Future.value(User(userID: userID));
  }

  @override
  Future<User> signInAnonymously() async {
    return await Future.delayed(Duration(seconds: 5), ()=>User(userID: userID));
  }

  @override
  Future<bool> signOut() {
    return Future.value(true);
  }

  @override
  Future<User> signInWithGmail() {
    // TODO: implement signInWithGmail
    throw UnimplementedError();
  }

}