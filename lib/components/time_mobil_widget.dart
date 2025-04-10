import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'time_mobil_model.dart';
export 'time_mobil_model.dart';

class TimeMobilWidget extends StatefulWidget {
  const TimeMobilWidget({
    super.key,
    this.parameter1,
  });

  final int? parameter1;

  @override
  State<TimeMobilWidget> createState() => _TimeMobilWidgetState();
}

class _TimeMobilWidgetState extends State<TimeMobilWidget> {
  late TimeMobilModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeMobilModel());

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
      initialTime: widget.parameter1!,
      getDisplayTime: (value) =>
          StopWatchTimer.getDisplayTime(value, milliSecond: false),
      controller: _model.timerController,
      updateStateInterval: Duration(milliseconds: 1000),
      onChanged: (value, displayTime, shouldUpdate) {
        _model.timerMilliseconds = value;
        _model.timerValue = displayTime;
        if (shouldUpdate) safeSetState(() {});
      },
      textAlign: TextAlign.start,
      style: FlutterFlowTheme.of(context).headlineSmall.override(
            fontFamily: 'Poppins',
            fontSize: 12.0,
            letterSpacing: 0.0,
            fontWeight: FontWeight.normal,
          ),
    );
  }
}
