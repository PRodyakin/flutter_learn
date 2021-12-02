import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_arch_test/feature/login/models/userphone.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../authentication/repo/authentication_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginUserPhoneChanged>(_onUserPhoneChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onUserPhoneChanged(
      LoginUserPhoneChanged event,
      Emitter<LoginState> emit,
      ) {
    final userPhone = UserPhone.dirty(event.userPhone);
    emit(state.copyWith(
      userPhone: userPhone,
      status: Formz.validate([userPhone]),
    ));
  }

  void _onSubmitted(
      LoginSubmitted event,
      Emitter<LoginState> emit,
      ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        await _authenticationRepository.sendSms(
          userPhone: state.userPhone.value,
        );
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}