import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/timer/timer_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'from_result_simulator_widget.dart' show FromResultSimulatorWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class FromResultSimulatorModel
    extends FlutterFlowModel<FromResultSimulatorWidget> {
  ///  Local state fields for this component.

  double finalScore = 0.0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(0, milliSecond: false);
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<ResultadosRecord>();
  // Models for timer dynamic component.
  late FlutterFlowDynamicModels<TimerModel> timerModels;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ResultadosRecord? refResult;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RegisterSimulatorRecord? refRegister;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ResultadosRecord? referenciaResultado;

  @override
  void initState(BuildContext context) {
    timerModels = FlutterFlowDynamicModels(() => TimerModel());
  }

  @override
  void dispose() {
    timerController.dispose();
    paginatedDataTableController.dispose();
    timerModels.dispose();
  }
}
