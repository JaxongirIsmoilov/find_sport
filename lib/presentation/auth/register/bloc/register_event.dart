part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}
class RegisterUserEvent extends RegisterEvent{
  final RegisterModel registerModel;

  RegisterUserEvent(this.registerModel);
}
