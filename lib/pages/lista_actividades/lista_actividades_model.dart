import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/create_update_actividad/create_update_actividad_widget.dart';
import '/pages/eliminar_actividad/eliminar_actividad_widget.dart';
import '/pages/empty_actividades/empty_actividades_widget.dart';
import '/pages/lista_modules/lista_modules_widget.dart';
import 'dart:ui';
import 'lista_actividades_widget.dart' show ListaActividadesWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListaActividadesModel extends FlutterFlowModel<ListaActividadesWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<ModuleClassRecord>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paginatedDataTableController.dispose();
  }
}
