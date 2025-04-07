import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/footer/footer_widget.dart';
import '/pages/header/header_widget.dart';
import '/pages/navbar/navbar_widget.dart';
import 'notes_widget.dart' show NotesWidget;
import 'package:flutter/material.dart';

class NotesModel extends FlutterFlowModel<NotesWidget> {
  ///  Local state fields for this page.

  DateTime? date1;

  DateTime? date2;

  DateTime? searchdate1;

  DateTime? searchdate2;

  String? refExamen;

  bool? estado;

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for Navbar component.
  late NavbarModel navbarModel;
  // State field(s) for cboExamenes widget.
  String? cboExamenesValue;
  FormFieldController<String>? cboExamenesValueController;
  // State field(s) for cboResultado widget.
  bool? cboResultadoValue;
  FormFieldController<bool>? cboResultadoValueController;
  DateTime? datePicked1;
  // State field(s) for cbodate1 widget.
  String? cbodate1Value;
  FormFieldController<String>? cbodate1ValueController;
  DateTime? datePicked2;
  // State field(s) for cbodate2 widget.
  String? cbodate2Value;
  FormFieldController<String>? cbodate2ValueController;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<ResultadosRecord>();
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    navbarModel = createModel(context, () => NavbarModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    navbarModel.dispose();
    paginatedDataTableController.dispose();
    footerModel.dispose();
  }
}
