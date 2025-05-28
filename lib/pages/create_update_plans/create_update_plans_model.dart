import '/flutter_flow/flutter_flow_util.dart';
import 'create_update_plans_widget.dart' show CreateUpdatePlansWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  bool isDataUploading_uploadDataFxu = false;
  FFUploadedFile uploadedLocalFile_uploadDataFxu =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataFxu = '';

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
