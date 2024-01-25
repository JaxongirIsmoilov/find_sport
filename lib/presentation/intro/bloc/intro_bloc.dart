  import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:find_sport/data/models/language_selector_model.dart';
import 'package:meta/meta.dart';

part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {

  final List<LanguageSelectorModel> languages = [
    const LanguageSelectorModel('assets/flags/flag_russia.png', 'Russian'),
    const LanguageSelectorModel('assets/flags/flag_uzbekistan.png', 'Uzbek'),
    const LanguageSelectorModel('assets/flags/flag_uzbekistan.png', 'Cyrillic'),
  ];

  IntroBloc() : super(IntroInitial()) {
    on<CheckLanguageEvent>((event, emit) {
      emit(SelectedLanguageState(event.selectedLanguage));
    });
    
    on<GetAllLanguagesEvent>((event, emit){
      emit(GetAllLanguagesState(languages));
    });
  }
}
