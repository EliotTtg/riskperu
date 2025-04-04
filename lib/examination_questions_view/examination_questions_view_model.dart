import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/from_result_simulator/from_result_simulator_widget.dart';
import '/pages/header/header_widget.dart';
import '/pages/navbar/navbar_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'examination_questions_view_widget.dart'
    show ExaminationQuestionsViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class ExaminationQuestionsViewModel
    extends FlutterFlowModel<ExaminationQuestionsViewWidget> {
  ///  Local state fields for this page.

  int indexQuestion = 0;

  bool stateEnding = false;

  List<String> stringQuestions = [];
  void addToStringQuestions(String item) => stringQuestions.add(item);
  void removeFromStringQuestions(String item) => stringQuestions.remove(item);
  void removeAtIndexFromStringQuestions(int index) =>
      stringQuestions.removeAt(index);
  void insertAtIndexInStringQuestions(int index, String item) =>
      stringQuestions.insert(index, item);
  void updateStringQuestionsAtIndex(int index, Function(String) updateFn) =>
      stringQuestions[index] = updateFn(stringQuestions[index]);

  String? refGroupExamen;

  String? refExamen;

  ResultadosRecord? refResult;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - porcentajeCourseLinea] action in examinationQuestionsView widget.
  double? porcentajeCourse;
  // Stores action output result for [Custom Action - porcentajeCourse] action in examinationQuestionsView widget.
  double? porcentajeExamenes;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for Navbar component.
  late NavbarModel navbarModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  PreguntasRecord? refPreguntas;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  RespuestasRecord? refQuestion;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ResultadosRecord? refResultado1;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ResultadosRecord? refResultCourse1;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RegisterSimulatorRecord? refRegister;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ResultadosRecord? refResultCourse2;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    navbarModel.dispose();
  }
}
