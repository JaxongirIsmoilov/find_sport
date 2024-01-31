import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:find_sport/presentation/intro/bloc/intro_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/language_selector_model.dart';

class IntroPage extends StatefulWidget {
  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final _bloc = IntroBloc();
  LanguageSelectorModel selectedLanguage =
  const LanguageSelectorModel('assets/flags/lang_uz.png', 'Uzbek');
  final List<LanguageSelectorModel> langList = [];

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: BlocConsumer<IntroBloc, IntroState>(
        listener: (context, state) {
          if (state is SelectedLanguageState) {
            selectedLanguage = state.selectedLanguage;
          }
          if (state is GetAllLanguagesState) {
            langList.addAll(state.allLanguage);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 75),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/logo.png'),
                        const SizedBox(width: 5),
                        Image.asset('assets/images/findspot_text.png')
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding:
                    const EdgeInsets.only(bottom: 50, right: 50, left: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Languages',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black.withAlpha(100),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.black.withAlpha(100))),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<LanguageSelectorModel>(
                                isExpanded: true,
                                hint: Row(
                                  children: [
                                    Image.asset(
                                      'assets/flags/lang_uz.png',
                                      width: 16,
                                      height: 16,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Choose a language',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black.withAlpha(90),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                items: langList
                                    .map((LanguageSelectorModel item) =>
                                    DropdownMenuItem<LanguageSelectorModel>(
                                      value: item,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            item.image,
                                            width: 24,
                                            height: 24,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            item.name,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.black
                                                  .withAlpha(90),
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ))
                                    .toList(),
                                value: selectedLanguage,
                                onChanged: (LanguageSelectorModel? value) {
                                  print("LanguageSelectorModel");
                                  if (value?.name == 'Uzbek') {
                                    context.setLocale(const Locale('uz'));
                                  }

                                  if (value?.name == 'Russian') {
                                    context.setLocale(const Locale('ru'));
                                  }

                                  if (value?.name == 'Kril') {
                                    context.setLocale(const Locale("kril"));
                                  }

                                  context
                                      .read<IntroBloc>()
                                      .add(CheckLanguageEvent(value!));
                                },
                              ),
                            )),
                        const SizedBox(height: 20),
                        InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, 'register');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 52,
                                  height: 58,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 4,
                                        top: 0,
                                        child: Container(
                                          width: 48,
                                          height: 48,
                                          decoration: const ShapeDecoration(
                                            color: Color(0xFF01001F),
                                            shape: OvalBorder(),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 10,
                                        child: Opacity(
                                          opacity: 0.20,
                                          child: Container(
                                            width: 48,
                                            height: 48,
                                            decoration: const ShapeDecoration(
                                              color: Color(0xFF01001F),
                                              shape: OvalBorder(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 16,
                                        top: 12,
                                        child: Container(
                                          width: 24,
                                          height: 24,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(),
                                          child: const Stack(children: [
                                            Icon(
                                              Icons.arrow_forward,
                                              color: Colors.white,
                                            ),
                                          ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
