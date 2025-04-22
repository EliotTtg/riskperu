import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/header_mobil/header_mobil_widget.dart';
import '/pages/navbar/navbar_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'examination_questions_view_mobil_model.dart';
export 'examination_questions_view_mobil_model.dart';

class ExaminationQuestionsViewMobilWidget extends StatefulWidget {
  const ExaminationQuestionsViewMobilWidget({
    super.key,
    required this.refExamination,
    required this.refCourse,
    required this.refUser,
    required this.type,
    required this.isdemo,
  });

  final ExamenesRecord? refExamination;
  final CoursesRecord? refCourse;
  final DocumentReference? refUser;
  final int? type;
  final bool? isdemo;

  static String routeName = 'examinationQuestionsViewMobil';
  static String routePath = 'ExaminationQuestionsViewMobil';

  @override
  State<ExaminationQuestionsViewMobilWidget> createState() =>
      _ExaminationQuestionsViewMobilWidgetState();
}

class _ExaminationQuestionsViewMobilWidgetState
    extends State<ExaminationQuestionsViewMobilWidget> {
  late ExaminationQuestionsViewMobilModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExaminationQuestionsViewMobilModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.refExamen = widget.refExamination?.reference.id;
      safeSetState(() {});
      await Future.wait([
        Future(() async {
          _model.porcentajeCourse = await actions.porcentajeCourseLinea(
            widget.refCourse!,
            widget.refUser!,
            widget.isdemo!,
          );
        }),
        Future(() async {
          _model.porcentajeExamenes = await actions.porcentajeCourse(
            widget.refCourse!,
            widget.refUser!,
            widget.isdemo!,
          );
        }),
      ]);
      await Future.delayed(const Duration(milliseconds: 1000));
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'RiskPeru',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  wrapWithModel(
                    model: _model.headerMobilModel,
                    updateCallback: () => safeSetState(() {}),
                    child: HeaderMobilWidget(),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: double.infinity,
                                child: Visibility(
                                  visible: valueOrDefault(
                                          currentUserDocument?.userType, 0) !=
                                      2,
                                  child: AuthUserStreamWidget(
                                    builder: (context) => wrapWithModel(
                                      model: _model.navbarModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: NavbarWidget(
                                        state: 4,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: SingleChildScrollView(
                                  primary: false,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              flex: 2,
                                              child: Padding(
                                                padding: EdgeInsets.all(20.0),
                                                child: StreamBuilder<
                                                    List<ExamenesRecord>>(
                                                  stream: queryExamenesRecord(
                                                    queryBuilder:
                                                        (examenesRecord) =>
                                                            examenesRecord
                                                                .where(
                                                      'uid',
                                                      isEqualTo:
                                                          _model.refExamen,
                                                    ),
                                                    singleRecord: true,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 14.0,
                                                          height: 14.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<ExamenesRecord>
                                                        containerExamenesRecordList =
                                                        snapshot.data!;
                                                    final containerExamenesRecord =
                                                        containerExamenesRecordList
                                                                .isNotEmpty
                                                            ? containerExamenesRecordList
                                                                .first
                                                            : null;

                                                    return Container(
                                                      width: double.infinity,
                                                      constraints:
                                                          BoxConstraints(
                                                        minHeight: 500.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: StreamBuilder<
                                                          List<
                                                              ResultadosRecord>>(
                                                        stream:
                                                            queryResultadosRecord(
                                                          queryBuilder: (resultadosRecord) =>
                                                              resultadosRecord
                                                                  .where(
                                                                    'estudiante_ref',
                                                                    isEqualTo:
                                                                        widget
                                                                            .refUser
                                                                            ?.id,
                                                                  )
                                                                  .where(
                                                                    'examen_ref',
                                                                    isEqualTo:
                                                                        containerExamenesRecord
                                                                            ?.reference
                                                                            .id,
                                                                  )
                                                                  .where(
                                                                    'type',
                                                                    isEqualTo:
                                                                        widget
                                                                            .type,
                                                                  )
                                                                  .orderBy(
                                                                      'created_date',
                                                                      descending:
                                                                          true),
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 14.0,
                                                                height: 14.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<ResultadosRecord>
                                                              containerResultadosRecordList =
                                                              snapshot.data!;
                                                          final containerResultadosRecord =
                                                              containerResultadosRecordList
                                                                      .isNotEmpty
                                                                  ? containerResultadosRecordList
                                                                      .first
                                                                  : null;

                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            20.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          'Modo examen',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              104.0,
                                                                          height:
                                                                              3.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 5.0)),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        FFButtonWidget(
                                                                          onPressed:
                                                                              () {
                                                                            print('Button pressed ...');
                                                                          },
                                                                          text:
                                                                              valueOrDefault<String>(
                                                                            () {
                                                                              if (containerResultadosRecord?.fechaFinExamen != null) {
                                                                                return 'Finalizado';
                                                                              } else if (containerResultadosRecord?.fechaInicioExamen != null) {
                                                                                return 'En Proceso';
                                                                              } else {
                                                                                return 'Pendiente';
                                                                              }
                                                                            }(),
                                                                            'Pendiente',
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                26.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                25.0,
                                                                                0.0,
                                                                                25.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: Colors.white,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            elevation:
                                                                                0.0,
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.dateTimeFormat(getCurrentTimestamp),
                                                                            '-- / -- / ----  00:00',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: Color(0xFF979797),
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 25.0)),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            StreamBuilder<List<PreguntasRecord>>(
                                                                              stream: queryPreguntasRecord(
                                                                                queryBuilder: (preguntasRecord) => preguntasRecord.where(
                                                                                  'examen_ref',
                                                                                  isEqualTo: widget.refExamination?.reference.id != '' ? widget.refExamination?.reference.id : null,
                                                                                ),
                                                                              ),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: SizedBox(
                                                                                      width: 14.0,
                                                                                      height: 14.0,
                                                                                      child: CircularProgressIndicator(
                                                                                        valueColor: AlwaysStoppedAnimation<Color>(
                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                List<PreguntasRecord> richTextPreguntasRecordList = snapshot.data!;

                                                                                return RichText(
                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                  text: TextSpan(
                                                                                    children: [
                                                                                      TextSpan(
                                                                                        text: 'Examen ',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              color: Color(0xFF979797),
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                            ),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: ' de ',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              color: Color(0xFF979797),
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                            ),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: valueOrDefault<String>(
                                                                                          richTextPreguntasRecordList.length.toString(),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              color: Color(0xFF979797),
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                            ),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: ' preguntas',
                                                                                        style: TextStyle(
                                                                                          color: Color(0xFF979797),
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: Color(0xFF979797),
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    'Contenido de Examen',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: Color(0xFF01203F),
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ].divide(SizedBox(height: 10.0)),
                                                                      ),
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFF3F5FB),
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(5.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.arrow_right,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 24.0,
                                                                                ),
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    containerExamenesRecord?.nombre,
                                                                                    '-',
                                                                                  ),
                                                                                  maxLines: 1,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: Colors.black,
                                                                                        fontSize: 13.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            _model.refPreguntas =
                                                                                await queryPreguntasRecordOnce(
                                                                              queryBuilder: (preguntasRecord) => preguntasRecord.where(
                                                                                'examen_ref',
                                                                                isEqualTo: containerExamenesRecord?.reference.id,
                                                                              ),
                                                                              singleRecord: true,
                                                                            ).then((s) => s.firstOrNull);
                                                                            if (_model.refPreguntas !=
                                                                                null) {
                                                                              _model.refQuestion = await queryRespuestasRecordOnce(
                                                                                queryBuilder: (respuestasRecord) => respuestasRecord.where(
                                                                                  'uid_pregunta',
                                                                                  isEqualTo: _model.refPreguntas?.reference.id,
                                                                                ),
                                                                                singleRecord: true,
                                                                              ).then((s) => s.firstOrNull);
                                                                              if (_model.refQuestion != null) {
                                                                                if (containerResultadosRecord != null) {
                                                                                  _model.refResult = containerResultadosRecord;
                                                                                  safeSetState(() {});
                                                                                } else {
                                                                                  var resultadosRecordReference1 = ResultadosRecord.collection.doc();
                                                                                  await resultadosRecordReference1.set({
                                                                                    ...createResultadosRecordData(
                                                                                      estudianteRef: currentUserReference?.id,
                                                                                      estado: true,
                                                                                      type: widget.type,
                                                                                      examenRef: containerExamenesRecord?.reference.id,
                                                                                    ),
                                                                                    ...mapToFirestore(
                                                                                      {
                                                                                        'created_date': FieldValue.serverTimestamp(),
                                                                                      },
                                                                                    ),
                                                                                  });
                                                                                  _model.refResultado1 = ResultadosRecord.getDocumentFromData({
                                                                                    ...createResultadosRecordData(
                                                                                      estudianteRef: currentUserReference?.id,
                                                                                      estado: true,
                                                                                      type: widget.type,
                                                                                      examenRef: containerExamenesRecord?.reference.id,
                                                                                    ),
                                                                                    ...mapToFirestore(
                                                                                      {
                                                                                        'created_date': DateTime.now(),
                                                                                      },
                                                                                    ),
                                                                                  }, resultadosRecordReference1);

                                                                                  await _model.refResultado1!.reference.update(createResultadosRecordData(
                                                                                    uid: _model.refResultado1?.reference.id,
                                                                                  ));
                                                                                  _model.refResultCourse1 = await ResultadosRecord.getDocumentOnce(_model.refResultado1!.reference);
                                                                                  if (widget.type == 2) {
                                                                                    var registerSimulatorRecordReference = RegisterSimulatorRecord.collection.doc();
                                                                                    await registerSimulatorRecordReference.set({
                                                                                      ...createRegisterSimulatorRecordData(
                                                                                        uidUser: widget.refUser?.id,
                                                                                        uidCourse: widget.refCourse?.reference.id,
                                                                                      ),
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'created_date': FieldValue.serverTimestamp(),
                                                                                        },
                                                                                      ),
                                                                                    });
                                                                                    _model.refRegister = RegisterSimulatorRecord.getDocumentFromData({
                                                                                      ...createRegisterSimulatorRecordData(
                                                                                        uidUser: widget.refUser?.id,
                                                                                        uidCourse: widget.refCourse?.reference.id,
                                                                                      ),
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'created_date': DateTime.now(),
                                                                                        },
                                                                                      ),
                                                                                    }, registerSimulatorRecordReference);

                                                                                    await _model.refRegister!.reference.update(createRegisterSimulatorRecordData(
                                                                                      uid: _model.refRegister?.reference.id,
                                                                                    ));
                                                                                  }
                                                                                  _model.refResult = _model.refResultCourse1;
                                                                                  safeSetState(() {});
                                                                                }

                                                                                if (!(_model.refResult?.fechaInicioExamen != null)) {
                                                                                  await _model.refResult!.reference.update({
                                                                                    ...mapToFirestore(
                                                                                      {
                                                                                        'fecha_inicio_examen': FieldValue.serverTimestamp(),
                                                                                      },
                                                                                    ),
                                                                                  });
                                                                                  _model.refResultCourse2 = await ResultadosRecord.getDocumentOnce(_model.refResult!.reference);
                                                                                  _model.refResult = _model.refResultCourse2;
                                                                                  safeSetState(() {});
                                                                                }
                                                                                if (_model.refResult?.fechaFinExamen != null) {
                                                                                  context.pushNamed(
                                                                                    ExaminationQuestionsFrmRespuestasWidget.routeName,
                                                                                    queryParameters: {
                                                                                      'refExamination': serializeParam(
                                                                                        widget.refExamination,
                                                                                        ParamType.Document,
                                                                                      ),
                                                                                      'refUser': serializeParam(
                                                                                        widget.refUser,
                                                                                        ParamType.DocumentReference,
                                                                                      ),
                                                                                      'type': serializeParam(
                                                                                        widget.type,
                                                                                        ParamType.int,
                                                                                      ),
                                                                                      'isdemo': serializeParam(
                                                                                        widget.isdemo,
                                                                                        ParamType.bool,
                                                                                      ),
                                                                                      'refCourse': serializeParam(
                                                                                        widget.refCourse,
                                                                                        ParamType.Document,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                    extra: <String, dynamic>{
                                                                                      'refExamination': widget.refExamination,
                                                                                      'refCourse': widget.refCourse,
                                                                                      kTransitionInfoKey: TransitionInfo(
                                                                                        hasTransition: true,
                                                                                        transitionType: PageTransitionType.fade,
                                                                                        duration: Duration(milliseconds: 0),
                                                                                      ),
                                                                                    },
                                                                                  );
                                                                                } else {
                                                                                  context.pushNamed(
                                                                                    ExaminationQuestionsFinalWidget.routeName,
                                                                                    queryParameters: {
                                                                                      'refExamination': serializeParam(
                                                                                        containerExamenesRecord,
                                                                                        ParamType.Document,
                                                                                      ),
                                                                                      'refResult': serializeParam(
                                                                                        _model.refResult,
                                                                                        ParamType.Document,
                                                                                      ),
                                                                                      'refCourse': serializeParam(
                                                                                        widget.refCourse,
                                                                                        ParamType.Document,
                                                                                      ),
                                                                                      'refUser': serializeParam(
                                                                                        currentUserReference,
                                                                                        ParamType.DocumentReference,
                                                                                      ),
                                                                                      'type': serializeParam(
                                                                                        widget.type,
                                                                                        ParamType.int,
                                                                                      ),
                                                                                      'isdemo': serializeParam(
                                                                                        widget.isdemo,
                                                                                        ParamType.bool,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                    extra: <String, dynamic>{
                                                                                      'refExamination': containerExamenesRecord,
                                                                                      'refResult': _model.refResult,
                                                                                      'refCourse': widget.refCourse,
                                                                                      kTransitionInfoKey: TransitionInfo(
                                                                                        hasTransition: true,
                                                                                        transitionType: PageTransitionType.fade,
                                                                                        duration: Duration(milliseconds: 0),
                                                                                      ),
                                                                                    },
                                                                                  );
                                                                                }

                                                                                await Future.delayed(const Duration(milliseconds: 1000));
                                                                              }
                                                                            }

                                                                            safeSetState(() {});
                                                                          },
                                                                          text:
                                                                              valueOrDefault<String>(
                                                                            () {
                                                                              if (containerResultadosRecord?.fechaFinExamen != null) {
                                                                                return 'Ver resultados';
                                                                              } else if (containerResultadosRecord?.fechaInicioExamen != null) {
                                                                                return 'Continuar examen';
                                                                              } else {
                                                                                return 'Empezar examen';
                                                                              }
                                                                            }(),
                                                                            'Empezar examen',
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                26.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                35.0,
                                                                                0.0,
                                                                                35.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: Colors.white,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                            elevation:
                                                                                0.0,
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(height: 20.0)).around(
                                                                              SizedBox(height: 20.0)),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          5.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 20.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
