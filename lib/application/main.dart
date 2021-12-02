import 'package:clean_arch_test/application/state_observer.dart';
import 'package:clean_arch_test/application/app.dart';
import 'package:clean_arch_test/application/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  BlocOverrides.runZoned(
    () => runApp(App()),
    blocObserver: StateObserver(),
  );
}
