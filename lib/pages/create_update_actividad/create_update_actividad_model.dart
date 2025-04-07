import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_update_actividad_widget.dart' show CreateUpdateActividadWidget;
import 'package:flutter/material.dart';

class CreateUpdateActividadModel
    extends FlutterFlowModel<CreateUpdateActividadWidget> {
  ///  Local state fields for this component.

  List<String> listRecursos = [];
  void addToListRecursos(String item) => listRecursos.add(item);
  void removeFromListRecursos(String item) => listRecursos.remove(item);
  void removeAtIndexFromListRecursos(int index) => listRecursos.removeAt(index);
  void insertAtIndexInListRecursos(int index, String item) =>
      listRecursos.insert(index, item);
  void updateListRecursosAtIndex(int index, Function(String) updateFn) =>
      listRecursos[index] = updateFn(listRecursos[index]);

  int indice = 0;

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

  // State field(s) for txtenlace widget.
  FocusNode? txtenlaceFocusNode;
  TextEditingController? txtenlaceTextController;
  String? Function(BuildContext, String?)? txtenlaceTextControllerValidator;
  String? _txtenlaceTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto';
    }

    return null;
  }

  // State field(s) for txtduracion widget.
  FocusNode? txtduracionFocusNode;
  TextEditingController? txtduracionTextController;
  String? Function(BuildContext, String?)? txtduracionTextControllerValidator;
  String? _txtduracionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto';
    }

    return null;
  }

  bool isDataUploading1 = false;
  List<FFUploadedFile> uploadedLocalFiles1 = [];

  bool isDataUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];
  List<String> uploadedFileUrls2 = [];

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActionsRecord? refActionUpdate;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ModuleClassRecord? refModuleclass;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActionsRecord? refActionCreate;

  @override
  void initState(BuildContext context) {
    txtnombreTextControllerValidator = _txtnombreTextControllerValidator;
    txtenlaceTextControllerValidator = _txtenlaceTextControllerValidator;
    txtduracionTextControllerValidator = _txtduracionTextControllerValidator;
  }

  @override
  void dispose() {
    txtnombreFocusNode?.dispose();
    txtnombreTextController?.dispose();

    txtenlaceFocusNode?.dispose();
    txtenlaceTextController?.dispose();

    txtduracionFocusNode?.dispose();
    txtduracionTextController?.dispose();
  }
}
