import '../constants/route_names.dart';
import '../locator.dart';
import '../services/authentication_service.dart';
import '../services/navigation_service.dart';
import 'base_model.dart';

class StartUpViewModel extends BaseModel {

  //check if the user is logged in. If the user is we navigate to the HomeView otherwise we navigate to the LoginView
  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  Future handleStartUpLogic() async {
    var hasLoggedInUser =  _authenticationService.isUserLoggedIn();
    if (hasLoggedInUser == null) {
        _navigationService.navigateTo(HomeViewRoute);

    } else {
      _navigationService.navigateTo(LoginViewRoute);
    }
  }
}
