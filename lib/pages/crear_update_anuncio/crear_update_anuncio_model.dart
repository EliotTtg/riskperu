import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'crear_update_anuncio_widget.dart' show CrearUpdateAnuncioWidget;
import 'package:flutter/material.dart';

class CrearUpdateAnuncioModel
    extends FlutterFlowModel<CrearUpdateAnuncioWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txttitulo widget.
  FocusNode? txttituloFocusNode;
  TextEditingController? txttituloTextController;
  String? Function(BuildContext, String?)? txttituloTextControllerValidator;
  String? _txttituloTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto';
    }

    return null;
  }

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
  AnnouncementsCoursesRecord? refAnuncio;

  @override
  void initState(BuildContext context) {
    txttituloTextControllerValidator = _txttituloTextControllerValidator;
    txtcontenidoTextControllerValidator = _txtcontenidoTextControllerValidator;
  }

  @override
  void dispose() {
    txttituloFocusNode?.dispose();
    txttituloTextController?.dispose();

    txtcontenidoFocusNode?.dispose();
    txtcontenidoTextController?.dispose();
  }
}
