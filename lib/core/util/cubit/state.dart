import 'package:hti_library_admin/core/models/login_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MainState {}

class Empty extends MainState {}

class Loading extends MainState {}

class Loaded extends MainState {}

class LanguageLoaded extends MainState {}

class BottomChanged extends MainState {}

class SliderIndicator extends MainState {
  final int index;

  SliderIndicator({
    required this.index,
  });
}

class ThemeLoaded extends MainState {}

class ChangeModeState extends MainState {}

class ChangeLanguageState extends MainState {}

class Error extends MainState {
  final String error;

  Error(this.error);
}

class CategoriesChangeParentCategoryState extends MainState {
  final int index;

  CategoriesChangeParentCategoryState({
    required this.index,
  });
}

class InternetState extends MainState {}

class SignInState extends MainState {}

///--------------------------------------------------------------------------------------------- HTI
// enableLoginButton ---------------------------- start
class EnableLoginButtonState extends MainState {}

// enableLoginButton ---------------------------- end

// ------------ change photo ------------ //
class ChangeImageLoadingState extends MainState {}

class ChangeImageSuccessState extends MainState {}

class ChangeImageErrorState extends MainState {
  final String? error;

  ChangeImageErrorState(this.error);
}

class LoginLoading extends MainState {}

class LoginSuccess extends MainState {
  final LoginModel loginModel;

  LoginSuccess({required this.loginModel});
}

class LogoutLoading extends MainState {}

class LogoutSuccess extends MainState {}

class SelectMonth extends MainState {
  final int value;

  SelectMonth({
    required this.value,
  });
}
