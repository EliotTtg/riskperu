import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/empty_description/empty_description_widget.dart';
import 'dart:ui';
import 'create_update_plans_widget.dart' show CreateUpdatePlansWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateUpdatePlansModel extends FlutterFlowModel<CreateUpdatePlansWidget> {
  ///  Local state fields for this component.

  List<String> listDescription = [];
  void addToListDescription(String item) => listDescription.add(item);
  void removeFromListDescription(String item) => listDescription.remove(item);
  void removeAtIndexFromListDescription(int index) =>
      listDescription.removeAt(index);
  void insertAtIndexInListDescription(int index, String item) =>
      listDescription.insert(index, item);
  void updateListDescriptionAtIndex(int index, Function(String) updateFn) =>
      listDescription[index] = updateFn(listDescription[index]);

  String? imagen;

  Color? color;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtnombre widget.
  FocusNode? txtnombreFocusNode;
  TextEditingController? txtnombreTextController;
  String? Function(BuildContext, String?)? txtnombreTextControllerValidator;
  String? _txtnombreTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto';
    }

    return null;
  }

  // State field(s) for txtprice widget.
  FocusNode? txtpriceFocusNode;
  TextEditingController? txtpriceTextController;
  String? Function(BuildContext, String?)? txtpriceTextControllerValidator;
  String? _txtpriceTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto';
    }

    return null;
  }

  Color? colorPicked;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for txtdescripcion widget.
  FocusNode? txtdescripcionFocusNode;
  TextEditingController? txtdescripcionTextController;
  String? Function(BuildContext, String?)?
      txtdescripcionTextControllerValidator;

  @override
  void initState(BuildContext context) {
    txtnombreTextControllerValidator = _txtnombreTextControllerValidator;
    txtpriceTextControllerValidator = _txtpriceTextControllerValidator;
  }

  @override
  void dispose() {
    txtnombreFocusNode?.dispose();
    txtnombreTextController?.dispose();

    txtpriceFocusNode?.dispose();
    txtpriceTextController?.dispose();

    txtdescripcionFocusNode?.dispose();
    txtdescripcionTextController?.dispose();
  }
}
