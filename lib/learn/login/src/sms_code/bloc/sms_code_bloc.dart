import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sms_code_event.dart';
part 'sms_code_state.dart';

class SmsCodeBloc extends Bloc<SmsCodeEvent, SmsCodeState> {
  SmsCodeBloc() : super(SmsCodeInitial()) {
    on<SmsCodeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
