import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'form_register_demo_widget.dart' show FormRegisterDemoWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FormRegisterDemoModel extends FlutterFlowModel<FormRegisterDemoWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtnombre widget.
  FocusNode? txtnombreFocusNode;
  TextEditingController? txtnombreTextController;
  String? Function(BuildContext, String?)? txtnombreTextControllerValidator;
  String? _txtnombreTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto';
    }

    return null;
  }

  // State field(s) for txtapellido widget.
  FocusNode? txtapellidoFocusNode;
  TextEditingController? txtapellidoTextController;
  String? Function(BuildContext, String?)? txtapellidoTextControllerValidator;
  String? _txtapellidoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto';
    }

    return null;
  }

  // State field(s) for txtcorreo widget.
  FocusNode? txtcorreoFocusNode;
  TextEditingController? txtcorreoTextController;
  String? Function(BuildContext, String?)? txtcorreoTextControllerValidator;
  String? _txtcorreoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'El correo no es válido debe contener @Email.com';
    }
    return null;
  }

  // State field(s) for txtnumero widget.
  FocusNode? txtnumeroFocusNode;
  TextEditingController? txtnumeroTextController;
  String? Function(BuildContext, String?)? txtnumeroTextControllerValidator;
  String? _txtnumeroTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto';
    }

    if (val.length < 9) {
      return 'Campo obligatorio incompleto';
    }
    if (val.length > 9) {
      return 'Campo obligatorio incompleto';
    }

    return null;
  }

  // State field(s) for txtpassword widget.
  FocusNode? txtpasswordFocusNode;
  TextEditingController? txtpasswordTextController;
  String? Function(BuildContext, String?)? txtpasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    txtnombreTextControllerValidator = _txtnombreTextControllerValidator;
    txtapellidoTextControllerValidator = _txtapellidoTextControllerValidator;
    txtcorreoTextControllerValidator = _txtcorreoTextControllerValidator;
    txtnumeroTextControllerValidator = _txtnumeroTextControllerValidator;
  }

  @override
  void dispose() {
    txtnombreFocusNode?.dispose();
    txtnombreTextController?.dispose();

    txtapellidoFocusNode?.dispose();
    txtapellidoTextController?.dispose();

    txtcorreoFocusNode?.dispose();
    txtcorreoTextController?.dispose();

    txtnumeroFocusNode?.dispose();
    txtnumeroTextController?.dispose();

    txtpasswordFocusNode?.dispose();
    txtpasswordTextController?.dispose();
  }
}
