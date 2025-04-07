import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_update_category_examen_widget.dart'
    show CreateUpdateCategoryExamenWidget;
import 'package:flutter/material.dart';

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
