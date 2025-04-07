import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'crear_nota_curso_widget.dart' show CrearNotaCursoWidget;
import 'package:flutter/material.dart';

class CrearNotaCursoModel extends FlutterFlowModel<CrearNotaCursoWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtcontenido widget.
  FocusNode? txtcontenidoFocusNode;
  TextEditingController? txtcontenidoTextController;
  String? Function(BuildContext, String?)? txtcontenidoTextControllerValidator;
  String? _txtcontenidoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotasRecord? refNotas;

  @override
  void initState(BuildContext context) {
    txtcontenidoTextControllerValidator = _txtcontenidoTextControllerValidator;
  }

  @override
  void dispose() {
    txtcontenidoFocusNode?.dispose();
    txtcontenidoTextController?.dispose();
  }
}
