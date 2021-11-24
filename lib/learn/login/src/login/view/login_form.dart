import 'package:clean_arch_test/learn/login/src/login/bloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: SafeArea(
        child: Container(
          child: Column(
            children: [
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _Title(),
                    const Padding(padding: EdgeInsets.all(10)),
                    _PhoneInput(),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _LoginButton(),
                    Padding(padding: EdgeInsets.all(10)),
                    _Terms(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Terms extends StatelessWidget {
  const _Terms({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Нажимая кнопку «Начать» \nя соглашаюсь наобработку персональных\n данных и данных об абонентах",
      style: TextStyle(fontSize: 11),
      textAlign: TextAlign.center,
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Привет! Введи свой \nномер и начнем ",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
      ),
    );
  }
}

class _PhoneInput extends StatelessWidget {
  final maskFormatter = MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      initialText: "+7 (");

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.userPhone != current.userPhone,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_usernameInput_textField'),
          inputFormatters: [
            maskFormatter,
          ],
          keyboardType: TextInputType.phone,
          onTap: () => maskFormatter.maskText(""),
          onChanged: (userPhone) =>
              context.read<LoginBloc>().add(LoginUserPhoneChanged(userPhone)),
          decoration: InputDecoration(
            filled: true,
            hintText: "+7",
            errorText: state.userPhone.invalid ? 'Некорректный номер' : null,
            border: OutlineInputBorder(),
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : Container(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    key: const Key('loginForm_continue_raisedButton'),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: const Text(
                        'Начать',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    onPressed: state.status.isValidated
                        ? () {
                            context
                                .read<LoginBloc>()
                                .add(const LoginSubmitted());
                          }
                        : null,
                  ),
                ),
              );
      },
    );
  }
}
