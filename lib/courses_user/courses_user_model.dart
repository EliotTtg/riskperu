import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/anuncio_simulator/anuncio_simulator_widget.dart';
import '/pages/empty_course/empty_course_widget.dart';
import '/pages/header/header_widget.dart';
import '/pages/navbar/navbar_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'courses_user_widget.dart' show CoursesUserWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CoursesUserModel extends FlutterFlowModel<CoursesUserWidget> {
  ///  Local state fields for this page.

  String? photo;

  UsersCoursesRecord? userCourse;

  List<String> planGratis = ['9T75Yb8XEX6YMb8KupV6'];
  void addToPlanGratis(String item) => planGratis.add(item);
  void removeFromPlanGratis(String item) => planGratis.remove(item);
  void removeAtIndexFromPlanGratis(int index) => planGratis.removeAt(index);
  void insertAtIndexInPlanGratis(int index, String item) =>
      planGratis.insert(index, item);
  void updatePlanGratisAtIndex(int index, Function(String) updateFn) =>
      planGratis[index] = updateFn(planGratis[index]);

  List<String> planBasico = ['9T75Yb8XEX6YMb8KupV6', 'kBFHn5gMQdw1ZV1rIki1'];
  void addToPlanBasico(String item) => planBasico.add(item);
  void removeFromPlanBasico(String item) => planBasico.remove(item);
  void removeAtIndexFromPlanBasico(int index) => planBasico.removeAt(index);
  void insertAtIndexInPlanBasico(int index, String item) =>
      planBasico.insert(index, item);
  void updatePlanBasicoAtIndex(int index, Function(String) updateFn) =>
      planBasico[index] = updateFn(planBasico[index]);

  List<String> planPremium = [
    '9T75Yb8XEX6YMb8KupV6',
    'kBFHn5gMQdw1ZV1rIki1',
    'EtcLc7zprUY1GeqPEB2H'
  ];
  void addToPlanPremium(String item) => planPremium.add(item);
  void removeFromPlanPremium(String item) => planPremium.remove(item);
  void removeAtIndexFromPlanPremium(int index) => planPremium.removeAt(index);
  void insertAtIndexInPlanPremium(int index, String item) =>
      planPremium.insert(index, item);
  void updatePlanPremiumAtIndex(int index, Function(String) updateFn) =>
      planPremium[index] = updateFn(planPremium[index]);

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for Navbar component.
  late NavbarModel navbarModel;
  // Model for AnuncioSimulator component.
  late AnuncioSimulatorModel anuncioSimulatorModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  SessionRecord? refSessionStudent;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ModuleRecord? refModulesCourse;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ModuleClassRecord? refClassCourse;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  UsersRecord? refUserCourse;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  UsersCoursesRecord? refCourseExistCourse;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  UsersCoursesRecord? refUserCourseCreateCourse;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    navbarModel = createModel(context, () => NavbarModel());
    anuncioSimulatorModel = createModel(context, () => AnuncioSimulatorModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    navbarModel.dispose();
    anuncioSimulatorModel.dispose();
  }
}
