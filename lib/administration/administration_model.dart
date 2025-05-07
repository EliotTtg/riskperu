import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/header/header_widget.dart';
import '/pages/navbar/navbar_widget.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'administration_widget.dart' show AdministrationWidget;
import 'package:flutter/material.dart';

class AdministrationModel extends FlutterFlowModel<AdministrationWidget> {
  ///  Local state fields for this page.

  String? refCourse;

  String? refCourseSimulator;

  String? refCategoryExamen;

  String? refCategoryExamenSimulator;

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

  // State field(s) for txtbuscarUsuario widget.
  FocusNode? txtbuscarUsuarioFocusNode;
  TextEditingController? txtbuscarUsuarioTextController;
  String? Function(BuildContext, String?)?
      txtbuscarUsuarioTextControllerValidator;
  List<UsersRecord> simpleSearchResults1 = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController1 =
      FlutterFlowDataTableController<UsersRecord>();
  // State field(s) for txtbuscarExamen widget.
  FocusNode? txtbuscarExamenFocusNode1;
  TextEditingController? txtbuscarExamenTextController1;
  String? Function(BuildContext, String?)?
      txtbuscarExamenTextController1Validator;
  List<ExamenesRecord> simpleSearchResults2 = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController2 =
      FlutterFlowDataTableController<ExamenesRecord>();
  // State field(s) for txtbuscarExamen widget.
  FocusNode? txtbuscarExamenFocusNode2;
  TextEditingController? txtbuscarExamenTextController2;
  String? Function(BuildContext, String?)?
      txtbuscarExamenTextController2Validator;
  List<ExamGroupsRecord> simpleSearchResults3 = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController3 =
      FlutterFlowDataTableController<ExamGroupsRecord>();
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<ExamGroupsRecord>? refCategoryExamens;
  // State field(s) for txtbuscarCurso widget.
  FocusNode? txtbuscarCursoFocusNode1;
  TextEditingController? txtbuscarCursoTextController1;
  String? Function(BuildContext, String?)?
      txtbuscarCursoTextController1Validator;
  List<CoursesRecord> simpleSearchResults4 = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController4 =
      FlutterFlowDataTableController<CoursesRecord>();
  // State field(s) for txtbuscarEstudiante widget.
  FocusNode? txtbuscarEstudianteFocusNode;
  TextEditingController? txtbuscarEstudianteTextController;
  String? Function(BuildContext, String?)?
      txtbuscarEstudianteTextControllerValidator;
  List<UsersRecord> simpleSearchResults5 = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController5 =
      FlutterFlowDataTableController<UsersRecord>();
  // State field(s) for txtbuscarCategoria widget.
  FocusNode? txtbuscarCategoriaFocusNode;
  TextEditingController? txtbuscarCategoriaTextController;
  String? Function(BuildContext, String?)?
      txtbuscarCategoriaTextControllerValidator;
  List<CategoryCoursesRecord> simpleSearchResults6 = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController6 =
      FlutterFlowDataTableController<CategoryCoursesRecord>();
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<CoursesRecord>? refCoursesCategory;
  // State field(s) for txtbuscarExamen widget.
  FocusNode? txtbuscarExamenFocusNode3;
  TextEditingController? txtbuscarExamenTextController3;
  String? Function(BuildContext, String?)?
      txtbuscarExamenTextController3Validator;
  List<ExamenesRecord> simpleSearchResults7 = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController7 =
      FlutterFlowDataTableController<ExamenesRecord>();
  // State field(s) for txtbuscarExamen widget.
  FocusNode? txtbuscarExamenFocusNode4;
  TextEditingController? txtbuscarExamenTextController4;
  String? Function(BuildContext, String?)?
      txtbuscarExamenTextController4Validator;
  List<ExamGroupsRecord> simpleSearchResults8 = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController8 =
      FlutterFlowDataTableController<ExamGroupsRecord>();
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<ExamGroupsRecord>? refCategorySimulator;
  // State field(s) for txtbuscarCurso widget.
  FocusNode? txtbuscarCursoFocusNode2;
  TextEditingController? txtbuscarCursoTextController2;
  String? Function(BuildContext, String?)?
      txtbuscarCursoTextController2Validator;
  List<CoursesRecord> simpleSearchResults9 = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController9 =
      FlutterFlowDataTableController<CoursesRecord>();
  // State field(s) for txtbuscarBlogs widget.
  FocusNode? txtbuscarBlogsFocusNode;
  TextEditingController? txtbuscarBlogsTextController;
  String? Function(BuildContext, String?)?
      txtbuscarBlogsTextControllerValidator;
  List<BlogsRecord> simpleSearchResults10 = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController10 =
      FlutterFlowDataTableController<BlogsRecord>();

  /// Query cache managers for this widget.

  final _usuariosManager = StreamRequestManager<List<UsersRecord>>();
  Stream<List<UsersRecord>> usuarios({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<UsersRecord>> Function() requestFn,
  }) =>
      _usuariosManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUsuariosCache() => _usuariosManager.clear();
  void clearUsuariosCacheKey(String? uniqueKey) =>
      _usuariosManager.clearRequest(uniqueKey);

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
    txtbuscarUsuarioFocusNode?.dispose();
    txtbuscarUsuarioTextController?.dispose();

    paginatedDataTableController1.dispose();
    txtbuscarExamenFocusNode1?.dispose();
    txtbuscarExamenTextController1?.dispose();

    paginatedDataTableController2.dispose();
    txtbuscarExamenFocusNode2?.dispose();
    txtbuscarExamenTextController2?.dispose();

    paginatedDataTableController3.dispose();
    txtbuscarCursoFocusNode1?.dispose();
    txtbuscarCursoTextController1?.dispose();

    paginatedDataTableController4.dispose();
    txtbuscarEstudianteFocusNode?.dispose();
    txtbuscarEstudianteTextController?.dispose();

    paginatedDataTableController5.dispose();
    txtbuscarCategoriaFocusNode?.dispose();
    txtbuscarCategoriaTextController?.dispose();

    paginatedDataTableController6.dispose();
    txtbuscarExamenFocusNode3?.dispose();
    txtbuscarExamenTextController3?.dispose();

    paginatedDataTableController7.dispose();
    txtbuscarExamenFocusNode4?.dispose();
    txtbuscarExamenTextController4?.dispose();

    paginatedDataTableController8.dispose();
    txtbuscarCursoFocusNode2?.dispose();
    txtbuscarCursoTextController2?.dispose();

    paginatedDataTableController9.dispose();
    txtbuscarBlogsFocusNode?.dispose();
    txtbuscarBlogsTextController?.dispose();

    paginatedDataTableController10.dispose();

    /// Dispose query cache managers for this widget.

    clearUsuariosCache();
  }
}
