import 'package:clean_arch_test/learn/counter/app.dart';
import 'package:clean_arch_test/learn/counter/counter_observer.dart';
import 'package:clean_arch_test/learn/login/app/app.dart';
import 'package:clean_arch_test/learn/login/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/my_home_page.dart';

void main() async {
  await di.init();

  BlocOverrides.runZoned(
    () => runApp(App(
      authenticationRepository: di.sl(),
      userRepository: di.sl(),
    )),
    blocObserver: CounterObserver(),
  );
}
