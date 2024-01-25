part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterUserState extends RegisterState{
  final RegisterResponse response;

  RegisterUserState(this.response);
}

class RegisterSuccessState extends RegisterState {
  final RegisterResponse response;

  RegisterSuccessState(this.response);
}

class RegisterLoadingState extends RegisterState{}
class RegisterErrorState extends RegisterState{
  String errorMessage;

  RegisterErrorState(this.errorMessage);
}
