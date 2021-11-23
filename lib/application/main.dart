import 'package:clean_arch_test/learn/counter/app.dart';
import 'package:clean_arch_test/learn/counter/counter_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application.dart';
import '../presentation/my_home_page.dart';

void main() {
  BlocOverrides.runZoned(
        () => runApp(const CounterApp()),
    blocObserver: CounterObserver(),
  );
}
