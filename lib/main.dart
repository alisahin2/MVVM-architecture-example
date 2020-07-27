import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randevuuygulamasi/landing_page.dart';
import 'package:randevuuygulamasi/locator.dart';
import 'package:randevuuygulamasi/viewmodel/user_model.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FLutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ChangeNotifierProvider(
        //builder: (BuildContext context)=> UserModel(),
        create: (BuildContext context) =>UserModel(),
        child: LandingPage(
        ),
      ),
    );
  }
}
