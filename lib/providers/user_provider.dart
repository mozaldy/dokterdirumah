import 'package:flutter/widgets.dart';
import 'package:dokter_dirumah/model/user.dart';
import 'package:dokter_dirumah/controlllers/auth.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthController _authMethods = AuthController();

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}