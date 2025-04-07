import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'txt_comentario_publicacion_curso_widget.dart'
    show TxtComentarioPublicacionCursoWidget;
import 'package:flutter/material.dart';

class TxtComentarioPublicacionCursoModel
    extends FlutterFlowModel<TxtComentarioPublicacionCursoWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txtGuardarComentario widget.
  FocusNode? txtGuardarComentarioFocusNode;
  TextEditingController? txtGuardarComentarioTextController;
  String? Function(BuildContext, String?)?
      txtGuardarComentarioTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in txtGuardarComentario widget.
  AnnouncementCommentsRecord? refComentarioPublicacion;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtGuardarComentarioFocusNode?.dispose();
    txtGuardarComentarioTextController?.dispose();
  }
}
