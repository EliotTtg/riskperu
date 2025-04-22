import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'create_update_category_examen_model.dart';
export 'create_update_category_examen_model.dart';

class CreateUpdateCategoryExamenWidget extends StatefulWidget {
  const CreateUpdateCategoryExamenWidget({
    super.key,
    this.refGroupExamen,
    required this.refCourse,
  });

  final ExamGroupsRecord? refGroupExamen;
  final String? refCourse;

  @override
  State<CreateUpdateCategoryExamenWidget> createState() =>
      _CreateUpdateCategoryExamenWidgetState();
}

class _CreateUpdateCategoryExamenWidgetState
    extends State<CreateUpdateCategoryExamenWidget> {
  late CreateUpdateCategoryExamenModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateUpdateCategoryExamenModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.refGroupExamen != null) {
        await Future.wait([
          Future(() async {
            safeSetState(() {
              _model.cbostateValueController?.value = valueOrDefault<bool>(
                widget.refGroupExamen?.state,
                false,
              );
            });
          }),
          Future(() async {
            safeSetState(() {
              _model.cbotypeValueController?.value = valueOrDefault<bool>(
                widget.refGroupExamen?.isDemo,
                false,
              );
            });
          }),
        ]);
      } else {
        await Future.wait([
          Future(() async {
            safeSetState(() {
              _model.cbostateValueController?.value = false;
            });
          }),
          Future(() async {
            safeSetState(() {
              _model.cbotypeValueController?.value = false;
            });
          }),
        ]);
      }

      await Future.delayed(const Duration(milliseconds: 1000));
    });

    _model.textController ??=
        TextEditingController(text: widget.refGroupExamen?.name);
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0x18000000),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(80.0, 50.0, 80.0, 50.0),
              child: Material(
                color: Colors.transparent,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  width: 396.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Grupo de Examen',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nombre',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Ingrese la respuesta',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  hoverColor:
                                      FlutterFlowTheme.of(context).alternate,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      letterSpacing: 0.0,
                                    ),
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tipo',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            FlutterFlowDropDown<bool>(
                              controller: _model.cbotypeValueController ??=
                                  FormFieldController<bool>(null),
                              options: List<bool>.from([true, false]),
                              optionLabels: ['Demo', 'Estandar'],
                              onChanged: (val) =>
                                  safeSetState(() => _model.cbotypeValue = val),
                              width: double.infinity,
                              height: 39.0,
                              maxHeight: 300.0,
                              searchHintTextStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                  ),
                              searchTextStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                  ),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: 'Seleccione',
                              searchHintText: 'Buscar tipo..',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor: Color(0xFFE4E4E7),
                              borderWidth: 0.0,
                              borderRadius: 4.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              hidesUnderline: true,
                              isOverButton: false,
                              isSearchable: true,
                              isMultiSelect: false,
                            ),
                          ].divide(SizedBox(height: 5.0)),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Estado',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            FlutterFlowDropDown<bool>(
                              controller: _model.cbostateValueController ??=
                                  FormFieldController<bool>(null),
                              options: List<bool>.from([true, false]),
                              optionLabels: ['Activo', 'Inactivo'],
                              onChanged: (val) => safeSetState(
                                  () => _model.cbostateValue = val),
                              width: double.infinity,
                              height: 39.0,
                              maxHeight: 300.0,
                              searchHintTextStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                  ),
                              searchTextStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                  ),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: 'Seleccione',
                              searchHintText: 'Buscar estado..',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor: Color(0xFFE4E4E7),
                              borderWidth: 0.0,
                              borderRadius: 4.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              hidesUnderline: true,
                              isOverButton: false,
                              isSearchable: true,
                              isMultiSelect: false,
                            ),
                          ].divide(SizedBox(height: 5.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  final firestoreBatch =
                                      FirebaseFirestore.instance.batch();
                                  try {
                                    if (widget.refGroupExamen != null) {
                                      firestoreBatch.update(
                                          widget.refGroupExamen!.reference, {
                                        ...createExamGroupsRecordData(
                                          name: _model.textController.text,
                                          state: _model.cbostateValue,
                                          isDemo: _model.cbotypeValue,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'Updated_date':
                                                FieldValue.serverTimestamp(),
                                          },
                                        ),
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Se actualizo exitosamente el grupo de examenes',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .success,
                                        ),
                                      );
                                    } else {
                                      var examGroupsRecordReference =
                                          ExamGroupsRecord.collection.doc();
                                      firestoreBatch
                                          .set(examGroupsRecordReference, {
                                        ...createExamGroupsRecordData(
                                          name: _model.textController.text,
                                          createdBy: currentUserReference?.id,
                                          uidCourse: widget.refCourse,
                                          state: _model.cbostateValue,
                                          isDemo: _model.cbotypeValue,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'Created_date':
                                                FieldValue.serverTimestamp(),
                                            'Updated_date':
                                                FieldValue.serverTimestamp(),
                                          },
                                        ),
                                      });
                                      _model.refCourses =
                                          ExamGroupsRecord.getDocumentFromData({
                                        ...createExamGroupsRecordData(
                                          name: _model.textController.text,
                                          createdBy: currentUserReference?.id,
                                          uidCourse: widget.refCourse,
                                          state: _model.cbostateValue,
                                          isDemo: _model.cbotypeValue,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'Created_date': DateTime.now(),
                                            'Updated_date': DateTime.now(),
                                          },
                                        ),
                                      }, examGroupsRecordReference);

                                      firestoreBatch.update(
                                          _model.refCourses!.reference,
                                          createExamGroupsRecordData(
                                            uid:
                                                _model.refCourses?.reference.id,
                                          ));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Se creo exitosamente el grupo de examenes',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .success,
                                        ),
                                      );
                                    }

                                    Navigator.pop(context);
                                  } finally {
                                    await firestoreBatch.commit();
                                  }

                                  safeSetState(() {});
                                },
                                text: valueOrDefault<String>(
                                  widget.refGroupExamen != null
                                      ? 'ACTUALIZAR'
                                      : 'AGREGAR',
                                  'AGREGAR',
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 32.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                            ),
                            Flexible(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                                text: 'CANCELAR',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 32.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 10.0)),
                        ),
                      ].divide(SizedBox(height: 20.0)),
                    ),
                  ),
                ),
              ),
            ),
          ].divide(SizedBox(height: 50.0)).around(SizedBox(height: 50.0)),
        ),
      ),
    );
  }
}
