part of 'login_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  LoginSuccessState();
}

class LoginErrorState extends LoginState{
  late String errorMessage;
}
