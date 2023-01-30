part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginSubmitEvent extends LoginEvent {
  late String username;
  late String password;
  LoginSubmitEvent(this.username, this.password);
}
