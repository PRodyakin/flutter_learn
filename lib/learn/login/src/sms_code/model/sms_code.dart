import 'package:formz/formz.dart';

enum SmsCodeValidationError { empty }

class SmsCode extends FormzInput<String, SmsCodeValidationError> {
  const SmsCode.pure() : super.pure('');

  const SmsCode.dirty([String value = '']) : super.dirty(value);
  static const int SMS_CODE_LENGTH = 4;

  @override
  SmsCodeValidationError? validator(String? value) {
    if (value == null) {
      return null;
    }

    return value.length == SMS_CODE_LENGTH ? null : SmsCodeValidationError.empty;
  }
}
