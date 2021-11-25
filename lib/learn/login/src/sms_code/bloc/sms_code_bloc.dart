import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_arch_test/learn/login/src/authentication/repo/authentication_repository.dart';
import 'package:clean_arch_test/learn/login/src/sms_code/model/sms_code.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../injection_container.dart';

part 'sms_code_event.dart';

part 'sms_code_state.dart';

class SmsCodeBloc extends Bloc<SmsCodeEvent, SmsCodeState> {
  SmsCodeBloc() : super(SmsCodeState()) {
    final authRepo = sl<AuthenticationRepository>();

    on<SmsCodeInputFinished>(_onSmsCodeInputFinished);
    on<SmsCodeSubmitted>(_onSmsCodeSubmitted);
    on<SmsCodeRequested>(_onSmsCodeRequested);
  }

  void _onSmsCodeInputFinished(SmsCodeInputFinished event, emit) {

    if(event.smsCode.length < SmsCode.SMS_CODE_LENGTH){
      return;
    }

    var smsCode = SmsCode.dirty(event.smsCode);

    state.copyWith(
      status: Formz.validate([smsCode]),
      smsCode: smsCode,
    );
  }

  FutureOr<void> _onSmsCodeSubmitted(
      SmsCodeSubmitted event, Emitter<SmsCodeState> emit) {
    //repo send code

    //start timer
  }

  FutureOr<void> _onSmsCodeRequested(
      SmsCodeRequested event, Emitter<SmsCodeState> emit) {
    // repo request code

    // repo start timer
  }
}
