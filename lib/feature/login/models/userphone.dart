import 'package:formz/formz.dart';

enum UserPhoneValidationError { empty, short }

class UserPhone extends FormzInput<String, UserPhoneValidationError> {
  const UserPhone.pure() : super.pure('');

  const UserPhone.dirty([String value = '']) : super.dirty(value);

  static const int PHONE_LENGTH = 10;

  @override
  UserPhoneValidationError? validator(String? value) {
    if (value == null) {
      return null;
    }

    if (value.isEmpty) {
      return UserPhoneValidationError.empty;
    }

    if (value.length < PHONE_LENGTH) {
      return UserPhoneValidationError.short;
    }
    return null;
  }
}
