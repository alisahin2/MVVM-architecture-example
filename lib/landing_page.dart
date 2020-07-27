import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randevuuygulamasi/home_page.dart';
import 'package:randevuuygulamasi/sign_in_page.dart';
import 'package:randevuuygulamasi/viewmodel/user_model.dart';

class LandingPage extends StatelessWidget {
  @override //tekrar tekrar calisabilir
  Widget build(BuildContext context) {

    final _userModel = Provider.of<UserModel>(context);

    if (_userModel.user == null) {
      return SignInPage();
    } else
      return HomePage(
        user: _userModel.user,
      );
  }
}
