import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/empty_simulator/empty_simulator_widget.dart';
import '/pages/footer/footer_widget.dart';
import '/pages/header/header_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'simulador_widget.dart' show SimuladorWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class SimuladorModel extends FlutterFlowModel<SimuladorWidget> {
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
  // State field(s) for cboCategory widget.
  String? cboCategoryValue;
  FormFieldController<String>? cboCategoryValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<CoursesRecord> simpleSearchResults = [];
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
    textFieldFocusNode?.dispose();
    textController?.dispose();

    footerModel.dispose();
  }
}
