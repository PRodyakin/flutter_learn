import 'dart:async';

import 'package:clean_arch_test/feature/sms_code/bloc/sms_code_bloc.dart';
import 'package:clean_arch_test/feature/sms_code/model/sms_code.dart';
import 'package:clean_arch_test/feature/timer_button/view/timer_button_widget.dart';
import 'package:clean_arch_test/feature/timer_button/view/timer_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SmsCodeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _Title(),
                const Padding(padding: EdgeInsets.all(10)),
                Row(
                  children: [
                    Flexible(
                      child: _PinCode(),
                      flex: 2,
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _LoginButton(),
                Padding(padding: EdgeInsets.all(10)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PinCode extends StatelessWidget {
  _PinCode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SmsCodeBloc, SmsCodeState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return PinCodeTextField(
          length: SmsCode.SMS_CODE_LENGTH,
          obscureText: false,
          animationType: AnimationType.fade,
          keyboardType: TextInputType.numberWithOptions(decimal: false),
          pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              activeFillColor: state.status.isValid ? Colors.orange : Colors.white,
              selectedColor: Colors.white,
              selectedFillColor: Colors.white,
              inactiveColor: Colors.white,
              inactiveFillColor: Colors.white,
              activeColor: Colors.blue),
          animationDuration: Duration(milliseconds: 300),
          enableActiveFill: true,
          onCompleted: (v) => _onCompleted(context, v),
          beforeTextPaste: (text) {
            print("Allowing to paste $text");
            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //but you can show anything you want here, like your pop up saying wrong paste format or etc
            return true;
          },
          appContext: context,
          onChanged: (String value) {},
        );
      },
    );
  }

  SmsCodeBloc getBloc(BuildContext context) => context.read<SmsCodeBloc>();

  _onCompleted(BuildContext context, String code) {
    getBloc(context).add(SmsCodeInputFinished(code));
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Мы отправили код \nчтобы убедиться \nчто это точно ты",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SmsCodeBloc, SmsCodeState>(
      builder: (context, state) {
        return Container(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            child: TimerButtonWidget(
              key: const Key('loginForm_continue_raisedButton'),
              style: buildButtonStyle(),
              onPressed: onPressed(state, context),
              activeText: Text("Отправить код повторно"),
              inactiveText: Text("Запросить через"),
            ),
          ),
        );
      },
    );
  }

  onPressed(SmsCodeState state, BuildContext context) {
    //TODO call new sms code
    return null;
  }

  ButtonStyle buildButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class ButtonText extends StatelessWidget {
  const ButtonText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: const Text(
        'Начать',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
