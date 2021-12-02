import 'package:clean_arch_test/feature/authentication/authentication_bloc.dart';
import 'package:clean_arch_test/feature/authentication/repo/authentication_repository.dart';
import 'package:clean_arch_test/feature/home/home_page.dart';
import 'package:clean_arch_test/feature/login/view/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => SplashPage());
  }
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationBloc(),
        )
      ],
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          switch (state.status) {
            case AuthenticationStatus.authenticated:
              // _navigator.pushAndRemoveUntil<void>(
              //
              // );
              break;
            case AuthenticationStatus.unauthenticated:
              _navigator.pushAndRemoveUntil<void>(
                LoginPage.route(),
                    (route) => false,
              );
              break;
            default:
              break;
          }
        },
        child: SpalshView(),
      ),
    );
  }
}

class SpalshView extends StatelessWidget {
  const SpalshView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 1],
            colors: [
              Colors.blue[700]!,
              Colors.lightGreen,
            ],
          ),
        ),
        child: Column(
          children: [
            Flexible(
              flex: 5,
              child: Center(
                child: SvgPicture.asset(
                  'assets/icon/migcredit2.svg',
                  semanticsLabel: 'Logo',
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Center(
                  child:
                      Lottie.asset('assets/animations/loading_bubbles.json')),
            ),
          ],
        ),
      ),
    );
  }
}
