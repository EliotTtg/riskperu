import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/cbo_estado/cbo_estado_widget.dart';
import '/pages/empty_students/empty_students_widget.dart';
import 'dart:ui';
import 'lista_estudiantes_examen_widget.dart' show ListaEstudiantesExamenWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListaEstudiantesExamenModel
    extends FlutterFlowModel<ListaEstudiantesExamenWidget> {
  ///  Local state fields for this component.

  UsersRecord? refUser;

  ///  State fields for stateful widgets in this component.

  // State field(s) for txttitulo widget.
  FocusNode? txttituloFocusNode;
  TextEditingController? txttituloTextController;
  String? Function(BuildContext, String?)? txttituloTextControllerValidator;
  // State field(s) for txttiempolimite widget.
  FocusNode? txttiempolimiteFocusNode;
  TextEditingController? txttiempolimiteTextController;
  String? Function(BuildContext, String?)?
      txttiempolimiteTextControllerValidator;
  // State field(s) for txtencargado widget.
  FocusNode? txtencargadoFocusNode;
  TextEditingController? txtencargadoTextController;
  String? Function(BuildContext, String?)? txtencargadoTextControllerValidator;
  // State field(s) for cboencargados widget.
  String? cboencargadosValue;
  FormFieldController<String>? cboencargadosValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in cboencargados widget.
  UsersRecord? refEstudiant;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ResultadosRecord? refUserExamen;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ActionsRecord? refAction;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<ResultadosRecord>();
  // Models for cboEstado dynamic component.
  late FlutterFlowDynamicModels<CboEstadoModel> cboEstadoModels;

  @override
  void initState(BuildContext context) {
    cboEstadoModels = FlutterFlowDynamicModels(() => CboEstadoModel());
  }

  @override
  void dispose() {
    txttituloFocusNode?.dispose();
    txttituloTextController?.dispose();

    txttiempolimiteFocusNode?.dispose();
    txttiempolimiteTextController?.dispose();

    txtencargadoFocusNode?.dispose();
    txtencargadoTextController?.dispose();

    paginatedDataTableController.dispose();
    cboEstadoModels.dispose();
  }
}
