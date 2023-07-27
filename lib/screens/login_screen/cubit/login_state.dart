
abstract class LoginState {}

class LoginInitial extends LoginState {}
class UserLoginLoadingState extends LoginState {}
class UserLoginSuccessState extends LoginState {
  final String token;

  UserLoginSuccessState({
    required this.token});
}
class UserLoginErrorState extends LoginState {
  final String error;

  UserLoginErrorState({
    required this.error});
}
