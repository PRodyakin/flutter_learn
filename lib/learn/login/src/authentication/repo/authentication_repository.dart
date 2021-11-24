import 'dart:async';

import 'package:clean_arch_test/data/service/fake_service.dart';
import 'package:clean_arch_test/learn/login/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();
  final restClient = sl<RestClient>();
  final prefs = sl<SharedPreferences>();

  Stream<AuthenticationStatus> get status async* {
    await restClient.getStatus();
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String userPhone,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 300),
      () => _controller.add(AuthenticationStatus.authenticated),
    );
  }

  Future<void> sendSms({
    required String userPhone,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 2000),
      () => {
        prefs.setString("sms_code", "0000"),
      },
    );
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}