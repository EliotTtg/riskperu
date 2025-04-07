import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/footer/footer_widget.dart';
import '/pages/header/header_widget.dart';
import '/index.dart';
import 'simulador_widget.dart' show SimuladorWidget;
import 'package:flutter/material.dart';

class SimuladorModel extends FlutterFlowModel<SimuladorWidget> {
  ///  Local state fields for this page.

  String? courseCategory;

  List<String> uidsCourse = [];
  void addToUidsCourse(String item) => uidsCourse.add(item);
  void removeFromUidsCourse(String item) => uidsCourse.remove(item);
  void removeAtIndexFromUidsCourse(int index) => uidsCourse.removeAt(index);
  void insertAtIndexInUidsCourse(int index, String item) =>
      uidsCourse.insert(index, item);
  void updateUidsCourseAtIndex(int index, Function(String) updateFn) =>
      uidsCourse[index] = updateFn(uidsCourse[index]);

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for cboCategory widget.
  String? cboCategoryValue;
  FormFieldController<String>? cboCategoryValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<CoursesRecord> simpleSearchResults = [];
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    footerModel.dispose();
  }
}
