import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'lista_preguntas_examen_widget.dart' show ListaPreguntasExamenWidget;
import 'package:flutter/material.dart';

class ListaPreguntasExamenModel
    extends FlutterFlowModel<ListaPreguntasExamenWidget> {
  ///  Local state fields for this component.

  bool stateViewQuestion = false;

  PreguntasRecord? refPreguntaUpdate;

  RespuestasRecord? refRespuesta;

  ///  State fields for stateful widgets in this component.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for txttitulo widget.
  FocusNode? txttituloFocusNode;
  TextEditingController? txttituloTextController;
  String? Function(BuildContext, String?)? txttituloTextControllerValidator;
  // State field(s) for txttiempolimite widget.
  FocusNode? txttiempolimiteFocusNode;
  TextEditingController? txttiempolimiteTextController;
  String? Function(BuildContext, String?)?
      txttiempolimiteTextControllerValidator;
  // State field(s) for txtencargado widget.
  FocusNode? txtencargadoFocusNode;
  TextEditingController? txtencargadoTextController;
  String? Function(BuildContext, String?)? txtencargadoTextControllerValidator;
  // State field(s) for txtenunciado widget.
  FocusNode? txtenunciadoFocusNode;
  TextEditingController? txtenunciadoTextController;
  String? Function(BuildContext, String?)? txtenunciadoTextControllerValidator;
  // State field(s) for txtpregunta widget.
  FocusNode? txtpreguntaFocusNode;
  TextEditingController? txtpreguntaTextController;
  String? Function(BuildContext, String?)? txtpreguntaTextControllerValidator;
  // State field(s) for cbodominios widget.
  int? cbodominiosValue;
  FormFieldController<int>? cbodominiosValueController;
  // State field(s) for txtexplicacion widget.
  FocusNode? txtexplicacionFocusNode;
  TextEditingController? txtexplicacionTextController;
  String? Function(BuildContext, String?)?
      txtexplicacionTextControllerValidator;
  String? _txtexplicacionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActionsRecord? refActionUpdates;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? countPreguntas;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PreguntasRecord? refQuestionCreate;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActionsRecord? refActionCreate;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  PreguntasRecord? refOfQuestion;
  // State field(s) for txtrespuesta widget.
  FocusNode? txtrespuestaFocusNode;
  TextEditingController? txtrespuestaTextController;
  String? Function(BuildContext, String?)? txtrespuestaTextControllerValidator;
  String? _txtrespuestaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ActionsRecord? refQuestionUpdates;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  RespuestasRecord? refRespuestaCreate;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ActionsRecord? refActionCreateQuestionss;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ActionsRecord? refQuestionDelete;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ActionsRecord? refQuestionDeletes;

  @override
  void initState(BuildContext context) {
    txtexplicacionTextControllerValidator =
        _txtexplicacionTextControllerValidator;
    txtrespuestaTextControllerValidator = _txtrespuestaTextControllerValidator;
  }

  @override
  void dispose() {
    txttituloFocusNode?.dispose();
    txttituloTextController?.dispose();

    txttiempolimiteFocusNode?.dispose();
    txttiempolimiteTextController?.dispose();

    txtencargadoFocusNode?.dispose();
    txtencargadoTextController?.dispose();

    txtenunciadoFocusNode?.dispose();
    txtenunciadoTextController?.dispose();

    txtpreguntaFocusNode?.dispose();
    txtpreguntaTextController?.dispose();

    txtexplicacionFocusNode?.dispose();
    txtexplicacionTextController?.dispose();

    txtrespuestaFocusNode?.dispose();
    txtrespuestaTextController?.dispose();
  }
}
