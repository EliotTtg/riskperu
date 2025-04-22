import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/from_result_simulator/from_result_simulator_widget.dart';
import '/pages/header/header_widget.dart';
import '/pages/header_mobil/header_mobil_widget.dart';
import '/pages/navbar/navbar_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'examination_questions_view_model.dart';
export 'examination_questions_view_model.dart';

class ExaminationQuestionsViewWidget extends StatefulWidget {
  const ExaminationQuestionsViewWidget({
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

  static String routeName = 'examinationQuestionsView';
  static String routePath = 'ExaminationQuestionsView';

  @override
  State<ExaminationQuestionsViewWidget> createState() =>
      _ExaminationQuestionsViewWidgetState();
}

class _ExaminationQuestionsViewWidgetState
    extends State<ExaminationQuestionsViewWidget> {
  late ExaminationQuestionsViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExaminationQuestionsViewModel());

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
                          child: HeaderWidget(),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        wrapWithModel(
                          model: _model.headerMobilModel,
                          updateCallback: () => safeSetState(() {}),
                          child: HeaderMobilWidget(),
                        ),
                    ],
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
                                        padding: EdgeInsets.all(
                                            valueOrDefault<double>(
                                          () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return 20.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return 50.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return 50.0;
                                            } else {
                                              return 50.0;
                                            }
                                          }(),
                                          50.0,
                                        )),
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                flex: 1,
                                                child: StreamBuilder<
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
                                                                .where(
                                                                  'state',
                                                                  isEqualTo:
                                                                      true,
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
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            20.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
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
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                'Regresar al ',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                valueOrDefault<String>(
                                                                              widget.type == 1 ? 'Curso' : 'Simulador',
                                                                              'Simulador',
                                                                            ),
                                                                            style:
                                                                                TextStyle(),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Montserrat',
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
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
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                widget
                                                                    .refCourse
                                                                    ?.name,
                                                                '-',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
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
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Glory',
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
                                                                  EdgeInsets
                                                                      .zero,
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
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: valueOrDefault<
                                                                            String>(
                                                                          formatNumber(
                                                                            _model.porcentajeExamenes,
                                                                            formatType:
                                                                                FormatType.custom,
                                                                            format:
                                                                                '0',
                                                                            locale:
                                                                                '',
                                                                          ),
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Montserrat',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w300,
                                                                            ),
                                                                      ),
                                                                      TextSpan(
                                                                        text:
                                                                            '%',
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
                                                                              'Montserrat',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                        ),
                                                                  ),
                                                                ),
                                                                StreamBuilder<
                                                                    List<
                                                                        RegisterSimulatorRecord>>(
                                                                  stream:
                                                                      queryRegisterSimulatorRecord(
                                                                    queryBuilder: (registerSimulatorRecord) =>
                                                                        registerSimulatorRecord
                                                                            .where(
                                                                              'uid_user',
                                                                              isEqualTo: widget.refUser?.id,
                                                                            )
                                                                            .where(
                                                                              'uid_course',
                                                                              isEqualTo: widget.refCourse?.reference.id,
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
                                                                          width:
                                                                              14.0,
                                                                          height:
                                                                              14.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<RegisterSimulatorRecord>
                                                                        containerRegisterSimulatorRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    // Return an empty Container when the item does not exist.
                                                                    if (snapshot
                                                                        .data!
                                                                        .isEmpty) {
                                                                      return Container();
                                                                    }
                                                                    final containerRegisterSimulatorRecord = containerRegisterSimulatorRecordList
                                                                            .isNotEmpty
                                                                        ? containerRegisterSimulatorRecordList
                                                                            .first
                                                                        : null;

                                                                    return Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Text(
                                                                        'Ultima Visita el ${dateTimeFormat(
                                                                          "d \'de\' MMMM \'de\' y HH:mm",
                                                                          containerRegisterSimulatorRecord
                                                                              ?.createdDate,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Montserrat',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w300,
                                                                            ),
                                                                      ),
                                                                    );
                                                                  },
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
                                                              builder:
                                                                  (context) {
                                                                final listCategoria =
                                                                    containerExamGroupsRecordList
                                                                        .toList();

                                                                return ListView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  primary:
                                                                      false,
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
                                                                              isEqualTo: listCategoriaItem.reference.id,
                                                                            )
                                                                            .where(
                                                                              'state',
                                                                              isEqualTo: true,
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
                                                                        List<ExamenesRecord>
                                                                            containerExamenesRecordList =
                                                                            snapshot.data!;

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
                                                                                                        fontFamily: 'Montserrat',
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
                                                                                                          fontFamily: 'Montserrat',
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
                                                                                                      fontFamily: 'Montserrat',
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
                                                                              if (_model.refGroupExamen == listCategoriaItem.reference.id)
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
                                                                                            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                              context.pushNamed(
                                                                                                ExaminationQuestionsViewMobilWidget.routeName,
                                                                                                queryParameters: {
                                                                                                  'refExamination': serializeParam(
                                                                                                    widget.refExamination,
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
                                                                                                    widget.isdemo,
                                                                                                    ParamType.bool,
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
                                                                                              _model.refExamen = listaexamenesItem.reference.id;
                                                                                              safeSetState(() {});
                                                                                            }
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
                                                                                                                  fontFamily: 'Montserrat',
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
                                              ),
                                              if (responsiveVisibility(
                                                context: context,
                                                phone: false,
                                              ))
                                                Flexible(
                                                  flex: 2,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                0.0, 0.0),
                                                    child: StreamBuilder<
                                                        List<ExamenesRecord>>(
                                                      stream:
                                                          queryExamenesRecord(
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
                                                          width:
                                                              double.infinity,
                                                          constraints:
                                                              BoxConstraints(
                                                            minHeight: 500.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
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
                                                                        isEqualTo: widget
                                                                            .refUser
                                                                            ?.id,
                                                                      )
                                                                      .where(
                                                                        'examen_ref',
                                                                        isEqualTo: containerExamenesRecord
                                                                            ?.reference
                                                                            .id,
                                                                      )
                                                                      .where(
                                                                        'type',
                                                                        isEqualTo:
                                                                            widget.type,
                                                                      )
                                                                      .orderBy(
                                                                          'created_date',
                                                                          descending:
                                                                              true),
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
                                                              List<ResultadosRecord>
                                                                  containerResultadosRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              final containerResultadosRecord =
                                                                  containerResultadosRecordList
                                                                          .isNotEmpty
                                                                      ? containerResultadosRecordList
                                                                          .first
                                                                      : null;

                                                              return Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            20.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              'Modo examen',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ),
                                                                            Container(
                                                                              width: 104.0,
                                                                              height: 3.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 10.0)),
                                                                        ),
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
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                FFButtonWidget(
                                                                                  onPressed: () {
                                                                                    print('Button pressed ...');
                                                                                  },
                                                                                  text: valueOrDefault<String>(
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
                                                                                  options: FFButtonOptions(
                                                                                    height: 26.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: Colors.white,
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    elevation: 0.0,
                                                                                    borderRadius: BorderRadius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    functions.dateTimeFormat(getCurrentTimestamp),
                                                                                    '-- / -- / ----  00:00',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: Color(0xFF979797),
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 25.0)),
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
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFFF3F5FB),
                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(5.0),
                                                                                child: Row(
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
                                                                            Builder(
                                                                              builder: (context) => FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  _model.refPreguntas = await queryPreguntasRecordOnce(
                                                                                    queryBuilder: (preguntasRecord) => preguntasRecord.where(
                                                                                      'examen_ref',
                                                                                      isEqualTo: containerExamenesRecord?.reference.id,
                                                                                    ),
                                                                                    singleRecord: true,
                                                                                  ).then((s) => s.firstOrNull);
                                                                                  if (_model.refPreguntas != null) {
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
                                                                                                child: FromResultSimulatorWidget(
                                                                                                  refExamen: containerExamenesRecord!,
                                                                                                  refUser: currentUserReference!,
                                                                                                  refCourse: widget.refCourse!,
                                                                                                  type: widget.type!,
                                                                                                ),
                                                                                              ),
                                                                                            );
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
                                                                                text: valueOrDefault<String>(
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
                                                                                options: FFButtonOptions(
                                                                                  height: 26.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(35.0, 0.0, 35.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Montserrat',
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
                                                                          ].divide(SizedBox(height: 20.0)).around(SizedBox(height: 20.0)),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 5.0)),
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
                                            ],
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
