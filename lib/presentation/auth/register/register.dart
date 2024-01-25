import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../data/models/register/register_model.dart';
import '../../../utils/localization/locale_keys.g.dart';
import 'bloc/register_bloc.dart';

class RegisterPage extends StatelessWidget {

  final controllerFirstName = TextEditingController();
  final controllerLastName = TextEditingController();
  final controllerPhone = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerConfirmPassword = TextEditingController();


  var maskFormatter = MaskTextInputFormatter(
      mask: '(##)-###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (state.response.message != null &&
                state.response.message!
                    .contains('Successfully created user!')) {
              Navigator.pushReplacementNamed(context, 'home');
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Something went wrong, Please check all information and try again!'),
                duration: Duration(seconds: 3),
              ));
            }
          }
          if (state is RegisterLoadingState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Register in progress, wait...'),
              duration: Duration(seconds: 3),
            ));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Align(
                              alignment: Alignment.center,
                              child: Stack(
                                children: [
                                  Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                          height: 230,
                                          decoration: const ShapeDecoration(
                                            shape: OvalBorder(
                                              side: BorderSide(
                                                  width: 1,
                                                  color: Color(0xFF01001F)),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(25),
                                            child: Image.asset(
                                                'assets/images/img_center.png'),
                                          ))),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 180),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                            'assets/images/circle_item1.png')
                                            .animate()
                                            .fadeIn() // uses `Animate.defaultDuration`
                                            .scale() // inherits duration from fadeIn
                                            .move(
                                            delay: 300.ms, duration: 600.ms)
                                            .slide() // runs after the above w/new duration
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 180),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                            'assets/images/circle_item2.png')
                                            .animate()
                                            .fadeIn() // uses `Animate.defaultDuration`
                                            .scale() // inherits duration from fadeIn
                                            .move(
                                            delay: 300.ms, duration: 600.ms)
                                            .slide()),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 180, right: 180),
                                    child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Image.asset(
                                            'assets/images/circle_item3.png')
                                            .animate()
                                            .fadeIn() // uses `Animate.defaultDuration`
                                            .scale() // inherits duration from fadeIn
                                            .move(
                                            delay: 300.ms, duration: 600.ms)
                                            .slide()),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 150, left: 230),
                                    child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Image.asset(
                                            'assets/images/circle_item4.png')
                                            .animate()
                                            .fadeIn() // uses `Animate.defaultDuration`
                                            .scale() // inherits duration from fadeIn
                                            .move(
                                            delay: 300.ms, duration: 600.ms)
                                            .slide()),
                                  ),
                                ],
                              )),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          LocaleKeys.sign_up.tr(),
                          style: GoogleFonts.abel(
                            color: const Color(0xFF01001F),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            height: 0,
                            letterSpacing: 1.20,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                LocaleKeys.first_name.tr(),
                                style: GoogleFonts.abel(
                                  color: const Color(0xFF232638),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  height: 0.10,
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                controller: controllerFirstName,
                                decoration: InputDecoration(
                                  hintText: LocaleKeys.first_name_enter.tr(),
                                  hintStyle: GoogleFonts.abel(
                                    color: const Color(0xFF949CA9),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 0.11,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF949CA9)),
                                  ),
                                  contentPadding: const EdgeInsets.all(10.0),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                LocaleKeys.last_name.tr(),
                                style: GoogleFonts.abel(
                                  color: const Color(0xFF232638),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  height: 0.10,
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                controller: controllerLastName,
                                decoration: InputDecoration(
                                  hintText: LocaleKeys.last_name_enter.tr(),
                                  hintStyle: GoogleFonts.abel(
                                    color: const Color(0xFF949CA9),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 0.11,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF949CA9)),
                                  ),
                                  contentPadding: const EdgeInsets.all(10.0),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                LocaleKeys.phone.tr(),
                                style: GoogleFonts.abel(
                                  color: const Color(0xFF232638),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  height: 0.10,
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                controller: controllerPhone,
                                keyboardType: TextInputType.number,
                                inputFormatters: [maskFormatter],
                                decoration: InputDecoration(
                                  prefixText: '+998 ',
                                  labelText: '+998 (__) ___ - __ - __',
                                  labelStyle: GoogleFonts.abel(
                                    color:
                                    const Color(0xFF232638).withAlpha(90),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    height: 0.10,
                                  ),
                                  floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                                  hintText: '(__) ___ - __ - __',
                                  hintStyle: GoogleFonts.abel(
                                    color: const Color(0xFF949CA9),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 0.11,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF949CA9)),
                                  ),
                                  contentPadding: const EdgeInsets.all(10.0),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                LocaleKeys.password.tr(),
                                style: GoogleFonts.abel(
                                  color: const Color(0xFF232638),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  height: 0.10,
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                controller: controllerPassword,
                                decoration: InputDecoration(
                                  hintText: LocaleKeys.password_enter.tr(),
                                  hintStyle: GoogleFonts.abel(
                                    color: const Color(0xFF949CA9),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 0.11,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF949CA9)),
                                  ),
                                  contentPadding: const EdgeInsets.all(10.0),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                LocaleKeys.confirm_password.tr(),
                                style: GoogleFonts.abel(
                                  color: const Color(0xFF232638),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  height: 0.10,
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                controller: controllerConfirmPassword,
                                decoration: InputDecoration(
                                  hintText:
                                  LocaleKeys.confirm_password_enter.tr(),
                                  hintStyle: GoogleFonts.abel(
                                    color: const Color(0xFF949CA9),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 0.11,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF949CA9)),
                                  ),
                                  contentPadding: const EdgeInsets.all(10.0),
                                ),
                              ),
                              const SizedBox(height: 20),
                              InkWell(
                                  onTap: () {
                                    if (controllerPassword.text.isNotEmpty &&
                                        controllerConfirmPassword
                                            .text.isNotEmpty &&
                                        controllerPassword.text ==
                                            controllerConfirmPassword.text) {
                                      if (controllerPhone.text.length != 14) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text('Invalid number!'),
                                          duration: Duration(
                                              seconds:
                                              3), // Adjust the duration as needed
                                        ));
                                      } else if (controllerFirstName
                                          .text.isNotEmpty &&
                                          controllerLastName.text.isNotEmpty) {
                                        context.read<RegisterBloc>().add(
                                            RegisterUserEvent(RegisterModel(
                                                controllerFirstName.text,
                                                controllerLastName.text,
                                                "+998${controllerPhone.text.replaceAll('-', '').replaceAll('(', '').replaceAll(')', '')}",
                                                controllerPassword.text)));
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text('Invalid password!'),
                                        duration: Duration(
                                            seconds:
                                            3), // Adjust the duration as needed
                                      ));
                                    }
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 37,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                    decoration: ShapeDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment(0.00, -1.00),
                                        end: Alignment(0, 1),
                                        colors: [
                                          Color(0xAD00001F),
                                          Color(0xFF01001F)
                                        ],
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(6)),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            LocaleKeys.save.tr(),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              height: 0.11,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ))),
          );
        },
      ),
    );
  }
}
