import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_arch_test/learn/login/src/timer_button/utils/ticker.dart';
import 'package:meta/meta.dart';

part 'timer_button_state.dart';

class TimerButtonCubit extends Cubit<TimerButtonState> {
  TimerButtonCubit(this._ticker, this._duration)
      : super(TimerButtonState(_duration, true)) {
    startTimer();
  }

  final int _duration;
  final Ticker _ticker;
  static const int _TIMER_END = 0;
  StreamSubscription<int>? _tickerSubscription;

  startTimer() {
    emit(TimerButtonState(_duration, true));
    _tickerSubscription?.cancel();
    _tickerSubscription =
        _ticker.tick(ticks: state.time).listen((duration) => _onTick(duration));
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  _onTick(int duration) {
    emit(TimerButtonState(duration, duration > _TIMER_END));
  }
}
