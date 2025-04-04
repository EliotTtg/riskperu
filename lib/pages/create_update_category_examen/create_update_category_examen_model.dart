import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'create_update_category_examen_widget.dart'
    show CreateUpdateCategoryExamenWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateUpdateCategoryExamenModel
    extends FlutterFlowModel<CreateUpdateCategoryExamenWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for cbotype widget.
  bool? cbotypeValue;
  FormFieldController<bool>? cbotypeValueController;
  // State field(s) for cbostate widget.
  bool? cbostateValue;
  FormFieldController<bool>? cbostateValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ExamGroupsRecord? refCourses;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
