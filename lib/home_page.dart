import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:randevuuygulamasi/model/user_model.dart';
import 'package:randevuuygulamasi/viewmodel/user_model.dart';

//sadece kullanici kaydi yapmis olanlarin gorebilcegi sayfa
class HomePage extends StatelessWidget {

  final User user;

  HomePage({Key key,@required this.user})
      : super(key: key);//constructor bu

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
            child: Text(
              "Cikis Yap",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: ()=> _cikisYap(context),
          )
        ],
        title: Text("Ana Sayfa"),
      ),
      body: Center(
        child: Text("hosgeldiniz ${user.userID} "),
      ),
    );
  }
  Future<bool> _cikisYap(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context);
    bool sonuc = await _userModel.signOut();
    return sonuc;
  }
}

