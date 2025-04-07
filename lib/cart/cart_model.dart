import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/course_calification/course_calification_widget.dart';
import '/pages/empty_cart/empty_cart_widget.dart';
import '/pages/footer/footer_widget.dart';
import '/pages/header/header_widget.dart';
import '/index.dart';
import 'cart_widget.dart' show CartWidget;
import 'package:flutter/material.dart';

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
