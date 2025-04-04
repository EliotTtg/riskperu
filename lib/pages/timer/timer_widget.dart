import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'timer_model.dart';
export 'timer_model.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({
    super.key,
    this.parameter1,
  });

  final int? parameter1;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late TimerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowTimer(
      initialTime: widget!.parameter1!,
      getDisplayTime: (value) =>
          StopWatchTimer.getDisplayTime(value, milliSecond: false),
      controller: _model.timerController,
      updateStateInterval: Duration(milliseconds: 10000),
      onChanged: (value, displayTime, shouldUpdate) {
        _model.timerMilliseconds = value;
        _model.timerValue = displayTime;
        if (shouldUpdate) safeSetState(() {});
      },
      textAlign: TextAlign.start,
      style: FlutterFlowTheme.of(context).headlineSmall.override(
            fontFamily: 'Poppins',
            color: FlutterFlowTheme.of(context).primaryText,
            fontSize: 14.0,
            letterSpacing: 0.0,
            fontWeight: FontWeight.normal,
          ),
    );
  }
}
