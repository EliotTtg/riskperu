import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'loading_cart_widget.dart' show LoadingCartWidget;
import 'package:flutter/material.dart';

class LoadingCartModel extends FlutterFlowModel<LoadingCartWidget> {
  ///  Local state fields for this page.

  List<String> listCourses = [];
  void addToListCourses(String item) => listCourses.add(item);
  void removeFromListCourses(String item) => listCourses.remove(item);
  void removeAtIndexFromListCourses(int index) => listCourses.removeAt(index);
  void insertAtIndexInListCourses(int index, String item) =>
      listCourses.insert(index, item);
  void updateListCoursesAtIndex(int index, Function(String) updateFn) =>
      listCourses[index] = updateFn(listCourses[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - obtenerLinkPaypalRegreso] action in LoadingCart widget.
  String? returnURLcodigo;
  // Stores action output result for [Firestore Query - Query a collection] action in LoadingCart widget.
  PasarelaPagosRecord? qPasarela;
  // Stores action output result for [Custom Action - approveOrderPaypal] action in LoadingCart widget.
  String? returnOrder;
  // Stores action output result for [Backend Call - Create Document] action in LoadingCart widget.
  UsersCoursesRecord? refCourseUser;
  // Stores action output result for [Firestore Query - Query a collection] action in LoadingCart widget.
  PasarelaPagosRecord? refuserplan;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
