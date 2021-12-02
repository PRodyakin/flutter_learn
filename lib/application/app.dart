import 'package:clean_arch_test/feature/authentication/authentication_bloc.dart';
import 'package:clean_arch_test/feature/authentication/repo/authentication_repository.dart';
import 'package:clean_arch_test/feature/home/home_page.dart';
import 'package:clean_arch_test/feature/login/view/login_page.dart';
import 'package:clean_arch_test/feature/sms_code/view/sms_code_page.dart';
import 'package:clean_arch_test/feature/splash/splash_page.dart';
import 'package:clean_arch_test/feature/authentication/repo/user_repository.dart';
import 'package:clean_arch_test/feature/timer_button/bloc/timer_button_cubit.dart';
import 'package:clean_arch_test/feature/timer_button/utils/ticker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  AppView();
  }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.white10),
        ),
      ),
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}