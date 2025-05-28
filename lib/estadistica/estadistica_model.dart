import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/empty_actividades/empty_actividades_widget.dart';
import '/pages/empty_course/empty_course_widget.dart';
import '/pages/empty_dashboard/empty_dashboard_widget.dart';
import '/pages/empty_test/empty_test_widget.dart';
import '/pages/footer/footer_widget.dart';
import '/pages/header/header_widget.dart';
import '/pages/header_mobil_cerrar_sesion/header_mobil_cerrar_sesion_widget.dart';
import '/index.dart';
import 'estadistica_widget.dart' show EstadisticaWidget;
import 'package:flutter/material.dart';

class EstadisticaModel extends FlutterFlowModel<EstadisticaWidget> {
  ///  Local state fields for this page.

  List<UsersNumberStruct> data1 = [];
  void addToData1(UsersNumberStruct item) => data1.add(item);
  void removeFromData1(UsersNumberStruct item) => data1.remove(item);
  void removeAtIndexFromData1(int index) => data1.removeAt(index);
  void insertAtIndexInData1(int index, UsersNumberStruct item) =>
      data1.insert(index, item);
  void updateData1AtIndex(int index, Function(UsersNumberStruct) updateFn) =>
      data1[index] = updateFn(data1[index]);

  List<UsersNumberStruct> data2 = [];
  void addToData2(UsersNumberStruct item) => data2.add(item);
  void removeFromData2(UsersNumberStruct item) => data2.remove(item);
  void removeAtIndexFromData2(int index) => data2.removeAt(index);
  void insertAtIndexInData2(int index, UsersNumberStruct item) =>
      data2.insert(index, item);
  void updateData2AtIndex(int index, Function(UsersNumberStruct) updateFn) =>
      data2[index] = updateFn(data2[index]);

  List<UsersNumberStruct> countGeneral = [];
  void addToCountGeneral(UsersNumberStruct item) => countGeneral.add(item);
  void removeFromCountGeneral(UsersNumberStruct item) =>
      countGeneral.remove(item);
  void removeAtIndexFromCountGeneral(int index) => countGeneral.removeAt(index);
  void insertAtIndexInCountGeneral(int index, UsersNumberStruct item) =>
      countGeneral.insert(index, item);
  void updateCountGeneralAtIndex(
          int index, Function(UsersNumberStruct) updateFn) =>
      countGeneral[index] = updateFn(countGeneral[index]);

  int? indiceRecource = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - obtenerDataPorSemanaYCategoria] action in Estadistica widget.
  List<UsersNumberStruct>? userCorrectas;
  // Stores action output result for [Custom Action - obtenerDataPorSemanaYCategoria] action in Estadistica widget.
  List<UsersNumberStruct>? userIncorrectas;
  // Stores action output result for [Custom Action - obtenerDataGeneral] action in Estadistica widget.
  List<UsersNumberStruct>? dataGeneral;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for HeaderMobilCerrarSesion component.
  late HeaderMobilCerrarSesionModel headerMobilCerrarSesionModel;
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
  // Model for EmptyCourse component.
  late EmptyCourseModel emptyCourseModel1;
  // Model for EmptyTest component.
  late EmptyTestModel emptyTestModel1;
  // Model for EmptyActividades component.
  late EmptyActividadesModel emptyActividadesModel1;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  UsersCoursesRecord? refCourseUserMobil;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  SessionRecord? refSessionStudentMobil;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ModuleRecord? refModulesCourseMobil;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ModuleClassRecord? refClassCourseMobil;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  UsersRecord? refUserMobil;
  // Model for EmptyCourse component.
  late EmptyCourseModel emptyCourseModel2;
  // Model for EmptyTest component.
  late EmptyTestModel emptyTestModel2;
  // Model for EmptyActividades component.
  late EmptyActividadesModel emptyActividadesModel2;
  // Model for EmptyDashboard component.
  late EmptyDashboardModel emptyDashboardModel;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    headerMobilCerrarSesionModel =
        createModel(context, () => HeaderMobilCerrarSesionModel());
    emptyCourseModel1 = createModel(context, () => EmptyCourseModel());
    emptyTestModel1 = createModel(context, () => EmptyTestModel());
    emptyActividadesModel1 =
        createModel(context, () => EmptyActividadesModel());
    emptyCourseModel2 = createModel(context, () => EmptyCourseModel());
    emptyTestModel2 = createModel(context, () => EmptyTestModel());
    emptyActividadesModel2 =
        createModel(context, () => EmptyActividadesModel());
    emptyDashboardModel = createModel(context, () => EmptyDashboardModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    headerMobilCerrarSesionModel.dispose();
    emptyCourseModel1.dispose();
    emptyTestModel1.dispose();
    emptyActividadesModel1.dispose();
    emptyCourseModel2.dispose();
    emptyTestModel2.dispose();
    emptyActividadesModel2.dispose();
    emptyDashboardModel.dispose();
    footerModel.dispose();
  }
}
