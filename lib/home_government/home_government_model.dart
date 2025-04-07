import '/flutter_flow/flutter_flow_util.dart';
import '/pages/footer/footer_widget.dart';
import '/pages/header_kpacita/header_kpacita_widget.dart';
import '/index.dart';
import 'home_government_widget.dart' show HomeGovernmentWidget;
import 'package:flutter/material.dart';

class HomeGovernmentModel extends FlutterFlowModel<HomeGovernmentWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for HeaderKpacita component.
  late HeaderKpacitaModel headerKpacitaModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    headerKpacitaModel = createModel(context, () => HeaderKpacitaModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    headerKpacitaModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

    footerModel.dispose();
  }
}
