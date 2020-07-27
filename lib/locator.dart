import 'package:get_it/get_it.dart';
import 'package:randevuuygulamasi/repository/user_repository.dart';
import 'package:randevuuygulamasi/services/fake_auth_service.dart';
import 'package:randevuuygulamasi/services/firebase_auth_service.dart';

GetIt locator = GetIt();

void setupLocator(){
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => FakeAuthenticationService());
  locator.registerLazySingleton(() => UserRepository());

}