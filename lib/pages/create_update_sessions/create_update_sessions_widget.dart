import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/lista_sessions/lista_sessions_widget.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_update_sessions_model.dart';
export 'create_update_sessions_model.dart';

class CreateUpdateSessionsWidget extends StatefulWidget {
  const CreateUpdateSessionsWidget({
    super.key,
    this.refSession,
    required this.refCourse,
  });

  final SessionRecord? refSession;
  final CoursesRecord? refCourse;

  @override
  State<CreateUpdateSessionsWidget> createState() =>
      _CreateUpdateSessionsWidgetState();
}

class _CreateUpdateSessionsWidgetState
    extends State<CreateUpdateSessionsWidget> {
  late CreateUpdateSessionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateUpdateSessionsModel());

    _model.textController ??=
        TextEditingController(text: widget!.refSession?.name);
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
                              widget!.refSession != null
                                  ? 'Actualizar Sesión'
                                  : 'Agregar Sesión',
                              'Agregar Sesión',
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
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textController',
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
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 5.0)),
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
                                    onPressed: (_model.textController.text ==
                                            widget!.refSession?.name)
                                        ? null
                                        : () async {
                                            if (_model.formKey.currentState ==
                                                    null ||
                                                !_model.formKey.currentState!
                                                    .validate()) {
                                              return;
                                            }
                                            if (widget!.refSession != null) {
                                              await widget!
                                                  .refSession!.reference
                                                  .update(
                                                      createSessionRecordData(
                                                name:
                                                    _model.textController.text,
                                              ));
                                            } else {
                                              var sessionRecordReference =
                                                  SessionRecord.collection
                                                      .doc();
                                              await sessionRecordReference.set({
                                                ...createSessionRecordData(
                                                  name: _model
                                                      .textController.text,
                                                  createdBy:
                                                      currentUserReference?.id,
                                                  uidCourse: widget!
                                                      .refCourse?.reference.id,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'Created_Date': FieldValue
                                                        .serverTimestamp(),
                                                  },
                                                ),
                                              });
                                              _model.refSession = SessionRecord
                                                  .getDocumentFromData({
                                                ...createSessionRecordData(
                                                  name: _model
                                                      .textController.text,
                                                  createdBy:
                                                      currentUserReference?.id,
                                                  uidCourse: widget!
                                                      .refCourse?.reference.id,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'Created_Date':
                                                        DateTime.now(),
                                                  },
                                                ),
                                              }, sessionRecordReference);

                                              await _model.refSession!.reference
                                                  .update(
                                                      createSessionRecordData(
                                                uid: _model
                                                    .refSession?.reference.id,
                                              ));
                                            }

                                            Navigator.pop(context);
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: ListaSessionsWidget(
                                                    refCourses:
                                                        widget!.refCourse!,
                                                  ),
                                                );
                                              },
                                            );

                                            await Future.delayed(const Duration(
                                                milliseconds: 1000));

                                            safeSetState(() {});
                                          },
                                    text: valueOrDefault<String>(
                                      widget!.refSession != null
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
                                      disabledColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                      disabledTextColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
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
                                            child: ListaSessionsWidget(
                                              refCourses: widget!.refCourse!,
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
