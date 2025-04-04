import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/alerta_tipo_user/alerta_tipo_user_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_update_usuario_widget.dart' show CreateUpdateUsuarioWidget;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateUpdateUsuarioModel
    extends FlutterFlowModel<CreateUpdateUsuarioWidget> {
  ///  Local state fields for this component.

  int? rol;

  bool stateConfirm = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtcodigo widget.
  FocusNode? txtcodigoFocusNode;
  TextEditingController? txtcodigoTextController;
  String? Function(BuildContext, String?)? txtcodigoTextControllerValidator;
  String? _txtcodigoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto.';
    }

    return null;
  }

  // Stores action output result for [Custom Action - generarCodigoUser] action in IconButton widget.
  String? codeUserempty;
  // Stores action output result for [Custom Action - generarCodigoUser] action in IconButton widget.
  String? codeUser;
  // State field(s) for cborol widget.
  int? cborolValue;
  FormFieldController<int>? cborolValueController;
  // State field(s) for txtDNI widget.
  FocusNode? txtDNIFocusNode;
  TextEditingController? txtDNITextController;
  String? Function(BuildContext, String?)? txtDNITextControllerValidator;
  String? _txtDNITextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto.';
    }

    if (val.length < 8) {
      return 'Por favor, ingrese un número válido de 8 dígitos.';
    }
    if (val.length > 8) {
      return 'Por favor, ingrese un número válido de 8 dígitos.';
    }

    return null;
  }

  // State field(s) for txtnombre widget.
  FocusNode? txtnombreFocusNode;
  TextEditingController? txtnombreTextController;
  String? Function(BuildContext, String?)? txtnombreTextControllerValidator;
  String? _txtnombreTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto.';
    }

    return null;
  }

  // State field(s) for txtpassword widget.
  FocusNode? txtpasswordFocusNode;
  TextEditingController? txtpasswordTextController;
  late bool txtpasswordVisibility;
  String? Function(BuildContext, String?)? txtpasswordTextControllerValidator;
  String? _txtpasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto.';
    }

    if (val.length < 6) {
      return 'Campo obligatorio incompleto.';
    }

    if (!RegExp(
            '^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[!@#\\\$%^&*()_+\\-=\\[\\]{};:,.<>\\/?]).{6,}\$')
        .hasMatch(val)) {
      return 'Contraseña no cumple con el formato requerido.';
    }
    return null;
  }

  // State field(s) for txtemail widget.
  FocusNode? txtemailFocusNode;
  TextEditingController? txtemailTextController;
  String? Function(BuildContext, String?)? txtemailTextControllerValidator;
  String? _txtemailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto.';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'El correo no es válido debe contener @email.com';
    }
    return null;
  }

  // State field(s) for txtconfirmarcontrasea widget.
  FocusNode? txtconfirmarcontraseaFocusNode;
  TextEditingController? txtconfirmarcontraseaTextController;
  late bool txtconfirmarcontraseaVisibility;
  String? Function(BuildContext, String?)?
      txtconfirmarcontraseaTextControllerValidator;
  // Stores action output result for [Custom Action - updateUser] action in Button widget.
  String? messageUpdateUser;
  // Stores action output result for [Custom Action - addUser] action in Button widget.
  String? messageAddUser;

  @override
  void initState(BuildContext context) {
    txtcodigoTextControllerValidator = _txtcodigoTextControllerValidator;
    txtDNITextControllerValidator = _txtDNITextControllerValidator;
    txtnombreTextControllerValidator = _txtnombreTextControllerValidator;
    txtpasswordVisibility = false;
    txtpasswordTextControllerValidator = _txtpasswordTextControllerValidator;
    txtemailTextControllerValidator = _txtemailTextControllerValidator;
    txtconfirmarcontraseaVisibility = false;
  }

  @override
  void dispose() {
    txtcodigoFocusNode?.dispose();
    txtcodigoTextController?.dispose();

    txtDNIFocusNode?.dispose();
    txtDNITextController?.dispose();

    txtnombreFocusNode?.dispose();
    txtnombreTextController?.dispose();

    txtpasswordFocusNode?.dispose();
    txtpasswordTextController?.dispose();

    txtemailFocusNode?.dispose();
    txtemailTextController?.dispose();

    txtconfirmarcontraseaFocusNode?.dispose();
    txtconfirmarcontraseaTextController?.dispose();
  }
}
