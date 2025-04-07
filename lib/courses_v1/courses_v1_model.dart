import '/flutter_flow/flutter_flow_util.dart';
import '/pages/footer/footer_widget.dart';
import '/pages/header/header_widget.dart';
import 'courses_v1_widget.dart' show CoursesV1Widget;
import 'package:flutter/material.dart';

class CoursesV1Model extends FlutterFlowModel<CoursesV1Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
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
    footerModel.dispose();
  }
}
