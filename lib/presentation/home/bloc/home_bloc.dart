import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/ads/ads_model.dart';
import '../../../di/di.dart';
import '../../../domain/repository/app_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _repository = getIt<AppRepository>();

  HomeBloc() : super(HomeInitial()) {
    on<SendAdEvent>((event, emit) {
      _repository.sendAd(event.adsModel);
      emit(SendAdState());
    });
  }
}
