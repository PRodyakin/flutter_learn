part of 'sms_code_bloc.dart';

abstract class SmsCodeEvent extends Equatable{

  const SmsCodeEvent();

  @override
  List<Object> get props => [];
}

class SmsCodeInputFinished extends SmsCodeEvent{

  const SmsCodeInputFinished(this.smsCode);

  final String smsCode;

  @override
  List<Object> get props => [smsCode];
}

class SmsCodeSubmitted extends SmsCodeEvent{
  const SmsCodeSubmitted();
}

class SmsCodeRequested extends SmsCodeEvent{
  const SmsCodeRequested();
}