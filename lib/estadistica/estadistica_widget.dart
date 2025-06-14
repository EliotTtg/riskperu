import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/empty_actividades/empty_actividades_widget.dart';
import '/pages/empty_course/empty_course_widget.dart';
import '/pages/empty_dashboard/empty_dashboard_widget.dart';
import '/pages/empty_test/empty_test_widget.dart';
import '/pages/footer/footer_widget.dart';
import '/pages/header/header_widget.dart';
import '/pages/header_mobil_cerrar_sesion/header_mobil_cerrar_sesion_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'estadistica_model.dart';
export 'estadistica_model.dart';

class EstadisticaWidget extends StatefulWidget {
  const EstadisticaWidget({super.key});

  static String routeName = 'Estadistica';
  static String routePath = 'estadistica';

  @override
  State<EstadisticaWidget> createState() => _EstadisticaWidgetState();
}

class _EstadisticaWidgetState extends State<EstadisticaWidget> {
  late EstadisticaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EstadisticaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          _model.userCorrectas = await actions.obtenerDataPorSemanaYCategoria(
            currentUserReference!.id,
            1,
          );
          _model.data1 =
              _model.userCorrectas!.toList().cast<UsersNumberStruct>();
          safeSetState(() {});
        }),
        Future(() async {
          _model.userIncorrectas = await actions.obtenerDataPorSemanaYCategoria(
            currentUserReference!.id,
            2,
          );
          _model.data2 =
              _model.userIncorrectas!.toList().cast<UsersNumberStruct>();
          safeSetState(() {});
        }),
        Future(() async {
          _model.dataGeneral = await actions.obtenerDataGeneral(
            currentUserReference!.id,
          );
          _model.countGeneral =
              _model.dataGeneral!.toList().cast<UsersNumberStruct>();
          safeSetState(() {});
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
    final chartPieChartColorsList1 = [
      Color(0xFF1C9E6C),
      Color(0xFFEA553D),
      Color(0xFF979797)
    ];
    final chartPieChartColorsList2 = [
      Color(0xFF1C9E6C),
      Color(0xFFEA553D),
      Color(0xFF979797)
    ];
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                      ))
                        wrapWithModel(
                          model: _model.headerModel,
                          updateCallback: () => safeSetState(() {}),
                          child: HeaderWidget(
                            state: 5,
                          ),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        wrapWithModel(
                          model: _model.headerMobilCerrarSesionModel,
                          updateCallback: () => safeSetState(() {}),
                          child: HeaderMobilCerrarSesionWidget(),
                        ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsets.all(valueOrDefault<double>(
                                () {
                                  if (MediaQuery.sizeOf(context).width <
                                      kBreakpointSmall) {
                                    return 20.0;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointMedium) {
                                    return 50.0;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointLarge) {
                                    return 50.0;
                                  } else {
                                    return 50.0;
                                  }
                                }(),
                                50.0,
                              )),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (responsiveVisibility(
                                        context: context,
                                        phone: false,
                                      ))
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              child: StreamBuilder<
                                                  List<CoursesRecord>>(
                                                stream: queryCoursesRecord(
                                                  queryBuilder:
                                                      (coursesRecord) =>
                                                          coursesRecord
                                                              .where(
                                                                'course_type',
                                                                isEqualTo: 1,
                                                              )
                                                              .where(
                                                                'State',
                                                                isEqualTo: true,
                                                              )
                                                              .orderBy(
                                                                  'Created_Date',
                                                                  descending:
                                                                      true),
                                                  limit: 10,
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
                                                  List<CoursesRecord>
                                                      containerCoursesRecordList =
                                                      snapshot.data!;

                                                  return Container(
                                                    width: double.infinity,
                                                    height: 404.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    child: Builder(
                                                      builder: (context) {
                                                        if (containerCoursesRecordList
                                                            .isNotEmpty) {
                                                          return Column(
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
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        20.0,
                                                                        20.0,
                                                                        0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Cursos Recientes',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.montserrat(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF094B90),
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          227.0,
                                                                      height:
                                                                          3.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          5.0)),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    SingleChildScrollView(
                                                                  primary:
                                                                      false,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final listCursosEstrenados =
                                                                              containerCoursesRecordList.toList();

                                                                          return ListView
                                                                              .builder(
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            shrinkWrap:
                                                                                true,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            itemCount:
                                                                                listCursosEstrenados.length,
                                                                            itemBuilder:
                                                                                (context, listCursosEstrenadosIndex) {
                                                                              final listCursosEstrenadosItem = listCursosEstrenados[listCursosEstrenadosIndex];
                                                                              return Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsets.all(20.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Flexible(
                                                                                                    child: Text(
                                                                                                      listCursosEstrenadosItem.name,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.montserrat(
                                                                                                              fontWeight: FontWeight.bold,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            fontSize: 16.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      _model.refCourseUser = await queryUsersCoursesRecordOnce(
                                                                                                        queryBuilder: (usersCoursesRecord) => usersCoursesRecord
                                                                                                            .where(
                                                                                                              'uid_user',
                                                                                                              isEqualTo: currentUserReference?.id,
                                                                                                            )
                                                                                                            .where(
                                                                                                              'uid_courses',
                                                                                                              isEqualTo: listCursosEstrenadosItem.reference.id,
                                                                                                            ),
                                                                                                        singleRecord: true,
                                                                                                      ).then((s) => s.firstOrNull);
                                                                                                      if (_model.refCourseUser != null) {
                                                                                                        _model.refSessionStudent = await querySessionRecordOnce(
                                                                                                          queryBuilder: (sessionRecord) => sessionRecord
                                                                                                              .where(
                                                                                                                'uid_Course',
                                                                                                                isEqualTo: listCursosEstrenadosItem.reference.id,
                                                                                                              )
                                                                                                              .orderBy('Created_Date'),
                                                                                                          singleRecord: true,
                                                                                                        ).then((s) => s.firstOrNull);
                                                                                                        if (_model.refSessionStudent != null) {
                                                                                                          _model.refModulesCourse = await queryModuleRecordOnce(
                                                                                                            queryBuilder: (moduleRecord) => moduleRecord
                                                                                                                .where(
                                                                                                                  'uid_Session',
                                                                                                                  isEqualTo: _model.refSessionStudent?.reference.id,
                                                                                                                )
                                                                                                                .orderBy('Created_date'),
                                                                                                            singleRecord: true,
                                                                                                          ).then((s) => s.firstOrNull);
                                                                                                          if (_model.refModulesCourse != null) {
                                                                                                            _model.refClassCourse = await queryModuleClassRecordOnce(
                                                                                                              queryBuilder: (moduleClassRecord) => moduleClassRecord
                                                                                                                  .where(
                                                                                                                    'uid_Module',
                                                                                                                    isEqualTo: _model.refModulesCourse?.reference.id,
                                                                                                                  )
                                                                                                                  .orderBy('Created_date'),
                                                                                                              singleRecord: true,
                                                                                                            ).then((s) => s.firstOrNull);
                                                                                                            if (_model.refClassCourse != null) {
                                                                                                              _model.refUser = await queryUsersRecordOnce(
                                                                                                                queryBuilder: (usersRecord) => usersRecord.where(
                                                                                                                  'uid',
                                                                                                                  isEqualTo: currentUserReference?.id,
                                                                                                                ),
                                                                                                                singleRecord: true,
                                                                                                              ).then((s) => s.firstOrNull);

                                                                                                              context.pushNamed(
                                                                                                                CourseDatailsWidget.routeName,
                                                                                                                queryParameters: {
                                                                                                                  'refCourses': serializeParam(
                                                                                                                    listCursosEstrenadosItem,
                                                                                                                    ParamType.Document,
                                                                                                                  ),
                                                                                                                  'refCoursesClass': serializeParam(
                                                                                                                    _model.refClassCourse,
                                                                                                                    ParamType.Document,
                                                                                                                  ),
                                                                                                                  'refUser': serializeParam(
                                                                                                                    _model.refUser,
                                                                                                                    ParamType.Document,
                                                                                                                  ),
                                                                                                                }.withoutNulls,
                                                                                                                extra: <String, dynamic>{
                                                                                                                  'refCourses': listCursosEstrenadosItem,
                                                                                                                  'refCoursesClass': _model.refClassCourse,
                                                                                                                  'refUser': _model.refUser,
                                                                                                                  kTransitionInfoKey: TransitionInfo(
                                                                                                                    hasTransition: true,
                                                                                                                    transitionType: PageTransitionType.fade,
                                                                                                                    duration: Duration(milliseconds: 0),
                                                                                                                  ),
                                                                                                                },
                                                                                                              );
                                                                                                            }
                                                                                                          }
                                                                                                        }
                                                                                                      } else {
                                                                                                        context.pushNamed(
                                                                                                          CoursePriceWidget.routeName,
                                                                                                          queryParameters: {
                                                                                                            'refCourse': serializeParam(
                                                                                                              listCursosEstrenadosItem,
                                                                                                              ParamType.Document,
                                                                                                            ),
                                                                                                          }.withoutNulls,
                                                                                                          extra: <String, dynamic>{
                                                                                                            'refCourse': listCursosEstrenadosItem,
                                                                                                            kTransitionInfoKey: TransitionInfo(
                                                                                                              hasTransition: true,
                                                                                                              transitionType: PageTransitionType.fade,
                                                                                                              duration: Duration(milliseconds: 0),
                                                                                                            ),
                                                                                                          },
                                                                                                        );
                                                                                                      }

                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: Color(0xFF094B90),
                                                                                                        borderRadius: BorderRadius.circular(4.0),
                                                                                                      ),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(15.0, 5.0, 15.0, 5.0),
                                                                                                        child: Text(
                                                                                                          'Ir',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.montserrat(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                fontSize: 12.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 20.0)),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        width: double.infinity,
                                                                                        height: 2.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 10.0)),
                                                          );
                                                        } else {
                                                          return wrapWithModel(
                                                            model: _model
                                                                .emptyCourseModel1,
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                EmptyCourseWidget(),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: StreamBuilder<
                                                  List<CoursesRecord>>(
                                                stream: queryCoursesRecord(
                                                  queryBuilder:
                                                      (coursesRecord) =>
                                                          coursesRecord
                                                              .where(
                                                                'course_type',
                                                                isEqualTo: 2,
                                                              )
                                                              .where(
                                                                'State',
                                                                isEqualTo: true,
                                                              )
                                                              .orderBy(
                                                                  'Created_Date',
                                                                  descending:
                                                                      true),
                                                  limit: 10,
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
                                                  List<CoursesRecord>
                                                      containerCoursesRecordList =
                                                      snapshot.data!;

                                                  return Container(
                                                    width: double.infinity,
                                                    height: 404.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    child: Builder(
                                                      builder: (context) {
                                                        if (containerCoursesRecordList
                                                            .isNotEmpty) {
                                                          return Column(
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
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        20.0,
                                                                        20.0,
                                                                        0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        context.goNamed(
                                                                            LoadingWidget.routeName);
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        'Simuladores',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.montserrat(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF094B90),
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          227.0,
                                                                      height:
                                                                          3.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          5.0)),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    SingleChildScrollView(
                                                                  primary:
                                                                      false,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final listExamenes =
                                                                              containerCoursesRecordList.toList();

                                                                          return ListView
                                                                              .builder(
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            shrinkWrap:
                                                                                true,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            itemCount:
                                                                                listExamenes.length,
                                                                            itemBuilder:
                                                                                (context, listExamenesIndex) {
                                                                              final listExamenesItem = listExamenes[listExamenesIndex];
                                                                              return Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsets.all(20.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Flexible(
                                                                                                    child: Text(
                                                                                                      listExamenesItem.name,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.montserrat(
                                                                                                              fontWeight: FontWeight.bold,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            fontSize: 16.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      context.pushNamed(
                                                                                                        SimulatorWidget.routeName,
                                                                                                        queryParameters: {
                                                                                                          'refCourse': serializeParam(
                                                                                                            listExamenesItem,
                                                                                                            ParamType.Document,
                                                                                                          ),
                                                                                                        }.withoutNulls,
                                                                                                        extra: <String, dynamic>{
                                                                                                          'refCourse': listExamenesItem,
                                                                                                          kTransitionInfoKey: TransitionInfo(
                                                                                                            hasTransition: true,
                                                                                                            transitionType: PageTransitionType.fade,
                                                                                                            duration: Duration(milliseconds: 0),
                                                                                                          ),
                                                                                                        },
                                                                                                      );
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: Color(0xFF094B90),
                                                                                                        borderRadius: BorderRadius.circular(4.0),
                                                                                                      ),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(15.0, 5.0, 15.0, 5.0),
                                                                                                        child: Text(
                                                                                                          'Ir',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.montserrat(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                fontSize: 12.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 20.0)),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        width: double.infinity,
                                                                                        height: 2.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 10.0)),
                                                          );
                                                        } else {
                                                          return wrapWithModel(
                                                            model: _model
                                                                .emptyTestModel1,
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                EmptyTestWidget(),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                height: 404.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                child: Builder(
                                                  builder: (context) {
                                                    if (_model.countGeneral
                                                        .isNotEmpty) {
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        20.0,
                                                                        20.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Registro de Preguntas',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .montserrat(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Color(
                                                                            0xFF094B90),
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                Container(
                                                                  width: 227.0,
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
                                                              ].divide(SizedBox(
                                                                  height: 5.0)),
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Flexible(
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        FlutterFlowPieChart(
                                                                      data:
                                                                          FFPieChartData(
                                                                        values: _model
                                                                            .countGeneral
                                                                            .map((e) =>
                                                                                e.number)
                                                                            .toList(),
                                                                        colors:
                                                                            chartPieChartColorsList1,
                                                                        radius: [
                                                                          100.0
                                                                        ],
                                                                      ),
                                                                      donutHoleRadius:
                                                                          0.0,
                                                                      donutHoleColor:
                                                                          Colors
                                                                              .transparent,
                                                                      sectionLabelStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.glory(
                                                                              fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          20.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Flexible(
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              width: 10.0,
                                                                              height: 10.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFF1C9E6C),
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              child: Text(
                                                                                'Correctas',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.montserrat(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      lineHeight: 1.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 10.0)),
                                                                        ),
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              width: 10.0,
                                                                              height: 10.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFFEA553D),
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              child: Text(
                                                                                'Incorrectas',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.montserrat(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      lineHeight: 1.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 10.0)),
                                                                        ),
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              width: 10.0,
                                                                              height: 10.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFF979797),
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              child: Text(
                                                                                'Pendientes',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.montserrat(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      lineHeight: 1.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 10.0)),
                                                                        ),
                                                                      ),
                                                                    ]
                                                                        .divide(SizedBox(
                                                                            width:
                                                                                20.0))
                                                                        .addToStart(SizedBox(
                                                                            width:
                                                                                10.0))
                                                                        .addToEnd(SizedBox(
                                                                            width:
                                                                                10.0)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 10.0)),
                                                      );
                                                    } else {
                                                      return wrapWithModel(
                                                        model: _model
                                                            .emptyActividadesModel1,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            EmptyActividadesWidget(),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 50.0)),
                                        ),
                                      if (responsiveVisibility(
                                        context: context,
                                        tablet: false,
                                        tabletLandscape: false,
                                        desktop: false,
                                      ))
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            StreamBuilder<List<CoursesRecord>>(
                                              stream: queryCoursesRecord(
                                                queryBuilder: (coursesRecord) =>
                                                    coursesRecord
                                                        .where(
                                                          'course_type',
                                                          isEqualTo: 1,
                                                        )
                                                        .where(
                                                          'State',
                                                          isEqualTo: true,
                                                        )
                                                        .orderBy('Created_Date',
                                                            descending: true),
                                                limit: 10,
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
                                                List<CoursesRecord>
                                                    containerCoursesRecordList =
                                                    snapshot.data!;

                                                return Container(
                                                  width: double.infinity,
                                                  height: 404.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  child: Builder(
                                                    builder: (context) {
                                                      if (containerCoursesRecordList
                                                          .isNotEmpty) {
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          20.0,
                                                                          20.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Cursos Recientes',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.montserrat(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Color(0xFF094B90),
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  Container(
                                                                    width:
                                                                        227.0,
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
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        5.0)),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child:
                                                                  SingleChildScrollView(
                                                                primary: false,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final listCursosEstrenados =
                                                                            containerCoursesRecordList.toList();

                                                                        return ListView
                                                                            .builder(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          itemCount:
                                                                              listCursosEstrenados.length,
                                                                          itemBuilder:
                                                                              (context, listCursosEstrenadosIndex) {
                                                                            final listCursosEstrenadosItem =
                                                                                listCursosEstrenados[listCursosEstrenadosIndex];
                                                                            return Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(20.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Flexible(
                                                                                                  child: Text(
                                                                                                    listCursosEstrenadosItem.name,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.montserrat(
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 16.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    _model.refCourseUserMobil = await queryUsersCoursesRecordOnce(
                                                                                                      queryBuilder: (usersCoursesRecord) => usersCoursesRecord
                                                                                                          .where(
                                                                                                            'uid_user',
                                                                                                            isEqualTo: currentUserReference?.id,
                                                                                                          )
                                                                                                          .where(
                                                                                                            'uid_courses',
                                                                                                            isEqualTo: listCursosEstrenadosItem.reference.id,
                                                                                                          ),
                                                                                                      singleRecord: true,
                                                                                                    ).then((s) => s.firstOrNull);
                                                                                                    if (_model.refCourseUserMobil != null) {
                                                                                                      _model.refSessionStudentMobil = await querySessionRecordOnce(
                                                                                                        queryBuilder: (sessionRecord) => sessionRecord
                                                                                                            .where(
                                                                                                              'uid_Course',
                                                                                                              isEqualTo: listCursosEstrenadosItem.reference.id,
                                                                                                            )
                                                                                                            .orderBy('Created_Date'),
                                                                                                        singleRecord: true,
                                                                                                      ).then((s) => s.firstOrNull);
                                                                                                      if (_model.refSessionStudentMobil != null) {
                                                                                                        _model.refModulesCourseMobil = await queryModuleRecordOnce(
                                                                                                          queryBuilder: (moduleRecord) => moduleRecord
                                                                                                              .where(
                                                                                                                'uid_Session',
                                                                                                                isEqualTo: _model.refSessionStudentMobil?.reference.id,
                                                                                                              )
                                                                                                              .orderBy('Created_date'),
                                                                                                          singleRecord: true,
                                                                                                        ).then((s) => s.firstOrNull);
                                                                                                        if (_model.refModulesCourseMobil != null) {
                                                                                                          _model.refClassCourseMobil = await queryModuleClassRecordOnce(
                                                                                                            queryBuilder: (moduleClassRecord) => moduleClassRecord
                                                                                                                .where(
                                                                                                                  'uid_Module',
                                                                                                                  isEqualTo: _model.refModulesCourseMobil?.reference.id,
                                                                                                                )
                                                                                                                .orderBy('Created_date'),
                                                                                                            singleRecord: true,
                                                                                                          ).then((s) => s.firstOrNull);
                                                                                                          if (_model.refClassCourseMobil != null) {
                                                                                                            _model.refUserMobil = await queryUsersRecordOnce(
                                                                                                              queryBuilder: (usersRecord) => usersRecord.where(
                                                                                                                'uid',
                                                                                                                isEqualTo: currentUserReference?.id,
                                                                                                              ),
                                                                                                              singleRecord: true,
                                                                                                            ).then((s) => s.firstOrNull);

                                                                                                            context.pushNamed(
                                                                                                              CourseDatailsWidget.routeName,
                                                                                                              queryParameters: {
                                                                                                                'refCourses': serializeParam(
                                                                                                                  listCursosEstrenadosItem,
                                                                                                                  ParamType.Document,
                                                                                                                ),
                                                                                                                'refCoursesClass': serializeParam(
                                                                                                                  _model.refClassCourseMobil,
                                                                                                                  ParamType.Document,
                                                                                                                ),
                                                                                                                'refUser': serializeParam(
                                                                                                                  _model.refUserMobil,
                                                                                                                  ParamType.Document,
                                                                                                                ),
                                                                                                              }.withoutNulls,
                                                                                                              extra: <String, dynamic>{
                                                                                                                'refCourses': listCursosEstrenadosItem,
                                                                                                                'refCoursesClass': _model.refClassCourseMobil,
                                                                                                                'refUser': _model.refUserMobil,
                                                                                                                kTransitionInfoKey: TransitionInfo(
                                                                                                                  hasTransition: true,
                                                                                                                  transitionType: PageTransitionType.fade,
                                                                                                                  duration: Duration(milliseconds: 0),
                                                                                                                ),
                                                                                                              },
                                                                                                            );
                                                                                                          }
                                                                                                        }
                                                                                                      }
                                                                                                    } else {
                                                                                                      context.pushNamed(
                                                                                                        CoursePriceWidget.routeName,
                                                                                                        queryParameters: {
                                                                                                          'refCourse': serializeParam(
                                                                                                            listCursosEstrenadosItem,
                                                                                                            ParamType.Document,
                                                                                                          ),
                                                                                                        }.withoutNulls,
                                                                                                        extra: <String, dynamic>{
                                                                                                          'refCourse': listCursosEstrenadosItem,
                                                                                                          kTransitionInfoKey: TransitionInfo(
                                                                                                            hasTransition: true,
                                                                                                            transitionType: PageTransitionType.fade,
                                                                                                            duration: Duration(milliseconds: 0),
                                                                                                          ),
                                                                                                        },
                                                                                                      );
                                                                                                    }

                                                                                                    safeSetState(() {});
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Color(0xFF094B90),
                                                                                                      borderRadius: BorderRadius.circular(4.0),
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(15.0, 5.0, 15.0, 5.0),
                                                                                                      child: Text(
                                                                                                        'Ir',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              font: GoogleFonts.montserrat(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 20.0)),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: double.infinity,
                                                                                      height: 2.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 10.0)),
                                                        );
                                                      } else {
                                                        return wrapWithModel(
                                                          model: _model
                                                              .emptyCourseModel2,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              EmptyCourseWidget(),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                            StreamBuilder<List<CoursesRecord>>(
                                              stream: queryCoursesRecord(
                                                queryBuilder: (coursesRecord) =>
                                                    coursesRecord
                                                        .where(
                                                          'course_type',
                                                          isEqualTo: 2,
                                                        )
                                                        .where(
                                                          'State',
                                                          isEqualTo: true,
                                                        )
                                                        .orderBy('Created_Date',
                                                            descending: true),
                                                limit: 10,
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
                                                List<CoursesRecord>
                                                    containerCoursesRecordList =
                                                    snapshot.data!;

                                                return Container(
                                                  width: double.infinity,
                                                  height: 404.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  child: Builder(
                                                    builder: (context) {
                                                      if (containerCoursesRecordList
                                                          .isNotEmpty) {
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          20.0,
                                                                          20.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context.goNamed(
                                                                          LoadingWidget
                                                                              .routeName);
                                                                    },
                                                                    child: Text(
                                                                      'Simuladores',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.montserrat(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF094B90),
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width:
                                                                        227.0,
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
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        5.0)),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child:
                                                                  SingleChildScrollView(
                                                                primary: false,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final listExamenes =
                                                                            containerCoursesRecordList.toList();

                                                                        return ListView
                                                                            .builder(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          itemCount:
                                                                              listExamenes.length,
                                                                          itemBuilder:
                                                                              (context, listExamenesIndex) {
                                                                            final listExamenesItem =
                                                                                listExamenes[listExamenesIndex];
                                                                            return Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(20.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Flexible(
                                                                                                  child: Text(
                                                                                                    listExamenesItem.name,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.montserrat(
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 16.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    context.pushNamed(
                                                                                                      SimulatorWidget.routeName,
                                                                                                      queryParameters: {
                                                                                                        'refCourse': serializeParam(
                                                                                                          listExamenesItem,
                                                                                                          ParamType.Document,
                                                                                                        ),
                                                                                                      }.withoutNulls,
                                                                                                      extra: <String, dynamic>{
                                                                                                        'refCourse': listExamenesItem,
                                                                                                        kTransitionInfoKey: TransitionInfo(
                                                                                                          hasTransition: true,
                                                                                                          transitionType: PageTransitionType.fade,
                                                                                                          duration: Duration(milliseconds: 0),
                                                                                                        ),
                                                                                                      },
                                                                                                    );
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Color(0xFF094B90),
                                                                                                      borderRadius: BorderRadius.circular(4.0),
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(15.0, 5.0, 15.0, 5.0),
                                                                                                      child: Text(
                                                                                                        'Ir',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              font: GoogleFonts.montserrat(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 20.0)),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: double.infinity,
                                                                                      height: 2.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 10.0)),
                                                        );
                                                      } else {
                                                        return wrapWithModel(
                                                          model: _model
                                                              .emptyTestModel2,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              EmptyTestWidget(),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 404.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              child: Builder(
                                                builder: (context) {
                                                  if (_model.countGeneral
                                                      .isNotEmpty) {
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      20.0,
                                                                      20.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Registro de Preguntas',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .montserrat(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Color(
                                                                          0xFF094B90),
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                              Container(
                                                                width: 227.0,
                                                                height: 3.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 5.0)),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Flexible(
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      FlutterFlowPieChart(
                                                                    data:
                                                                        FFPieChartData(
                                                                      values: _model
                                                                          .countGeneral
                                                                          .map((e) =>
                                                                              e.number)
                                                                          .toList(),
                                                                      colors:
                                                                          chartPieChartColorsList2,
                                                                      radius: [
                                                                        100.0
                                                                      ],
                                                                    ),
                                                                    donutHoleRadius:
                                                                        0.0,
                                                                    donutHoleColor:
                                                                        Colors
                                                                            .transparent,
                                                                    sectionLabelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.glory(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .headlineSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .headlineSmall
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            20.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Flexible(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                10.0,
                                                                            height:
                                                                                10.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFF1C9E6C),
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Text(
                                                                              'Correctas',
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.montserrat(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    lineHeight: 1.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 10.0)),
                                                                      ),
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                10.0,
                                                                            height:
                                                                                10.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFEA553D),
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Text(
                                                                              'Incorrectas',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.montserrat(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    lineHeight: 1.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 10.0)),
                                                                      ),
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                10.0,
                                                                            height:
                                                                                10.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFF979797),
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Text(
                                                                              'Pendientes',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.montserrat(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    lineHeight: 1.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 10.0)),
                                                                      ),
                                                                    ),
                                                                  ]
                                                                      .divide(SizedBox(
                                                                          width:
                                                                              20.0))
                                                                      .addToStart(SizedBox(
                                                                          width:
                                                                              10.0))
                                                                      .addToEnd(SizedBox(
                                                                          width:
                                                                              10.0)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 10.0)),
                                                    );
                                                  } else {
                                                    return wrapWithModel(
                                                      model: _model
                                                          .emptyActividadesModel2,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          EmptyActividadesWidget(),
                                                    );
                                                  }
                                                },
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 20.0)),
                                        ),
                                    ],
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Builder(
                                      builder: (context) {
                                        if ((_model.data1.isNotEmpty) ||
                                            (_model.data2.isNotEmpty)) {
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 20.0, 20.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Estadistica por semana',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .montserrat(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xFF094B90),
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                    Container(
                                                      width: 227.0,
                                                      height: 3.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 5.0)),
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height: 250.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
                                                  child: Container(
                                                    height: 230.0,
                                                    child: FlutterFlowBarChart(
                                                      barData: [
                                                        FFBarChartData(
                                                          yData: _model.data1
                                                              .map((e) =>
                                                                  e.number)
                                                              .toList(),
                                                          color:
                                                              Color(0xFF1C9E6C),
                                                          borderColor:
                                                              Color(0xFF1C9E6C),
                                                        ),
                                                        FFBarChartData(
                                                          yData: _model.data2
                                                              .map((e) =>
                                                                  e.number)
                                                              .toList(),
                                                          color:
                                                              Color(0xFFEA553D),
                                                          borderColor:
                                                              Color(0xFFEA553D),
                                                        )
                                                      ],
                                                      xLabels: _model.data1
                                                          .map(
                                                              (e) => e.category)
                                                          .toList(),
                                                      barWidth: 15.0,
                                                      barBorderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      barSpace: 0.0,
                                                      groupSpace: 8.0,
                                                      alignment:
                                                          BarChartAlignment
                                                              .spaceAround,
                                                      chartStylingInfo:
                                                          ChartStylingInfo(
                                                        enableTooltip: true,
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                        showGrid: true,
                                                        showBorder: false,
                                                      ),
                                                      axisBounds: AxisBounds(),
                                                      xAxisLabelInfo:
                                                          AxisLabelInfo(
                                                        showLabels: true,
                                                        labelInterval: 10.0,
                                                        reservedSize: 28.0,
                                                      ),
                                                      yAxisLabelInfo:
                                                          AxisLabelInfo(
                                                        reservedSize: 42.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 10.0,
                                                        height: 10.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFF1C9E6C),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Correctas',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .montserrat(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                              lineHeight: 1.0,
                                                            ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 10.0,
                                                        height: 10.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFEA553D),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Incorrectas',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .montserrat(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                              lineHeight: 1.0,
                                                            ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ].divide(SizedBox(width: 20.0)),
                                              ),
                                            ]
                                                .divide(SizedBox(height: 10.0))
                                                .addToEnd(
                                                    SizedBox(height: 20.0)),
                                          );
                                        } else {
                                          return Container(
                                            height: 250.0,
                                            decoration: BoxDecoration(),
                                            child: wrapWithModel(
                                              model: _model.emptyDashboardModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: EmptyDashboardWidget(),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ]
                                    .divide(SizedBox(height: 25.0))
                                    .addToEnd(SizedBox(height: 50.0)),
                              ),
                            ),
                          ),
                          if ((valueOrDefault(
                                      currentUserDocument?.userType, 0) ==
                                  2) &&
                              responsiveVisibility(
                                context: context,
                                phone: false,
                              ))
                            AuthUserStreamWidget(
                              builder: (context) => wrapWithModel(
                                model: _model.footerModel,
                                updateCallback: () => safeSetState(() {}),
                                child: FooterWidget(),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
