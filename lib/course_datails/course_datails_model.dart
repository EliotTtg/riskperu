import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/crear_nota_curso/crear_nota_curso_widget.dart';
import '/pages/crear_tipo_comentario/crear_tipo_comentario_widget.dart';
import '/pages/empty_announcements/empty_announcements_widget.dart';
import '/pages/empty_coment/empty_coment_widget.dart';
import '/pages/header_course/header_course_widget.dart';
import '/pages/navbar/navbar_widget.dart';
import '/pages/popup_add_coments/popup_add_coments_widget.dart';
import '/pages/txt_comentario_publicacion_curso/txt_comentario_publicacion_curso_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'course_datails_widget.dart' show CourseDatailsWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class CourseDatailsModel extends FlutterFlowModel<CourseDatailsWidget> {
  ///  Local state fields for this page.

  ModuleClassRecord? refCourseClass;

  int state = 1;

  List<String> listViewModule = [];
  void addToListViewModule(String item) => listViewModule.add(item);
  void removeFromListViewModule(String item) => listViewModule.remove(item);
  void removeAtIndexFromListViewModule(int index) =>
      listViewModule.removeAt(index);
  void insertAtIndexInListViewModule(int index, String item) =>
      listViewModule.insert(index, item);
  void updateListViewModuleAtIndex(int index, Function(String) updateFn) =>
      listViewModule[index] = updateFn(listViewModule[index]);

  bool stateDescripcion = false;

  ResultadosRecord? refResultadoLocal;

  bool stateQuestion = false;

  List<String> listComentView = [];
  void addToListComentView(String item) => listComentView.add(item);
  void removeFromListComentView(String item) => listComentView.remove(item);
  void removeAtIndexFromListComentView(int index) =>
      listComentView.removeAt(index);
  void insertAtIndexInListComentView(int index, String item) =>
      listComentView.insert(index, item);
  void updateListComentViewAtIndex(int index, Function(String) updateFn) =>
      listComentView[index] = updateFn(listComentView[index]);

  String? uidCourse;

  double? totalActividades;

  List<String> listAnuncio = [];
  void addToListAnuncio(String item) => listAnuncio.add(item);
  void removeFromListAnuncio(String item) => listAnuncio.remove(item);
  void removeAtIndexFromListAnuncio(int index) => listAnuncio.removeAt(index);
  void insertAtIndexInListAnuncio(int index, String item) =>
      listAnuncio.insert(index, item);
  void updateListAnuncioAtIndex(int index, Function(String) updateFn) =>
      listAnuncio[index] = updateFn(listAnuncio[index]);

  int? indiceRecourse = 0;

  List<String> listViewSession = [];
  void addToListViewSession(String item) => listViewSession.add(item);
  void removeFromListViewSession(String item) => listViewSession.remove(item);
  void removeAtIndexFromListViewSession(int index) =>
      listViewSession.removeAt(index);
  void insertAtIndexInListViewSession(int index, String item) =>
      listViewSession.insert(index, item);
  void updateListViewSessionAtIndex(int index, Function(String) updateFn) =>
      listViewSession[index] = updateFn(listViewSession[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in CourseDatails widget.
  UsersCoursesRecord? refUserCourse;
  // Stores action output result for [Custom Action - totalActividadesCourse] action in CourseDatails widget.
  double? totalActivities;
  // Model for HeaderCourse component.
  late HeaderCourseModel headerCourseModel;
  // Model for Navbar component.
  late NavbarModel navbarModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // Models for PopupAddComents dynamic component.
  late FlutterFlowDynamicModels<PopupAddComentsModel> popupAddComentsModels1;
  // Models for PopupAddComents dynamic component.
  late FlutterFlowDynamicModels<PopupAddComentsModel> popupAddComentsModels2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for cboCourse widget.
  String? cboCourseValue;
  FormFieldController<String>? cboCourseValueController;
  // State field(s) for DropDown widget.
  String? dropDownValue4;
  FormFieldController<String>? dropDownValueController4;
  // Models for txtComentarioPublicacionCurso dynamic component.
  late FlutterFlowDynamicModels<TxtComentarioPublicacionCursoModel>
      txtComentarioPublicacionCursoModels;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue5;
  FormFieldController<String>? dropDownValueController5;
  // State field(s) for Checkbox widget.
  Map<ModuleClassRecord, bool> checkboxValueMap = {};
  List<ModuleClassRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // Stores action output result for [Backend Call - Create Document] action in Checkbox widget.
  UsersModuleclassRecord? refstatemoduleclasss;
  // Stores action output result for [Backend Call - Create Document] action in Checkbox widget.
  UsersModuleclassRecord? refstatemoduleclasssOff;

  @override
  void initState(BuildContext context) {
    headerCourseModel = createModel(context, () => HeaderCourseModel());
    navbarModel = createModel(context, () => NavbarModel());
    popupAddComentsModels1 =
        FlutterFlowDynamicModels(() => PopupAddComentsModel());
    popupAddComentsModels2 =
        FlutterFlowDynamicModels(() => PopupAddComentsModel());
    txtComentarioPublicacionCursoModels =
        FlutterFlowDynamicModels(() => TxtComentarioPublicacionCursoModel());
  }

  @override
  void dispose() {
    headerCourseModel.dispose();
    navbarModel.dispose();
    tabBarController?.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    popupAddComentsModels1.dispose();
    popupAddComentsModels2.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    txtComentarioPublicacionCursoModels.dispose();
    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }
}
