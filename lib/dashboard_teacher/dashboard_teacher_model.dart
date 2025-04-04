import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/empty_course/empty_course_widget.dart';
import '/pages/empty_dashboard/empty_dashboard_widget.dart';
import '/pages/empty_modules/empty_modules_widget.dart';
import '/pages/header/header_widget.dart';
import '/pages/navbar/navbar_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'dashboard_teacher_widget.dart' show DashboardTeacherWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardTeacherModel extends FlutterFlowModel<DashboardTeacherWidget> {
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

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - obtenerDataPorDiaStudients] action in DashboardTeacher widget.
  List<UsersNumberStruct>? userall;
  // Stores action output result for [Custom Action - obtenerDataPorDiaStudients] action in DashboardTeacher widget.
  List<UsersNumberStruct>? userdemo;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for Navbar component.
  late NavbarModel navbarModel;
  // Model for EmptyCourse component.
  late EmptyCourseModel emptyCourseModel;
  // State field(s) for Checkbox widget.
  Map<ModuleClassRecord, bool> checkboxValueMap = {};
  List<ModuleClassRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // Model for EmptyModules component.
  late EmptyModulesModel emptyModulesModel;
  // Model for EmptyDashboard component.
  late EmptyDashboardModel emptyDashboardModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    navbarModel = createModel(context, () => NavbarModel());
    emptyCourseModel = createModel(context, () => EmptyCourseModel());
    emptyModulesModel = createModel(context, () => EmptyModulesModel());
    emptyDashboardModel = createModel(context, () => EmptyDashboardModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    navbarModel.dispose();
    emptyCourseModel.dispose();
    emptyModulesModel.dispose();
    emptyDashboardModel.dispose();
  }
}
