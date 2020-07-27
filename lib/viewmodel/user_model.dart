import 'package:flutter/material.dart';
import 'package:randevuuygulamasi/locator.dart';
import 'package:randevuuygulamasi/model/user_model.dart';
import 'package:randevuuygulamasi/repository/user_repository.dart';
import 'package:randevuuygulamasi/services/auth_base.dart';

//isteklerin repository ye yollandigi yer

enum ViewState{Idle, Busy}

class UserModel with ChangeNotifier implements AuthBase{
  ViewState _state = ViewState.Idle;
  UserRepository _userRepository =locator<UserRepository>();
  User _user;


  User get user => _user;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  UserModel(){
    currentUser();
  }

  @override
  Future<User> currentUser() async {
    try{
      state = ViewState.Busy;
      _user = await _userRepository.currentUser();
      return _user;
    }catch(e){
      debugPrint("Viewmodeldeki current user hata " + e.toString());
      return null;
    }finally{
      state = ViewState.Idle;
    }
  }

  @override
  Future<User> signInAnonymously() async {
    try{
      state = ViewState.Busy;
      _user = await _userRepository.signInAnonymously();
      return _user;
    }catch(e){
      debugPrint("Viewmodeldeki current user hata " + e.toString());
      return null;
    }finally{
      state = ViewState.Idle;
    }

  }

  @override
  Future<bool> signOut() async {
    try{
      state = ViewState.Busy;
      return await _userRepository.signOut();
    }catch(e){
      debugPrint("Viewmodeldeki current user hata " + e.toString());
      return false;
    }finally{
      state = ViewState.Idle;
    }

  }
}