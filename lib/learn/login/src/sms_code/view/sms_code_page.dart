import 'package:clean_arch_test/learn/login/src/authentication/repo/authentication_repository.dart';
import 'package:clean_arch_test/learn/login/src/login/bloc/login_bloc.dart';
import 'package:clean_arch_test/learn/login/src/sms_code/bloc/sms_code_bloc.dart';
import 'package:clean_arch_test/learn/login/src/sms_code/view/sms_code_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmsCodePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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