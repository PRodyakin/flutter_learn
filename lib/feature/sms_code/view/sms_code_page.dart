import 'package:clean_arch_test/feature/authentication/repo/authentication_repository.dart';
import 'package:clean_arch_test/feature/login/bloc/login_bloc.dart';
import 'package:clean_arch_test/feature/login/view/login_page.dart';
import 'package:clean_arch_test/feature/sms_code/bloc/sms_code_bloc.dart';
import 'package:clean_arch_test/feature/security/pin_code/view/pin_code_page.dart';
import 'package:clean_arch_test/feature/sms_code/view/sms_code_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SmsCodePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => SmsCodePage());
  }

  @protected
  Route nextRoute() {
    return PinCodePage.route();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SmsCodeBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          shadowColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: BlocConsumer<SmsCodeBloc, SmsCodeState>(
            builder: (context, state) {
              return SmsCodeView();
            },
            listener: (context, state) {
              if (state.status.isSubmissionSuccess) {
                Navigator.pushAndRemoveUntil(context, nextRoute(), (route) => false);
              }
            },
          ),
        ),
      ),
    );
  }
}

class SmsCodeRegistration extends SmsCodePage {
  @override
  Route nextRoute() {
    return LoginPage.route();
  }
}
