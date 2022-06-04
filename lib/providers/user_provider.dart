import 'package:flutter/material.dart';
import 'package:instagram/model/user.dart';
import 'package:instagram/resources/auth_methods.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
  AuthMethods _authMethods = AuthMethods();

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await _authMethods.getUsrDetails();
    _user = user;
    notifyListeners();
  }
}
