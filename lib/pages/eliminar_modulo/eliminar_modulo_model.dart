import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'eliminar_modulo_widget.dart' show EliminarModuloWidget;
import 'package:flutter/material.dart';

class EliminarModuloModel extends FlutterFlowModel<EliminarModuloWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActionsRecord? refActionCreate;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
