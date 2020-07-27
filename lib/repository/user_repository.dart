import 'package:randevuuygulamasi/locator.dart';
import 'package:randevuuygulamasi/model/user_model.dart';
import 'package:randevuuygulamasi/services/auth_base.dart';
import 'package:randevuuygulamasi/services/fake_auth_service.dart';
import 'package:randevuuygulamasi/services/firebase_auth_service.dart';

enum AppMode{DEBUG, RELEASE}

class UserRepository implements AuthBase{
  /*
  * Repository katmani bu
  * firebase veya fake servis kullancaksam hangisinde ne olcagini burada belirtiyorum
  * bu sayede => widgetler hangi servisin ne kullandigini bilmeden
  * islemleri gerceklestiriyor
  *  */


  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  FakeAuthenticationService _fakeAuthenticationService = locator<FakeAuthenticationService>();

  AppMode appMode =AppMode.DEBUG;//servis daha hazir degilken kullanilir

  @override
  Future<User> currentUser() async {
    if(appMode == AppMode.DEBUG){
      return await _fakeAuthenticationService.currentUser();
    }else{
      return await _firebaseAuthService.currentUser();
    }
  }

  @override
  Future<User> signInAnonymously() async {
    if(appMode == AppMode.DEBUG){
      return await _fakeAuthenticationService.signInAnonymously();
    }else{
      return await _firebaseAuthService.signInAnonymously();
    }
  }

  @override
  Future<bool> signOut() async {
    if(appMode == AppMode.DEBUG){
      return await _fakeAuthenticationService.signOut();
    }else{
      return await _firebaseAuthService.signOut();
    }
  }

}