import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_update_module_widget.dart' show CreateUpdateModuleWidget;
import 'package:flutter/material.dart';

class CreateUpdateModuleModel
    extends FlutterFlowModel<CreateUpdateModuleWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModuleRecord? refModule;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
