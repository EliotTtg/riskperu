import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'txtcontenido_widget.dart' show TxtcontenidoWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TxtcontenidoModel extends FlutterFlowModel<TxtcontenidoWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txtcontenido widget.
  FocusNode? txtcontenidoFocusNode;
  TextEditingController? txtcontenidoTextController;
  String? Function(BuildContext, String?)? txtcontenidoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtcontenidoFocusNode?.dispose();
    txtcontenidoTextController?.dispose();
  }
}
