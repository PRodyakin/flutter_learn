part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = FormzStatus.pure,
    this.userPhone = const UserPhone.pure(),
  });

  final FormzStatus status;
  final UserPhone userPhone;

  LoginState copyWith({
    FormzStatus? status,
    UserPhone? userPhone,
  }) {
    return LoginState(
      status: status ?? this.status,
      userPhone: userPhone ?? this.userPhone,
    );
  }

  @override
  List<Object> get props => [status, userPhone];
}
