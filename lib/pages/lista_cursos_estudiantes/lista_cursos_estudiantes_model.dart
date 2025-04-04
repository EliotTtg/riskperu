import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/empty_course/empty_course_widget.dart';
import 'dart:ui';
import 'lista_cursos_estudiantes_widget.dart' show ListaCursosEstudiantesWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListaCursosEstudiantesModel
    extends FlutterFlowModel<ListaCursosEstudiantesWidget> {
  ///  Local state fields for this component.

  UsersRecord? refUser;

  ///  State fields for stateful widgets in this component.

  // State field(s) for txttitulo widget.
  FocusNode? txttituloFocusNode;
  TextEditingController? txttituloTextController;
  String? Function(BuildContext, String?)? txttituloTextControllerValidator;
  // State field(s) for txtencargado widget.
  FocusNode? txtencargadoFocusNode;
  TextEditingController? txtencargadoTextController;
  String? Function(BuildContext, String?)? txtencargadoTextControllerValidator;
  // State field(s) for txttiempolimite widget.
  FocusNode? txttiempolimiteFocusNode;
  TextEditingController? txttiempolimiteTextController;
  String? Function(BuildContext, String?)?
      txttiempolimiteTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txttituloFocusNode?.dispose();
    txttituloTextController?.dispose();

    txtencargadoFocusNode?.dispose();
    txtencargadoTextController?.dispose();

    txttiempolimiteFocusNode?.dispose();
    txttiempolimiteTextController?.dispose();
  }
}
