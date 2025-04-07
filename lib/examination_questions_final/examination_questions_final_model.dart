import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/header/header_widget.dart';
import '/pages/navbar/navbar_widget.dart';
import '/index.dart';
import 'examination_questions_final_widget.dart'
    show ExaminationQuestionsFinalWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class ExaminationQuestionsFinalModel
    extends FlutterFlowModel<ExaminationQuestionsFinalWidget> {
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

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - porcentajeCourseLinea] action in examinationQuestionsFinal widget.
  double? porcentajeCourse;
  // Stores action output result for [Custom Action - porcentajeCourseLinea] action in examinationQuestionsFinal widget.
  double? porcentajeExamenes;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for Navbar component.
  late NavbarModel navbarModel;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(0, milliSecond: false);
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Stores action output result for [Backend Call - Read Document] action in Timer widget.
  ResultadosRecord? resultadoFinalBienTime;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  UsersAnswersRecord? refRespuestaCrear;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RespuestaStateRecord? refStateQuestion;
  // Stores action output result for [Custom Action - verificarPreguntasRespondidas] action in Button widget.
  bool? estadoExamen;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ResultadosRecord? resultadoFinalBien;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ResultadosRecord? resultadoFinalBien2;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    navbarModel.dispose();
    timerController.dispose();
  }
}
