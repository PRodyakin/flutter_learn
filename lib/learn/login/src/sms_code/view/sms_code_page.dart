import 'package:clean_arch_test/learn/login/src/authentication/repo/authentication_repository.dart';
import 'package:clean_arch_test/learn/login/src/login/bloc/login_bloc.dart';
import 'package:clean_arch_test/learn/login/src/sms_code/bloc/sms_code_bloc.dart';
import 'package:clean_arch_test/learn/login/src/sms_code/view/sms_code_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmsCodePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => SmsCodePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return SmsCodeBloc();
          },
          child: SmsCodeView(),
        ),
      ),
    );
  }
}
