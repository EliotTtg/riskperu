import '/flutter_flow/flutter_flow_util.dart';
import '/pages/header/header_widget.dart';
import '/pages/navbar/navbar_widget.dart';
import 'information_widget.dart' show InformationWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InformationModel extends FlutterFlowModel<InformationWidget> {
  ///  Local state fields for this page.

  String? photo;

  String? firma;

  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for Navbar component.
  late NavbarModel navbarModel;
  bool isDataUploading_uploadDataQ1f = false;
  FFUploadedFile uploadedLocalFile_uploadDataQ1f =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for txtdisplayname widget.
  FocusNode? txtdisplaynameFocusNode;
  TextEditingController? txtdisplaynameTextController;
  String? Function(BuildContext, String?)?
      txtdisplaynameTextControllerValidator;
  String? _txtdisplaynameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto';
    }

    return null;
  }

  // State field(s) for txtfunction widget.
  FocusNode? txtfunctionFocusNode;
  TextEditingController? txtfunctionTextController;
  String? Function(BuildContext, String?)? txtfunctionTextControllerValidator;
  // State field(s) for txtdni widget.
  FocusNode? txtdniFocusNode;
  TextEditingController? txtdniTextController;
  late MaskTextInputFormatter txtdniMask;
  String? Function(BuildContext, String?)? txtdniTextControllerValidator;
  String? _txtdniTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto';
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }
    if (val.length > 8) {
      return 'Maximum 8 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for txtlast widget.
  FocusNode? txtlastFocusNode;
  TextEditingController? txtlastTextController;
  String? Function(BuildContext, String?)? txtlastTextControllerValidator;
  // State field(s) for txtphone widget.
  FocusNode? txtphoneFocusNode;
  TextEditingController? txtphoneTextController;
  late MaskTextInputFormatter txtphoneMask;
  String? Function(BuildContext, String?)? txtphoneTextControllerValidator;
  String? _txtphoneTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto';
    }

    return null;
  }

  // State field(s) for txtdescription widget.
  FocusNode? txtdescriptionFocusNode;
  TextEditingController? txtdescriptionTextController;
  String? Function(BuildContext, String?)?
      txtdescriptionTextControllerValidator;
  String? _txtdescriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto';
    }

    return null;
  }

  // State field(s) for txtemail widget.
  FocusNode? txtemailFocusNode;
  TextEditingController? txtemailTextController;
  String? Function(BuildContext, String?)? txtemailTextControllerValidator;
  String? _txtemailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  bool isDataUploading_uploadDataHng = false;
  FFUploadedFile uploadedLocalFile_uploadDataHng =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataHng = '';

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    navbarModel = createModel(context, () => NavbarModel());
    txtdisplaynameTextControllerValidator =
        _txtdisplaynameTextControllerValidator;
    txtdniTextControllerValidator = _txtdniTextControllerValidator;
    txtphoneTextControllerValidator = _txtphoneTextControllerValidator;
    txtdescriptionTextControllerValidator =
        _txtdescriptionTextControllerValidator;
    txtemailTextControllerValidator = _txtemailTextControllerValidator;
  }

  @override
  void dispose() {
    headerModel.dispose();
    navbarModel.dispose();
    txtdisplaynameFocusNode?.dispose();
    txtdisplaynameTextController?.dispose();

    txtfunctionFocusNode?.dispose();
    txtfunctionTextController?.dispose();

    txtdniFocusNode?.dispose();
    txtdniTextController?.dispose();

    txtlastFocusNode?.dispose();
    txtlastTextController?.dispose();

    txtphoneFocusNode?.dispose();
    txtphoneTextController?.dispose();

    txtdescriptionFocusNode?.dispose();
    txtdescriptionTextController?.dispose();

    txtemailFocusNode?.dispose();
    txtemailTextController?.dispose();
  }
}
