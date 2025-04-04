import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/footer/footer_widget.dart';
import '/pages/header/header_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'simulator_widget.dart' show SimulatorWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SimulatorModel extends FlutterFlowModel<SimulatorWidget> {
  ///  Local state fields for this page.

  bool stateDescription = false;

  String? uidSession;

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ExamGroupsRecord? refGroup;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ExamenesRecord? refExamen;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RegisterSimulatorRecord? refHistory;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    footerModel.dispose();
  }
}
