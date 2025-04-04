import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/create_update_module/create_update_module_widget.dart';
import '/pages/eliminar_modulo/eliminar_modulo_widget.dart';
import '/pages/empty_modules/empty_modules_widget.dart';
import '/pages/lista_actividades/lista_actividades_widget.dart';
import '/pages/lista_sessions/lista_sessions_widget.dart';
import 'dart:ui';
import 'lista_modules_widget.dart' show ListaModulesWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListaModulesModel extends FlutterFlowModel<ListaModulesWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<ModuleRecord>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paginatedDataTableController.dispose();
  }
}
