import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/empty_certificates/empty_certificates_widget.dart';
import '/pages/footer/footer_widget.dart';
import '/pages/header/header_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'course_test_widget.dart' show CourseTestWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<ExamenesRecord>();
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CertificatesRecord? certificate;
  // Stores action output result for [Custom Action - downloadAndSaveCertificatePDF] action in Button widget.
  String? urlCertificate;
  // Stores action output result for [Custom Action - codeCertificate] action in Button widget.
  String? codeCertificate;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CertificatesRecord? refCertificate;
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
    paginatedDataTableController.dispose();
    footerModel.dispose();
  }
}
