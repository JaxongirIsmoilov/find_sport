import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:find_sport/data/models/register/register_model.dart';
import 'package:find_sport/data/models/register_response/register_response_model.dart';
import 'package:meta/meta.dart';

import '../../../../di/di.dart';
import '../../../../domain/repository/app_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final _repository = getIt<AppRepository>();

  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterUserEvent>((event, emit) async{
      emit(RegisterLoadingState());
      try{
        final response = await _repository.register(event.registerModel);
        emit(RegisterSuccessState(response));
      }catch(e){
        emit(RegisterErrorState(e.toString()));
      }
    });
  }
}
