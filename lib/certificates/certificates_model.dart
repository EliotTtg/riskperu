import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/header/header_widget.dart';
import '/pages/navbar/navbar_widget.dart';
import 'certificates_widget.dart' show CertificatesWidget;
import 'package:flutter/material.dart';

class CertificatesModel extends FlutterFlowModel<CertificatesWidget> {
  ///  Local state fields for this page.

  List<String> codesCerticates = [];
  void addToCodesCerticates(String item) => codesCerticates.add(item);
  void removeFromCodesCerticates(String item) => codesCerticates.remove(item);
  void removeAtIndexFromCodesCerticates(int index) =>
      codesCerticates.removeAt(index);
  void insertAtIndexInCodesCerticates(int index, String item) =>
      codesCerticates.insert(index, item);
  void updateCodesCerticatesAtIndex(int index, Function(String) updateFn) =>
      codesCerticates[index] = updateFn(codesCerticates[index]);

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for Navbar component.
  late NavbarModel navbarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<CertificatesRecord> simpleSearchResults = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<CertificatesRecord>();
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  CoursesRecord? refCourse;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  UsersRecord? refUser;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    navbarModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    paginatedDataTableController.dispose();
  }
}
