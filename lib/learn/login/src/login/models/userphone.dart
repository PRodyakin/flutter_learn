import 'package:formz/formz.dart';

enum UserPhoneValidationError { empty }

class UserPhone extends FormzInput<String, UserPhoneValidationError> {
  const UserPhone.pure() : super.pure('');
  const UserPhone.dirty([String value = '']) : super.dirty(value);

  @override
  UserPhoneValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : UserPhoneValidationError.empty;
  }
}