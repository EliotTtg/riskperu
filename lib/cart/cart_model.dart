import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/course_calification/course_calification_widget.dart';
import '/pages/empty_cart/empty_cart_widget.dart';
import '/pages/footer/footer_widget.dart';
import '/pages/header/header_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'cart_widget.dart' show CartWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartModel extends FlutterFlowModel<CartWidget> {
  ///  Local state fields for this page.

  double? totalPrecio;

  String? codigoPasarela;

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for EmptyCart component.
  late EmptyCartModel emptyCartModel;
  // Models for CourseCalification dynamic component.
  late FlutterFlowDynamicModels<CourseCalificationModel>
      courseCalificationModels;
  // Stores action output result for [Backend Call - API (getCambioDevisa)] action in btnPagar widget.
  ApiCallResponse? qDevisa;
  // Stores action output result for [Custom Action - getPaypalAccessToken] action in btnPagar widget.
  String? tokenAccesoPaypal;
  // Stores action output result for [Custom Action - createPaypalOrder] action in btnPagar widget.
  String? idOrden;
  // Stores action output result for [Backend Call - Create Document] action in btnPagar widget.
  PasarelaPagosRecord? pasarelaPago;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    emptyCartModel = createModel(context, () => EmptyCartModel());
    courseCalificationModels =
        FlutterFlowDynamicModels(() => CourseCalificationModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    emptyCartModel.dispose();
    courseCalificationModels.dispose();
    footerModel.dispose();
  }
}
