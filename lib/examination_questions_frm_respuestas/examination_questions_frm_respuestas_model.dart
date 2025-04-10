import '/backend/backend.dart';
import '/components/time_mobil_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/header_mobil/header_mobil_widget.dart';
import '/index.dart';
import 'examination_questions_frm_respuestas_widget.dart'
    show ExaminationQuestionsFrmRespuestasWidget;
import 'package:flutter/material.dart';

class ExaminationQuestionsFrmRespuestasModel
    extends FlutterFlowModel<ExaminationQuestionsFrmRespuestasWidget> {
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

  // Model for HeaderMobil component.
  late HeaderMobilModel headerMobilModel;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<ResultadosRecord>();
  // Models for timeMobil dynamic component.
  late FlutterFlowDynamicModels<TimeMobilModel> timeMobilModels;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ResultadosRecord? refResult;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RegisterSimulatorRecord? refRegister;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ResultadosRecord? referenciaResultado;

  @override
  void initState(BuildContext context) {
    headerMobilModel = createModel(context, () => HeaderMobilModel());
    timeMobilModels = FlutterFlowDynamicModels(() => TimeMobilModel());
  }

  @override
  void dispose() {
    headerMobilModel.dispose();
    paginatedDataTableController.dispose();
    timeMobilModels.dispose();
  }
}
