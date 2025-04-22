import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'txt_comentario_publicacion_curso_model.dart';
export 'txt_comentario_publicacion_curso_model.dart';

class TxtComentarioPublicacionCursoWidget extends StatefulWidget {
  const TxtComentarioPublicacionCursoWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
  });

  final String? parameter1;
  final String? parameter2;
  final String? parameter3;

  @override
  State<TxtComentarioPublicacionCursoWidget> createState() =>
      _TxtComentarioPublicacionCursoWidgetState();
}

class _TxtComentarioPublicacionCursoWidgetState
    extends State<TxtComentarioPublicacionCursoWidget> {
  late TxtComentarioPublicacionCursoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TxtComentarioPublicacionCursoModel());

    _model.txtGuardarComentarioTextController ??= TextEditingController();
    _model.txtGuardarComentarioFocusNode ??= FocusNode();

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.network(
                  valueOrDefault<String>(
                    widget.parameter1,
                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/kpacita-ssg7c7/assets/kom25ftm37kk/Frame_1171276035.png',
                  ),
                ).image,
              ),
              borderRadius: BorderRadius.circular(42.0),
            ),
          ),
          Expanded(
            child: Container(
              width: 200.0,
              child: TextFormField(
                controller: _model.txtGuardarComentarioTextController,
                focusNode: _model.txtGuardarComentarioFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.txtGuardarComentarioTextController',
                  Duration(milliseconds: 2000),
                  () => safeSetState(() {}),
                ),
                onFieldSubmitted: (_) async {
                  if (_model.txtGuardarComentarioTextController.text != '') {
                    var announcementCommentsRecordReference =
                        AnnouncementCommentsRecord.collection.doc();
                    await announcementCommentsRecordReference.set({
                      ...createAnnouncementCommentsRecordData(
                        createdBy: widget.parameter2,
                        uidAnnouncementsCourse: widget.parameter3,
                        text: _model.txtGuardarComentarioTextController.text,
                      ),
                      ...mapToFirestore(
                        {
                          'Created_Date': FieldValue.serverTimestamp(),
                        },
                      ),
                    });
                    _model.refComentarioPublicacion =
                        AnnouncementCommentsRecord.getDocumentFromData({
                      ...createAnnouncementCommentsRecordData(
                        createdBy: widget.parameter2,
                        uidAnnouncementsCourse: widget.parameter3,
                        text: _model.txtGuardarComentarioTextController.text,
                      ),
                      ...mapToFirestore(
                        {
                          'Created_Date': DateTime.now(),
                        },
                      ),
                    }, announcementCommentsRecordReference);

                    await _model.refComentarioPublicacion!.reference
                        .update(createAnnouncementCommentsRecordData(
                      uid: _model.refComentarioPublicacion?.reference.id,
                    ));
                    safeSetState(() {
                      _model.txtGuardarComentarioTextController?.clear();
                    });
                  }

                  safeSetState(() {});
                },
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  isDense: true,
                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        font: GoogleFonts.montserrat(
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).labelMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelMedium.fontStyle,
                      ),
                  hintText: 'Crear una nueva nota',
                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        font: GoogleFonts.montserrat(
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontStyle,
                        ),
                        color: Color(0xFF767676),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).labelMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelMedium.fontStyle,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryText,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4.0),
                      bottomRight: Radius.circular(4.0),
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryText,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4.0),
                      bottomRight: Radius.circular(4.0),
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4.0),
                      bottomRight: Radius.circular(4.0),
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4.0),
                      bottomRight: Radius.circular(4.0),
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.montserrat(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                cursorColor: FlutterFlowTheme.of(context).primaryText,
                validator: _model.txtGuardarComentarioTextControllerValidator
                    .asValidator(context),
              ),
            ),
          ),
        ].divide(SizedBox(width: 10.0)),
      ),
    );
  }
}
