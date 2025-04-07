import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_update_courses_widget.dart' show CreateUpdateCoursesWidget;
import 'package:flutter/material.dart';

class CreateUpdateCoursesModel
    extends FlutterFlowModel<CreateUpdateCoursesWidget> {
  ///  Local state fields for this component.

  String? managers;

  String? photo;

  String? categoryCourse;

  String? refTest;

  String? language;

  String? imageCourse;

  String? imageCertificate;

  List<String> benefits = [];
  void addToBenefits(String item) => benefits.add(item);
  void removeFromBenefits(String item) => benefits.remove(item);
  void removeAtIndexFromBenefits(int index) => benefits.removeAt(index);
  void insertAtIndexInBenefits(int index, String item) =>
      benefits.insert(index, item);
  void updateBenefitsAtIndex(int index, Function(String) updateFn) =>
      benefits[index] = updateFn(benefits[index]);

  List<String> prerequsites = [];
  void addToPrerequsites(String item) => prerequsites.add(item);
  void removeFromPrerequsites(String item) => prerequsites.remove(item);
  void removeAtIndexFromPrerequsites(int index) => prerequsites.removeAt(index);
  void insertAtIndexInPrerequsites(int index, String item) =>
      prerequsites.insert(index, item);
  void updatePrerequsitesAtIndex(int index, Function(String) updateFn) =>
      prerequsites[index] = updateFn(prerequsites[index]);

  bool viewMethodologys = false;

  bool viewrequisites = false;

  bool viewVideo = false;

  bool? state;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

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
  // State field(s) for txtPrice widget.
  FocusNode? txtPriceFocusNode;
  TextEditingController? txtPriceTextController;
  String? Function(BuildContext, String?)? txtPriceTextControllerValidator;
  String? _txtPriceTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto';
    }

    return null;
  }

  // State field(s) for cboencargado widget.
  String? cboencargadoValue;
  FormFieldController<String>? cboencargadoValueController;
  // State field(s) for txthoras widget.
  FocusNode? txthorasFocusNode;
  TextEditingController? txthorasTextController;
  String? Function(BuildContext, String?)? txthorasTextControllerValidator;
  String? _txthorasTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto';
    }

    return null;
  }

  // State field(s) for cbolenguaje widget.
  String? cbolenguajeValue;
  FormFieldController<String>? cbolenguajeValueController;
  // State field(s) for txtdescripcion widget.
  FocusNode? txtdescripcionFocusNode;
  TextEditingController? txtdescripcionTextController;
  String? Function(BuildContext, String?)?
      txtdescripcionTextControllerValidator;
  String? _txtdescripcionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto';
    }

    return null;
  }

  // State field(s) for txtobjetivo widget.
  FocusNode? txtobjetivoFocusNode;
  TextEditingController? txtobjetivoTextController;
  String? Function(BuildContext, String?)? txtobjetivoTextControllerValidator;
  String? _txtobjetivoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto';
    }

    return null;
  }

  // State field(s) for txtmethodologys widget.
  FocusNode? txtmethodologysFocusNode;
  TextEditingController? txtmethodologysTextController;
  String? Function(BuildContext, String?)?
      txtmethodologysTextControllerValidator;
  // State field(s) for txtrequisites widget.
  FocusNode? txtrequisitesFocusNode;
  TextEditingController? txtrequisitesTextController;
  String? Function(BuildContext, String?)? txtrequisitesTextControllerValidator;
  // State field(s) for txturlvideo widget.
  FocusNode? txturlvideoFocusNode;
  TextEditingController? txturlvideoTextController;
  String? Function(BuildContext, String?)? txturlvideoTextControllerValidator;
  String? _txturlvideoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio incompleto';
    }

    return null;
  }

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActionsRecord? refActionUpdate;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CoursesRecord? refCourse;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActionsRecord? refActionCreate;

  @override
  void initState(BuildContext context) {
    txtnombrecursoTextControllerValidator =
        _txtnombrecursoTextControllerValidator;
    txtintroduccionTextControllerValidator =
        _txtintroduccionTextControllerValidator;
    txtPriceTextControllerValidator = _txtPriceTextControllerValidator;
    txthorasTextControllerValidator = _txthorasTextControllerValidator;
    txtdescripcionTextControllerValidator =
        _txtdescripcionTextControllerValidator;
    txtobjetivoTextControllerValidator = _txtobjetivoTextControllerValidator;
    txturlvideoTextControllerValidator = _txturlvideoTextControllerValidator;
  }

  @override
  void dispose() {
    txtnombrecursoFocusNode?.dispose();
    txtnombrecursoTextController?.dispose();

    txtintroduccionFocusNode?.dispose();
    txtintroduccionTextController?.dispose();

    txtPriceFocusNode?.dispose();
    txtPriceTextController?.dispose();

    txthorasFocusNode?.dispose();
    txthorasTextController?.dispose();

    txtdescripcionFocusNode?.dispose();
    txtdescripcionTextController?.dispose();

    txtobjetivoFocusNode?.dispose();
    txtobjetivoTextController?.dispose();

    txtmethodologysFocusNode?.dispose();
    txtmethodologysTextController?.dispose();

    txtrequisitesFocusNode?.dispose();
    txtrequisitesTextController?.dispose();

    txturlvideoFocusNode?.dispose();
    txturlvideoTextController?.dispose();
  }
}
