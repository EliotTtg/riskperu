import '/flutter_flow/flutter_flow_util.dart';
import '/pages/footer/footer_widget.dart';
import '/pages/header/header_widget.dart';
import '/pages/header_mobil/header_mobil_widget.dart';
import 'blogs_widget.dart' show BlogsWidget;
import 'package:flutter/material.dart';

class BlogsModel extends FlutterFlowModel<BlogsWidget> {
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
  // Model for HeaderMobil component.
  late HeaderMobilModel headerMobilModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    headerMobilModel = createModel(context, () => HeaderMobilModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    headerMobilModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    footerModel.dispose();
  }
}
