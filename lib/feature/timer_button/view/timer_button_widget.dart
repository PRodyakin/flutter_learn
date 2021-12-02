import 'package:clean_arch_test/feature/timer_button/bloc/timer_button_cubit.dart';
import 'package:clean_arch_test/feature/timer_button/utils/ticker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerButtonWidget extends StatelessWidget {
  TimerButtonWidget({
    this.onPressed,
    this.key,
    this.style,
    required this.inactiveText,
    required this.activeText,
  });

  final VoidCallback? onPressed;
  final Key? key;
  final ButtonStyle? style;
  final Text inactiveText;
  final Text activeText;

  getChild(TimerButtonState state) {
    return state.isRunning ? inactiveTimerText(state.time) : activeText;
  }

  Widget inactiveTimerText(int time) {
    final minutesStr = ((time / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (time % 60).floor().toString().padLeft(2, '0');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        inactiveText,
        Text(" $minutesStr:$secondsStr"),
      ],
    );
  }

  VoidCallback? _onPressed(TimerButtonState state, BuildContext context) {
    if (state.isRunning) {
      return null;
    } else {
      return () => startTimer(context);
    }
  }

  startTimer(BuildContext context) {
    onPressed?.call();
    context.read<TimerButtonCubit>().startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerButtonCubit(10),
      child: BlocBuilder<TimerButtonCubit, TimerButtonState>(
        builder: (context, state) {
          return ElevatedButton(
            key: key,
            onPressed: _onPressed(state, context),
            style: style,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: getChild(state),
            ),
          );
        },
      ),
    );
  }
}
