import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/lista_actividades/lista_actividades_widget.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_update_actividad_model.dart';
export 'create_update_actividad_model.dart';

class CreateUpdateActividadWidget extends StatefulWidget {
  const CreateUpdateActividadWidget({
    super.key,
    this.refActividad,
    required this.refModule,
    required this.refSession,
    required this.refCourse,
  });

  final ModuleClassRecord? refActividad;
  final ModuleRecord? refModule;
  final SessionRecord? refSession;
  final CoursesRecord? refCourse;

  @override
  State<CreateUpdateActividadWidget> createState() =>
      _CreateUpdateActividadWidgetState();
}

class _CreateUpdateActividadWidgetState
    extends State<CreateUpdateActividadWidget> {
  late CreateUpdateActividadModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateUpdateActividadModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.refActividad != null) {
        _model.listRecursos =
            widget!.refActividad!.archives.toList().cast<String>();
        safeSetState(() {});
      }
    });

    _model.txtnombreTextController ??=
        TextEditingController(text: widget!.refActividad?.name);
    _model.txtnombreFocusNode ??= FocusNode();

    _model.txtenlaceTextController ??=
        TextEditingController(text: widget!.refActividad?.linkVideo);
    _model.txtenlaceFocusNode ??= FocusNode();

    _model.txtduracionTextController ??= TextEditingController(
        text: formatNumber(
      widget!.refActividad?.minutes,
      formatType: FormatType.custom,
      format: '0',
      locale: '',
    ));
    _model.txtduracionFocusNode ??= FocusNode();

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
            Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Padding(
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
                            valueOrDefault<String>(
                              widget!.refActividad != null
                                  ? 'Actualizar Actividad'
                                  : 'Agregar Actividad',
                              'Agregar Actividad',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nombre',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller:
                                          _model.txtnombreTextController,
                                      focusNode: _model.txtnombreFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.txtnombreTextController',
                                        Duration(milliseconds: 1000),
                                        () => safeSetState(() {}),
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Escribe',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        hoverColor: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            letterSpacing: 0.0,
                                          ),
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model
                                          .txtnombreTextControllerValidator
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
                                    'Enlace',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller:
                                          _model.txtenlaceTextController,
                                      focusNode: _model.txtenlaceFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.txtenlaceTextController',
                                        Duration(milliseconds: 1000),
                                        () => safeSetState(() {}),
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Escribe',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        hoverColor: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            letterSpacing: 0.0,
                                          ),
                                      maxLines: null,
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model
                                          .txtenlaceTextControllerValidator
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
                                    'Duración (Minutos)',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller:
                                          _model.txtduracionTextController,
                                      focusNode: _model.txtduracionFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.txtduracionTextController',
                                        Duration(milliseconds: 1000),
                                        () => safeSetState(() {}),
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Escribe',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        hoverColor: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            letterSpacing: 0.0,
                                          ),
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model
                                          .txtduracionTextControllerValidator
                                          .asValidator(context),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp('[0-9]'))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Recursos',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (_model
                                                .listRecursos.isNotEmpty) {
                                              _model.listRecursos = [];
                                              safeSetState(() {});
                                            } else {
                                              if (_model.uploadedLocalFiles1
                                                  .isNotEmpty) {
                                                safeSetState(() {
                                                  _model.isDataUploading1 =
                                                      false;
                                                  _model.uploadedLocalFiles1 =
                                                      [];
                                                });
                                              } else {
                                                final selectedFiles =
                                                    await selectFiles(
                                                  multiFile: true,
                                                );
                                                if (selectedFiles != null) {
                                                  safeSetState(() => _model
                                                      .isDataUploading1 = true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];

                                                  try {
                                                    selectedUploadedFiles =
                                                        selectedFiles
                                                            .map((m) =>
                                                                FFUploadedFile(
                                                                  name: m
                                                                      .storagePath
                                                                      .split(
                                                                          '/')
                                                                      .last,
                                                                  bytes:
                                                                      m.bytes,
                                                                ))
                                                            .toList();
                                                  } finally {
                                                    _model.isDataUploading1 =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                          .length ==
                                                      selectedFiles.length) {
                                                    safeSetState(() {
                                                      _model.uploadedLocalFiles1 =
                                                          selectedUploadedFiles;
                                                    });
                                                  } else {
                                                    safeSetState(() {});
                                                    return;
                                                  }
                                                }
                                              }
                                            }

                                            await Future.delayed(const Duration(
                                                milliseconds: 1000));
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color: Color(0xFFE0E3E7),
                                              ),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    (_model.listRecursos
                                                                .isNotEmpty) ||
                                                            (_model
                                                                .uploadedLocalFiles1
                                                                .isNotEmpty)
                                                        ? 'Recursos Seleccionados'
                                                        : 'Sin Recursos',
                                                    'Sin Recursos',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (_model.listRecursos.isNotEmpty)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderRadius: 8.0,
                                            buttonSize: 38.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            icon: Icon(
                                              Icons.download_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 20.0,
                                            ),
                                            onPressed: () async {
                                              while (
                                                  _model.listRecursos.length >=
                                                      valueOrDefault<int>(
                                                        valueOrDefault<int>(
                                                              _model.indice,
                                                              0,
                                                            ) +
                                                            1,
                                                        1,
                                                      )) {
                                                await downloadFile(
                                                  filename:
                                                      'Recurso ${(_model.indice + 1).toString()}: ${widget!.refActividad?.name}',
                                                  url: valueOrDefault<String>(
                                                    _model.listRecursos
                                                        .elementAtOrNull(
                                                            _model.indice),
                                                    '-',
                                                  ),
                                                );
                                                _model.indice =
                                                    _model.indice + 1;
                                                safeSetState(() {});
                                              }
                                              _model.indice = 0;
                                              safeSetState(() {});
                                            },
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(height: 10.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                child: Builder(
                                  builder: (context) => FFButtonWidget(
                                    onPressed: () async {
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      if (_model
                                          .uploadedLocalFiles1.isNotEmpty) {
                                        {
                                          safeSetState(() =>
                                              _model.isDataUploading2 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];
                                          var selectedFiles = <SelectedFile>[];
                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles =
                                                _model.uploadedLocalFiles1;
                                            selectedFiles =
                                                selectedFilesFromUploadedFiles(
                                              selectedUploadedFiles,
                                              isMultiData: true,
                                            );
                                            downloadUrls = (await Future.wait(
                                              selectedFiles.map(
                                                (f) async => await uploadData(
                                                    f.storagePath, f.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            _model.isDataUploading2 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedFiles.length &&
                                              downloadUrls.length ==
                                                  selectedFiles.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFiles2 =
                                                  selectedUploadedFiles;
                                              _model.uploadedFileUrls2 =
                                                  downloadUrls;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        _model.listRecursos = _model
                                            .uploadedFileUrls2
                                            .toList()
                                            .cast<String>();
                                        safeSetState(() {});
                                      }
                                      if (widget!.refActividad != null) {
                                        await widget!.refActividad!.reference
                                            .update({
                                          ...createModuleClassRecordData(
                                            name: _model
                                                .txtnombreTextController.text,
                                            linkVideo: _model
                                                .txtenlaceTextController.text,
                                            minutes: int.tryParse(_model
                                                .txtduracionTextController
                                                .text),
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'archives': _model.listRecursos,
                                            },
                                          ),
                                        });

                                        var actionsRecordReference1 =
                                            ActionsRecord.collection.doc();
                                        await actionsRecordReference1.set({
                                          ...createActionsRecordData(
                                            uidUser: currentUserReference?.id,
                                            descripction:
                                                'Modifico una actividad al modulo:${widget!.refModule?.name} llamada: ${_model.txtnombreTextController.text}',
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'Created_Date':
                                                  FieldValue.serverTimestamp(),
                                            },
                                          ),
                                        });
                                        _model.refActionUpdate =
                                            ActionsRecord.getDocumentFromData({
                                          ...createActionsRecordData(
                                            uidUser: currentUserReference?.id,
                                            descripction:
                                                'Modifico una actividad al modulo:${widget!.refModule?.name} llamada: ${_model.txtnombreTextController.text}',
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'Created_Date': DateTime.now(),
                                            },
                                          ),
                                        }, actionsRecordReference1);

                                        await _model.refActionUpdate!.reference
                                            .update(createActionsRecordData(
                                          uid: _model
                                              .refActionUpdate?.reference.id,
                                        ));
                                      } else {
                                        var moduleClassRecordReference =
                                            ModuleClassRecord.collection.doc();
                                        await moduleClassRecordReference.set({
                                          ...createModuleClassRecordData(
                                            name: _model
                                                .txtnombreTextController.text,
                                            createdDate: getCurrentTimestamp,
                                            linkVideo: _model
                                                .txtenlaceTextController.text,
                                            uidModule:
                                                widget!.refModule?.reference.id,
                                            minutes: int.tryParse(_model
                                                .txtduracionTextController
                                                .text),
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'archives': _model.listRecursos,
                                            },
                                          ),
                                        });
                                        _model.refModuleclass =
                                            ModuleClassRecord
                                                .getDocumentFromData({
                                          ...createModuleClassRecordData(
                                            name: _model
                                                .txtnombreTextController.text,
                                            createdDate: getCurrentTimestamp,
                                            linkVideo: _model
                                                .txtenlaceTextController.text,
                                            uidModule:
                                                widget!.refModule?.reference.id,
                                            minutes: int.tryParse(_model
                                                .txtduracionTextController
                                                .text),
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'archives': _model.listRecursos,
                                            },
                                          ),
                                        }, moduleClassRecordReference);

                                        await _model.refModuleclass!.reference
                                            .update(createModuleClassRecordData(
                                          uid: _model
                                              .refModuleclass?.reference.id,
                                        ));

                                        var actionsRecordReference2 =
                                            ActionsRecord.collection.doc();
                                        await actionsRecordReference2.set({
                                          ...createActionsRecordData(
                                            uidUser: currentUserReference?.id,
                                            descripction:
                                                'Agrego una actividad al modulo:${widget!.refModule?.name} llamada: ${_model.txtnombreTextController.text}',
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'Created_Date':
                                                  FieldValue.serverTimestamp(),
                                            },
                                          ),
                                        });
                                        _model.refActionCreate =
                                            ActionsRecord.getDocumentFromData({
                                          ...createActionsRecordData(
                                            uidUser: currentUserReference?.id,
                                            descripction:
                                                'Agrego una actividad al modulo:${widget!.refModule?.name} llamada: ${_model.txtnombreTextController.text}',
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'Created_Date': DateTime.now(),
                                            },
                                          ),
                                        }, actionsRecordReference2);

                                        await _model.refActionCreate!.reference
                                            .update(createActionsRecordData(
                                          uid: _model
                                              .refActionCreate?.reference.id,
                                        ));
                                      }

                                      Navigator.pop(context);
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: ListaActividadesWidget(
                                              refModulo: widget!.refModule!,
                                              refSession: widget!.refSession!,
                                              refCourse: widget!.refCourse!,
                                            ),
                                          );
                                        },
                                      );

                                      await Future.delayed(
                                          const Duration(milliseconds: 1000));

                                      safeSetState(() {});
                                    },
                                    text: valueOrDefault<String>(
                                      widget!.refActividad != null
                                          ? 'ACTUALIZAR'
                                          : 'AGREGAR',
                                      'AGREGAR',
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 32.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Builder(
                                  builder: (context) => FFButtonWidget(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: ListaActividadesWidget(
                                              refModulo: widget!.refModule!,
                                              refSession: widget!.refSession!,
                                              refCourse: widget!.refCourse!,
                                            ),
                                          );
                                        },
                                      );

                                      await Future.delayed(
                                          const Duration(milliseconds: 1000));
                                    },
                                    text: 'CANCELAR',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 32.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
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
            ),
          ].divide(SizedBox(height: 50.0)).around(SizedBox(height: 50.0)),
        ),
      ),
    );
  }
}
