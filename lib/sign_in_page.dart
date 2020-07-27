import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randevuuygulamasi/common_widget/social_lig_in_button.dart';
import 'package:randevuuygulamasi/model/user_model.dart';
import 'package:randevuuygulamasi/viewmodel/user_model.dart';

class SignInPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Lovers"),
        elevation: 0,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Oturum Acin",
              textAlign: TextAlign.center, //yaziyi satir boyunca ortalar
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            SizedBox(
              height: 8,
            ),
            SocialLoginButton(
              buttonText: "Gmail ile Giris",
              textColor: Colors.black87,
              buttonColor: Colors.white,
              onPressed: () {},
            ),
            SocialLoginButton(
              buttonText: "Facebook ile giris",
              textColor: Colors.white,
              radius: 16,
              buttonColor: Color(0xFF334D92),
              onPressed: () {},
            ),
            SocialLoginButton(
              buttonText: "Email ve Sifre ile Giris",
              onPressed: () {},
            ),
            SocialLoginButton(
              buttonText: "Misafir Giris",
              onPressed: ()=> _misafirGiris(context),
            ),
          ],
        ),
      ),
    );
  }

  void _misafirGiris(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context);
    User _user= await _userModel.signInAnonymously();

    print("Oturum acan uid: " + _user.userID.toString());
  }
}
