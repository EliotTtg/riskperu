import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'loading_widget.dart' show LoadingWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoadingModel extends FlutterFlowModel<LoadingWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - obtenerLinkPaypalRegreso] action in Loading widget.
  String? returnURLcodigo;
  // Stores action output result for [Firestore Query - Query a collection] action in Loading widget.
  PasarelaPagosRecord? qPasarela;
  // Stores action output result for [Custom Action - approveOrderPaypal] action in Loading widget.
  String? returnOrder;
  // Stores action output result for [Firestore Query - Query a collection] action in Loading widget.
  PasarelaPagosRecord? refuserplan;
  // Stores action output result for [Firestore Query - Query a collection] action in Loading widget.
  UsersPlansRecord? userPlan;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
