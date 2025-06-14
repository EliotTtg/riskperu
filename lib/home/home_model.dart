import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/course_calification/course_calification_widget.dart';
import '/pages/footer/footer_widget.dart';
import '/pages/header/header_widget.dart';
import '/pages/header_mobil_cerrar_sesion/header_mobil_cerrar_sesion_widget.dart';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
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
  // Model for HeaderMobilCerrarSesion component.
  late HeaderMobilCerrarSesionModel headerMobilCerrarSesionModel;
  // State field(s) for cboCategory widget.
  String? cboCategoryValue;
  FormFieldController<String>? cboCategoryValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<CoursesRecord> simpleSearchResults = [];
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  UsersCoursesRecord? refCourseUser;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  SessionRecord? refSessionStudent;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ModuleRecord? refModulesCourse;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ModuleClassRecord? refClassCourse;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  UsersRecord? refUser;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ExamGroupsRecord? refGroup;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ExamenesRecord? refExamen;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  RegisterSimulatorRecord? refHistory;
  // Models for CourseCalification dynamic component.
  late FlutterFlowDynamicModels<CourseCalificationModel>
      courseCalificationModels;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    headerMobilCerrarSesionModel =
        createModel(context, () => HeaderMobilCerrarSesionModel());
    courseCalificationModels =
        FlutterFlowDynamicModels(() => CourseCalificationModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    headerMobilCerrarSesionModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    courseCalificationModels.dispose();
    footerModel.dispose();
  }
}
