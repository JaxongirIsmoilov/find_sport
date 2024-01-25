part of 'intro_bloc.dart';

@immutable
abstract class IntroState {}

class IntroInitial extends IntroState {}

class SelectedLanguageState extends IntroState{
  final LanguageSelectorModel selectedLanguage;

  SelectedLanguageState(this.selectedLanguage);
}

class GetAllLanguagesState extends IntroState{
  final List<LanguageSelectorModel> allLanguage;

  GetAllLanguagesState(this.allLanguage);
}
