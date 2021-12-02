import 'dart:async';

import 'dart:ffi';

import 'package:flutter/foundation.dart';

class Ticker {
  Ticker() {

  }

  late int ticks;
  late Function onTick;

  StreamSubscription<int>? tickerSubscription;

  Stream<int> tick({required int ticks}) {
    return Stream.periodic(Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }
}

class ButtonTimer {
  Duration duration;
  Function? callback;

  ButtonTimer(this.duration);

  start() {
    callback = (timer) {
      print('asd');
    };
    Timer.periodic(duration, (timer) {
      callback?.call(timer);
    });
  }
}
