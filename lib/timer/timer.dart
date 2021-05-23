import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import './timer_model.dart';

class CountdownTimer {
  double _fractionLeft;
  int work = 90; // minute value. See startWork()
  int shortBreak = 20;
  int longBreak = 50;
  bool _isActive = true;
  Timer timer;
  Duration _timeLeft;
  Duration _fullTime;

  String printTime(Duration t) {
    String minutes = t.inMinutes < 10
        ? '0' + t.inMinutes.toString()
        : t.inMinutes.toString();

    int secondsLeft = t.inSeconds - (t.inMinutes * 60);
    String seconds = secondsLeft < 10
        ? '0' + secondsLeft.toString()
        : secondsLeft.toString();

    return minutes + ':' + seconds;
  }

  Stream<TimerModel> stream() async* {
    yield* Stream.periodic(Duration(seconds: 1), (int a) {
      String timeLeft;
      if (this._isActive) {
        _timeLeft = _timeLeft - Duration(seconds: 1);
        _fractionLeft = _timeLeft.inSeconds / _fullTime.inSeconds;
        if (_timeLeft.inSeconds <= 0) {
          _isActive = false;
        }
      }
      timeLeft = printTime(_timeLeft);
      return TimerModel(timeLeft, _fractionLeft);
    });
  }

  Future readSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.work =
        prefs.getInt('workTime') == null ? 30 : prefs.getInt('workTime');

    this.shortBreak =
        prefs.getInt('shortBreak') == null ? 30 : prefs.getInt('shortBreak');
    this.longBreak =
        prefs.getInt('longBreak') == null ? 30 : prefs.getInt('longBreak');
  }

  void startWork() async {
    await readSettings();
    _fractionLeft = 1;
    _timeLeft = Duration(minutes: this.work);
    _fullTime = _timeLeft;
  }

  void startBreak(bool isShort) {
    _fractionLeft = 1;
    _timeLeft = Duration(minutes: isShort ? this.shortBreak : this.longBreak);
    _fullTime = _timeLeft;
  }

  void pauseTime() {
    this._isActive = false;
  }

  void continueTime() {
    if (this._timeLeft.inSeconds > 0) {
      this._isActive = true;
    }
  }

  void restartTime() {
    if (this._timeLeft.inSeconds > 0) {
      this.startWork();
      this._isActive = true;
    }
  }
}
