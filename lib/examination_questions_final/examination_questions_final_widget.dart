import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/alerta_terminar_examen/alerta_terminar_examen_widget.dart';
import '/pages/from_result_examination/from_result_examination_widget.dart';
import '/pages/header/header_widget.dart';
import '/pages/navbar/navbar_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'examination_questions_final_model.dart';
export 'examination_questions_final_model.dart';

class ExaminationQuestionsFinalWidget extends StatefulWidget {
  const ExaminationQuestionsFinalWidget({
    super.key,
    required this.refExamination,
    required this.refResult,
    required this.refCourse,
    required this.refUser,
    required this.type,
    required this.isdemo,
  });

  final ExamenesRecord? refExamination;
  final ResultadosRecord? refResult;
  final CoursesRecord? refCourse;
  final DocumentReference? refUser;
  final int? type;
  final bool? isdemo;

  static String routeName = 'examinationQuestionsFinal';
  static String routePath = 'ExaminationQuestionsFinal';

  @override
  State<ExaminationQuestionsFinalWidget> createState() =>
      _ExaminationQuestionsFinalWidgetState();
}

class _ExaminationQuestionsFinalWidgetState
    extends State<ExaminationQuestionsFinalWidget> {
  late ExaminationQuestionsFinalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExaminationQuestionsFinalModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
      await Future.wait([
        Future(() async {
          _model.porcentajeCourse = await actions.porcentajeCourseLinea(
            widget.refCourse!,
            widget.refUser!,
            widget.isdemo!,
          );
        }),
        Future(() async {
          _model.porcentajeExamenes = await actions.porcentajeCourseLinea(
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
    context.watch<FFAppState>();

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
                    model: _model.headerModel,
                    updateCallback: () => safeSetState(() {}),
                    child: HeaderWidget(),
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            30.0, 30.0, 30.0, 30.0),
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              StreamBuilder<
                                                  List<ExamGroupsRecord>>(
                                                stream: queryExamGroupsRecord(
                                                  queryBuilder:
                                                      (examGroupsRecord) =>
                                                          examGroupsRecord
                                                              .where(
                                                                'uid_Course',
                                                                isEqualTo: widget
                                                                    .refCourse
                                                                    ?.reference
                                                                    .id,
                                                              )
                                                              .where(
                                                                'is_demo',
                                                                isEqualTo:
                                                                    widget
                                                                        .isdemo,
                                                              )
                                                              .orderBy(
                                                                  'Created_date'),
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
                                                  List<ExamGroupsRecord>
                                                      containerExamGroupsRecordList =
                                                      snapshot.data!;

                                                  return Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.3,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(20.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.safePop();
                                                            },
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      'Regresar al Curso',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.1,
                                                                  height: 3.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              widget.refCourse
                                                                  ?.name,
                                                              '-',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  fontSize:
                                                                      24.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                          LinearPercentIndicator(
                                                            percent:
                                                                valueOrDefault<
                                                                    double>(
                                                              _model
                                                                  .porcentajeCourse,
                                                              0.0,
                                                            ),
                                                            lineHeight: 5.0,
                                                            animation: true,
                                                            animateFromLastPercent:
                                                                true,
                                                            progressColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                            center: Text(
                                                              '50%',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        0.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                  ),
                                                            ),
                                                            padding:
                                                                EdgeInsets.zero,
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: valueOrDefault<
                                                                          String>(
                                                                        formatNumber(
                                                                          _model
                                                                              .porcentajeExamenes,
                                                                          formatType:
                                                                              FormatType.custom,
                                                                          format:
                                                                              '0',
                                                                          locale:
                                                                              '',
                                                                        ),
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: '%',
                                                                      style:
                                                                          TextStyle(),
                                                                    ),
                                                                    TextSpan(
                                                                      text:
                                                                          ' completo',
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                      ),
                                                                ),
                                                              ),
                                                              Text(
                                                                'Ultima Visita el 18 de Marzo de 2025 15:27',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Divider(
                                                            height: 1.0,
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                          ),
                                                          Builder(
                                                            builder: (context) {
                                                              final listCategoria =
                                                                  containerExamGroupsRecordList
                                                                      .toList();

                                                              return ListView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    listCategoria
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        listCategoriaIndex) {
                                                                  final listCategoriaItem =
                                                                      listCategoria[
                                                                          listCategoriaIndex];
                                                                  return StreamBuilder<
                                                                      List<
                                                                          ExamenesRecord>>(
                                                                    stream:
                                                                        queryExamenesRecord(
                                                                      queryBuilder: (examenesRecord) => examenesRecord
                                                                          .where(
                                                                            'uid_Group',
                                                                            isEqualTo:
                                                                                listCategoriaItem.reference.id,
                                                                          )
                                                                          .where(
                                                                            'state',
                                                                            isEqualTo:
                                                                                true,
                                                                          )
                                                                          .orderBy('fecha_creacion'),
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                14.0,
                                                                            height:
                                                                                14.0,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<ExamenesRecord>
                                                                          containerExamenesRecordList =
                                                                          snapshot
                                                                              .data!;

                                                                      return Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                if (_model.refGroupExamen == listCategoriaItem.reference.id) {
                                                                                  _model.refGroupExamen = null;
                                                                                  safeSetState(() {});
                                                                                } else {
                                                                                  _model.refGroupExamen = null;
                                                                                  safeSetState(() {});
                                                                                  _model.refGroupExamen = listCategoriaItem.reference.id;
                                                                                  safeSetState(() {});
                                                                                }
                                                                              },
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0x82F1F1F1),
                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Flexible(
                                                                                            child: RichText(
                                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                                              text: TextSpan(
                                                                                                children: [
                                                                                                  TextSpan(
                                                                                                    text: listCategoriaItem.name,
                                                                                                    style: TextStyle(
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontWeight: FontWeight.w300,
                                                                                                      fontSize: 16.0,
                                                                                                    ),
                                                                                                  )
                                                                                                ],
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      fontSize: 16.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            decoration: BoxDecoration(),
                                                                                            child: FaIcon(
                                                                                              FontAwesomeIcons.caretDown,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              size: 19.0,
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 20.0)),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          RichText(
                                                                                            textScaler: MediaQuery.of(context).textScaler,
                                                                                            text: TextSpan(
                                                                                              children: [
                                                                                                TextSpan(
                                                                                                  text: '0',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        fontSize: 16.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                                TextSpan(
                                                                                                  text: '/',
                                                                                                  style: TextStyle(
                                                                                                    fontSize: 16.0,
                                                                                                  ),
                                                                                                ),
                                                                                                TextSpan(
                                                                                                  text: valueOrDefault<String>(
                                                                                                    containerExamenesRecordList.length.toString(),
                                                                                                    '0',
                                                                                                  ),
                                                                                                  style: TextStyle(),
                                                                                                )
                                                                                              ],
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    fontSize: 16.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 5.0)),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            if (_model.refGroupExamen ==
                                                                                listCategoriaItem.reference.id)
                                                                              Builder(
                                                                                builder: (context) {
                                                                                  final listaexamenes = containerExamenesRecordList.toList();

                                                                                  return ListView.builder(
                                                                                    padding: EdgeInsets.zero,
                                                                                    shrinkWrap: true,
                                                                                    scrollDirection: Axis.vertical,
                                                                                    itemCount: listaexamenes.length,
                                                                                    itemBuilder: (context, listaexamenesIndex) {
                                                                                      final listaexamenesItem = listaexamenes[listaexamenesIndex];
                                                                                      return InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          context.pushNamed(
                                                                                            ExaminationQuestionsViewWidget.routeName,
                                                                                            queryParameters: {
                                                                                              'refExamination': serializeParam(
                                                                                                listaexamenesItem,
                                                                                                ParamType.Document,
                                                                                              ),
                                                                                              'refCourse': serializeParam(
                                                                                                widget.refCourse,
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
                                                                                                false,
                                                                                                ParamType.bool,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                            extra: <String, dynamic>{
                                                                                              'refExamination': listaexamenesItem,
                                                                                              'refCourse': widget.refCourse,
                                                                                              kTransitionInfoKey: TransitionInfo(
                                                                                                hasTransition: true,
                                                                                                transitionType: PageTransitionType.fade,
                                                                                                duration: Duration(milliseconds: 0),
                                                                                              ),
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                        child: Container(
                                                                                          width: double.infinity,
                                                                                          decoration: BoxDecoration(
                                                                                            color: valueOrDefault<Color>(
                                                                                              _model.refExamen == listaexamenesItem.reference.id ? FlutterFlowTheme.of(context).alternate : Colors.white,
                                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            ),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                                                                                                      child: RichText(
                                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                                        text: TextSpan(
                                                                                                          children: [
                                                                                                            TextSpan(
                                                                                                              text: valueOrDefault<String>(
                                                                                                                listaexamenesItem.nombre,
                                                                                                                '-',
                                                                                                              ),
                                                                                                              style: TextStyle(),
                                                                                                            )
                                                                                                          ],
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                lineHeight: 1.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(width: 10.0)),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                },
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 10.0)),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                              Flexible(
                                                child: StreamBuilder<
                                                    List<PreguntasRecord>>(
                                                  stream: queryPreguntasRecord(
                                                    queryBuilder:
                                                        (preguntasRecord) =>
                                                            preguntasRecord
                                                                .where(
                                                                  'examen_ref',
                                                                  isEqualTo: widget
                                                                              .refExamination
                                                                              ?.reference
                                                                              .id !=
                                                                          ''
                                                                      ? widget
                                                                          .refExamination
                                                                          ?.reference
                                                                          .id
                                                                      : null,
                                                                )
                                                                .orderBy(
                                                                    'created_time'),
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
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    30.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFFEFF3F6),
                                                                          borderRadius:
                                                                              BorderRadius.circular(4.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(10.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    'Limite de tiempo: ',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  Builder(
                                                                                    builder: (context) => FlutterFlowTimer(
                                                                                      initialTime: valueOrDefault<int>(
                                                                                        functions.tiempoRestanteExamen(
                                                                                            widget.refResult!.fechaInicioExamen!,
                                                                                            valueOrDefault<int>(
                                                                                              widget.refExamination?.tiempoLimite,
                                                                                              0,
                                                                                            )),
                                                                                        0,
                                                                                      ),
                                                                                      getDisplayTime: (value) => StopWatchTimer.getDisplayTime(value, milliSecond: false),
                                                                                      controller: _model.timerController,
                                                                                      updateStateInterval: Duration(milliseconds: 1000),
                                                                                      onChanged: (value, displayTime, shouldUpdate) {
                                                                                        _model.timerMilliseconds = value;
                                                                                        _model.timerValue = displayTime;
                                                                                        if (shouldUpdate) safeSetState(() {});
                                                                                      },
                                                                                      onEnded: () async {
                                                                                        _model.timerController.onStopTimer();
                                                                                        await actions.actualizarResultadoExamen(
                                                                                          widget.refResult!.reference.id,
                                                                                        );
                                                                                        await actions.deleteRegister(
                                                                                          widget.refExamination!.reference.id,
                                                                                          widget.refUser!.id,
                                                                                          widget.refCourse!.reference.id,
                                                                                        );
                                                                                        _model.resultadoFinalBienTime = await ResultadosRecord.getDocumentOnce(widget.refResult!.reference);
                                                                                        await showDialog(
                                                                                          context: context,
                                                                                          builder: (dialogContext) {
                                                                                            return Dialog(
                                                                                              elevation: 0,
                                                                                              insetPadding: EdgeInsets.zero,
                                                                                              backgroundColor: Colors.transparent,
                                                                                              alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                              child: GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: FromResultExaminationWidget(
                                                                                                  refResult: _model.resultadoFinalBienTime!,
                                                                                                  refUser: widget.refUser!,
                                                                                                  refExamen: widget.refExamination!,
                                                                                                  refCourse: widget.refCourse!,
                                                                                                  type: widget.type!,
                                                                                                  isdemo: widget.isdemo!,
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );

                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      textAlign: TextAlign.start,
                                                                                      style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              LinearPercentIndicator(
                                                                                percent: valueOrDefault<double>(
                                                                                  (1 - (DateTime.now().difference(DateTime.parse(widget.refResult!.fechaInicioExamen!.toString())).inMinutes.toDouble() / widget.refExamination!.tiempoLimite)).clamp(0.0, 1.0),
                                                                                  0.0,
                                                                                ),
                                                                                lineHeight: 5.0,
                                                                                animation: true,
                                                                                animateFromLastPercent: true,
                                                                                progressColor: FlutterFlowTheme.of(context).primary,
                                                                                backgroundColor: FlutterFlowTheme.of(context).accent4,
                                                                                center: Text(
                                                                                  '50%',
                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 0.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w300,
                                                                                      ),
                                                                                ),
                                                                                padding: EdgeInsets.zero,
                                                                              ),
                                                                            ].divide(SizedBox(height: 5.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFFEFF3F6),
                                                                          borderRadius:
                                                                              BorderRadius.circular(4.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(10.0),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final listaPreguntas = containerPreguntasRecordList.toList();

                                                                              return Wrap(
                                                                                spacing: 10.0,
                                                                                runSpacing: 10.0,
                                                                                alignment: WrapAlignment.start,
                                                                                crossAxisAlignment: WrapCrossAlignment.start,
                                                                                direction: Axis.horizontal,
                                                                                runAlignment: WrapAlignment.start,
                                                                                verticalDirection: VerticalDirection.down,
                                                                                clipBehavior: Clip.antiAlias,
                                                                                children: List.generate(listaPreguntas.length, (listaPreguntasIndex) {
                                                                                  final listaPreguntasItem = listaPreguntas[listaPreguntasIndex];
                                                                                  return StreamBuilder<List<RespuestaStateRecord>>(
                                                                                    stream: queryRespuestaStateRecord(
                                                                                      queryBuilder: (respuestaStateRecord) => respuestaStateRecord
                                                                                          .where(
                                                                                            'uis_user',
                                                                                            isEqualTo: widget.refUser?.id,
                                                                                          )
                                                                                          .where(
                                                                                            'uid_examen',
                                                                                            isEqualTo: widget.refExamination?.reference.id,
                                                                                          )
                                                                                          .where(
                                                                                            'uid_question',
                                                                                            isEqualTo: listaPreguntasItem.reference.id,
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
                                                                                            child: CircularProgressIndicator(
                                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                FlutterFlowTheme.of(context).primary,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                      List<RespuestaStateRecord> containerRespuestaStateRecordList = snapshot.data!;
                                                                                      final containerRespuestaStateRecord = containerRespuestaStateRecordList.isNotEmpty ? containerRespuestaStateRecordList.first : null;

                                                                                      return Container(
                                                                                        decoration: BoxDecoration(),
                                                                                        child: StreamBuilder<List<UsersAnswersRecord>>(
                                                                                          stream: queryUsersAnswersRecord(
                                                                                            queryBuilder: (usersAnswersRecord) => usersAnswersRecord
                                                                                                .where(
                                                                                                  'uid_user',
                                                                                                  isEqualTo: widget.refResult?.estudianteRef,
                                                                                                )
                                                                                                .where(
                                                                                                  'uid_pregunta',
                                                                                                  isEqualTo: listaPreguntasItem.reference.id,
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
                                                                                            List<UsersAnswersRecord> containerUsersAnswersRecordList = snapshot.data!;

                                                                                            return Container(
                                                                                              decoration: BoxDecoration(),
                                                                                              child: StreamBuilder<List<RespuestasRecord>>(
                                                                                                stream: queryRespuestasRecord(
                                                                                                  queryBuilder: (respuestasRecord) => respuestasRecord
                                                                                                      .where(
                                                                                                        'uid_pregunta',
                                                                                                        isEqualTo: listaPreguntasItem.reference.id,
                                                                                                      )
                                                                                                      .where(
                                                                                                        'es_correcta',
                                                                                                        isEqualTo: true,
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
                                                                                                  List<RespuestasRecord> containerRespuestasRecordList = snapshot.data!;

                                                                                                  return InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      _model.indexQuestion = listaPreguntasIndex;
                                                                                                      _model.stateEnding = false;
                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      height: 30.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: valueOrDefault<Color>(
                                                                                                          containerRespuestaStateRecord != null
                                                                                                              ? valueOrDefault<Color>(
                                                                                                                  Set.from(containerRespuestasRecordList.map((e) => e.reference.id).toList()).containsAll(containerUsersAnswersRecordList.map((e) => e.respuestaUid).toList()) && Set.from(containerUsersAnswersRecordList.map((e) => e.respuestaUid).toList()).containsAll(containerRespuestasRecordList.map((e) => e.reference.id).toList()) ? Color(0xFF00A133) : Color(0xFFBD0020),
                                                                                                                  Color(0xFFBD0020),
                                                                                                                )
                                                                                                              : Color(0xFFEFF3F6),
                                                                                                          Color(0xFFEFF3F6),
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(4.0),
                                                                                                        border: Border.all(
                                                                                                          color: valueOrDefault<Color>(
                                                                                                            listaPreguntasIndex == _model.indexQuestion ? FlutterFlowTheme.of(context).secondary : Color(0xFFBFBFBF),
                                                                                                            Color(0xFFBFBFBF),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(15.0, 3.0, 15.0, 3.0),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            (listaPreguntasIndex + 1).toString(),
                                                                                                            '1',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                color: valueOrDefault<Color>(
                                                                                                                  containerRespuestaStateRecord != null ? FlutterFlowTheme.of(context).secondaryBackground : FlutterFlowTheme.of(context).primaryText,
                                                                                                                  FlutterFlowTheme.of(context).primaryText,
                                                                                                                ),
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                }),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            5.0)),
                                                                  ),
                                                                ),
                                                                if (!_model
                                                                    .stateEnding)
                                                                  RichText(
                                                                    textScaler:
                                                                        MediaQuery.of(context)
                                                                            .textScaler,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              'PREGUNTA ',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: Color(0xFF979797),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              valueOrDefault<String>(
                                                                            (valueOrDefault<int>(
                                                                                      _model.indexQuestion,
                                                                                      0,
                                                                                    ) +
                                                                                    1)
                                                                                .toString(),
                                                                            '0',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: Color(0xFF979797),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              ' de ',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: Color(0xFF979797),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              valueOrDefault<String>(
                                                                            containerPreguntasRecordList.length.toString(),
                                                                            '0',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: Color(0xFF979797),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                Color(0xFF979797),
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    if (!_model
                                                                        .stateEnding)
                                                                      StreamBuilder<
                                                                          List<
                                                                              PreguntasRecord>>(
                                                                        stream:
                                                                            queryPreguntasRecord(
                                                                          queryBuilder: (preguntasRecord) =>
                                                                              preguntasRecord.where(
                                                                            'uid',
                                                                            isEqualTo:
                                                                                containerPreguntasRecordList.elementAtOrNull(_model.indexQuestion)?.reference.id,
                                                                          ),
                                                                          singleRecord:
                                                                              true,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<PreguntasRecord>
                                                                              containerPreguntasRecordList =
                                                                              snapshot.data!;
                                                                          final containerPreguntasRecord = containerPreguntasRecordList.isNotEmpty
                                                                              ? containerPreguntasRecordList.first
                                                                              : null;

                                                                          return Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                          child: RichText(
                                                                                            textScaler: MediaQuery.of(context).textScaler,
                                                                                            text: TextSpan(
                                                                                              children: [
                                                                                                TextSpan(
                                                                                                  text: valueOrDefault<String>(
                                                                                                    (valueOrDefault<int>(
                                                                                                              _model.indexQuestion,
                                                                                                              0,
                                                                                                            ) +
                                                                                                            1)
                                                                                                        .toString(),
                                                                                                    '1',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                                TextSpan(
                                                                                                  text: '.',
                                                                                                  style: TextStyle(),
                                                                                                ),
                                                                                                TextSpan(
                                                                                                  text: ' Pregunta',
                                                                                                  style: TextStyle(),
                                                                                                )
                                                                                              ],
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 10.0)),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Divider(
                                                                                  height: 4.0,
                                                                                  thickness: 1.0,
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                                StreamBuilder<List<RespuestaStateRecord>>(
                                                                                  stream: queryRespuestaStateRecord(
                                                                                    queryBuilder: (respuestaStateRecord) => respuestaStateRecord
                                                                                        .where(
                                                                                          'uis_user',
                                                                                          isEqualTo: widget.refUser?.id,
                                                                                        )
                                                                                        .where(
                                                                                          'uid_examen',
                                                                                          isEqualTo: widget.refExamination?.reference.id,
                                                                                        )
                                                                                        .where(
                                                                                          'uid_question',
                                                                                          isEqualTo: containerPreguntasRecord?.reference.id,
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
                                                                                          child: CircularProgressIndicator(
                                                                                            valueColor: AlwaysStoppedAnimation<Color>(
                                                                                              FlutterFlowTheme.of(context).primary,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                    List<RespuestaStateRecord> containerRespuestaStateRecordList = snapshot.data!;
                                                                                    final containerRespuestaStateRecord = containerRespuestaStateRecordList.isNotEmpty ? containerRespuestaStateRecordList.first : null;

                                                                                    return Container(
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              if (containerPreguntasRecord?.enunciado != null && containerPreguntasRecord?.enunciado != '')
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      containerPreguntasRecord?.enunciado,
                                                                                                      '-',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                                                                                                child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    containerPreguntasRecord?.texto,
                                                                                                    '-',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                                                                                                child: StreamBuilder<List<RespuestasRecord>>(
                                                                                                  stream: queryRespuestasRecord(
                                                                                                    queryBuilder: (respuestasRecord) => respuestasRecord
                                                                                                        .where(
                                                                                                          'uid_pregunta',
                                                                                                          isEqualTo: containerPreguntasRecord?.reference.id,
                                                                                                        )
                                                                                                        .orderBy('created_date', descending: true),
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
                                                                                                    List<RespuestasRecord> containerRespuestasRecordList = snapshot.data!;

                                                                                                    return Container(
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Container(
                                                                                                        decoration: BoxDecoration(),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            if (!(containerRespuestaStateRecord != null))
                                                                                                              Container(
                                                                                                                decoration: BoxDecoration(),
                                                                                                                child: Builder(
                                                                                                                  builder: (context) {
                                                                                                                    final listaRespuesta2 = containerRespuestasRecordList.toList();

                                                                                                                    return ListView.separated(
                                                                                                                      padding: EdgeInsets.zero,
                                                                                                                      shrinkWrap: true,
                                                                                                                      scrollDirection: Axis.vertical,
                                                                                                                      itemCount: listaRespuesta2.length,
                                                                                                                      separatorBuilder: (_, __) => SizedBox(height: 5.0),
                                                                                                                      itemBuilder: (context, listaRespuesta2Index) {
                                                                                                                        final listaRespuesta2Item = listaRespuesta2[listaRespuesta2Index];
                                                                                                                        return StreamBuilder<List<UsersAnswersRecord>>(
                                                                                                                          stream: queryUsersAnswersRecord(
                                                                                                                            queryBuilder: (usersAnswersRecord) => usersAnswersRecord
                                                                                                                                .where(
                                                                                                                                  'uid_user',
                                                                                                                                  isEqualTo: widget.refResult?.estudianteRef,
                                                                                                                                )
                                                                                                                                .where(
                                                                                                                                  'uid_pregunta',
                                                                                                                                  isEqualTo: containerPreguntasRecord?.reference.id,
                                                                                                                                )
                                                                                                                                .where(
                                                                                                                                  'respuesta_uid',
                                                                                                                                  isEqualTo: listaRespuesta2Item.reference.id,
                                                                                                                                )
                                                                                                                                .where(
                                                                                                                                  'uid_examen',
                                                                                                                                  isEqualTo: widget.refExamination?.reference.id,
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
                                                                                                                                  child: CircularProgressIndicator(
                                                                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              );
                                                                                                                            }
                                                                                                                            List<UsersAnswersRecord> containerUsersAnswersRecordList = snapshot.data!;
                                                                                                                            final containerUsersAnswersRecord = containerUsersAnswersRecordList.isNotEmpty ? containerUsersAnswersRecordList.first : null;

                                                                                                                            return InkWell(
                                                                                                                              splashColor: Colors.transparent,
                                                                                                                              focusColor: Colors.transparent,
                                                                                                                              hoverColor: Colors.transparent,
                                                                                                                              highlightColor: Colors.transparent,
                                                                                                                              onTap: () async {
                                                                                                                                if (containerUsersAnswersRecord != null) {
                                                                                                                                  await containerUsersAnswersRecord.reference.delete();
                                                                                                                                } else {
                                                                                                                                  var usersAnswersRecordReference = UsersAnswersRecord.collection.doc();
                                                                                                                                  await usersAnswersRecordReference.set(createUsersAnswersRecordData(
                                                                                                                                    uidUser: widget.refResult?.estudianteRef,
                                                                                                                                    uidPregunta: containerPreguntasRecord?.reference.id,
                                                                                                                                    respuestaUid: listaRespuesta2Item.reference.id,
                                                                                                                                    uidExamen: widget.refExamination?.reference.id,
                                                                                                                                  ));
                                                                                                                                  _model.refRespuestaCrear = UsersAnswersRecord.getDocumentFromData(
                                                                                                                                      createUsersAnswersRecordData(
                                                                                                                                        uidUser: widget.refResult?.estudianteRef,
                                                                                                                                        uidPregunta: containerPreguntasRecord?.reference.id,
                                                                                                                                        respuestaUid: listaRespuesta2Item.reference.id,
                                                                                                                                        uidExamen: widget.refExamination?.reference.id,
                                                                                                                                      ),
                                                                                                                                      usersAnswersRecordReference);

                                                                                                                                  await _model.refRespuestaCrear!.reference.update(createUsersAnswersRecordData(
                                                                                                                                    uid: _model.refRespuestaCrear?.reference.id,
                                                                                                                                  ));
                                                                                                                                }

                                                                                                                                await Future.delayed(const Duration(milliseconds: 1000));

                                                                                                                                safeSetState(() {});
                                                                                                                              },
                                                                                                                              child: Container(
                                                                                                                                decoration: BoxDecoration(
                                                                                                                                  color: valueOrDefault<Color>(
                                                                                                                                    containerUsersAnswersRecord != null ? Color(0xFFC8E5CC) : Color(0xFFEFF3F6),
                                                                                                                                    Color(0xFFEFF3F6),
                                                                                                                                  ),
                                                                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                                                                ),
                                                                                                                                child: Padding(
                                                                                                                                  padding: EdgeInsets.all(10.0),
                                                                                                                                  child: Row(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    children: [
                                                                                                                                      Builder(
                                                                                                                                        builder: (context) {
                                                                                                                                          if (containerUsersAnswersRecord != null) {
                                                                                                                                            return Icon(
                                                                                                                                              Icons.check_box_outlined,
                                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                              size: 15.0,
                                                                                                                                            );
                                                                                                                                          } else {
                                                                                                                                            return Icon(
                                                                                                                                              Icons.check_box_outline_blank,
                                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                              size: 15.0,
                                                                                                                                            );
                                                                                                                                          }
                                                                                                                                        },
                                                                                                                                      ),
                                                                                                                                      RichText(
                                                                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                                                                        text: TextSpan(
                                                                                                                                          children: [
                                                                                                                                            TextSpan(
                                                                                                                                              text: valueOrDefault<String>(
                                                                                                                                                functions.numberToLetter(listaRespuesta2Index + 1),
                                                                                                                                                '1',
                                                                                                                                              ),
                                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                    fontFamily: 'Poppins',
                                                                                                                                                    fontSize: 12.0,
                                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                                  ),
                                                                                                                                            ),
                                                                                                                                            TextSpan(
                                                                                                                                              text: ')',
                                                                                                                                              style: TextStyle(),
                                                                                                                                            )
                                                                                                                                          ],
                                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                                fontSize: 12.0,
                                                                                                                                                letterSpacing: 0.0,
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      Flexible(
                                                                                                                                        child: Text(
                                                                                                                                          listaRespuesta2Item.textoRespuesta,
                                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                                color: Colors.black,
                                                                                                                                                fontSize: 12.0,
                                                                                                                                                letterSpacing: 0.0,
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ].divide(SizedBox(width: 10.0)),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            );
                                                                                                                          },
                                                                                                                        );
                                                                                                                      },
                                                                                                                    );
                                                                                                                  },
                                                                                                                ),
                                                                                                              ),
                                                                                                            if (containerRespuestaStateRecord != null)
                                                                                                              Container(
                                                                                                                decoration: BoxDecoration(),
                                                                                                                child: Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Builder(
                                                                                                                      builder: (context) {
                                                                                                                        final listaRespuesta1 = containerRespuestasRecordList.toList();

                                                                                                                        return ListView.separated(
                                                                                                                          padding: EdgeInsets.zero,
                                                                                                                          shrinkWrap: true,
                                                                                                                          scrollDirection: Axis.vertical,
                                                                                                                          itemCount: listaRespuesta1.length,
                                                                                                                          separatorBuilder: (_, __) => SizedBox(height: 5.0),
                                                                                                                          itemBuilder: (context, listaRespuesta1Index) {
                                                                                                                            final listaRespuesta1Item = listaRespuesta1[listaRespuesta1Index];
                                                                                                                            return StreamBuilder<List<UsersAnswersRecord>>(
                                                                                                                              stream: queryUsersAnswersRecord(
                                                                                                                                queryBuilder: (usersAnswersRecord) => usersAnswersRecord
                                                                                                                                    .where(
                                                                                                                                      'uid_user',
                                                                                                                                      isEqualTo: widget.refResult?.estudianteRef,
                                                                                                                                    )
                                                                                                                                    .where(
                                                                                                                                      'uid_pregunta',
                                                                                                                                      isEqualTo: containerPreguntasRecord?.reference.id,
                                                                                                                                    )
                                                                                                                                    .where(
                                                                                                                                      'respuesta_uid',
                                                                                                                                      isEqualTo: listaRespuesta1Item.reference.id,
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
                                                                                                                                      child: CircularProgressIndicator(
                                                                                                                                        valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  );
                                                                                                                                }
                                                                                                                                List<UsersAnswersRecord> containerUsersAnswersRecordList = snapshot.data!;
                                                                                                                                final containerUsersAnswersRecord = containerUsersAnswersRecordList.isNotEmpty ? containerUsersAnswersRecordList.first : null;

                                                                                                                                return Container(
                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                    color: valueOrDefault<Color>(
                                                                                                                                      () {
                                                                                                                                        if (listaRespuesta1Item.esCorrecta) {
                                                                                                                                          return Color(0xFFC8E5CC);
                                                                                                                                        } else if ((containerUsersAnswersRecord != null) && !listaRespuesta1Item.esCorrecta) {
                                                                                                                                          return Color(0x72D90429);
                                                                                                                                        } else {
                                                                                                                                          return Color(0xFFEFF3F6);
                                                                                                                                        }
                                                                                                                                      }(),
                                                                                                                                      Color(0xFFEFF3F6),
                                                                                                                                    ),
                                                                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                                                                  ),
                                                                                                                                  child: Padding(
                                                                                                                                    padding: EdgeInsets.all(10.0),
                                                                                                                                    child: Row(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      children: [
                                                                                                                                        Builder(
                                                                                                                                          builder: (context) {
                                                                                                                                            if (containerUsersAnswersRecord != null) {
                                                                                                                                              return Icon(
                                                                                                                                                Icons.check_box_outlined,
                                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                size: 15.0,
                                                                                                                                              );
                                                                                                                                            } else {
                                                                                                                                              return Icon(
                                                                                                                                                Icons.check_box_outline_blank,
                                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                size: 15.0,
                                                                                                                                              );
                                                                                                                                            }
                                                                                                                                          },
                                                                                                                                        ),
                                                                                                                                        RichText(
                                                                                                                                          textScaler: MediaQuery.of(context).textScaler,
                                                                                                                                          text: TextSpan(
                                                                                                                                            children: [
                                                                                                                                              TextSpan(
                                                                                                                                                text: valueOrDefault<String>(
                                                                                                                                                  functions.numberToLetter(listaRespuesta1Index + 1),
                                                                                                                                                  '1',
                                                                                                                                                ),
                                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                      fontFamily: 'Poppins',
                                                                                                                                                      fontSize: 12.0,
                                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                                    ),
                                                                                                                                              ),
                                                                                                                                              TextSpan(
                                                                                                                                                text: ')',
                                                                                                                                                style: TextStyle(),
                                                                                                                                              )
                                                                                                                                            ],
                                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                  fontFamily: 'Poppins',
                                                                                                                                                  fontSize: 12.0,
                                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                                ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                        Flexible(
                                                                                                                                          child: Text(
                                                                                                                                            listaRespuesta1Item.textoRespuesta,
                                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                  fontFamily: 'Poppins',
                                                                                                                                                  color: Colors.black,
                                                                                                                                                  fontSize: 12.0,
                                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                                ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ].divide(SizedBox(width: 10.0)),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                );
                                                                                                                              },
                                                                                                                            );
                                                                                                                          },
                                                                                                                        );
                                                                                                                      },
                                                                                                                    ),
                                                                                                                    StreamBuilder<List<RespuestasRecord>>(
                                                                                                                      stream: FFAppState().respuestas(
                                                                                                                        requestFn: () => queryRespuestasRecord(
                                                                                                                          queryBuilder: (respuestasRecord) => respuestasRecord
                                                                                                                              .where(
                                                                                                                                'uid_pregunta',
                                                                                                                                isEqualTo: containerPreguntasRecord?.reference.id,
                                                                                                                              )
                                                                                                                              .where(
                                                                                                                                'es_correcta',
                                                                                                                                isEqualTo: true,
                                                                                                                              ),
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
                                                                                                                        List<RespuestasRecord> containerRespuestasRecordList = snapshot.data!;

                                                                                                                        return Container(
                                                                                                                          decoration: BoxDecoration(),
                                                                                                                          child: Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
                                                                                                                            child: StreamBuilder<List<UsersAnswersRecord>>(
                                                                                                                              stream: FFAppState().usersAnswers(
                                                                                                                                requestFn: () => queryUsersAnswersRecord(
                                                                                                                                  queryBuilder: (usersAnswersRecord) => usersAnswersRecord
                                                                                                                                      .where(
                                                                                                                                        'uid_user',
                                                                                                                                        isEqualTo: widget.refResult?.estudianteRef,
                                                                                                                                      )
                                                                                                                                      .where(
                                                                                                                                        'uid_pregunta',
                                                                                                                                        isEqualTo: containerPreguntasRecord?.reference.id,
                                                                                                                                      ),
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
                                                                                                                                List<UsersAnswersRecord> containerUsersAnswersRecordList = snapshot.data!;

                                                                                                                                return Container(
                                                                                                                                  width: double.infinity,
                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                    color: Color(0xFFEFF3F6),
                                                                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                                                                    border: Border.all(
                                                                                                                                      color: Color(0xFFCECECE),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  child: Container(
                                                                                                                                    decoration: BoxDecoration(),
                                                                                                                                    child: Padding(
                                                                                                                                      padding: EdgeInsets.all(20.0),
                                                                                                                                      child: Column(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                        children: [
                                                                                                                                          Text(
                                                                                                                                            valueOrDefault<String>(
                                                                                                                                              Set.from(containerRespuestasRecordList.map((e) => e.reference.id).toList()).containsAll(containerUsersAnswersRecordList.map((e) => e.respuestaUid).toList()) && Set.from(containerUsersAnswersRecordList.map((e) => e.respuestaUid).toList()).containsAll(containerRespuestasRecordList.map((e) => e.reference.id).toList()) ? 'Correcto' : 'Incorrecto',
                                                                                                                                              'Incorrecto',
                                                                                                                                            ),
                                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                  fontFamily: 'Poppins',
                                                                                                                                                  color: valueOrDefault<Color>(
                                                                                                                                                    Set.from(containerRespuestasRecordList.map((e) => e.reference.id).toList()).containsAll(containerUsersAnswersRecordList.map((e) => e.respuestaUid).toList()) && Set.from(containerUsersAnswersRecordList.map((e) => e.respuestaUid).toList()).containsAll(containerRespuestasRecordList.map((e) => e.reference.id).toList()) ? Color(0xFF00A133) : Color(0xFFBD0020),
                                                                                                                                                    Color(0xFFBD0020),
                                                                                                                                                  ),
                                                                                                                                                  fontSize: 14.0,
                                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                                                ),
                                                                                                                                          ),
                                                                                                                                          Text(
                                                                                                                                            'Respuesta',
                                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                  fontFamily: 'Poppins',
                                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                                                ),
                                                                                                                                          ),
                                                                                                                                          Text(
                                                                                                                                            valueOrDefault<String>(
                                                                                                                                              containerPreguntasRecord?.explicacion,
                                                                                                                                              '-',
                                                                                                                                            ),
                                                                                                                                            textAlign: TextAlign.start,
                                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                  fontFamily: 'Poppins',
                                                                                                                                                  fontSize: 12.0,
                                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                                ),
                                                                                                                                          ),
                                                                                                                                        ].divide(SizedBox(height: 10.0)),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                );
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      },
                                                                                                                    ),
                                                                                                                  ].divide(SizedBox(height: 10.0)),
                                                                                                                ),
                                                                                                              ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ].divide(SizedBox(height: 5.0)),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          5.0)),
                                                                ),
                                                                if (!_model
                                                                    .stateEnding)
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children:
                                                                          [
                                                                        if (_model.indexQuestion !=
                                                                            0)
                                                                          Flexible(
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  _model.indexQuestion = valueOrDefault<int>(
                                                                                    _model.indexQuestion - 1,
                                                                                    0,
                                                                                  );
                                                                                  safeSetState(() {});
                                                                                },
                                                                                text: 'Atras',
                                                                                options: FFButtonOptions(
                                                                                  width: 173.0,
                                                                                  height: 26.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(35.0, 0.0, 35.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: Colors.white,
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                  elevation: 0.0,
                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        Flexible(
                                                                          child:
                                                                              StreamBuilder<List<RespuestaStateRecord>>(
                                                                            stream:
                                                                                FFAppState().respuestaState(
                                                                              requestFn: () => queryRespuestaStateRecord(
                                                                                queryBuilder: (respuestaStateRecord) => respuestaStateRecord
                                                                                    .where(
                                                                                      'uis_user',
                                                                                      isEqualTo: widget.refUser?.id,
                                                                                    )
                                                                                    .where(
                                                                                      'uid_examen',
                                                                                      isEqualTo: widget.refExamination?.reference.id,
                                                                                    )
                                                                                    .where(
                                                                                      'uid_question',
                                                                                      isEqualTo: containerPreguntasRecordList.elementAtOrNull(_model.indexQuestion)?.reference.id,
                                                                                    ),
                                                                                singleRecord: true,
                                                                              ),
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              List<RespuestaStateRecord> containerRespuestaStateRecordList = snapshot.data!;
                                                                              final containerRespuestaStateRecord = containerRespuestaStateRecordList.isNotEmpty ? containerRespuestaStateRecordList.first : null;

                                                                              return Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    FFButtonWidget(
                                                                                      onPressed: (containerRespuestaStateRecord != null)
                                                                                          ? null
                                                                                          : () async {
                                                                                              var respuestaStateRecordReference = RespuestaStateRecord.collection.doc();
                                                                                              await respuestaStateRecordReference.set(createRespuestaStateRecordData(
                                                                                                uidQuestion: containerPreguntasRecordList.elementAtOrNull(_model.indexQuestion)?.reference.id,
                                                                                                uisUser: widget.refUser?.id,
                                                                                                uidExamen: widget.refExamination?.reference.id,
                                                                                              ));
                                                                                              _model.refStateQuestion = RespuestaStateRecord.getDocumentFromData(
                                                                                                  createRespuestaStateRecordData(
                                                                                                    uidQuestion: containerPreguntasRecordList.elementAtOrNull(_model.indexQuestion)?.reference.id,
                                                                                                    uisUser: widget.refUser?.id,
                                                                                                    uidExamen: widget.refExamination?.reference.id,
                                                                                                  ),
                                                                                                  respuestaStateRecordReference);

                                                                                              await _model.refStateQuestion!.reference.update(createRespuestaStateRecordData(
                                                                                                uid: _model.refStateQuestion?.reference.id,
                                                                                              ));

                                                                                              safeSetState(() {});
                                                                                            },
                                                                                      text: 'Comprobar',
                                                                                      options: FFButtonOptions(
                                                                                        width: 173.0,
                                                                                        height: 26.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(35.0, 0.0, 35.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              color: Colors.white,
                                                                                              fontSize: 14.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                        elevation: 0.0,
                                                                                        borderRadius: BorderRadius.circular(4.0),
                                                                                        disabledColor: FlutterFlowTheme.of(context).secondary,
                                                                                      ),
                                                                                    ),
                                                                                    FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        if (containerPreguntasRecordList.length ==
                                                                                            valueOrDefault<int>(
                                                                                              _model.indexQuestion + 1,
                                                                                              0,
                                                                                            )) {
                                                                                          _model.stateEnding = true;
                                                                                          safeSetState(() {});
                                                                                        } else {
                                                                                          _model.indexQuestion = valueOrDefault<int>(
                                                                                            _model.indexQuestion + 1,
                                                                                            0,
                                                                                          );
                                                                                          safeSetState(() {});
                                                                                        }
                                                                                      },
                                                                                      text: valueOrDefault<String>(
                                                                                        containerPreguntasRecordList.length ==
                                                                                                valueOrDefault<int>(
                                                                                                  _model.indexQuestion + 1,
                                                                                                  0,
                                                                                                )
                                                                                            ? 'Terminar'
                                                                                            : 'Siguiente ',
                                                                                        'Siguiente',
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        width: 173.0,
                                                                                        height: 26.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(35.0, 0.0, 35.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              color: Colors.white,
                                                                                              fontSize: 14.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                        elevation: 0.0,
                                                                                        borderRadius: BorderRadius.circular(4.0),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 20.0)),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 20.0)),
                                                                    ),
                                                                  ),
                                                                if (_model
                                                                    .stateEnding)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            30.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children:
                                                                          [
                                                                        Builder(
                                                                          builder: (context) =>
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              _model.estadoExamen = await actions.verificarPreguntasRespondidas(
                                                                                widget.refResult!.estudianteRef,
                                                                                widget.refExamination!.reference.id,
                                                                              );
                                                                              if (_model.estadoExamen!) {
                                                                                _model.timerController.onStopTimer();
                                                                                await actions.actualizarResultadoExamen(
                                                                                  widget.refResult!.reference.id,
                                                                                );
                                                                                await actions.deleteRegister(
                                                                                  widget.refExamination!.reference.id,
                                                                                  widget.refUser!.id,
                                                                                  widget.refCourse!.reference.id,
                                                                                );
                                                                                _model.resultadoFinalBien = await ResultadosRecord.getDocumentOnce(widget.refResult!.reference);
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (dialogContext) {
                                                                                    return Dialog(
                                                                                      elevation: 0,
                                                                                      insetPadding: EdgeInsets.zero,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                      child: GestureDetector(
                                                                                        onTap: () {
                                                                                          FocusScope.of(dialogContext).unfocus();
                                                                                          FocusManager.instance.primaryFocus?.unfocus();
                                                                                        },
                                                                                        child: FromResultExaminationWidget(
                                                                                          refResult: _model.resultadoFinalBien!,
                                                                                          refUser: widget.refUser!,
                                                                                          refExamen: widget.refExamination!,
                                                                                          refCourse: widget.refCourse!,
                                                                                          type: widget.type!,
                                                                                          isdemo: widget.isdemo!,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                );
                                                                              } else {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (dialogContext) {
                                                                                    return Dialog(
                                                                                      elevation: 0,
                                                                                      insetPadding: EdgeInsets.zero,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                      child: GestureDetector(
                                                                                        onTap: () {
                                                                                          FocusScope.of(dialogContext).unfocus();
                                                                                          FocusManager.instance.primaryFocus?.unfocus();
                                                                                        },
                                                                                        child: AlertaTerminarExamenWidget(),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                );

                                                                                if (FFAppState().stateConfirmation) {
                                                                                  _model.timerController.onStopTimer();
                                                                                  FFAppState().stateConfirmation = false;
                                                                                  safeSetState(() {});
                                                                                  await actions.actualizarResultadoExamen(
                                                                                    widget.refResult!.reference.id,
                                                                                  );
                                                                                  await actions.deleteRegister(
                                                                                    widget.refExamination!.reference.id,
                                                                                    widget.refUser!.id,
                                                                                    widget.refCourse!.reference.id,
                                                                                  );
                                                                                  _model.resultadoFinalBien2 = await ResultadosRecord.getDocumentOnce(widget.refResult!.reference);
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (dialogContext) {
                                                                                      return Dialog(
                                                                                        elevation: 0,
                                                                                        insetPadding: EdgeInsets.zero,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                        child: GestureDetector(
                                                                                          onTap: () {
                                                                                            FocusScope.of(dialogContext).unfocus();
                                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                                          },
                                                                                          child: FromResultExaminationWidget(
                                                                                            refResult: _model.resultadoFinalBien2!,
                                                                                            refUser: widget.refUser!,
                                                                                            refExamen: widget.refExamination!,
                                                                                            refCourse: widget.refCourse!,
                                                                                            type: widget.type!,
                                                                                            isdemo: widget.isdemo!,
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                }
                                                                              }

                                                                              safeSetState(() {});
                                                                            },
                                                                            text:
                                                                                'Confirmar Envio',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 173.0,
                                                                              height: 26.0,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(35.0, 0.0, 35.0, 0.0),
                                                                              iconAlignment: IconAlignment.start,
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: Colors.white,
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                              elevation: 0.0,
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 20.0)),
                                                                    ),
                                                                  ),
                                                              ].divide(SizedBox(
                                                                  height: 5.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 20.0)),
                                          ),
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
