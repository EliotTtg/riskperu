import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_update_category_widget.dart' show CreateUpdateCategoryWidget;
import 'package:flutter/material.dart';

class CreateUpdateCategoryModel
    extends FlutterFlowModel<CreateUpdateCategoryWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CategoryCoursesRecord? refCourses;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
