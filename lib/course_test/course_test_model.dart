import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'course_test_widget.dart' show CourseTestWidget;
import 'package:flutter/material.dart';

class CourseTestModel extends FlutterFlowModel<CourseTestWidget> {
  ///  Local state fields for this page.

  List<String> listModule = [];
  void addToListModule(String item) => listModule.add(item);
  void removeFromListModule(String item) => listModule.remove(item);
  void removeAtIndexFromListModule(int index) => listModule.removeAt(index);
  void insertAtIndexInListModule(int index, String item) =>
      listModule.insert(index, item);
  void updateListModuleAtIndex(int index, Function(String) updateFn) =>
      listModule[index] = updateFn(listModule[index]);

  ModuleClassRecord? refClassModule;

  ResultadosRecord? refResult;

  bool stateDescription = false;

  bool stateContentCourse = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
