import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/empty_certificates/empty_certificates_widget.dart';
import '/pages/footer/footer_widget.dart';
import '/pages/header/header_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'course_test_model.dart';
export 'course_test_model.dart';

class CourseTestWidget extends StatefulWidget {
  const CourseTestWidget({
    super.key,
    required this.refCourse,
  });

  final CoursesRecord? refCourse;

  static String routeName = 'CourseTest';
  static String routePath = 'courseTest';

  @override
  State<CourseTestWidget> createState() => _CourseTestWidgetState();
}

class _CourseTestWidgetState extends State<CourseTestWidget> {
  late CourseTestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CourseTestModel());

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
                    model: _model.headerModel,
                    updateCallback: () => safeSetState(() {}),
                    child: HeaderWidget(
                      state: widget.refCourse?.courseType,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF17236A),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(50.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Curso',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.montserrat(
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
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 28.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            widget.refCourse?.name,
                                            '--',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 48.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            widget.refCourse?.description,
                                            '--',
                                          ),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w300,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        '4,6',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 16.0,
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 5.0)),
                                                  ),
                                                  RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              '731 Calificaciones',
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        )
                                                      ],
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '58,810',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  Text(
                                                    'Estudiantes',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
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
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
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
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '16 Horas',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  Text(
                                                    'Total',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
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
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
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
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ].divide(SizedBox(width: 20.0)),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 15.0)),
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(),
                                        ),
                                      ].divide(SizedBox(height: 15.0)),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 20.0)),
                              ),
                            ),
                          ),
                          StreamBuilder<List<ExamenesRecord>>(
                            stream: queryExamenesRecord(
                              queryBuilder: (examenesRecord) => examenesRecord
                                  .where(
                                    'state',
                                    isEqualTo: true,
                                  )
                                  .where(
                                    'uid_Course',
                                    isEqualTo: widget.refCourse?.reference.id,
                                  )
                                  .orderBy('fecha_creacion'),
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
                              List<ExamenesRecord> containerExamenesRecordList =
                                  snapshot.data!;

                              return Container(
                                width: double.infinity,
                                height: 450.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: 'Usuario: ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      TextSpan(
                                                        text: valueOrDefault<
                                                            String>(
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.codigo,
                                                              ''),
                                                          '--',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      TextSpan(
                                                        text: ' / ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      TextSpan(
                                                        text: valueOrDefault<
                                                            String>(
                                                          currentUserDisplayName,
                                                          '--',
                                                        ),
                                                        style: TextStyle(),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
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
                                                          ),
                                                          letterSpacing: 0.0,
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
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              StreamBuilder<
                                                  List<ResultadosRecord>>(
                                                stream: queryResultadosRecord(
                                                  queryBuilder: (resultadosRecord) =>
                                                      resultadosRecord
                                                          .whereIn(
                                                              'examen_ref',
                                                              containerExamenesRecordList
                                                                  .map((e) => e
                                                                      .reference
                                                                      .id)
                                                                  .toList())
                                                          .where(
                                                            'estudiante_ref',
                                                            isEqualTo:
                                                                currentUserReference
                                                                    ?.id,
                                                          )
                                                          .where(
                                                            'type',
                                                            isEqualTo: widget
                                                                .refCourse
                                                                ?.courseType,
                                                          )
                                                          .where(
                                                            'estado',
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
                                                      mostrarNotaFinalResultadosRecordList =
                                                      snapshot.data!;

                                                  return RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'Nota Final : ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
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
                                                        TextSpan(
                                                          text: valueOrDefault<
                                                              String>(
                                                            formatNumber(
                                                              (List<double>?
                                                                      var1) {
                                                                return (var1?.isEmpty ??
                                                                        true)
                                                                    ? 0.0
                                                                    : (var1!.map((e) => e ?? 0.0).reduce((a,
                                                                                b) =>
                                                                            a +
                                                                            b) /
                                                                        var1.length);
                                                              }(
                                                                  mostrarNotaFinalResultadosRecordList
                                                                      .map((e) =>
                                                                          valueOrDefault<
                                                                              double>(
                                                                            e.calificacion,
                                                                            0.0,
                                                                          ))
                                                                      .toList()),
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '0',
                                                              locale: '',
                                                            ),
                                                            '0',
                                                          ),
                                                          style: TextStyle(),
                                                        )
                                                      ],
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
                                                  );
                                                },
                                              ),
                                            ].divide(SizedBox(width: 20.0)),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 3.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFDCDCDC),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 5.0)),
                                      ),
                                      Flexible(
                                        child: Builder(
                                          builder: (context) {
                                            final listExamen =
                                                containerExamenesRecordList
                                                    .toList();
                                            if (listExamen.isEmpty) {
                                              return Center(
                                                child:
                                                    EmptyCertificatesWidget(),
                                              );
                                            }

                                            return FlutterFlowDataTable<
                                                ExamenesRecord>(
                                              controller: _model
                                                  .paginatedDataTableController,
                                              data: listExamen,
                                              columnsBuilder: (onSortChanged) =>
                                                  [
                                                DataColumn2(
                                                  label: DefaultTextStyle.merge(
                                                    softWrap: true,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        'Fecha',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFF212529),
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                DataColumn2(
                                                  label: DefaultTextStyle.merge(
                                                    softWrap: true,
                                                    child: Text(
                                                      'Nombre del examen',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF212529),
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                  fixedWidth:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.2,
                                                ),
                                                DataColumn2(
                                                  label: DefaultTextStyle.merge(
                                                    softWrap: true,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        'Nota General',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFF212529),
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                DataColumn2(
                                                  label: DefaultTextStyle.merge(
                                                    softWrap: true,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        'Personas',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFF212529),
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                DataColumn2(
                                                  label: DefaultTextStyle.merge(
                                                    softWrap: true,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        'Entorno',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFF212529),
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                DataColumn2(
                                                  label: DefaultTextStyle.merge(
                                                    softWrap: true,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        'Procesos',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFF212529),
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                DataColumn2(
                                                  label: DefaultTextStyle.merge(
                                                    softWrap: true,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        'Estado',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFF212529),
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                DataColumn2(
                                                  label: DefaultTextStyle.merge(
                                                    softWrap: true,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        'Acción',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFF212529),
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                              dataRowBuilder: (listExamenItem,
                                                      listExamenIndex,
                                                      selected,
                                                      onSelectChanged) =>
                                                  DataRow(
                                                color:
                                                    WidgetStateProperty.all(
                                                  listExamenIndex % 2 == 0
                                                      ? Color(0xFFF6F6F6)
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                ),
                                                cells: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        dateTimeFormat(
                                                          "d/M/y",
                                                          listExamenItem
                                                              .fechaCreacion,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        '-- / -- / ----',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                  Text(
                                                    valueOrDefault<String>(
                                                      listExamenItem.nombre,
                                                      '--',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
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
                                                          ),
                                                          letterSpacing: 0.0,
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
                                                        ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: StreamBuilder<
                                                        List<ResultadosRecord>>(
                                                      stream:
                                                          queryResultadosRecord(
                                                        queryBuilder:
                                                            (resultadosRecord) =>
                                                                resultadosRecord
                                                                    .where(
                                                                      'examen_ref',
                                                                      isEqualTo: listExamenItem.reference.id !=
                                                                              ''
                                                                          ? listExamenItem
                                                                              .reference
                                                                              .id
                                                                          : null,
                                                                    )
                                                                    .where(
                                                                      'estudiante_ref',
                                                                      isEqualTo: currentUserReference?.id !=
                                                                              ''
                                                                          ? currentUserReference
                                                                              ?.id
                                                                          : null,
                                                                    )
                                                                    .where(
                                                                      'type',
                                                                      isEqualTo: widget
                                                                          .refCourse
                                                                          ?.courseType,
                                                                    )
                                                                    .orderBy(
                                                                        'created_date',
                                                                        descending:
                                                                            true),
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
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
                                                        List<ResultadosRecord>
                                                            textResultadosRecordList =
                                                            snapshot.data!;
                                                        final textResultadosRecord =
                                                            textResultadosRecordList
                                                                    .isNotEmpty
                                                                ? textResultadosRecordList
                                                                    .first
                                                                : null;

                                                        return Text(
                                                          valueOrDefault<
                                                              String>(
                                                            textResultadosRecord !=
                                                                    null
                                                                ? valueOrDefault<
                                                                    String>(
                                                                    formatNumber(
                                                                      textResultadosRecord
                                                                          .calificacion,
                                                                      formatType:
                                                                          FormatType
                                                                              .compact,
                                                                    ),
                                                                    '0',
                                                                  )
                                                                : '0',
                                                            '0',
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
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
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: StreamBuilder<
                                                        List<ResultadosRecord>>(
                                                      stream:
                                                          queryResultadosRecord(
                                                        queryBuilder:
                                                            (resultadosRecord) =>
                                                                resultadosRecord
                                                                    .where(
                                                                      'examen_ref',
                                                                      isEqualTo:
                                                                          listExamenItem
                                                                              .reference
                                                                              .id,
                                                                    )
                                                                    .where(
                                                                      'estudiante_ref',
                                                                      isEqualTo:
                                                                          currentUserReference
                                                                              ?.id,
                                                                    )
                                                                    .where(
                                                                      'type',
                                                                      isEqualTo: widget
                                                                          .refCourse
                                                                          ?.courseType,
                                                                    )
                                                                    .orderBy(
                                                                        'created_date',
                                                                        descending:
                                                                            true),
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
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
                                                          child: StreamBuilder<
                                                              List<
                                                                  DetallesResultadosRecord>>(
                                                            stream:
                                                                queryDetallesResultadosRecord(
                                                              queryBuilder:
                                                                  (detallesResultadosRecord) =>
                                                                      detallesResultadosRecord
                                                                          .where(
                                                                            'uidResultado',
                                                                            isEqualTo:
                                                                                containerResultadosRecord?.reference.id,
                                                                          )
                                                                          .where(
                                                                            'type',
                                                                            isEqualTo:
                                                                                0,
                                                                          ),
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 14.0,
                                                                    height:
                                                                        14.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<DetallesResultadosRecord>
                                                                  richTextDetallesResultadosRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              final richTextDetallesResultadosRecord =
                                                                  richTextDetallesResultadosRecordList
                                                                          .isNotEmpty
                                                                      ? richTextDetallesResultadosRecordList
                                                                          .first
                                                                      : null;

                                                              return RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: valueOrDefault<
                                                                          String>(
                                                                        containerResultadosRecord !=
                                                                                null
                                                                            ? valueOrDefault<String>(
                                                                                formatNumber(
                                                                                  richTextDetallesResultadosRecord?.porcentaje,
                                                                                  formatType: FormatType.custom,
                                                                                  format: '0',
                                                                                  locale: '',
                                                                                ),
                                                                                '0',
                                                                              )
                                                                            : '0',
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.montserrat(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: '%',
                                                                      style:
                                                                          TextStyle(),
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .montserrat(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              );
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: StreamBuilder<
                                                        List<ResultadosRecord>>(
                                                      stream:
                                                          queryResultadosRecord(
                                                        queryBuilder:
                                                            (resultadosRecord) =>
                                                                resultadosRecord
                                                                    .where(
                                                                      'examen_ref',
                                                                      isEqualTo:
                                                                          listExamenItem
                                                                              .reference
                                                                              .id,
                                                                    )
                                                                    .where(
                                                                      'estudiante_ref',
                                                                      isEqualTo:
                                                                          currentUserReference
                                                                              ?.id,
                                                                    )
                                                                    .where(
                                                                      'type',
                                                                      isEqualTo: widget
                                                                          .refCourse
                                                                          ?.courseType,
                                                                    )
                                                                    .orderBy(
                                                                        'created_date',
                                                                        descending:
                                                                            true),
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
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
                                                          child: StreamBuilder<
                                                              List<
                                                                  DetallesResultadosRecord>>(
                                                            stream:
                                                                queryDetallesResultadosRecord(
                                                              queryBuilder:
                                                                  (detallesResultadosRecord) =>
                                                                      detallesResultadosRecord
                                                                          .where(
                                                                            'uidResultado',
                                                                            isEqualTo:
                                                                                containerResultadosRecord?.reference.id,
                                                                          )
                                                                          .where(
                                                                            'type',
                                                                            isEqualTo:
                                                                                1,
                                                                          ),
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 14.0,
                                                                    height:
                                                                        14.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<DetallesResultadosRecord>
                                                                  richTextDetallesResultadosRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              final richTextDetallesResultadosRecord =
                                                                  richTextDetallesResultadosRecordList
                                                                          .isNotEmpty
                                                                      ? richTextDetallesResultadosRecordList
                                                                          .first
                                                                      : null;

                                                              return RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: valueOrDefault<
                                                                          String>(
                                                                        containerResultadosRecord !=
                                                                                null
                                                                            ? valueOrDefault<String>(
                                                                                formatNumber(
                                                                                  richTextDetallesResultadosRecord?.porcentaje,
                                                                                  formatType: FormatType.custom,
                                                                                  format: '0',
                                                                                  locale: '',
                                                                                ),
                                                                                '0',
                                                                              )
                                                                            : '0',
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.montserrat(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: '%',
                                                                      style:
                                                                          TextStyle(),
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .montserrat(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              );
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: StreamBuilder<
                                                        List<ResultadosRecord>>(
                                                      stream:
                                                          queryResultadosRecord(
                                                        queryBuilder:
                                                            (resultadosRecord) =>
                                                                resultadosRecord
                                                                    .where(
                                                                      'examen_ref',
                                                                      isEqualTo:
                                                                          listExamenItem
                                                                              .reference
                                                                              .id,
                                                                    )
                                                                    .where(
                                                                      'estudiante_ref',
                                                                      isEqualTo:
                                                                          currentUserReference
                                                                              ?.id,
                                                                    )
                                                                    .where(
                                                                      'type',
                                                                      isEqualTo: widget
                                                                          .refCourse
                                                                          ?.courseType,
                                                                    )
                                                                    .orderBy(
                                                                        'created_date',
                                                                        descending:
                                                                            true),
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
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
                                                          child: StreamBuilder<
                                                              List<
                                                                  DetallesResultadosRecord>>(
                                                            stream:
                                                                queryDetallesResultadosRecord(
                                                              queryBuilder:
                                                                  (detallesResultadosRecord) =>
                                                                      detallesResultadosRecord
                                                                          .where(
                                                                            'uidResultado',
                                                                            isEqualTo:
                                                                                containerResultadosRecord?.reference.id,
                                                                          )
                                                                          .where(
                                                                            'type',
                                                                            isEqualTo:
                                                                                2,
                                                                          ),
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 14.0,
                                                                    height:
                                                                        14.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<DetallesResultadosRecord>
                                                                  richTextDetallesResultadosRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              final richTextDetallesResultadosRecord =
                                                                  richTextDetallesResultadosRecordList
                                                                          .isNotEmpty
                                                                      ? richTextDetallesResultadosRecordList
                                                                          .first
                                                                      : null;

                                                              return RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: valueOrDefault<
                                                                          String>(
                                                                        containerResultadosRecord !=
                                                                                null
                                                                            ? valueOrDefault<String>(
                                                                                formatNumber(
                                                                                  richTextDetallesResultadosRecord?.porcentaje,
                                                                                  formatType: FormatType.custom,
                                                                                  format: '0',
                                                                                  locale: '',
                                                                                ),
                                                                                '0',
                                                                              )
                                                                            : '0',
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.montserrat(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: '%',
                                                                      style:
                                                                          TextStyle(),
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .montserrat(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              );
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: StreamBuilder<
                                                        List<ResultadosRecord>>(
                                                      stream:
                                                          queryResultadosRecord(
                                                        queryBuilder:
                                                            (resultadosRecord) =>
                                                                resultadosRecord
                                                                    .where(
                                                                      'examen_ref',
                                                                      isEqualTo:
                                                                          listExamenItem
                                                                              .reference
                                                                              .id,
                                                                    )
                                                                    .where(
                                                                      'estudiante_ref',
                                                                      isEqualTo:
                                                                          currentUserReference
                                                                              ?.id,
                                                                    )
                                                                    .where(
                                                                      'type',
                                                                      isEqualTo: widget
                                                                          .refCourse
                                                                          ?.courseType,
                                                                    )
                                                                    .orderBy(
                                                                        'created_date',
                                                                        descending:
                                                                            true),
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
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
                                                        List<ResultadosRecord>
                                                            textResultadosRecordList =
                                                            snapshot.data!;
                                                        final textResultadosRecord =
                                                            textResultadosRecordList
                                                                    .isNotEmpty
                                                                ? textResultadosRecordList
                                                                    .first
                                                                : null;

                                                        return Text(
                                                          valueOrDefault<
                                                              String>(
                                                            () {
                                                              if (!(textResultadosRecord !=
                                                                  null)) {
                                                                return 'Pendiente';
                                                              } else if (textResultadosRecord
                                                                      .fechaFinExamen ==
                                                                  null) {
                                                                return 'En Proceso';
                                                              } else if (textResultadosRecord
                                                                      .calificacion >=
                                                                  13.0) {
                                                                return 'Aprobado';
                                                              } else if (textResultadosRecord
                                                                      .calificacion <=
                                                                  13.0) {
                                                                return 'Desaprobado';
                                                              } else {
                                                                return 'Pendiente';
                                                              }
                                                            }(),
                                                            'Pendiente',
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
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
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: StreamBuilder<
                                                        List<ResultadosRecord>>(
                                                      stream:
                                                          queryResultadosRecord(
                                                        queryBuilder:
                                                            (resultadosRecord) =>
                                                                resultadosRecord
                                                                    .where(
                                                                      'examen_ref',
                                                                      isEqualTo: listExamenItem.reference.id !=
                                                                              ''
                                                                          ? listExamenItem
                                                                              .reference
                                                                              .id
                                                                          : null,
                                                                    )
                                                                    .where(
                                                                      'estudiante_ref',
                                                                      isEqualTo: currentUserReference?.id !=
                                                                              ''
                                                                          ? currentUserReference
                                                                              ?.id
                                                                          : null,
                                                                    )
                                                                    .where(
                                                                      'type',
                                                                      isEqualTo: widget
                                                                          .refCourse
                                                                          ?.courseType,
                                                                    )
                                                                    .orderBy(
                                                                        'created_date',
                                                                        descending:
                                                                            true),
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
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
                                                        List<ResultadosRecord>
                                                            buttonResultadosRecordList =
                                                            snapshot.data!;
                                                        final buttonResultadosRecord =
                                                            buttonResultadosRecordList
                                                                    .isNotEmpty
                                                                ? buttonResultadosRecordList
                                                                    .first
                                                                : null;

                                                        return FFButtonWidget(
                                                          onPressed: () {
                                                            print(
                                                                'Button pressed ...');
                                                          },
                                                          text: valueOrDefault<
                                                              String>(
                                                            () {
                                                              if (buttonResultadosRecord
                                                                      ?.fechaFinExamen !=
                                                                  null) {
                                                                return 'Resultados';
                                                              } else if (buttonResultadosRecord
                                                                      ?.fechaInicioExamen !=
                                                                  null) {
                                                                return 'Continuar';
                                                              } else {
                                                                return 'Empezar';
                                                              }
                                                            }(),
                                                            'Empezar',
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 26.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        35.0,
                                                                        0.0,
                                                                        35.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .montserrat(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ]
                                                    .map((c) => DataCell(c))
                                                    .toList(),
                                              ),
                                              emptyBuilder: () => Center(
                                                child:
                                                    EmptyCertificatesWidget(),
                                              ),
                                              paginated: true,
                                              selectable: false,
                                              hidePaginator: false,
                                              showFirstLastButtons: true,
                                              headingRowHeight: 56.0,
                                              dataRowHeight: 48.0,
                                              columnSpacing: 20.0,
                                              headingRowColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              addHorizontalDivider: true,
                                              addTopAndBottomDivider: false,
                                              hideDefaultHorizontalDivider:
                                                  true,
                                              horizontalDividerColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              horizontalDividerThickness: 1.0,
                                              addVerticalDivider: false,
                                            );
                                          },
                                        ),
                                      ),
                                      StreamBuilder<List<ResultadosRecord>>(
                                        stream: queryResultadosRecord(
                                          queryBuilder: (resultadosRecord) =>
                                              resultadosRecord
                                                  .whereIn(
                                                      'examen_ref',
                                                      containerExamenesRecordList
                                                                  .map((e) => e
                                                                      .reference
                                                                      .id)
                                                                  .toList() !=
                                                              ''
                                                          ? containerExamenesRecordList
                                                              .map((e) => e
                                                                  .reference.id)
                                                              .toList()
                                                          : null)
                                                  .where(
                                                    'estudiante_ref',
                                                    isEqualTo:
                                                        currentUserReference
                                                                    ?.id !=
                                                                ''
                                                            ? currentUserReference
                                                                ?.id
                                                            : null,
                                                  )
                                                  .where(
                                                    'type',
                                                    isEqualTo: 1,
                                                  )
                                                  .where(
                                                    'estado',
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
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
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
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Visibility(
                                              visible: valueOrDefault<bool>(
                                                (List<double>? var1) {
                                                  return (var1?.isEmpty ?? true)
                                                      ? false
                                                      : (var1!
                                                                  .map((e) =>
                                                                      e ?? 0.0)
                                                                  .reduce((a,
                                                                          b) =>
                                                                      a + b) /
                                                              var1.length) >
                                                          14;
                                                }(containerResultadosRecordList
                                                    .map((e) =>
                                                        valueOrDefault<double>(
                                                          e.calificacion,
                                                          0.0,
                                                        ))
                                                    .toList()),
                                                false,
                                              ),
                                              child: FFButtonWidget(
                                                onPressed:
                                                    !valueOrDefault<bool>(
                                                  (List<double> var1) {
                                                    return (var1.isEmpty ??
                                                            true)
                                                        ? false
                                                        : (var1
                                                                    .map((e) =>
                                                                        e ??
                                                                        0.0)
                                                                    .reduce((a,
                                                                            b) =>
                                                                        a + b) /
                                                                var1.length) >=
                                                            14;
                                                  }(
                                                      containerResultadosRecordList
                                                          .map((e) =>
                                                              valueOrDefault<
                                                                  double>(
                                                                e.calificacion,
                                                                0.0,
                                                              ))
                                                          .toList()),
                                                  false,
                                                )
                                                        ? null
                                                        : () async {
                                                            _model.certificate =
                                                                await queryCertificatesRecordOnce(
                                                              queryBuilder:
                                                                  (certificatesRecord) =>
                                                                      certificatesRecord
                                                                          .where(
                                                                            'uid_Course',
                                                                            isEqualTo:
                                                                                widget.refCourse?.reference.id,
                                                                          )
                                                                          .where(
                                                                            'uid_User',
                                                                            isEqualTo:
                                                                                currentUserReference?.id,
                                                                          ),
                                                              singleRecord:
                                                                  true,
                                                            ).then((s) => s
                                                                    .firstOrNull);
                                                            if (!(_model
                                                                    .certificate !=
                                                                null)) {
                                                              if (valueOrDefault<
                                                                  bool>(
                                                                (List<double>
                                                                    var1) {
                                                                  return (var1.isEmpty ??
                                                                          true)
                                                                      ? false
                                                                      : (var1.map((e) => e ?? 0.0).reduce((a, b) => a + b) /
                                                                              var1.length) >=
                                                                          14;
                                                                }(containerResultadosRecordList
                                                                    .map((e) => valueOrDefault<double>(
                                                                          e.calificacion,
                                                                          0.0,
                                                                        ))
                                                                    .toList()),
                                                                false,
                                                              )) {
                                                                _model.urlCertificate =
                                                                    await actions
                                                                        .downloadAndSaveCertificatePDF(
                                                                  widget
                                                                      .refCourse!
                                                                      .name,
                                                                  'asincrónico',
                                                                  valueOrDefault<
                                                                      int>(
                                                                    int.parse(widget
                                                                        .refCourse!
                                                                        .hours),
                                                                    0,
                                                                  ),
                                                                  dateTimeFormat(
                                                                    "d/M/y",
                                                                    getCurrentTimestamp,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  valueOrDefault<
                                                                      String>(
                                                                    currentUserDisplayName,
                                                                    '--',
                                                                  ),
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.codigo,
                                                                      ''),
                                                                  valueOrDefault<
                                                                      double>(
                                                                    (List<double>
                                                                        var1) {
                                                                      return (var1.isEmpty ??
                                                                              true)
                                                                          ? 0.0
                                                                          : (var1.map((e) => e ?? 0.0).reduce((a, b) => a + b) /
                                                                              var1.length);
                                                                    }(containerResultadosRecordList
                                                                        .map((e) => valueOrDefault<double>(
                                                                              e.calificacion,
                                                                              0.0,
                                                                            ))
                                                                        .toList()),
                                                                    0.0,
                                                                  ),
                                                                );
                                                                _model.codeCertificate =
                                                                    await actions
                                                                        .codeCertificate(
                                                                  currentUserReference!
                                                                      .id,
                                                                  widget
                                                                      .refCourse!
                                                                      .reference
                                                                      .id,
                                                                );

                                                                var certificatesRecordReference =
                                                                    CertificatesRecord
                                                                        .collection
                                                                        .doc();
                                                                await certificatesRecordReference
                                                                    .set({
                                                                  ...createCertificatesRecordData(
                                                                    uidCourse: widget
                                                                        .refCourse
                                                                        ?.reference
                                                                        .id,
                                                                    urlPdf: _model
                                                                        .urlCertificate,
                                                                    id: _model
                                                                        .codeCertificate,
                                                                    uidUser:
                                                                        currentUserReference
                                                                            ?.id,
                                                                  ),
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'ReferralDate':
                                                                          FieldValue
                                                                              .serverTimestamp(),
                                                                    },
                                                                  ),
                                                                });
                                                                _model.refCertificate =
                                                                    CertificatesRecord
                                                                        .getDocumentFromData({
                                                                  ...createCertificatesRecordData(
                                                                    uidCourse: widget
                                                                        .refCourse
                                                                        ?.reference
                                                                        .id,
                                                                    urlPdf: _model
                                                                        .urlCertificate,
                                                                    id: _model
                                                                        .codeCertificate,
                                                                    uidUser:
                                                                        currentUserReference
                                                                            ?.id,
                                                                  ),
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'ReferralDate':
                                                                          DateTime
                                                                              .now(),
                                                                    },
                                                                  ),
                                                                }, certificatesRecordReference);

                                                                await _model
                                                                    .refCertificate!
                                                                    .reference
                                                                    .update(
                                                                        createCertificatesRecordData(
                                                                  uid: _model
                                                                      .refCertificate
                                                                      ?.reference
                                                                      .id,
                                                                ));

                                                                context
                                                                    .pushNamed(
                                                                  CertificatesWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'uidUser':
                                                                        serializeParam(
                                                                      currentUserReference
                                                                          ?.id,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    kTransitionInfoKey:
                                                                        TransitionInfo(
                                                                      hasTransition:
                                                                          true,
                                                                      transitionType:
                                                                          PageTransitionType
                                                                              .fade,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              0),
                                                                    ),
                                                                  },
                                                                );
                                                              }
                                                            }

                                                            safeSetState(() {});
                                                          },
                                                text: 'Generar Certificado',
                                                options: FFButtonOptions(
                                                  height: 50.0,
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
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            font: GoogleFonts
                                                                .montserrat(
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                            ),
                                                            color: Colors.white,
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                          ),
                                                  elevation: 1.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                  disabledColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: wrapWithModel(
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
