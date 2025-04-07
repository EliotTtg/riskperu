import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'popup_add_coment_widget.dart' show PopupAddComentWidget;
import 'package:flutter/material.dart';

class PopupAddComentModel extends FlutterFlowModel<PopupAddComentWidget> {
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
  ComentariosRecord? refComentario;

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
