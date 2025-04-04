import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/header/header_widget.dart';
import '/pages/update_password/update_password_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'login_app_widget.dart' show LoginAppWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginAppModel extends FlutterFlowModel<LoginAppWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for txtemail widget.
  FocusNode? txtemailFocusNode;
  TextEditingController? txtemailTextController;
  String? Function(BuildContext, String?)? txtemailTextControllerValidator;
  // State field(s) for txtpassword widget.
  FocusNode? txtpasswordFocusNode;
  TextEditingController? txtpasswordTextController;
  late bool txtpasswordVisibility;
  String? Function(BuildContext, String?)? txtpasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    txtpasswordVisibility = false;
  }

  @override
  void dispose() {
    headerModel.dispose();
    txtemailFocusNode?.dispose();
    txtemailTextController?.dispose();

    txtpasswordFocusNode?.dispose();
    txtpasswordTextController?.dispose();
  }
}
