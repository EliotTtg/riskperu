import '/backend/backend.dart';
import '/components/time_mobil_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/header_mobil/header_mobil_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'examination_questions_frm_respuestas_model.dart';
export 'examination_questions_frm_respuestas_model.dart';

class ExaminationQuestionsFrmRespuestasWidget extends StatefulWidget {
  const ExaminationQuestionsFrmRespuestasWidget({
    super.key,
    required this.refExamination,
    required this.refUser,
    required this.type,
    required this.isdemo,
    required this.refCourse,
  });

  final ExamenesRecord? refExamination;
  final DocumentReference? refUser;
  final int? type;
  final bool? isdemo;
  final CoursesRecord? refCourse;

  static String routeName = 'examinationQuestionsFrmRespuestas';
  static String routePath = 'ExaminationQuestionsFinalFrmRespuestas';

  @override
  State<ExaminationQuestionsFrmRespuestasWidget> createState() =>
      _ExaminationQuestionsFrmRespuestasWidgetState();
}

class _ExaminationQuestionsFrmRespuestasWidgetState
    extends State<ExaminationQuestionsFrmRespuestasWidget> {
  late ExaminationQuestionsFrmRespuestasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => ExaminationQuestionsFrmRespuestasModel());

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
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                          child: SingleChildScrollView(
                            primary: false,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                StreamBuilder<List<ResultadosRecord>>(
                                  stream: queryResultadosRecord(
                                    queryBuilder: (resultadosRecord) =>
                                        resultadosRecord
                                            .where(
                                              'estudiante_ref',
                                              isEqualTo: widget.refUser?.id,
                                            )
                                            .where(
                                              'examen_ref',
                                              isEqualTo: widget
                                                  .refExamination?.reference.id,
                                            )
                                            .orderBy('created_date',
                                                descending: true),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 14.0,
                                          height: 14.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<ResultadosRecord>
                                        containerResultadosRecordList =
                                        snapshot.data!;

                                    return Container(
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            StreamBuilder<
                                                List<PreguntasRecord>>(
                                              stream: queryPreguntasRecord(
                                                queryBuilder:
                                                    (preguntasRecord) =>
                                                        preguntasRecord.where(
                                                  'examen_ref',
                                                  isEqualTo: widget
                                                      .refExamination
                                                      ?.reference
                                                      .id,
                                                ),
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
                                                List<PreguntasRecord>
                                                    containerPreguntasRecordList =
                                                    snapshot.data!;

                                                return Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Puntaje Final',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                        RichText(
                                                          textScaler:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  containerResultadosRecordList
                                                                      .firstOrNull
                                                                      ?.calificacion
                                                                      .toString(),
                                                                  '0',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      fontSize:
                                                                          24.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: ' Puntos',
                                                                style:
                                                                    TextStyle(),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  fontSize:
                                                                      24.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                        RichText(
                                                          textScaler:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  formatNumber(
                                                                    containerResultadosRecordList
                                                                        .firstOrNull
                                                                        ?.cantidadCorrectas,
                                                                    formatType:
                                                                        FormatType
                                                                            .custom,
                                                                    format: '0',
                                                                    locale: '',
                                                                  ),
                                                                  '0',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: ' de ',
                                                                style:
                                                                    TextStyle(),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  containerPreguntasRecordList
                                                                      .length
                                                                      .toString(),
                                                                  '0',
                                                                ),
                                                                style:
                                                                    TextStyle(),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                            Builder(
                                              builder: (context) {
                                                final listResultados =
                                                    containerResultadosRecordList
                                                        .toList();

                                                return FlutterFlowDataTable<
                                                    ResultadosRecord>(
                                                  controller: _model
                                                      .paginatedDataTableController,
                                                  data: listResultados,
                                                  columnsBuilder:
                                                      (onSortChanged) => [
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Text(
                                                          'Fecha',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Text(
                                                          'Intento',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Text(
                                                          'Tiempo',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            'Puntuaje',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                  dataRowBuilder:
                                                      (listResultadosItem,
                                                              listResultadosIndex,
                                                              selected,
                                                              onSelectChanged) =>
                                                          DataRow(
                                                    color: WidgetStateProperty
                                                        .all(
                                                      listResultadosIndex % 2 ==
                                                              0
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                    ),
                                                    cells: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          dateTimeFormat(
                                                            "d/M/y",
                                                            listResultadosItem
                                                                .fechaInicioExamen,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          '-- / -- / ----',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                      RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: 'Intento ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  valueOrDefault<
                                                                      String>(
                                                                (((containerResultadosRecordList.length -
                                                                                1) +
                                                                            1) -
                                                                        listResultadosIndex)
                                                                    .toString(),
                                                                '1',
                                                              ),
                                                              style:
                                                                  TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .timeMobilModels
                                                            .getModel(
                                                          listResultadosItem
                                                              .reference.id,
                                                          listResultadosIndex,
                                                        ),
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: TimeMobilWidget(
                                                          key: Key(
                                                            'Keyzz7_${listResultadosItem.reference.id}',
                                                          ),
                                                          parameter1:
                                                              listResultadosItem
                                                                  .tiempoTranscurrido,
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: StreamBuilder<
                                                            List<
                                                                PreguntasRecord>>(
                                                          stream:
                                                              queryPreguntasRecord(
                                                            queryBuilder: (preguntasRecord) =>
                                                                preguntasRecord
                                                                    .where(
                                                                      'examen_ref',
                                                                      isEqualTo: widget.refExamination?.reference.id !=
                                                                              ''
                                                                          ? widget
                                                                              .refExamination
                                                                              ?.reference
                                                                              .id
                                                                          : null,
                                                                    )
                                                                    .orderBy(
                                                                        'created_time',
                                                                        descending:
                                                                            true),
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
                                                            List<PreguntasRecord>
                                                                richTextPreguntasRecordList =
                                                                snapshot.data!;

                                                            return RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: valueOrDefault<
                                                                        String>(
                                                                      listResultadosItem
                                                                          .cantidadCorrectas
                                                                          .toString(),
                                                                      '0',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                  TextSpan(
                                                                    text:
                                                                        ' de ',
                                                                    style:
                                                                        TextStyle(),
                                                                  ),
                                                                  TextSpan(
                                                                    text: valueOrDefault<
                                                                        String>(
                                                                      richTextPreguntasRecordList
                                                                          .length
                                                                          .toString(),
                                                                      '0',
                                                                    ),
                                                                    style:
                                                                        TextStyle(),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ]
                                                        .map((c) => DataCell(c))
                                                        .toList(),
                                                  ),
                                                  paginated: true,
                                                  selectable: false,
                                                  hidePaginator: false,
                                                  showFirstLastButtons: true,
                                                  height: 500.0,
                                                  minWidth: 500.0,
                                                  headingRowHeight: 56.0,
                                                  dataRowHeight: 48.0,
                                                  columnSpacing: 20.0,
                                                  headingRowColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  addHorizontalDivider: true,
                                                  addTopAndBottomDivider: false,
                                                  hideDefaultHorizontalDivider:
                                                      true,
                                                  horizontalDividerColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  horizontalDividerThickness:
                                                      1.0,
                                                  addVerticalDivider: false,
                                                );
                                              },
                                            ),
                                            if (((containerResultadosRecordList
                                                            .length <=
                                                        2) &&
                                                    (widget.type == 1)) ||
                                                (widget.type == 2))
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  context.goNamed(
                                                    ExaminationQuestionsViewMobilWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'refExamination':
                                                          serializeParam(
                                                        widget.refExamination,
                                                        ParamType.Document,
                                                      ),
                                                      'refCourse':
                                                          serializeParam(
                                                        widget.refCourse,
                                                        ParamType.Document,
                                                      ),
                                                      'refUser': serializeParam(
                                                        widget.refUser,
                                                        ParamType
                                                            .DocumentReference,
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
                                                      'refExamination': widget
                                                          .refExamination,
                                                      'refCourse':
                                                          widget.refCourse,
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                        duration: Duration(
                                                            milliseconds: 0),
                                                      ),
                                                    },
                                                  );

                                                  await containerResultadosRecordList
                                                      .firstOrNull!.reference
                                                      .update(
                                                          createResultadosRecordData(
                                                    estado: false,
                                                  ));

                                                  var resultadosRecordReference1 =
                                                      ResultadosRecord
                                                          .collection
                                                          .doc();
                                                  await resultadosRecordReference1
                                                      .set({
                                                    ...createResultadosRecordData(
                                                      estudianteRef:
                                                          widget.refUser?.id,
                                                      estado: true,
                                                      examenRef: widget
                                                          .refExamination
                                                          ?.reference
                                                          .id,
                                                      type: widget.type,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'created_date': FieldValue
                                                            .serverTimestamp(),
                                                      },
                                                    ),
                                                  });
                                                  _model.refResult =
                                                      ResultadosRecord
                                                          .getDocumentFromData({
                                                    ...createResultadosRecordData(
                                                      estudianteRef:
                                                          widget.refUser?.id,
                                                      estado: true,
                                                      examenRef: widget
                                                          .refExamination
                                                          ?.reference
                                                          .id,
                                                      type: widget.type,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'created_date':
                                                            DateTime.now(),
                                                      },
                                                    ),
                                                  }, resultadosRecordReference1);

                                                  await _model
                                                      .refResult!.reference
                                                      .update(
                                                          createResultadosRecordData(
                                                    uid: _model.refResult
                                                        ?.reference.id,
                                                  ));
                                                  if (widget.type == 2) {
                                                    var registerSimulatorRecordReference =
                                                        RegisterSimulatorRecord
                                                            .collection
                                                            .doc();
                                                    await registerSimulatorRecordReference
                                                        .set({
                                                      ...createRegisterSimulatorRecordData(
                                                        uidUser:
                                                            widget.refUser?.id,
                                                        uidCourse: widget
                                                            .refCourse
                                                            ?.reference
                                                            .id,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'created_date': FieldValue
                                                              .serverTimestamp(),
                                                        },
                                                      ),
                                                    });
                                                    _model.refRegister =
                                                        RegisterSimulatorRecord
                                                            .getDocumentFromData({
                                                      ...createRegisterSimulatorRecordData(
                                                        uidUser:
                                                            widget.refUser?.id,
                                                        uidCourse: widget
                                                            .refCourse
                                                            ?.reference
                                                            .id,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'created_date':
                                                              DateTime.now(),
                                                        },
                                                      ),
                                                    }, registerSimulatorRecordReference);

                                                    await _model
                                                        .refRegister!.reference
                                                        .update(
                                                            createRegisterSimulatorRecordData(
                                                      uid: _model.refRegister
                                                          ?.reference.id,
                                                    ));
                                                  }
                                                  _model.referenciaResultado =
                                                      await ResultadosRecord
                                                          .getDocumentOnce(
                                                              _model.refResult!
                                                                  .reference);
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 1000));

                                                  safeSetState(() {});
                                                },
                                                text: 'Reintentar',
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                              ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                context.goNamed(
                                                  ExaminationQuestionsViewMobilWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'refExamination':
                                                        serializeParam(
                                                      widget.refExamination,
                                                      ParamType.Document,
                                                    ),
                                                    'refCourse': serializeParam(
                                                      widget.refCourse,
                                                      ParamType.Document,
                                                    ),
                                                    'refUser': serializeParam(
                                                      widget.refUser,
                                                      ParamType
                                                          .DocumentReference,
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
                                                    'refExamination':
                                                        widget.refExamination,
                                                    'refCourse':
                                                        widget.refCourse,
                                                    kTransitionInfoKey:
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                    ),
                                                  },
                                                );
                                              },
                                              text: 'Cerrar',
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                elevation: 0.0,
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 10.0)),
                                        ),
                                      ),
                                    );
                                  },
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
          ),
        ));
  }
}
