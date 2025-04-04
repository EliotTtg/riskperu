import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'crear_tipo_comentario_widget.dart' show CrearTipoComentarioWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CrearTipoComentarioModel
    extends FlutterFlowModel<CrearTipoComentarioWidget> {
  ///  Local state fields for this component.

  bool type = true;

  bool stateComent = false;

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
  ComentariosRecord? refComentario;

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
