import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_update_blogs_widget.dart' show CreateUpdateBlogsWidget;
import 'package:flutter/material.dart';

class CreateUpdateBlogsModel extends FlutterFlowModel<CreateUpdateBlogsWidget> {
  ///  Local state fields for this component.

  String typeurl = 'image';

  String? image;

  DateTime? datepublic;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for txturlvideo widget.
  FocusNode? txturlvideoFocusNode;
  TextEditingController? txturlvideoTextController;
  String? Function(BuildContext, String?)? txturlvideoTextControllerValidator;
  // State field(s) for txtnombrecurso widget.
  FocusNode? txtnombrecursoFocusNode;
  TextEditingController? txtnombrecursoTextController;
  String? Function(BuildContext, String?)?
      txtnombrecursoTextControllerValidator;
  String? _txtnombrecursoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto';
    }

    return null;
  }

  // State field(s) for txtintroduccion widget.
  FocusNode? txtintroduccionFocusNode;
  TextEditingController? txtintroduccionTextController;
  String? Function(BuildContext, String?)?
      txtintroduccionTextControllerValidator;
  String? _txtintroduccionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto';
    }

    return null;
  }

  // State field(s) for cbocategoria widget.
  String? cbocategoriaValue;
  FormFieldController<String>? cbocategoriaValueController;
  // State field(s) for cbostate widget.
  bool? cbostateValue;
  FormFieldController<bool>? cbostateValueController;
  // State field(s) for txtlinkvisit widget.
  FocusNode? txtlinkvisitFocusNode;
  TextEditingController? txtlinkvisitTextController;
  String? Function(BuildContext, String?)? txtlinkvisitTextControllerValidator;
  String? _txtlinkvisitTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto';
    }

    if (!RegExp(kTextValidatorWebsiteRegex).hasMatch(val)) {
      return 'Campo obligatorio debe ser un enlace';
    }
    return null;
  }

  DateTime? datePicked;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  BlogsRecord? refblogimagecreate;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  BlogsRecord? refblogvideocreate;

  @override
  void initState(BuildContext context) {
    txtnombrecursoTextControllerValidator =
        _txtnombrecursoTextControllerValidator;
    txtintroduccionTextControllerValidator =
        _txtintroduccionTextControllerValidator;
    txtlinkvisitTextControllerValidator = _txtlinkvisitTextControllerValidator;
  }

  @override
  void dispose() {
    txturlvideoFocusNode?.dispose();
    txturlvideoTextController?.dispose();

    txtnombrecursoFocusNode?.dispose();
    txtnombrecursoTextController?.dispose();

    txtintroduccionFocusNode?.dispose();
    txtintroduccionTextController?.dispose();

    txtlinkvisitFocusNode?.dispose();
    txtlinkvisitTextController?.dispose();
  }
}
