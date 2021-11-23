import 'package:clean_arch_test/data/repo/geo_storm_repo_impl.dart';
import 'package:clean_arch_test/data/repo/solar_flare_repo_impl.dart';
import 'package:clean_arch_test/data/service/nasa_service.dart';
import 'package:clean_arch_test/domain/repo/geo_storm_repo.dart';
import 'package:clean_arch_test/domain/repo/solar_flare_repo.dart';
import 'package:clean_arch_test/domain/use_case/solar_activities_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/home_state.dart';
import '../presentation/my_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loginForm(),
    );
  }

  Widget _loginForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _userNameField(),
            _passwordField(),
            _loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _userNameField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: "User name",
      ),
      validator: (value) => null,
    );
  }

  Widget _passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        icon: Icon(Icons.security),
        hintText: "Password",
      ),
      validator: (value) => null,
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text("Login"),
    );
  }
}

abstract class LoginEvent {}

class LoginUserNameChanged extends LoginEvent {
  late String userName;

  LoginUserNameChanged(this.userName);
}

class LoginPasswordChanged extends LoginEvent {
  late String password;

  LoginPasswordChanged(this.password);
}

class LoginButtonSubmitted extends LoginEvent {}

class LoginState {
  late String userName;
  late String password;
  late FormSubmissionStatus formStatus;

  LoginState({
    this.userName = "",
    this.password = "",
    this.formStatus = const InitialFormStatus(),
  });

  LoginState copyWith(
      {String? username, String? password, FormSubmissionStatus? formStatus}) {
    return LoginState(
      userName: username ?? this.userName,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}

abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class InitialFormStatus extends FormSubmissionStatus {
  const InitialFormStatus();
}

class SubmissionSuccess extends FormSubmissionStatus {}

class SubmissionFailed extends FormSubmissionStatus {
  late Exception exception;

  SubmissionFailed(this.exception);
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginPasswordChanged>((event, emit) {});
  }
}

class RepoModule {
  static late final NasaService _nasaService = NasaService();
  static late GeoStormRepo geoStormRepo = GeoStormRepoImpl(_nasaService);
  static late SolarFlareRepo solarFlareRepo = SolarFlareRepoImpl(_nasaService);
}

class HomeModule {
  static late final HomeState homeState = HomeState(SolarActivitiesUseCase(
    RepoModule.geoStormRepo,
    RepoModule.solarFlareRepo,
  ));
}
