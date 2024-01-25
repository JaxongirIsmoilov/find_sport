part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class SendAdEvent extends HomeEvent {
  final AdsModel adsModel;

  SendAdEvent(this.adsModel);
}
