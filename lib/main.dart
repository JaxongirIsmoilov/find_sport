import 'package:easy_localization/easy_localization.dart';
import 'package:find_sport/presentation/auth/register/register.dart';
import 'package:find_sport/presentation/home/home_page.dart';
import 'package:find_sport/presentation/intro/intro_page.dart';
import 'package:flutter/material.dart';

import 'di/di.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: 'intro',
      routes: {
        'intro' : (context) => IntroPage(),
        'register' : (context) => RegisterPage(),
        'home' : (context) => HomePage()
      },
    );
  }
}
