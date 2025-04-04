import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'txt_comentario_publicacion_curso_widget.dart'
    show TxtComentarioPublicacionCursoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
