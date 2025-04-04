import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/empty_test/empty_test_widget.dart';
import '/pages/header/header_widget.dart';
import '/pages/navbar/navbar_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'lista_simuladores_widget.dart' show ListaSimuladoresWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListaSimuladoresModel extends FlutterFlowModel<ListaSimuladoresWidget> {
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

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for Navbar component.
  late NavbarModel navbarModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ExamGroupsRecord? refGroup;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ExamenesRecord? refExamen;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    navbarModel.dispose();
  }
}
