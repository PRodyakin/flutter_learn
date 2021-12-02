import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_arch_test/feature/timer_button/utils/ticker.dart';
import 'package:meta/meta.dart';

import '../../../../../application/injection_container.dart';

part 'timer_button_state.dart';

class TimerButtonCubit extends Cubit<TimerButtonState> {
  TimerButtonCubit(this._duration)
      : super(TimerButtonState(_duration, true)) {
    startTimer();
  }

  final int _duration;
  final Ticker _ticker = sl<Ticker>();

  static const int _TIMER_END = 0;

  startTimer() {
    _ticker.onTick =_onTick;

    emit(TimerButtonState(_duration, true));

  }

  @override
  Future<void> close() {
    _ticker.tickerSubscription?.cancel();
    return super.close();
  }

  _onTick(int duration) {
    emit(TimerButtonState(duration, duration > _TIMER_END));
  }
}
