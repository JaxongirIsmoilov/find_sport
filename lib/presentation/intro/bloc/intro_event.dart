part of 'intro_bloc.dart';

@immutable
abstract class IntroEvent {}

class SelectLanguageEvent extends IntroEvent{}

class CheckLanguageEvent extends IntroEvent{
  final LanguageSelectorModel selectedLanguage;

  CheckLanguageEvent(this.selectedLanguage);
}

class GetAllLanguagesEvent extends IntroEvent{}

