import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'popup_add_coments_widget.dart' show PopupAddComentsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PopupAddComentsModel extends FlutterFlowModel<PopupAddComentsWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtcontenidos widget.
  FocusNode? txtcontenidosFocusNode;
  TextEditingController? txtcontenidosTextController;
  String? Function(BuildContext, String?)? txtcontenidosTextControllerValidator;
  String? _txtcontenidosTextControllerValidator(
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
    txtcontenidosTextControllerValidator =
        _txtcontenidosTextControllerValidator;
  }

  @override
  void dispose() {
    txtcontenidosFocusNode?.dispose();
    txtcontenidosTextController?.dispose();
  }
}
