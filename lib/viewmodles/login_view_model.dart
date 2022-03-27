import 'package:flutter/cupertino.dart';
import 'package:green_app/ui/views/signup_view.dart';

import '../constants/route_names.dart';
import '../locator.dart';
import '../services/authentication_service.dart';
import '../services/dialog_service.dart';
import '../services/navigation_service.dart';
import 'base_model.dart';
class LoginViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  Future login({@required String email, @required String password}) async {
    setBusy(true);
    var result = await _authenticationService.loginWithEmail(
        email: email, password: password);
    setBusy(false);
    if (result is bool) {
      if (result) {
          _navigationService.navigateTo(HomeViewRoute);

      } else {
        await _dialogService.showDialog(
          title: 'Login Failure',
          description: 'Couldn\'t login at this moment. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: result,
      );
    }
  }


  //void navigateToSignup(){
    //_navigationService.navigateTo(SignUpViewRoute);
  //}
}