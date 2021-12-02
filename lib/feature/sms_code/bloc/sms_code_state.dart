part of 'sms_code_bloc.dart';


class SmsCodeState extends Equatable{
  const SmsCodeState({
    this.status = FormzStatus.pure,
    this.smsCode = const SmsCode.pure(),
  });

  final FormzStatus status;
  final SmsCode smsCode;

  SmsCodeState copyWith({
    FormzStatus? status,
    SmsCode? smsCode,
  }) {
    return SmsCodeState(
      status: status ?? this.status,
      smsCode: smsCode ?? this.smsCode,
    );
  }


  @override
  List<Object> get props => [smsCode, status];
}
