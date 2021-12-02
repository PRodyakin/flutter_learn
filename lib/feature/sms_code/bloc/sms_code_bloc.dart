import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_arch_test/feature/authentication/repo/authentication_repository.dart';
import 'package:clean_arch_test/feature/sms_code/model/sms_code.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../../../application/injection_container.dart';

part 'sms_code_event.dart';

part 'sms_code_state.dart';

class SmsCodeBloc extends Bloc<SmsCodeEvent, SmsCodeState> {
  final authRepo = sl<AuthenticationRepository>();

  SmsCodeBloc() : super(SmsCodeState()) {
    on<SmsCodeInputFinished>(_onSmsCodeInputFinished);
    on<SmsCodeSubmitted>(_onSmsCodeSubmitted);
    on<SmsCodeRequested>(_onSmsCodeRequested);
  }

  Future<void> _onSmsCodeInputFinished(SmsCodeInputFinished event, emit) async {
    //TODO validate on backend
    if (event.smsCode.length < SmsCode.SMS_CODE_LENGTH) {
      return;
    }

    var smsCode = SmsCode.dirty(event.smsCode);

    emit(state.copyWith(
      status: Formz.validate([smsCode]),
      smsCode: smsCode,
    ));
    add(SmsCodeSubmitted());

  }

  Future<void> _onSmsCodeSubmitted(
      SmsCodeSubmitted event, Emitter<SmsCodeState> emit) async {
    if (state.status.isValid) {
      await authRepo.logIn(smsCode: state.smsCode.value);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    }
  }

  FutureOr<void> _onSmsCodeRequested(
      SmsCodeRequested event, Emitter<SmsCodeState> emit) {
    // repo request code

    // start timer
  }
}
