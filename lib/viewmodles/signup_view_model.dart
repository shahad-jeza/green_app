import 'package:flutter/cupertino.dart';

import '../constants/route_names.dart';
import '../locator.dart';
import '../services/authentication_service.dart';
import '../services/dialog_service.dart';
import '../services/navigation_service.dart';
import 'base_model.dart';
class SignUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  Future signUp({@required String email,
    @required String password,
    @required String fullName
  }) async {
    setBusy(true);
    var result = await _authenticationService.signUpWithEmail(
        email: email,
        password: password,
    fullName: fullName,
    role: _selectedRole);
    setBusy(false);
    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(HomeViewRoute);
      } else {
        await _dialogService.showDialog(
          title: 'Sign Up Failure',
          description: 'General sign up failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Sign Up Failure',
        description: result,
      );
    }
  }

  String _selectedRole = 'Select account type';
  String get selectedRole => _selectedRole;
  void setSelectedRole(String role) {
    _selectedRole = role;
    notifyListeners();
  }

  //void navigateToLogin(){
    //_navigationService.navigateTo(LoginViewRoute);
  //}
}