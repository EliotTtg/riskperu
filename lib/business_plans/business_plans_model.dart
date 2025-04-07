import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/footer/footer_widget.dart';
import '/pages/header/header_widget.dart';
import 'business_plans_widget.dart' show BusinessPlansWidget;
import 'package:flutter/material.dart';

class BusinessPlansModel extends FlutterFlowModel<BusinessPlansWidget> {
  ///  Local state fields for this page.

  String? codigoPasarela;

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Stores action output result for [Backend Call - API (getCambioDevisa)] action in Button widget.
  ApiCallResponse? qDevisa;
  // Stores action output result for [Custom Action - getPaypalAccessToken] action in Button widget.
  String? tokenAccesoPaypal;
  // Stores action output result for [Custom Action - createPaypalOrder] action in Button widget.
  String? id;
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
