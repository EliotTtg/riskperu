import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/header/header_widget.dart';
import '/index.dart';
import 'register_widget.dart' show RegisterWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterModel extends FlutterFlowModel<RegisterWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for Header component.
  late HeaderModel headerModel;
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

  // State field(s) for txtemail widget.
  FocusNode? txtemailFocusNode;
  TextEditingController? txtemailTextController;
  String? Function(BuildContext, String?)? txtemailTextControllerValidator;
  String? _txtemailTextControllerValidator(BuildContext context, String? val) {
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
  late MaskTextInputFormatter txtnumeroMask;
  String? Function(BuildContext, String?)? txtnumeroTextControllerValidator;
  String? _txtnumeroTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto';
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
      return 'Campo obligatorio incompleto';
    }

    if (val.length < 6) {
      return 'Campo obligatorio incompleto';
    }

    if (!RegExp(
            '^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[!@#\\\$%^&*()_+\\-=\\[\\]{};:,.<>\\/?]).{6,}\$')
        .hasMatch(val)) {
      return 'Contraseña no cumple con el formato requerido.';
    }
    return null;
  }

  // State field(s) for chkofertas widget.
  bool? chkofertasValue;
  // State field(s) for chkoterminos widget.
  bool? chkoterminosValue;
  // Stores action output result for [Custom Action - generarCodigoUser] action in Button widget.
  String? codigouser;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UsersPlansRecord? refUserplan;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    txtnombreTextControllerValidator = _txtnombreTextControllerValidator;
    txtemailTextControllerValidator = _txtemailTextControllerValidator;
    txtnumeroTextControllerValidator = _txtnumeroTextControllerValidator;
    txtpasswordVisibility = false;
    txtpasswordTextControllerValidator = _txtpasswordTextControllerValidator;
  }

  @override
  void dispose() {
    headerModel.dispose();
    txtnombreFocusNode?.dispose();
    txtnombreTextController?.dispose();

    txtemailFocusNode?.dispose();
    txtemailTextController?.dispose();

    txtnumeroFocusNode?.dispose();
    txtnumeroTextController?.dispose();

    txtpasswordFocusNode?.dispose();
    txtpasswordTextController?.dispose();
  }
}
