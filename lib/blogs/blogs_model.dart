import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/footer/footer_widget.dart';
import '/pages/header/header_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'blogs_widget.dart' show BlogsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BlogsModel extends FlutterFlowModel<BlogsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
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
