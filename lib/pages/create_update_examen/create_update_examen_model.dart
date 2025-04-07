import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_update_examen_widget.dart' show CreateUpdateExamenWidget;
import 'package:flutter/material.dart';

class CreateUpdateExamenModel
    extends FlutterFlowModel<CreateUpdateExamenWidget> {
  ///  Local state fields for this component.

  String? refTeacher;

  bool state = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txttitulo widget.
  FocusNode? txttituloFocusNode;
  TextEditingController? txttituloTextController;
  String? Function(BuildContext, String?)? txttituloTextControllerValidator;
  String? _txttituloTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto';
    }

    return null;
  }

  // State field(s) for cbostate widget.
  bool? cbostateValue;
  FormFieldController<bool>? cbostateValueController;
  // State field(s) for txttiempolimite widget.
  FocusNode? txttiempolimiteFocusNode;
  TextEditingController? txttiempolimiteTextController;
  String? Function(BuildContext, String?)?
      txttiempolimiteTextControllerValidator;
  String? _txttiempolimiteTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto';
    }

    return null;
  }

  // State field(s) for cboencargados widget.
  String? cboencargadosValue;
  FormFieldController<String>? cboencargadosValueController;
  // State field(s) for txtdescripcion widget.
  FocusNode? txtdescripcionFocusNode;
  TextEditingController? txtdescripcionTextController;
  String? Function(BuildContext, String?)?
      txtdescripcionTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActionsRecord? refActionUpdate;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ExamenesRecord? refExamen;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActionsRecord? refActionCreate;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  PreguntasRecord? refPreguntas;

  @override
  void initState(BuildContext context) {
    txttituloTextControllerValidator = _txttituloTextControllerValidator;
    txttiempolimiteTextControllerValidator =
        _txttiempolimiteTextControllerValidator;
  }

  @override
  void dispose() {
    txttituloFocusNode?.dispose();
    txttituloTextController?.dispose();

    txttiempolimiteFocusNode?.dispose();
    txttiempolimiteTextController?.dispose();

    txtdescripcionFocusNode?.dispose();
    txtdescripcionTextController?.dispose();
  }
}
