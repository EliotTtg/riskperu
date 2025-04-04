import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'popup_add_coment_model.dart';
export 'popup_add_coment_model.dart';

class PopupAddComentWidget extends StatefulWidget {
  const PopupAddComentWidget({
    super.key,
    this.parameter1,
  });

  final String? parameter1;

  @override
  State<PopupAddComentWidget> createState() => _PopupAddComentWidgetState();
}

class _PopupAddComentWidgetState extends State<PopupAddComentWidget> {
  late PopupAddComentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopupAddComentModel());

    _model.txttituloTextController ??= TextEditingController();
    _model.txttituloFocusNode ??= FocusNode();

    _model.txtcontenidoTextController ??= TextEditingController();
    _model.txtcontenidoFocusNode ??= FocusNode();

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
      decoration: BoxDecoration(),
      child: Form(
        key: _model.formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Titulo o Resumen',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Container(
                    width: double.infinity,
                    child: TextFormField(
                      controller: _model.txttituloTextController,
                      focusNode: _model.txttituloFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.txttituloTextController',
                        Duration(milliseconds: 2000),
                        () => safeSetState(() {}),
                      ),
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'P.ej.: ¿Por qué utilizamos El Excel?',
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFA2A2A2),
                                  letterSpacing: 0.0,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            letterSpacing: 0.0,
                          ),
                      maxLines: 2,
                      minLines: 1,
                      maxLength: 255,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      buildCounter: (context,
                              {required currentLength,
                              required isFocused,
                              maxLength}) =>
                          null,
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      validator: _model.txttituloTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ].divide(SizedBox(height: 5.0)),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Detalle',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Container(
                    width: double.infinity,
                    child: TextFormField(
                      controller: _model.txtcontenidoTextController,
                      focusNode: _model.txtcontenidoFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.txtcontenidoTextController',
                        Duration(milliseconds: 2000),
                        () => safeSetState(() {}),
                      ),
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'P.ej.: En el minuto 05:28...',
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFA2A2A2),
                                  letterSpacing: 0.0,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            letterSpacing: 0.0,
                          ),
                      maxLines: 5,
                      maxLength: 255,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      buildCounter: (context,
                              {required currentLength,
                              required isFocused,
                              maxLength}) =>
                          null,
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      validator: _model.txtcontenidoTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ].divide(SizedBox(height: 5.0)),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Cancelar',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 44.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(16.0),
                          hoverColor: Color(0x3A0F0F0F),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }

                          var comentariosRecordReference =
                              ComentariosRecord.collection.doc();
                          await comentariosRecordReference.set({
                            ...createComentariosRecordData(
                              uidCourses: widget!.parameter1,
                              uidUser: currentUserReference?.id,
                              contenido: _model.txtcontenidoTextController.text,
                            ),
                            ...mapToFirestore(
                              {
                                'created_date': FieldValue.serverTimestamp(),
                              },
                            ),
                          });
                          _model.refComentario =
                              ComentariosRecord.getDocumentFromData({
                            ...createComentariosRecordData(
                              uidCourses: widget!.parameter1,
                              uidUser: currentUserReference?.id,
                              contenido: _model.txtcontenidoTextController.text,
                            ),
                            ...mapToFirestore(
                              {
                                'created_date': DateTime.now(),
                              },
                            ),
                          }, comentariosRecordReference);

                          await _model.refComentario!.reference
                              .update(createComentariosRecordData(
                            uid: _model.refComentario?.reference.id,
                          ));
                          Navigator.pop(context);

                          safeSetState(() {});
                        },
                        text: 'Responder',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 44.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryText,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 20.0)),
                ),
              ),
            ].divide(SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
