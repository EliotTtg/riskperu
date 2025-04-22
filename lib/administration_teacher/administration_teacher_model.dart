import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/header/header_widget.dart';
import '/pages/navbar/navbar_widget.dart';
import '/index.dart';
import 'administration_teacher_widget.dart' show AdministrationTeacherWidget;
import 'package:flutter/material.dart';

class AdministrationTeacherModel
    extends FlutterFlowModel<AdministrationTeacherWidget> {
  ///  Local state fields for this page.

  String? refCourse;

  String? refCategory;

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for Navbar component.
  late NavbarModel navbarModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for txtbuscarExamen widget.
  FocusNode? txtbuscarExamenFocusNode1;
  TextEditingController? txtbuscarExamenTextController1;
  String? Function(BuildContext, String?)?
      txtbuscarExamenTextController1Validator;
  List<ExamenesRecord> simpleSearchResults1 = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController1 =
      FlutterFlowDataTableController<ExamenesRecord>();
  // State field(s) for txtbuscarExamen widget.
  FocusNode? txtbuscarExamenFocusNode2;
  TextEditingController? txtbuscarExamenTextController2;
  String? Function(BuildContext, String?)?
      txtbuscarExamenTextController2Validator;
  List<ExamGroupsRecord> simpleSearchResults2 = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController2 =
      FlutterFlowDataTableController<ExamGroupsRecord>();
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<ExamGroupsRecord>? refCategoryExamens;
  // State field(s) for txtbuscarCurso widget.
  FocusNode? txtbuscarCursoFocusNode;
  TextEditingController? txtbuscarCursoTextController;
  String? Function(BuildContext, String?)?
      txtbuscarCursoTextControllerValidator;
  List<CoursesRecord> simpleSearchResults3 = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController3 =
      FlutterFlowDataTableController<CoursesRecord>();
  // State field(s) for txtbuscarEstudiante widget.
  FocusNode? txtbuscarEstudianteFocusNode;
  TextEditingController? txtbuscarEstudianteTextController;
  String? Function(BuildContext, String?)?
      txtbuscarEstudianteTextControllerValidator;
  List<UsersRecord> simpleSearchResults4 = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController4 =
      FlutterFlowDataTableController<UsersRecord>();

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    navbarModel.dispose();
    tabBarController?.dispose();
    txtbuscarExamenFocusNode1?.dispose();
    txtbuscarExamenTextController1?.dispose();

    paginatedDataTableController1.dispose();
    txtbuscarExamenFocusNode2?.dispose();
    txtbuscarExamenTextController2?.dispose();

    paginatedDataTableController2.dispose();
    txtbuscarCursoFocusNode?.dispose();
    txtbuscarCursoTextController?.dispose();

    paginatedDataTableController3.dispose();
    txtbuscarEstudianteFocusNode?.dispose();
    txtbuscarEstudianteTextController?.dispose();

    paginatedDataTableController4.dispose();
  }
}
