import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/footer/footer_widget.dart';
import '/pages/header/header_widget.dart';
import '/pages/header_mobil/header_mobil_widget.dart';
import '/index.dart';
import 'simulator_widget.dart' show SimulatorWidget;
import 'package:flutter/material.dart';

class SimulatorModel extends FlutterFlowModel<SimulatorWidget> {
  ///  Local state fields for this page.

  bool stateDescription = true;

  String? uidSession;

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for HeaderMobil component.
  late HeaderMobilModel headerMobilModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ExamGroupsRecord? refGroup;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ExamenesRecord? refExamen;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RegisterSimulatorRecord? refHistory;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ExamGroupsRecord? refGroupMobil;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ExamenesRecord? refExamenMobil;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RegisterSimulatorRecord? refHistoryMobil;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    headerMobilModel = createModel(context, () => HeaderMobilModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    headerMobilModel.dispose();
    footerModel.dispose();
  }
}
