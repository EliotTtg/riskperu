import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/header/header_widget.dart';
import '/pages/navbar/navbar_widget.dart';
import '/index.dart';
import 'dashboard_admin_widget.dart' show DashboardAdminWidget;
import 'package:flutter/material.dart';

class DashboardAdminModel extends FlutterFlowModel<DashboardAdminWidget> {
  ///  Local state fields for this page.

  List<UsersNumberStruct> data1 = [];
  void addToData1(UsersNumberStruct item) => data1.add(item);
  void removeFromData1(UsersNumberStruct item) => data1.remove(item);
  void removeAtIndexFromData1(int index) => data1.removeAt(index);
  void insertAtIndexInData1(int index, UsersNumberStruct item) =>
      data1.insert(index, item);
  void updateData1AtIndex(int index, Function(UsersNumberStruct) updateFn) =>
      data1[index] = updateFn(data1[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - obtenerDataAdmin] action in DashboardAdmin widget.
  List<UsersNumberStruct>? dataAdmin;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for Navbar component.
  late NavbarModel navbarModel;

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
