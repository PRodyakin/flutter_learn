part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUserPhoneChanged extends LoginEvent {
  const LoginUserPhoneChanged(this.userPhone);

  final String userPhone;

  @override
  List<Object> get props => [userPhone];
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}