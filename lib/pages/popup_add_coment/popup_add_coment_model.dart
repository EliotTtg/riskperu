import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'popup_add_coment_widget.dart' show PopupAddComentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
