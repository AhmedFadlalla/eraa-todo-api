
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class UserRegisterLoadingState extends RegisterState {}
class UserRegisterSuccessState extends RegisterState {}
class UserRegisterSuccessWithExceptionState extends RegisterState {
  final String message;

  UserRegisterSuccessWithExceptionState({
    required this.message});
}
class UserRegisterErrorState extends RegisterState {
  final String error;

  UserRegisterErrorState({required this.error});
}
