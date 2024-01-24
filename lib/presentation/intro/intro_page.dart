import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/language_selector_model.dart';

class IntroPage extends StatefulWidget {
  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  final List<LanguageSelectorModel> items = [
    const LanguageSelectorModel('assets/flags/lang_uz.png', 'Uzbek'),
    const LanguageSelectorModel('assets/flags/lang_ru.png', 'Russian'),
    const LanguageSelectorModel('assets/flags/lang_uz.png', 'Kiril'),
  ];

  LanguageSelectorModel? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Spacer(),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png'),
                const SizedBox(
                  width: 5,
                ),
                Image.asset('assets/images/findspot_text.png'),
              ],
            ),
          ),

          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 50, right: 50, left: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text("Languages", style: GoogleFonts.mulish(textStyle: const TextStyle(
                    color: Color(0xFF232638),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 0.10,
                  ),),),
                SizedBox(height: 5,),
                DropdownButtonHideUnderline(
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
                          width: 4,
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
                    items: items
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
                              SizedBox(width: 5,),
                              Text(
                                item.name,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black.withAlpha(90),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (LanguageSelectorModel? value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 18,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
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
                              decoration: ShapeDecoration(
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
                                decoration: ShapeDecoration(
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
                              decoration: BoxDecoration(),
                              child: const Stack(children: [
                                  Icon(Icons.arrow_forward, color: Colors.white,),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
