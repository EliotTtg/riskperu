import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'popup_add_coments_model.dart';
export 'popup_add_coments_model.dart';

class PopupAddComentsWidget extends StatefulWidget {
  const PopupAddComentsWidget({
    super.key,
    this.parameter1,
    this.parameter2,
  });

  final String? parameter1;
  final String? parameter2;

  @override
  State<PopupAddComentsWidget> createState() => _PopupAddComentsWidgetState();
}

class _PopupAddComentsWidgetState extends State<PopupAddComentsWidget> {
  late PopupAddComentsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopupAddComentsModel());

    _model.txtcontenidosTextController ??= TextEditingController();
    _model.txtcontenidosFocusNode ??= FocusNode();

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
            color: Color(0xFFF7F9FA),
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: Color(0xFFA7A7A7),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _model.txtcontenidosTextController,
                        focusNode: _model.txtcontenidosFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.txtcontenidosTextController',
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
                        minLines: 1,
                        maxLength: 255,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        buildCounter: (context,
                                {required currentLength,
                                required isFocused,
                                maxLength}) =>
                            null,
                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                        validator: _model.txtcontenidosTextControllerValidator
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
                          onPressed: () async {
                            FFAppState()
                                .removeFromListComent(widget.parameter1!);
                            FFAppState().update(() {});
                          },
                          text: 'Cancelar',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 44.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFFF7F9FA),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(16.0),
                            hoverColor: Color(0x180F0F0F),
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
                                uidCourses: widget.parameter2,
                                uidUser: currentUserReference?.id,
                                contenido:
                                    _model.txtcontenidosTextController.text,
                                paredId: widget.parameter1,
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
                                uidCourses: widget.parameter2,
                                uidUser: currentUserReference?.id,
                                contenido:
                                    _model.txtcontenidosTextController.text,
                                paredId: widget.parameter1,
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
                            FFAppState()
                                .removeFromListComent(widget.parameter1!);
                            FFAppState().update(() {});

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
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
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
      ),
    );
  }
}
