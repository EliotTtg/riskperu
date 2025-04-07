import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/crear_nota_curso/crear_nota_curso_widget.dart';
import '/pages/crear_tipo_comentario/crear_tipo_comentario_widget.dart';
import '/pages/empty_announcements/empty_announcements_widget.dart';
import '/pages/empty_coment/empty_coment_widget.dart';
import '/pages/header_course/header_course_widget.dart';
import '/pages/navbar/navbar_widget.dart';
import '/pages/popup_add_coments/popup_add_coments_widget.dart';
import '/pages/txt_comentario_publicacion_curso/txt_comentario_publicacion_curso_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'course_datails_model.dart';
export 'course_datails_model.dart';

class CourseDatailsWidget extends StatefulWidget {
  const CourseDatailsWidget({
    super.key,
    required this.refCourses,
    required this.refCoursesClass,
    required this.refUser,
  });

  final CoursesRecord? refCourses;
  final ModuleClassRecord? refCoursesClass;
  final UsersRecord? refUser;

  static String routeName = 'CourseDatails';
  static String routePath = 'courseDatails';

  @override
  State<CourseDatailsWidget> createState() => _CourseDatailsWidgetState();
}

class _CourseDatailsWidgetState extends State<CourseDatailsWidget>
    with TickerProviderStateMixin {
  late CourseDatailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CourseDatailsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.refUserCourse = await queryUsersCoursesRecordOnce(
        queryBuilder: (usersCoursesRecord) => usersCoursesRecord
            .where(
              'uid_user',
              isEqualTo: currentUserReference?.id,
            )
            .where(
              'uid_courses',
              isEqualTo: widget.refCourses?.reference.id,
            ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.refUserCourse?.reference != null) {
        _model.refCourseClass = widget.refCoursesClass;
        safeSetState(() {});
        _model.totalActivities = await actions.totalActividadesCourse(
          widget.refCourses!,
        );
        _model.totalActividades = _model.totalActivities;
        safeSetState(() {});
      } else {
        context.goNamed(
          CoursePriceWidget.routeName,
          queryParameters: {
            'refCourse': serializeParam(
              widget.refCourses,
              ParamType.Document,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            'refCourse': widget.refCourses,
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      }

      await Future.delayed(const Duration(milliseconds: 1000));
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

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
                  StreamBuilder<List<UsersModuleclassRecord>>(
                    stream: queryUsersModuleclassRecord(
                      queryBuilder: (usersModuleclassRecord) =>
                          usersModuleclassRecord
                              .where(
                                'uid_user',
                                isEqualTo: widget.refUser?.reference.id != ''
                                    ? widget.refUser?.reference.id
                                    : null,
                              )
                              .where(
                                'uid_curse',
                                isEqualTo:
                                    widget.refCourses?.reference.id != ''
                                        ? widget.refCourses?.reference.id
                                        : null,
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
                      List<UsersModuleclassRecord>
                          headerCourseUsersModuleclassRecordList =
                          snapshot.data!;

                      return wrapWithModel(
                        model: _model.headerCourseModel,
                        updateCallback: () => safeSetState(() {}),
                        child: HeaderCourseWidget(
                          proceso: valueOrDefault<double>(
                            (headerCourseUsersModuleclassRecordList
                                    .where((e) => e.stateView)
                                    .toList()
                                    .length
                                    .toDouble() /
                                valueOrDefault<double>(
                                  _model.totalActividades,
                                  0.0,
                                ) *
                                100),
                            0.0,
                          ),
                          nombreCurso: valueOrDefault<String>(
                            widget.refCourses?.name,
                            '-',
                          ),
                          urlPagina:
                              'riskperu://riskperu.com${GoRouterState.of(context).uri.toString()}',
                        ),
                      );
                    },
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
                              if (valueOrDefault(
                                      currentUserDocument?.userType, 0) !=
                                  2)
                                AuthUserStreamWidget(
                                  builder: (context) => Container(
                                    height: double.infinity,
                                    child: wrapWithModel(
                                      model: _model.navbarModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: NavbarWidget(
                                        state: 4,
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
                                        padding: EdgeInsets.all(50.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    child:
                                                        FlutterFlowVideoPlayer(
                                                      path: functions
                                                          .convertirVideo(_model
                                                              .refCourseClass!
                                                              .linkVideo),
                                                      videoType:
                                                          VideoType.network,
                                                      autoPlay: false,
                                                      looping: false,
                                                      showControls: true,
                                                      allowFullScreen: true,
                                                      allowPlaybackSpeedMenu:
                                                          true,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
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
                                                          EdgeInsets.all(15.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Container(
                                                          height: 800.0,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxHeight: 1500.0,
                                                          ),
                                                          child: Column(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    Alignment(
                                                                        -1.0,
                                                                        0),
                                                                child: TabBar(
                                                                  isScrollable:
                                                                      true,
                                                                  tabAlignment:
                                                                      TabAlignment
                                                                          .start,
                                                                  labelColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  unselectedLabelColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  unselectedLabelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  indicatorColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  tabs: [
                                                                    Tab(
                                                                      text:
                                                                          'Descripción general',
                                                                    ),
                                                                    Tab(
                                                                      text:
                                                                          'Preguntas y respuestas',
                                                                    ),
                                                                    Tab(
                                                                      text:
                                                                          'Notas',
                                                                    ),
                                                                    Tab(
                                                                      text:
                                                                          'Anuncios',
                                                                    ),
                                                                    Tab(
                                                                      text:
                                                                          'Valoraciones',
                                                                    ),
                                                                  ],
                                                                  controller: _model
                                                                      .tabBarController,
                                                                  onTap:
                                                                      (i) async {
                                                                    [
                                                                      () async {},
                                                                      () async {},
                                                                      () async {},
                                                                      () async {},
                                                                      () async {}
                                                                    ][i]();
                                                                  },
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    TabBarView(
                                                                  controller: _model
                                                                      .tabBarController,
                                                                  children: [
                                                                    SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                20.0,
                                                                                0.0,
                                                                                20.0,
                                                                                10.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      widget.refCourses?.name,
                                                                                      'Sin Nombre',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: Color(0xFF01203F),
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      widget.refCourses?.introduction,
                                                                                      '--',
                                                                                    ),
                                                                                    textAlign: TextAlign.start,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Text(
                                                                                                  '4,6',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                                Icon(
                                                                                                  Icons.star,
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  size: 15.0,
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 3.0)),
                                                                                            ),
                                                                                            Text(
                                                                                              '731 Calificaciones',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: Color(0xFF848484),
                                                                                                    fontSize: 10.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                StreamBuilder<List<UsersCoursesRecord>>(
                                                                                                  stream: queryUsersCoursesRecord(
                                                                                                    queryBuilder: (usersCoursesRecord) => usersCoursesRecord.where(
                                                                                                      'uid_courses',
                                                                                                      isEqualTo: widget.refCourses?.reference.id != '' ? widget.refCourses?.reference.id : null,
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
                                                                                                    List<UsersCoursesRecord> textUsersCoursesRecordList = snapshot.data!;

                                                                                                    return Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        formatNumber(
                                                                                                          textUsersCoursesRecordList.length,
                                                                                                          formatType: FormatType.compact,
                                                                                                        ),
                                                                                                        '0',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Poppins',
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 3.0)),
                                                                                            ),
                                                                                            Text(
                                                                                              'Estudiantes',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: Color(0xFF848484),
                                                                                                    fontSize: 10.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                RichText(
                                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                                  text: TextSpan(
                                                                                                    children: [
                                                                                                      TextSpan(
                                                                                                        text: valueOrDefault<String>(
                                                                                                          widget.refCourses?.hours,
                                                                                                          '0',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Poppins',
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                      TextSpan(
                                                                                                        text: ' Horas',
                                                                                                        style: TextStyle(),
                                                                                                      )
                                                                                                    ],
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 3.0)),
                                                                                            ),
                                                                                            Text(
                                                                                              'Total',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: Color(0xFF848484),
                                                                                                    fontSize: 10.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 20.0)),
                                                                                  ),
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.report_problem_outlined,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            size: 14.0,
                                                                                          ),
                                                                                          RichText(
                                                                                            textScaler: MediaQuery.of(context).textScaler,
                                                                                            text: TextSpan(
                                                                                              children: [
                                                                                                TextSpan(
                                                                                                  text: 'Última actualización ',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        lineHeight: 1.0,
                                                                                                      ),
                                                                                                ),
                                                                                                TextSpan(
                                                                                                  text: dateTimeFormat(
                                                                                                    "MMMM yyyy",
                                                                                                    widget.refCourses!.updatedDate!,
                                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                                  ),
                                                                                                  style: TextStyle(),
                                                                                                )
                                                                                              ],
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    lineHeight: 1.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 5.0)),
                                                                                      ),
                                                                                      StreamBuilder<List<LanguageRecord>>(
                                                                                        stream: queryLanguageRecord(
                                                                                          queryBuilder: (languageRecord) => languageRecord.where(
                                                                                            'uid',
                                                                                            isEqualTo: valueOrDefault<String>(
                                                                                              widget.refCourses?.language,
                                                                                              'Español',
                                                                                            ),
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
                                                                                          List<LanguageRecord> rowLanguageRecordList = snapshot.data!;
                                                                                          final rowLanguageRecord = rowLanguageRecordList.isNotEmpty ? rowLanguageRecordList.first : null;

                                                                                          return Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Icon(
                                                                                                    Icons.language_sharp,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 14.0,
                                                                                                  ),
                                                                                                  Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      rowLanguageRecord?.name,
                                                                                                      'Español',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          lineHeight: 1.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 5.0)),
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  FaIcon(
                                                                                                    FontAwesomeIcons.creditCard,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 14.0,
                                                                                                  ),
                                                                                                  RichText(
                                                                                                    textScaler: MediaQuery.of(context).textScaler,
                                                                                                    text: TextSpan(
                                                                                                      children: [
                                                                                                        TextSpan(
                                                                                                          text: valueOrDefault<String>(
                                                                                                            rowLanguageRecord?.name,
                                                                                                            'Español',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                lineHeight: 1.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                        TextSpan(
                                                                                                          text: ' (Automático)',
                                                                                                          style: TextStyle(),
                                                                                                        )
                                                                                                      ],
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Poppins',
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontSize: 14.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            lineHeight: 1.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 5.0)),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 10.0)),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ].divide(SizedBox(height: 7.0)),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 15.0)).addToStart(SizedBox(height: 10.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                3.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFB4B4B4),
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.all(20.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Icon(
                                                                                        Icons.language,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        size: 14.0,
                                                                                      ),
                                                                                      Text(
                                                                                        'Por Cifras',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 14.0,
                                                                                              letterSpacing: 0.0,
                                                                                              lineHeight: 1.0,
                                                                                            ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 5.0)),
                                                                                  ),
                                                                                  Flexible(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        RichText(
                                                                                          textScaler: MediaQuery.of(context).textScaler,
                                                                                          text: TextSpan(
                                                                                            children: [
                                                                                              TextSpan(
                                                                                                text: 'Nivel de habilidad: ',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      lineHeight: 1.0,
                                                                                                    ),
                                                                                              ),
                                                                                              TextSpan(
                                                                                                text: 'Todos los Niveles',
                                                                                                style: TextStyle(),
                                                                                              )
                                                                                            ],
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  lineHeight: 1.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        StreamBuilder<List<UsersCoursesRecord>>(
                                                                                          stream: queryUsersCoursesRecord(
                                                                                            queryBuilder: (usersCoursesRecord) => usersCoursesRecord.where(
                                                                                              'uid_courses',
                                                                                              isEqualTo: widget.refCourses?.reference.id != '' ? widget.refCourses?.reference.id : null,
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
                                                                                            List<UsersCoursesRecord> richTextUsersCoursesRecordList = snapshot.data!;

                                                                                            return RichText(
                                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                                              text: TextSpan(
                                                                                                children: [
                                                                                                  TextSpan(
                                                                                                    text: 'Estudiantes: ',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          lineHeight: 1.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                  TextSpan(
                                                                                                    text: valueOrDefault<String>(
                                                                                                      formatNumber(
                                                                                                        richTextUsersCoursesRecordList.length,
                                                                                                        formatType: FormatType.compact,
                                                                                                      ),
                                                                                                      '0',
                                                                                                    ),
                                                                                                    style: TextStyle(),
                                                                                                  )
                                                                                                ],
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      lineHeight: 1.0,
                                                                                                    ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                        RichText(
                                                                                          textScaler: MediaQuery.of(context).textScaler,
                                                                                          text: TextSpan(
                                                                                            children: [
                                                                                              TextSpan(
                                                                                                text: 'Idiomas: ',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      lineHeight: 1.0,
                                                                                                    ),
                                                                                              ),
                                                                                              TextSpan(
                                                                                                text: 'Español',
                                                                                                style: TextStyle(),
                                                                                              )
                                                                                            ],
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  lineHeight: 1.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        RichText(
                                                                                          textScaler: MediaQuery.of(context).textScaler,
                                                                                          text: TextSpan(
                                                                                            children: [
                                                                                              TextSpan(
                                                                                                text: 'Subtitulos: ',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      lineHeight: 1.0,
                                                                                                    ),
                                                                                              ),
                                                                                              TextSpan(
                                                                                                text: 'Si',
                                                                                                style: TextStyle(),
                                                                                              )
                                                                                            ],
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  lineHeight: 1.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 5.0)),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 40.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                3.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFB4B4B4),
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.all(20.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Icon(
                                                                                        Icons.language,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        size: 14.0,
                                                                                      ),
                                                                                      Text(
                                                                                        'Certificados',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 14.0,
                                                                                              letterSpacing: 0.0,
                                                                                              lineHeight: 1.0,
                                                                                            ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 5.0)),
                                                                                  ),
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      RichText(
                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                        text: TextSpan(
                                                                                          children: [
                                                                                            TextSpan(
                                                                                              text: 'Consigue el Certificado de Risk al completar todo el Curso',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    lineHeight: 1.0,
                                                                                                  ),
                                                                                            )
                                                                                          ],
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Poppins',
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                lineHeight: 1.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      FFButtonWidget(
                                                                                        onPressed: () async {
                                                                                          await downloadFile(
                                                                                            filename: 'Certificado',
                                                                                            url: 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/kpacita-ssg7c7/assets/29h2zxi2g2xb/Victor_Espinoza_Guzman.pdf',
                                                                                          );
                                                                                        },
                                                                                        text: 'Ver Certificado',
                                                                                        options: FFButtonOptions(
                                                                                          width: 386.0,
                                                                                          height: 34.0,
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                fontFamily: 'Poppins',
                                                                                                color: Colors.white,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                          elevation: 0.0,
                                                                                          borderRadius: BorderRadius.circular(4.0),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(height: 20.0)),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 27.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                3.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFB4B4B4),
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.all(20.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Icon(
                                                                                        Icons.language,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        size: 14.0,
                                                                                      ),
                                                                                      Text(
                                                                                        'Caracteristicas',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 14.0,
                                                                                              letterSpacing: 0.0,
                                                                                              lineHeight: 1.0,
                                                                                            ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 5.0)),
                                                                                  ),
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      RichText(
                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                        text: TextSpan(
                                                                                          children: [
                                                                                            TextSpan(
                                                                                              text: 'Disponible en ',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    lineHeight: 1.0,
                                                                                                  ),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: 'PC ',
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                fontWeight: FontWeight.bold,
                                                                                                decoration: TextDecoration.underline,
                                                                                              ),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: 'y ',
                                                                                              style: TextStyle(),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: 'Android',
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                fontWeight: FontWeight.bold,
                                                                                                decoration: TextDecoration.underline,
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Poppins',
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                lineHeight: 1.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(height: 20.0)),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 20.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                3.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFB4B4B4),
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.all(20.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.language,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            size: 14.0,
                                                                                          ),
                                                                                          Text(
                                                                                            'Descripción',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  lineHeight: 1.0,
                                                                                                ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 5.0)),
                                                                                      ),
                                                                                      Flexible(
                                                                                        child: Builder(
                                                                                          builder: (context) {
                                                                                            if (_model.stateDescripcion) {
                                                                                              return Text(
                                                                                                valueOrDefault<String>(
                                                                                                  widget.refCourses?.description,
                                                                                                  '--',
                                                                                                ),
                                                                                                textAlign: TextAlign.start,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              );
                                                                                            } else {
                                                                                              return GradientText(
                                                                                                valueOrDefault<String>(
                                                                                                  widget.refCourses?.description,
                                                                                                  '--',
                                                                                                ).maybeHandleOverflow(
                                                                                                  maxChars: 150,
                                                                                                ),
                                                                                                textAlign: TextAlign.start,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                                colors: [
                                                                                                  Color(0xFF666666),
                                                                                                  Color(0x06666666)
                                                                                                ],
                                                                                                gradientDirection: GradientDirection.ttb,
                                                                                                gradientType: GradientType.linear,
                                                                                              );
                                                                                            }
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 27.0)),
                                                                                  ),
                                                                                  FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      if (_model.stateDescripcion) {
                                                                                        _model.stateDescripcion = false;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        _model.stateDescripcion = true;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    text: valueOrDefault<String>(
                                                                                      _model.stateDescripcion ? 'Ver menos' : 'Ver más',
                                                                                      'Ver más',
                                                                                    ),
                                                                                    icon: FaIcon(
                                                                                      FontAwesomeIcons.caretDown,
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      size: 15.0,
                                                                                    ),
                                                                                    options: FFButtonOptions(
                                                                                      height: 40.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                      iconAlignment: IconAlignment.end,
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: Color(0x00DB0B17),
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      elevation: 0.0,
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    SingleChildScrollView(
                                                                      primary:
                                                                          false,
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          StreamBuilder<
                                                                              List<ComentariosRecord>>(
                                                                            stream:
                                                                                queryComentariosRecord(
                                                                              queryBuilder: (comentariosRecord) => comentariosRecord
                                                                                  .where(
                                                                                    'uid_Courses',
                                                                                    isEqualTo: widget.refCourses?.reference.id,
                                                                                  )
                                                                                  .where(
                                                                                    'pared_id',
                                                                                    isEqualTo: 'null',
                                                                                  )
                                                                                  .orderBy('created_date', descending: true),
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
                                                                              List<ComentariosRecord> containerComentariosRecordList = snapshot.data!;

                                                                              return Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                                                                                      child: Container(
                                                                                        width: double.infinity,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: double.infinity,
                                                                                              height: 44.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                                                border: Border.all(
                                                                                                  color: Colors.black,
                                                                                                ),
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: Container(
                                                                                                      width: 200.0,
                                                                                                      child: TextFormField(
                                                                                                        controller: _model.textController1,
                                                                                                        focusNode: _model.textFieldFocusNode1,
                                                                                                        autofocus: false,
                                                                                                        obscureText: false,
                                                                                                        decoration: InputDecoration(
                                                                                                          isDense: true,
                                                                                                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                          hintText: 'Buscar Todas las preguntas del curso',
                                                                                                          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                color: Color(0xFF767676),
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                          enabledBorder: OutlineInputBorder(
                                                                                                            borderSide: BorderSide(
                                                                                                              color: Color(0x00000000),
                                                                                                              width: 1.0,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.only(
                                                                                                              bottomLeft: Radius.circular(4.0),
                                                                                                              bottomRight: Radius.circular(0.0),
                                                                                                              topLeft: Radius.circular(4.0),
                                                                                                              topRight: Radius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          focusedBorder: OutlineInputBorder(
                                                                                                            borderSide: BorderSide(
                                                                                                              color: Color(0x00000000),
                                                                                                              width: 1.0,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.only(
                                                                                                              bottomLeft: Radius.circular(4.0),
                                                                                                              bottomRight: Radius.circular(0.0),
                                                                                                              topLeft: Radius.circular(4.0),
                                                                                                              topRight: Radius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          errorBorder: OutlineInputBorder(
                                                                                                            borderSide: BorderSide(
                                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                                              width: 1.0,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.only(
                                                                                                              bottomLeft: Radius.circular(4.0),
                                                                                                              bottomRight: Radius.circular(0.0),
                                                                                                              topLeft: Radius.circular(4.0),
                                                                                                              topRight: Radius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                                            borderSide: BorderSide(
                                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                                              width: 1.0,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.only(
                                                                                                              bottomLeft: Radius.circular(4.0),
                                                                                                              bottomRight: Radius.circular(0.0),
                                                                                                              topLeft: Radius.circular(4.0),
                                                                                                              topRight: Radius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          filled: true,
                                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Poppins',
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                        validator: _model.textController1Validator.asValidator(context),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  FlutterFlowIconButton(
                                                                                                    borderColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                    buttonSize: 46.0,
                                                                                                    fillColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                    icon: FaIcon(
                                                                                                      FontAwesomeIcons.search,
                                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                    onPressed: () {
                                                                                                      print('IconButton pressed ...');
                                                                                                    },
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      'Filtros:',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Poppins',
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                          ),
                                                                                                    ),
                                                                                                    FlutterFlowDropDown<String>(
                                                                                                      controller: _model.dropDownValueController1 ??= FormFieldController<String>(null),
                                                                                                      options: <String>[],
                                                                                                      onChanged: (val) => safeSetState(() => _model.dropDownValue1 = val),
                                                                                                      width: 200.0,
                                                                                                      height: 40.0,
                                                                                                      maxHeight: 300.0,
                                                                                                      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Poppins',
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                      hintText: 'Todas las Clases',
                                                                                                      icon: FaIcon(
                                                                                                        FontAwesomeIcons.caretDown,
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        size: 15.0,
                                                                                                      ),
                                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      elevation: 0.0,
                                                                                                      borderColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                      borderWidth: 0.0,
                                                                                                      borderRadius: 4.0,
                                                                                                      margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                      hidesUnderline: true,
                                                                                                      isOverButton: false,
                                                                                                      isSearchable: false,
                                                                                                      isMultiSelect: false,
                                                                                                    ),
                                                                                                  ].divide(SizedBox(height: 5.0)),
                                                                                                ),
                                                                                                Flexible(
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        'Ordenar Por:',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Poppins',
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                            ),
                                                                                                      ),
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Flexible(
                                                                                                            child: FlutterFlowDropDown<String>(
                                                                                                              controller: _model.dropDownValueController2 ??= FormFieldController<String>(null),
                                                                                                              options: [
                                                                                                                'Option 1',
                                                                                                                'Option 2',
                                                                                                                'Option 3'
                                                                                                              ],
                                                                                                              onChanged: (val) => safeSetState(() => _model.dropDownValue2 = val),
                                                                                                              width: double.infinity,
                                                                                                              height: 40.0,
                                                                                                              maxHeight: 300.0,
                                                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Poppins',
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                              hintText: 'Ordenar por Recomendados',
                                                                                                              icon: FaIcon(
                                                                                                                FontAwesomeIcons.caretDown,
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                size: 15.0,
                                                                                                              ),
                                                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              elevation: 0.0,
                                                                                                              borderColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                              borderWidth: 0.0,
                                                                                                              borderRadius: 4.0,
                                                                                                              margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                              hidesUnderline: true,
                                                                                                              isOverButton: false,
                                                                                                              isSearchable: false,
                                                                                                              isMultiSelect: false,
                                                                                                            ),
                                                                                                          ),
                                                                                                          FlutterFlowDropDown<String>(
                                                                                                            controller: _model.dropDownValueController3 ??= FormFieldController<String>(null),
                                                                                                            options: [
                                                                                                              'Option 1',
                                                                                                              'Option 2',
                                                                                                              'Option 3'
                                                                                                            ],
                                                                                                            onChanged: (val) => safeSetState(() => _model.dropDownValue3 = val),
                                                                                                            width: 200.0,
                                                                                                            height: 40.0,
                                                                                                            maxHeight: 300.0,
                                                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Poppins',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                            hintText: 'Filtrar Preguntas',
                                                                                                            icon: Icon(
                                                                                                              Icons.keyboard_arrow_down_rounded,
                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                              size: 24.0,
                                                                                                            ),
                                                                                                            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            elevation: 0.0,
                                                                                                            borderColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                            borderWidth: 0.0,
                                                                                                            borderRadius: 4.0,
                                                                                                            margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                            hidesUnderline: true,
                                                                                                            isOverButton: false,
                                                                                                            isSearchable: false,
                                                                                                            isMultiSelect: false,
                                                                                                          ),
                                                                                                        ].divide(SizedBox(width: 20.0)),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(height: 5.0)),
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 20.0)),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 10.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: double.infinity,
                                                                                      height: 3.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color(0xFFB4B4B4),
                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsets.all(20.0),
                                                                                      child: Container(
                                                                                        width: double.infinity,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            RichText(
                                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                                              text: TextSpan(
                                                                                                children: [
                                                                                                  TextSpan(
                                                                                                    text: 'Preguntas Destacadas en este Curso (',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontSize: 16.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                        ),
                                                                                                  ),
                                                                                                  TextSpan(
                                                                                                    text: '0',
                                                                                                    style: TextStyle(),
                                                                                                  ),
                                                                                                  TextSpan(
                                                                                                    text: ')',
                                                                                                    style: TextStyle(),
                                                                                                  )
                                                                                                ],
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      fontSize: 16.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Builder(
                                                                                              builder: (context) {
                                                                                                if (_model.stateQuestion) {
                                                                                                  return Builder(
                                                                                                    builder: (context) {
                                                                                                      final lisaComentario = containerComentariosRecordList.toList();
                                                                                                      if (lisaComentario.isEmpty) {
                                                                                                        return Center(
                                                                                                          child: Container(
                                                                                                            height: 250.0,
                                                                                                            child: EmptyComentWidget(),
                                                                                                          ),
                                                                                                        );
                                                                                                      }

                                                                                                      return ListView.separated(
                                                                                                        padding: EdgeInsets.zero,
                                                                                                        primary: false,
                                                                                                        shrinkWrap: true,
                                                                                                        scrollDirection: Axis.vertical,
                                                                                                        itemCount: lisaComentario.length,
                                                                                                        separatorBuilder: (_, __) => SizedBox(height: 20.0),
                                                                                                        itemBuilder: (context, lisaComentarioIndex) {
                                                                                                          final lisaComentarioItem = lisaComentario[lisaComentarioIndex];
                                                                                                          return Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              StreamBuilder<List<UsersRecord>>(
                                                                                                                stream: queryUsersRecord(
                                                                                                                  queryBuilder: (usersRecord) => usersRecord.where(
                                                                                                                    'uid',
                                                                                                                    isEqualTo: lisaComentarioItem.uidUser != '' ? lisaComentarioItem.uidUser : null,
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
                                                                                                                  List<UsersRecord> containerUsersRecordList = snapshot.data!;
                                                                                                                  final containerUsersRecord = containerUsersRecordList.isNotEmpty ? containerUsersRecordList.first : null;

                                                                                                                  return Container(
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                    ),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(35.0, 0.0, 0.0, 0.0),
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
                                                                                                                                image: CachedNetworkImageProvider(
                                                                                                                                  valueOrDefault<String>(
                                                                                                                                    containerUsersRecord?.photoUrl,
                                                                                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/kpacita-ssg7c7/assets/mouvjylm6zw7/Risk_Peru_rebranding_final_Mesa_de_trabajo_1_copia_11.png',
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              borderRadius: BorderRadius.circular(42.0),
                                                                                                                              border: Border.all(
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Flexible(
                                                                                                                            child: Container(
                                                                                                                              width: double.infinity,
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                              ),
                                                                                                                              child: Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                children: [
                                                                                                                                  Flexible(
                                                                                                                                    child: Container(
                                                                                                                                      decoration: BoxDecoration(),
                                                                                                                                      child: Column(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                        children: [
                                                                                                                                          Column(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                            children: [
                                                                                                                                              Text(
                                                                                                                                                valueOrDefault<String>(
                                                                                                                                                  containerUsersRecord?.displayName,
                                                                                                                                                  'Sistema',
                                                                                                                                                ),
                                                                                                                                                maxLines: 2,
                                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                      fontFamily: 'Poppins',
                                                                                                                                                      fontSize: 16.0,
                                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                                      fontWeight: FontWeight.bold,
                                                                                                                                                    ),
                                                                                                                                              ),
                                                                                                                                              Text(
                                                                                                                                                valueOrDefault<String>(
                                                                                                                                                  lisaComentarioItem.contenido,
                                                                                                                                                  '--',
                                                                                                                                                ),
                                                                                                                                                maxLines: 5,
                                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                      fontFamily: 'Poppins',
                                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                                    ),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                          Row(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            children: [
                                                                                                                                              RichText(
                                                                                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                                                                                text: TextSpan(
                                                                                                                                                  children: [
                                                                                                                                                    TextSpan(
                                                                                                                                                      text: valueOrDefault<String>(
                                                                                                                                                        dateTimeFormat(
                                                                                                                                                          "relative",
                                                                                                                                                          lisaComentarioItem.createdDate,
                                                                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                                                                        ),
                                                                                                                                                        'Sin fecha',
                                                                                                                                                      ),
                                                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                            fontFamily: 'Poppins',
                                                                                                                                                            letterSpacing: 0.0,
                                                                                                                                                          ),
                                                                                                                                                    )
                                                                                                                                                  ],
                                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                        fontFamily: 'Poppins',
                                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                                      ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                              FFButtonWidget(
                                                                                                                                                onPressed: () async {
                                                                                                                                                  if (FFAppState().listComent.contains(lisaComentarioItem.reference.id)) {
                                                                                                                                                    FFAppState().removeFromListComent(lisaComentarioItem.reference.id);
                                                                                                                                                    FFAppState().update(() {});
                                                                                                                                                  } else {
                                                                                                                                                    FFAppState().addToListComent(lisaComentarioItem.reference.id);
                                                                                                                                                    FFAppState().update(() {});
                                                                                                                                                  }
                                                                                                                                                },
                                                                                                                                                text: 'Responder',
                                                                                                                                                options: FFButtonOptions(
                                                                                                                                                  height: 30.0,
                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                                        fontFamily: 'Poppins',
                                                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                        fontSize: 12.0,
                                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                                                      ),
                                                                                                                                                  elevation: 0.0,
                                                                                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                                                                                  hoverColor: Color(0x180F0F0F),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ].divide(SizedBox(width: 20.0)),
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  FlutterFlowIconButton(
                                                                                                                                    borderColor: Colors.transparent,
                                                                                                                                    borderRadius: 100.0,
                                                                                                                                    buttonSize: 40.0,
                                                                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                    hoverColor: Color(0x180F0F0F),
                                                                                                                                    hoverIconColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    icon: Icon(
                                                                                                                                      Icons.more_vert,
                                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                      size: 24.0,
                                                                                                                                    ),
                                                                                                                                    onPressed: () {
                                                                                                                                      print('IconButton pressed ...');
                                                                                                                                    },
                                                                                                                                  ),
                                                                                                                                ].divide(SizedBox(width: 10.0)),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ].divide(SizedBox(width: 10.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                              ),
                                                                                                              StreamBuilder<List<ComentariosRecord>>(
                                                                                                                stream: queryComentariosRecord(
                                                                                                                  queryBuilder: (comentariosRecord) => comentariosRecord
                                                                                                                      .where(
                                                                                                                        'uid_Courses',
                                                                                                                        isEqualTo: widget.refCourses?.reference.id != '' ? widget.refCourses?.reference.id : null,
                                                                                                                      )
                                                                                                                      .where(
                                                                                                                        'pared_id',
                                                                                                                        isEqualTo: lisaComentarioItem.reference.id != '' ? lisaComentarioItem.reference.id : null,
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
                                                                                                                  List<ComentariosRecord> containerComentariosRecordList = snapshot.data!;

                                                                                                                  return Container(
                                                                                                                    width: double.infinity,
                                                                                                                    decoration: BoxDecoration(),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(80.0, 0.0, 0.0, 0.0),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          if (FFAppState().listComent.contains(lisaComentarioItem.reference.id))
                                                                                                                            wrapWithModel(
                                                                                                                              model: _model.popupAddComentsModels1.getModel(
                                                                                                                                widget.refCourses!.reference.id,
                                                                                                                                lisaComentarioIndex,
                                                                                                                              ),
                                                                                                                              updateCallback: () => safeSetState(() {}),
                                                                                                                              child: PopupAddComentsWidget(
                                                                                                                                key: Key(
                                                                                                                                  'Keyi2u_${widget.refCourses!.reference.id}',
                                                                                                                                ),
                                                                                                                                parameter1: lisaComentarioItem.reference.id,
                                                                                                                                parameter2: widget.refCourses?.reference.id,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          if (containerComentariosRecordList.isNotEmpty)
                                                                                                                            Builder(
                                                                                                                              builder: (context) {
                                                                                                                                if (_model.listComentView.contains(lisaComentarioItem.reference.id)) {
                                                                                                                                  return FFButtonWidget(
                                                                                                                                    onPressed: () async {
                                                                                                                                      _model.removeFromListComentView(lisaComentarioItem.reference.id);
                                                                                                                                      safeSetState(() {});
                                                                                                                                    },
                                                                                                                                    text: '${valueOrDefault<String>(
                                                                                                                                      formatNumber(
                                                                                                                                        containerComentariosRecordList.length,
                                                                                                                                        formatType: FormatType.custom,
                                                                                                                                        format: '0',
                                                                                                                                        locale: '',
                                                                                                                                      ),
                                                                                                                                      '1',
                                                                                                                                    )} ${valueOrDefault<String>(
                                                                                                                                      containerComentariosRecordList.length > 1 ? 'Respuestas' : 'Respuesta',
                                                                                                                                      'Respuesta',
                                                                                                                                    )}',
                                                                                                                                    icon: Icon(
                                                                                                                                      Icons.expand_less_rounded,
                                                                                                                                      size: 15.0,
                                                                                                                                    ),
                                                                                                                                    options: FFButtonOptions(
                                                                                                                                      height: 30.0,
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                            fontFamily: 'Poppins',
                                                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                                                            fontSize: 12.0,
                                                                                                                                            letterSpacing: 0.0,
                                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                                          ),
                                                                                                                                      elevation: 0.0,
                                                                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                                                                      hoverColor: Color(0x180F0F0F),
                                                                                                                                    ),
                                                                                                                                  );
                                                                                                                                } else {
                                                                                                                                  return FFButtonWidget(
                                                                                                                                    onPressed: () async {
                                                                                                                                      _model.addToListComentView(lisaComentarioItem.reference.id);
                                                                                                                                      safeSetState(() {});
                                                                                                                                    },
                                                                                                                                    text: '${valueOrDefault<String>(
                                                                                                                                      formatNumber(
                                                                                                                                        containerComentariosRecordList.length,
                                                                                                                                        formatType: FormatType.custom,
                                                                                                                                        format: '0',
                                                                                                                                        locale: '',
                                                                                                                                      ),
                                                                                                                                      '1',
                                                                                                                                    )} ${valueOrDefault<String>(
                                                                                                                                      containerComentariosRecordList.length > 1 ? 'Respuestas' : 'Respuesta',
                                                                                                                                      'Respuesta',
                                                                                                                                    )}',
                                                                                                                                    icon: Icon(
                                                                                                                                      Icons.keyboard_arrow_down_rounded,
                                                                                                                                      size: 15.0,
                                                                                                                                    ),
                                                                                                                                    options: FFButtonOptions(
                                                                                                                                      height: 30.0,
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                            fontFamily: 'Poppins',
                                                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                                                            fontSize: 12.0,
                                                                                                                                            letterSpacing: 0.0,
                                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                                          ),
                                                                                                                                      elevation: 0.0,
                                                                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                                                                      hoverColor: Color(0x180F0F0F),
                                                                                                                                    ),
                                                                                                                                  );
                                                                                                                                }
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          if (_model.listComentView.contains(lisaComentarioItem.reference.id))
                                                                                                                            Builder(
                                                                                                                              builder: (context) {
                                                                                                                                final listaComentarioRespondidos = containerComentariosRecordList.toList();

                                                                                                                                return ListView.separated(
                                                                                                                                  padding: EdgeInsets.fromLTRB(
                                                                                                                                    0,
                                                                                                                                    10.0,
                                                                                                                                    0,
                                                                                                                                    10.0,
                                                                                                                                  ),
                                                                                                                                  shrinkWrap: true,
                                                                                                                                  scrollDirection: Axis.vertical,
                                                                                                                                  itemCount: listaComentarioRespondidos.length,
                                                                                                                                  separatorBuilder: (_, __) => SizedBox(height: 10.0),
                                                                                                                                  itemBuilder: (context, listaComentarioRespondidosIndex) {
                                                                                                                                    final listaComentarioRespondidosItem = listaComentarioRespondidos[listaComentarioRespondidosIndex];
                                                                                                                                    return StreamBuilder<List<UsersRecord>>(
                                                                                                                                      stream: queryUsersRecord(
                                                                                                                                        queryBuilder: (usersRecord) => usersRecord.where(
                                                                                                                                          'uid',
                                                                                                                                          isEqualTo: lisaComentarioItem.uidUser != '' ? lisaComentarioItem.uidUser : null,
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
                                                                                                                                        List<UsersRecord> containerUsersRecordList = snapshot.data!;
                                                                                                                                        final containerUsersRecord = containerUsersRecordList.isNotEmpty ? containerUsersRecordList.first : null;

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
                                                                                                                                                    image: CachedNetworkImageProvider(
                                                                                                                                                      valueOrDefault<String>(
                                                                                                                                                        containerUsersRecord?.photoUrl,
                                                                                                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/kpacita-ssg7c7/assets/mouvjylm6zw7/Risk_Peru_rebranding_final_Mesa_de_trabajo_1_copia_11.png',
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                  borderRadius: BorderRadius.circular(42.0),
                                                                                                                                                  border: Border.all(
                                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                              Flexible(
                                                                                                                                                child: Container(
                                                                                                                                                  width: double.infinity,
                                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                                  ),
                                                                                                                                                  child: Container(
                                                                                                                                                    decoration: BoxDecoration(),
                                                                                                                                                    child: Column(
                                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                                      children: [
                                                                                                                                                        Column(
                                                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                                          children: [
                                                                                                                                                            Text(
                                                                                                                                                              valueOrDefault<String>(
                                                                                                                                                                containerUsersRecord?.displayName,
                                                                                                                                                                'Sistema',
                                                                                                                                                              ),
                                                                                                                                                              maxLines: 2,
                                                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                                    fontFamily: 'Poppins',
                                                                                                                                                                    fontSize: 16.0,
                                                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                                                    fontWeight: FontWeight.bold,
                                                                                                                                                                  ),
                                                                                                                                                            ),
                                                                                                                                                            Text(
                                                                                                                                                              valueOrDefault<String>(
                                                                                                                                                                lisaComentarioItem.contenido,
                                                                                                                                                                '--',
                                                                                                                                                              ),
                                                                                                                                                              maxLines: 5,
                                                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                                    fontFamily: 'Poppins',
                                                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                                                  ),
                                                                                                                                                            ),
                                                                                                                                                          ],
                                                                                                                                                        ),
                                                                                                                                                        Row(
                                                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                                                          children: [
                                                                                                                                                            RichText(
                                                                                                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                                                                                                              text: TextSpan(
                                                                                                                                                                children: [
                                                                                                                                                                  TextSpan(
                                                                                                                                                                    text: valueOrDefault<String>(
                                                                                                                                                                      dateTimeFormat(
                                                                                                                                                                        "relative",
                                                                                                                                                                        lisaComentarioItem.createdDate,
                                                                                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                                                                                      ),
                                                                                                                                                                      'Sin fecha',
                                                                                                                                                                    ),
                                                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                                          fontFamily: 'Poppins',
                                                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                                                        ),
                                                                                                                                                                  )
                                                                                                                                                                ],
                                                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                                      fontFamily: 'Poppins',
                                                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                                                    ),
                                                                                                                                                              ),
                                                                                                                                                            ),
                                                                                                                                                          ].divide(SizedBox(width: 20.0)),
                                                                                                                                                        ),
                                                                                                                                                      ].divide(SizedBox(height: 10.0)),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ].divide(SizedBox(width: 10.0)),
                                                                                                                                          ),
                                                                                                                                        );
                                                                                                                                      },
                                                                                                                                    );
                                                                                                                                  },
                                                                                                                                );
                                                                                                                              },
                                                                                                                            ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                              ),
                                                                                                            ],
                                                                                                          );
                                                                                                        },
                                                                                                      );
                                                                                                    },
                                                                                                  );
                                                                                                } else {
                                                                                                  return Builder(
                                                                                                    builder: (context) {
                                                                                                      final lisaComentario = containerComentariosRecordList.toList().take(3).toList();
                                                                                                      if (lisaComentario.isEmpty) {
                                                                                                        return Center(
                                                                                                          child: Container(
                                                                                                            height: 250.0,
                                                                                                            child: EmptyComentWidget(),
                                                                                                          ),
                                                                                                        );
                                                                                                      }

                                                                                                      return ListView.separated(
                                                                                                        padding: EdgeInsets.zero,
                                                                                                        primary: false,
                                                                                                        shrinkWrap: true,
                                                                                                        scrollDirection: Axis.vertical,
                                                                                                        itemCount: lisaComentario.length,
                                                                                                        separatorBuilder: (_, __) => SizedBox(height: 20.0),
                                                                                                        itemBuilder: (context, lisaComentarioIndex) {
                                                                                                          final lisaComentarioItem = lisaComentario[lisaComentarioIndex];
                                                                                                          return Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              StreamBuilder<List<UsersRecord>>(
                                                                                                                stream: queryUsersRecord(
                                                                                                                  queryBuilder: (usersRecord) => usersRecord.where(
                                                                                                                    'uid',
                                                                                                                    isEqualTo: lisaComentarioItem.uidUser != '' ? lisaComentarioItem.uidUser : null,
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
                                                                                                                  List<UsersRecord> containerUsersRecordList = snapshot.data!;
                                                                                                                  final containerUsersRecord = containerUsersRecordList.isNotEmpty ? containerUsersRecordList.first : null;

                                                                                                                  return Container(
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                    ),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(35.0, 0.0, 0.0, 0.0),
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
                                                                                                                                image: CachedNetworkImageProvider(
                                                                                                                                  valueOrDefault<String>(
                                                                                                                                    containerUsersRecord?.photoUrl,
                                                                                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/kpacita-ssg7c7/assets/mouvjylm6zw7/Risk_Peru_rebranding_final_Mesa_de_trabajo_1_copia_11.png',
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              borderRadius: BorderRadius.circular(42.0),
                                                                                                                              border: Border.all(
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Flexible(
                                                                                                                            child: Container(
                                                                                                                              width: double.infinity,
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                              ),
                                                                                                                              child: Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                children: [
                                                                                                                                  Flexible(
                                                                                                                                    child: Container(
                                                                                                                                      decoration: BoxDecoration(),
                                                                                                                                      child: Column(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                        children: [
                                                                                                                                          Column(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                            children: [
                                                                                                                                              Text(
                                                                                                                                                valueOrDefault<String>(
                                                                                                                                                  containerUsersRecord?.displayName,
                                                                                                                                                  'Sistema',
                                                                                                                                                ),
                                                                                                                                                maxLines: 2,
                                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                      fontFamily: 'Poppins',
                                                                                                                                                      fontSize: 16.0,
                                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                                      fontWeight: FontWeight.bold,
                                                                                                                                                    ),
                                                                                                                                              ),
                                                                                                                                              Text(
                                                                                                                                                valueOrDefault<String>(
                                                                                                                                                  lisaComentarioItem.contenido,
                                                                                                                                                  '--',
                                                                                                                                                ),
                                                                                                                                                maxLines: 5,
                                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                      fontFamily: 'Poppins',
                                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                                    ),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                          Row(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            children: [
                                                                                                                                              RichText(
                                                                                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                                                                                text: TextSpan(
                                                                                                                                                  children: [
                                                                                                                                                    TextSpan(
                                                                                                                                                      text: valueOrDefault<String>(
                                                                                                                                                        dateTimeFormat(
                                                                                                                                                          "relative",
                                                                                                                                                          lisaComentarioItem.createdDate,
                                                                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                                                                        ),
                                                                                                                                                        'Sin fecha',
                                                                                                                                                      ),
                                                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                            fontFamily: 'Poppins',
                                                                                                                                                            letterSpacing: 0.0,
                                                                                                                                                          ),
                                                                                                                                                    )
                                                                                                                                                  ],
                                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                        fontFamily: 'Poppins',
                                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                                      ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                              FFButtonWidget(
                                                                                                                                                onPressed: () async {
                                                                                                                                                  if (FFAppState().listComent.contains(lisaComentarioItem.reference.id)) {
                                                                                                                                                    FFAppState().removeFromListComent(lisaComentarioItem.reference.id);
                                                                                                                                                    FFAppState().update(() {});
                                                                                                                                                  } else {
                                                                                                                                                    FFAppState().addToListComent(lisaComentarioItem.reference.id);
                                                                                                                                                    FFAppState().update(() {});
                                                                                                                                                  }
                                                                                                                                                },
                                                                                                                                                text: 'Responder',
                                                                                                                                                options: FFButtonOptions(
                                                                                                                                                  height: 30.0,
                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                                        fontFamily: 'Poppins',
                                                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                        fontSize: 12.0,
                                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                                                      ),
                                                                                                                                                  elevation: 0.0,
                                                                                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                                                                                  hoverColor: Color(0x180F0F0F),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ].divide(SizedBox(width: 20.0)),
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  FlutterFlowIconButton(
                                                                                                                                    borderColor: Colors.transparent,
                                                                                                                                    borderRadius: 100.0,
                                                                                                                                    buttonSize: 40.0,
                                                                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                    hoverColor: Color(0x180F0F0F),
                                                                                                                                    hoverIconColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    icon: Icon(
                                                                                                                                      Icons.more_vert,
                                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                      size: 24.0,
                                                                                                                                    ),
                                                                                                                                    onPressed: () {
                                                                                                                                      print('IconButton pressed ...');
                                                                                                                                    },
                                                                                                                                  ),
                                                                                                                                ].divide(SizedBox(width: 10.0)),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ].divide(SizedBox(width: 10.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                              ),
                                                                                                              StreamBuilder<List<ComentariosRecord>>(
                                                                                                                stream: queryComentariosRecord(
                                                                                                                  queryBuilder: (comentariosRecord) => comentariosRecord
                                                                                                                      .where(
                                                                                                                        'uid_Courses',
                                                                                                                        isEqualTo: widget.refCourses?.reference.id != '' ? widget.refCourses?.reference.id : null,
                                                                                                                      )
                                                                                                                      .where(
                                                                                                                        'pared_id',
                                                                                                                        isEqualTo: lisaComentarioItem.reference.id != '' ? lisaComentarioItem.reference.id : null,
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
                                                                                                                  List<ComentariosRecord> containerComentariosRecordList = snapshot.data!;

                                                                                                                  return Container(
                                                                                                                    width: double.infinity,
                                                                                                                    decoration: BoxDecoration(),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(80.0, 0.0, 0.0, 0.0),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          if (FFAppState().listComent.contains(lisaComentarioItem.reference.id))
                                                                                                                            wrapWithModel(
                                                                                                                              model: _model.popupAddComentsModels2.getModel(
                                                                                                                                widget.refCourses!.reference.id,
                                                                                                                                lisaComentarioIndex,
                                                                                                                              ),
                                                                                                                              updateCallback: () => safeSetState(() {}),
                                                                                                                              child: PopupAddComentsWidget(
                                                                                                                                key: Key(
                                                                                                                                  'Keyfdu_${widget.refCourses!.reference.id}',
                                                                                                                                ),
                                                                                                                                parameter1: lisaComentarioItem.reference.id,
                                                                                                                                parameter2: widget.refCourses?.reference.id,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          if (containerComentariosRecordList.isNotEmpty)
                                                                                                                            Builder(
                                                                                                                              builder: (context) {
                                                                                                                                if (_model.listComentView.contains(lisaComentarioItem.reference.id)) {
                                                                                                                                  return FFButtonWidget(
                                                                                                                                    onPressed: () async {
                                                                                                                                      _model.removeFromListComentView(lisaComentarioItem.reference.id);
                                                                                                                                      safeSetState(() {});
                                                                                                                                    },
                                                                                                                                    text: '${valueOrDefault<String>(
                                                                                                                                      formatNumber(
                                                                                                                                        containerComentariosRecordList.length,
                                                                                                                                        formatType: FormatType.custom,
                                                                                                                                        format: '0',
                                                                                                                                        locale: '',
                                                                                                                                      ),
                                                                                                                                      '1',
                                                                                                                                    )} ${valueOrDefault<String>(
                                                                                                                                      containerComentariosRecordList.length > 1 ? 'Respuestas' : 'Respuesta',
                                                                                                                                      'Respuesta',
                                                                                                                                    )}',
                                                                                                                                    icon: Icon(
                                                                                                                                      Icons.expand_less_rounded,
                                                                                                                                      size: 15.0,
                                                                                                                                    ),
                                                                                                                                    options: FFButtonOptions(
                                                                                                                                      height: 30.0,
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                            fontFamily: 'Poppins',
                                                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                                                            fontSize: 12.0,
                                                                                                                                            letterSpacing: 0.0,
                                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                                          ),
                                                                                                                                      elevation: 0.0,
                                                                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                                                                      hoverColor: Color(0x180F0F0F),
                                                                                                                                    ),
                                                                                                                                  );
                                                                                                                                } else {
                                                                                                                                  return FFButtonWidget(
                                                                                                                                    onPressed: () async {
                                                                                                                                      _model.addToListComentView(lisaComentarioItem.reference.id);
                                                                                                                                      safeSetState(() {});
                                                                                                                                    },
                                                                                                                                    text: '${valueOrDefault<String>(
                                                                                                                                      formatNumber(
                                                                                                                                        containerComentariosRecordList.length,
                                                                                                                                        formatType: FormatType.custom,
                                                                                                                                        format: '0',
                                                                                                                                        locale: '',
                                                                                                                                      ),
                                                                                                                                      '1',
                                                                                                                                    )} ${valueOrDefault<String>(
                                                                                                                                      containerComentariosRecordList.length > 1 ? 'Respuestas' : 'Respuesta',
                                                                                                                                      'Respuesta',
                                                                                                                                    )}',
                                                                                                                                    icon: Icon(
                                                                                                                                      Icons.keyboard_arrow_down_rounded,
                                                                                                                                      size: 15.0,
                                                                                                                                    ),
                                                                                                                                    options: FFButtonOptions(
                                                                                                                                      height: 30.0,
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                            fontFamily: 'Poppins',
                                                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                                                            fontSize: 12.0,
                                                                                                                                            letterSpacing: 0.0,
                                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                                          ),
                                                                                                                                      elevation: 0.0,
                                                                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                                                                      hoverColor: Color(0x180F0F0F),
                                                                                                                                    ),
                                                                                                                                  );
                                                                                                                                }
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          if (_model.listComentView.contains(lisaComentarioItem.reference.id))
                                                                                                                            Builder(
                                                                                                                              builder: (context) {
                                                                                                                                final listaComentarioRespondidos = containerComentariosRecordList.toList();

                                                                                                                                return ListView.separated(
                                                                                                                                  padding: EdgeInsets.fromLTRB(
                                                                                                                                    0,
                                                                                                                                    10.0,
                                                                                                                                    0,
                                                                                                                                    10.0,
                                                                                                                                  ),
                                                                                                                                  shrinkWrap: true,
                                                                                                                                  scrollDirection: Axis.vertical,
                                                                                                                                  itemCount: listaComentarioRespondidos.length,
                                                                                                                                  separatorBuilder: (_, __) => SizedBox(height: 10.0),
                                                                                                                                  itemBuilder: (context, listaComentarioRespondidosIndex) {
                                                                                                                                    final listaComentarioRespondidosItem = listaComentarioRespondidos[listaComentarioRespondidosIndex];
                                                                                                                                    return StreamBuilder<List<UsersRecord>>(
                                                                                                                                      stream: queryUsersRecord(
                                                                                                                                        queryBuilder: (usersRecord) => usersRecord.where(
                                                                                                                                          'uid',
                                                                                                                                          isEqualTo: listaComentarioRespondidosItem.uidUser != '' ? listaComentarioRespondidosItem.uidUser : null,
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
                                                                                                                                        List<UsersRecord> containerUsersRecordList = snapshot.data!;
                                                                                                                                        final containerUsersRecord = containerUsersRecordList.isNotEmpty ? containerUsersRecordList.first : null;

                                                                                                                                        return Container(
                                                                                                                                          decoration: BoxDecoration(
                                                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                          ),
                                                                                                                                          child: Padding(
                                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
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
                                                                                                                                                      image: CachedNetworkImageProvider(
                                                                                                                                                        valueOrDefault<String>(
                                                                                                                                                          containerUsersRecord?.photoUrl,
                                                                                                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/kpacita-ssg7c7/assets/mouvjylm6zw7/Risk_Peru_rebranding_final_Mesa_de_trabajo_1_copia_11.png',
                                                                                                                                                        ),
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                    borderRadius: BorderRadius.circular(42.0),
                                                                                                                                                    border: Border.all(
                                                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                                Flexible(
                                                                                                                                                  child: Container(
                                                                                                                                                    width: double.infinity,
                                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                                    ),
                                                                                                                                                    child: Container(
                                                                                                                                                      decoration: BoxDecoration(),
                                                                                                                                                      child: Column(
                                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                                        children: [
                                                                                                                                                          Column(
                                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                                            children: [
                                                                                                                                                              Text(
                                                                                                                                                                valueOrDefault<String>(
                                                                                                                                                                  containerUsersRecord?.displayName,
                                                                                                                                                                  'Sistema',
                                                                                                                                                                ),
                                                                                                                                                                maxLines: 2,
                                                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                                      fontFamily: 'Poppins',
                                                                                                                                                                      fontSize: 16.0,
                                                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                                                      fontWeight: FontWeight.bold,
                                                                                                                                                                    ),
                                                                                                                                                              ),
                                                                                                                                                              Text(
                                                                                                                                                                listaComentarioRespondidosItem.contenido,
                                                                                                                                                                maxLines: 5,
                                                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                                      fontFamily: 'Poppins',
                                                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                                                    ),
                                                                                                                                                              ),
                                                                                                                                                            ],
                                                                                                                                                          ),
                                                                                                                                                          Row(
                                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                                            children: [
                                                                                                                                                              RichText(
                                                                                                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                                                                                                text: TextSpan(
                                                                                                                                                                  children: [
                                                                                                                                                                    TextSpan(
                                                                                                                                                                      text: valueOrDefault<String>(
                                                                                                                                                                        dateTimeFormat(
                                                                                                                                                                          "relative",
                                                                                                                                                                          listaComentarioRespondidosItem.createdDate,
                                                                                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                                                                                        ),
                                                                                                                                                                        'Sin Fecha',
                                                                                                                                                                      ),
                                                                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                                            fontFamily: 'Poppins',
                                                                                                                                                                            letterSpacing: 0.0,
                                                                                                                                                                          ),
                                                                                                                                                                    )
                                                                                                                                                                  ],
                                                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                                        fontFamily: 'Poppins',
                                                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                                                      ),
                                                                                                                                                                ),
                                                                                                                                                              ),
                                                                                                                                                            ].divide(SizedBox(width: 20.0)),
                                                                                                                                                          ),
                                                                                                                                                        ].divide(SizedBox(height: 10.0)),
                                                                                                                                                      ),
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
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                              ),
                                                                                                            ],
                                                                                                          );
                                                                                                        },
                                                                                                      );
                                                                                                    },
                                                                                                  );
                                                                                                }
                                                                                              },
                                                                                            ),
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                if (containerComentariosRecordList.length > 3)
                                                                                                  FFButtonWidget(
                                                                                                    onPressed: () async {
                                                                                                      if (_model.stateQuestion) {
                                                                                                        _model.stateQuestion = false;
                                                                                                        safeSetState(() {});
                                                                                                      } else {
                                                                                                        _model.stateQuestion = true;
                                                                                                        safeSetState(() {});
                                                                                                      }
                                                                                                    },
                                                                                                    text: valueOrDefault<String>(
                                                                                                      _model.stateQuestion ? 'Ver Menos' : 'Ver Mas',
                                                                                                      'Ver Mas',
                                                                                                    ),
                                                                                                    options: FFButtonOptions(
                                                                                                      width: double.infinity,
                                                                                                      height: 44.0,
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                            fontFamily: 'Poppins',
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                          ),
                                                                                                      elevation: 0.0,
                                                                                                      borderSide: BorderSide(
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(4.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                Builder(
                                                                                                  builder: (context) => FFButtonWidget(
                                                                                                    onPressed: () async {
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
                                                                                                              child: CrearTipoComentarioWidget(
                                                                                                                refCurse: widget.refCourses!,
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                        },
                                                                                                      );
                                                                                                    },
                                                                                                    text: valueOrDefault<String>(
                                                                                                      containerComentariosRecordList.isNotEmpty ? 'Hacer otra pregunta' : 'Hacer una pregunta',
                                                                                                      'Hacer una pregunta',
                                                                                                    ),
                                                                                                    options: FFButtonOptions(
                                                                                                      width: double.infinity,
                                                                                                      height: 44.0,
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                            fontFamily: 'Poppins',
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                          ),
                                                                                                      elevation: 0.0,
                                                                                                      borderSide: BorderSide(
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(4.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(height: 20.0)),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 10.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    SingleChildScrollView(
                                                                      primary:
                                                                          false,
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                20.0,
                                                                                10.0,
                                                                                20.0,
                                                                                10.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Container(
                                                                                    width: double.infinity,
                                                                                    height: 44.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      borderRadius: BorderRadius.circular(4.0),
                                                                                      border: Border.all(
                                                                                        color: Colors.black,
                                                                                      ),
                                                                                    ),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Container(
                                                                                            width: 200.0,
                                                                                            child: TextFormField(
                                                                                              controller: _model.textController2,
                                                                                              focusNode: _model.textFieldFocusNode2,
                                                                                              autofocus: false,
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                isDense: true,
                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                                hintText: 'Buscar Todas las preguntas del curso',
                                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: Color(0xFF767676),
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: Color(0x00000000),
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.only(
                                                                                                    bottomLeft: Radius.circular(4.0),
                                                                                                    bottomRight: Radius.circular(0.0),
                                                                                                    topLeft: Radius.circular(4.0),
                                                                                                    topRight: Radius.circular(0.0),
                                                                                                  ),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: Color(0x00000000),
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.only(
                                                                                                    bottomLeft: Radius.circular(4.0),
                                                                                                    bottomRight: Radius.circular(0.0),
                                                                                                    topLeft: Radius.circular(4.0),
                                                                                                    topRight: Radius.circular(0.0),
                                                                                                  ),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.only(
                                                                                                    bottomLeft: Radius.circular(4.0),
                                                                                                    bottomRight: Radius.circular(0.0),
                                                                                                    topLeft: Radius.circular(4.0),
                                                                                                    topRight: Radius.circular(0.0),
                                                                                                  ),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.only(
                                                                                                    bottomLeft: Radius.circular(4.0),
                                                                                                    bottomRight: Radius.circular(0.0),
                                                                                                    topLeft: Radius.circular(4.0),
                                                                                                    topRight: Radius.circular(0.0),
                                                                                                  ),
                                                                                                ),
                                                                                                filled: true,
                                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                              cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                              validator: _model.textController2Validator.asValidator(context),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        FlutterFlowIconButton(
                                                                                          borderColor: FlutterFlowTheme.of(context).primaryText,
                                                                                          buttonSize: 46.0,
                                                                                          fillColor: FlutterFlowTheme.of(context).primaryText,
                                                                                          icon: FaIcon(
                                                                                            FontAwesomeIcons.search,
                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                            size: 24.0,
                                                                                          ),
                                                                                          onPressed: () {
                                                                                            print('IconButton pressed ...');
                                                                                          },
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      StreamBuilder<List<UsersCoursesRecord>>(
                                                                                        stream: queryUsersCoursesRecord(
                                                                                          queryBuilder: (usersCoursesRecord) => usersCoursesRecord
                                                                                              .where(
                                                                                                'uid_user',
                                                                                                isEqualTo: widget.refUser?.reference.id != '' ? widget.refUser?.reference.id : null,
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
                                                                                          List<UsersCoursesRecord> containerUsersCoursesRecordList = snapshot.data!;

                                                                                          return Container(
                                                                                            decoration: BoxDecoration(),
                                                                                            child: StreamBuilder<List<CoursesRecord>>(
                                                                                              stream: queryCoursesRecord(
                                                                                                queryBuilder: (coursesRecord) => coursesRecord.whereIn('uid', containerUsersCoursesRecordList.map((e) => e.uidCourses).toList() != '' ? containerUsersCoursesRecordList.map((e) => e.uidCourses).toList() : null).orderBy('Created_Date', descending: true),
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
                                                                                                List<CoursesRecord> cboCourseCoursesRecordList = snapshot.data!;

                                                                                                return FlutterFlowDropDown<String>(
                                                                                                  controller: _model.cboCourseValueController ??= FormFieldController<String>(
                                                                                                    _model.cboCourseValue ??= '',
                                                                                                  ),
                                                                                                  options: List<String>.from(cboCourseCoursesRecordList.map((e) => e.reference.id).toList()),
                                                                                                  optionLabels: cboCourseCoursesRecordList.map((e) => e.name).toList(),
                                                                                                  onChanged: (val) async {
                                                                                                    safeSetState(() => _model.cboCourseValue = val);
                                                                                                    _model.uidCourse = _model.cboCourseValue;
                                                                                                    safeSetState(() {});
                                                                                                  },
                                                                                                  width: 200.0,
                                                                                                  height: 40.0,
                                                                                                  maxHeight: 300.0,
                                                                                                  searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                  searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                      ),
                                                                                                  hintText: 'Todas las Clases',
                                                                                                  searchHintText: 'Buscar curso..',
                                                                                                  icon: FaIcon(
                                                                                                    FontAwesomeIcons.caretDown,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    size: 15.0,
                                                                                                  ),
                                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  elevation: 0.0,
                                                                                                  borderColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                  borderWidth: 0.0,
                                                                                                  borderRadius: 4.0,
                                                                                                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                  hidesUnderline: true,
                                                                                                  isOverButton: false,
                                                                                                  isSearchable: true,
                                                                                                  isMultiSelect: false,
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                      Flexible(
                                                                                        child: Container(
                                                                                          width: double.infinity,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: FlutterFlowDropDown<String>(
                                                                                            controller: _model.dropDownValueController4 ??= FormFieldController<String>(null),
                                                                                            options: [
                                                                                              'Option 1',
                                                                                              'Option 2',
                                                                                              'Option 3'
                                                                                            ],
                                                                                            onChanged: (val) => safeSetState(() => _model.dropDownValue4 = val),
                                                                                            width: double.infinity,
                                                                                            height: 40.0,
                                                                                            maxHeight: 300.0,
                                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                ),
                                                                                            hintText: 'Ordenar por Recomendados',
                                                                                            icon: FaIcon(
                                                                                              FontAwesomeIcons.caretDown,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 15.0,
                                                                                            ),
                                                                                            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            elevation: 0.0,
                                                                                            borderColor: FlutterFlowTheme.of(context).primaryText,
                                                                                            borderWidth: 0.0,
                                                                                            borderRadius: 4.0,
                                                                                            margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                            hidesUnderline: true,
                                                                                            isOverButton: false,
                                                                                            isSearchable: false,
                                                                                            isMultiSelect: false,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 20.0)),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 10.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.all(20.0),
                                                                            child:
                                                                                StreamBuilder<List<NotasRecord>>(
                                                                              stream: queryNotasRecord(
                                                                                queryBuilder: (notasRecord) => notasRecord
                                                                                    .where(
                                                                                      'uid_User',
                                                                                      isEqualTo: widget.refUser?.reference.id != '' ? widget.refUser?.reference.id : null,
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
                                                                                List<NotasRecord> containerNotasRecordList = snapshot.data!;

                                                                                return Container(
                                                                                  width: double.infinity,
                                                                                  constraints: BoxConstraints(
                                                                                    minHeight: 200.0,
                                                                                  ),
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: Builder(
                                                                                    builder: (context) {
                                                                                      if (containerNotasRecordList.isNotEmpty) {
                                                                                        return Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Container(
                                                                                              constraints: BoxConstraints(
                                                                                                maxHeight: 500.0,
                                                                                              ),
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Builder(
                                                                                                builder: (context) {
                                                                                                  final listaNota = containerNotasRecordList.toList();

                                                                                                  return ListView.separated(
                                                                                                    padding: EdgeInsets.zero,
                                                                                                    shrinkWrap: true,
                                                                                                    scrollDirection: Axis.vertical,
                                                                                                    itemCount: listaNota.length,
                                                                                                    separatorBuilder: (_, __) => SizedBox(height: 10.0),
                                                                                                    itemBuilder: (context, listaNotaIndex) {
                                                                                                      final listaNotaItem = listaNota[listaNotaIndex];
                                                                                                      return Container(
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: Color(0xFFF7F9FA),
                                                                                                          borderRadius: BorderRadius.circular(4.0),
                                                                                                          border: Border.all(
                                                                                                            color: Color(0xFFA7A7A7),
                                                                                                          ),
                                                                                                        ),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsets.all(20.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Flexible(
                                                                                                                child: Container(
                                                                                                                  width: double.infinity,
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        valueOrDefault<String>(
                                                                                                                          listaNotaItem.contenido,
                                                                                                                          '--',
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'Poppins',
                                                                                                                              fontSize: 18.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                      StreamBuilder<List<CoursesRecord>>(
                                                                                                                        stream: queryCoursesRecord(
                                                                                                                          queryBuilder: (coursesRecord) => coursesRecord.where(
                                                                                                                            'uid',
                                                                                                                            isEqualTo: listaNotaItem.uidCourse != '' ? listaNotaItem.uidCourse : null,
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
                                                                                                                          List<CoursesRecord> richTextCoursesRecordList = snapshot.data!;
                                                                                                                          final richTextCoursesRecord = richTextCoursesRecordList.isNotEmpty ? richTextCoursesRecordList.first : null;

                                                                                                                          return RichText(
                                                                                                                            textScaler: MediaQuery.of(context).textScaler,
                                                                                                                            text: TextSpan(
                                                                                                                              children: [
                                                                                                                                TextSpan(
                                                                                                                                  text: 'Curso: ',
                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                        fontFamily: 'Poppins',
                                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                        fontSize: 12.0,
                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                        fontWeight: FontWeight.bold,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                                TextSpan(
                                                                                                                                  text: valueOrDefault<String>(
                                                                                                                                    richTextCoursesRecord?.name,
                                                                                                                                    '--',
                                                                                                                                  ),
                                                                                                                                  style: TextStyle(),
                                                                                                                                )
                                                                                                                              ],
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'Poppins',
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    fontSize: 12.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          );
                                                                                                                        },
                                                                                                                      ),
                                                                                                                      RichText(
                                                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                                                        text: TextSpan(
                                                                                                                          children: [
                                                                                                                            TextSpan(
                                                                                                                              text: 'Fecha de creacion: ',
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'Poppins',
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    fontSize: 12.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FontWeight.bold,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            TextSpan(
                                                                                                                              text: valueOrDefault<String>(
                                                                                                                                dateTimeFormat(
                                                                                                                                  "relative",
                                                                                                                                  listaNotaItem.createdDate,
                                                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                                                ),
                                                                                                                                '-- / -- / ---',
                                                                                                                              ),
                                                                                                                              style: TextStyle(),
                                                                                                                            )
                                                                                                                          ],
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 12.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ].divide(SizedBox(height: 5.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              FlutterFlowIconButton(
                                                                                                                borderColor: Colors.transparent,
                                                                                                                borderRadius: 100.0,
                                                                                                                buttonSize: 40.0,
                                                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                hoverColor: Color(0x180F0F0F),
                                                                                                                icon: Icon(
                                                                                                                  Icons.delete_rounded,
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                ),
                                                                                                                onPressed: () async {
                                                                                                                  await listaNotaItem.reference.delete();
                                                                                                                },
                                                                                                              ),
                                                                                                            ].divide(SizedBox(width: 10.0)),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                            Builder(
                                                                                              builder: (context) => FFButtonWidget(
                                                                                                onPressed: () async {
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
                                                                                                          child: CrearNotaCursoWidget(
                                                                                                            refCurse: widget.refCourses!,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  );
                                                                                                },
                                                                                                text: 'Crear Nota',
                                                                                                options: FFButtonOptions(
                                                                                                  width: double.infinity,
                                                                                                  height: 44.0,
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                      ),
                                                                                                  elevation: 0.0,
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 10.0)),
                                                                                        );
                                                                                      } else {
                                                                                        return Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            Builder(
                                                                                              builder: (context) => InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
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
                                                                                                          child: CrearNotaCursoWidget(
                                                                                                            refCurse: widget.refCourses!,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  );
                                                                                                },
                                                                                                child: Text(
                                                                                                  'Haga clic aquí para crear su primera nota.',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 10.0)),
                                                                                        );
                                                                                      }
                                                                                    },
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    StreamBuilder<
                                                                        List<
                                                                            AnnouncementsCoursesRecord>>(
                                                                      stream:
                                                                          queryAnnouncementsCoursesRecord(
                                                                        queryBuilder:
                                                                            (announcementsCoursesRecord) =>
                                                                                announcementsCoursesRecord.where(
                                                                          'uid_Course',
                                                                          isEqualTo: widget.refCourses?.reference.id != ''
                                                                              ? widget.refCourses?.reference.id
                                                                              : null,
                                                                        ),
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
                                                                        List<AnnouncementsCoursesRecord>
                                                                            listViewAnnouncementsCoursesRecordList =
                                                                            snapshot.data!;
                                                                        if (listViewAnnouncementsCoursesRecordList
                                                                            .isEmpty) {
                                                                          return EmptyAnnouncementsWidget();
                                                                        }

                                                                        return ListView
                                                                            .builder(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          primary:
                                                                              false,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          itemCount:
                                                                              listViewAnnouncementsCoursesRecordList.length,
                                                                          itemBuilder:
                                                                              (context, listViewIndex) {
                                                                            final listViewAnnouncementsCoursesRecord =
                                                                                listViewAnnouncementsCoursesRecordList[listViewIndex];
                                                                            return Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                                                                                      child: StreamBuilder<List<UsersRecord>>(
                                                                                        stream: queryUsersRecord(
                                                                                          queryBuilder: (usersRecord) => usersRecord.where(
                                                                                            'uid',
                                                                                            isEqualTo: listViewAnnouncementsCoursesRecord.createdBy != '' ? listViewAnnouncementsCoursesRecord.createdBy : null,
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
                                                                                          List<UsersRecord> containerUsersRecordList = snapshot.data!;
                                                                                          final containerUsersRecord = containerUsersRecordList.isNotEmpty ? containerUsersRecordList.first : null;

                                                                                          return Container(
                                                                                            width: double.infinity,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            ),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Container(
                                                                                                      width: 40.0,
                                                                                                      height: 40.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        image: DecorationImage(
                                                                                                          fit: BoxFit.cover,
                                                                                                          image: CachedNetworkImageProvider(
                                                                                                            valueOrDefault<String>(
                                                                                                              containerUsersRecord?.photoUrl,
                                                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/kpacita-ssg7c7/assets/mouvjylm6zw7/Risk_Peru_rebranding_final_Mesa_de_trabajo_1_copia_11.png',
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(42.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            containerUsersRecord?.displayName,
                                                                                                            'Sistema',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                fontSize: 16.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                decoration: TextDecoration.underline,
                                                                                                              ),
                                                                                                        ),
                                                                                                        RichText(
                                                                                                          textScaler: MediaQuery.of(context).textScaler,
                                                                                                          text: TextSpan(
                                                                                                            children: [
                                                                                                              TextSpan(
                                                                                                                text: 'Ha publicado un anuncio ',
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                              TextSpan(
                                                                                                                text: '- ',
                                                                                                                style: TextStyle(),
                                                                                                              ),
                                                                                                              TextSpan(
                                                                                                                text: valueOrDefault<String>(
                                                                                                                  dateTimeFormat(
                                                                                                                    "relative",
                                                                                                                    listViewAnnouncementsCoursesRecord.createdDate,
                                                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                                                  ),
                                                                                                                  'Sin Fecha',
                                                                                                                ),
                                                                                                                style: TextStyle(),
                                                                                                              )
                                                                                                            ],
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Poppins',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ].divide(SizedBox(width: 20.0)),
                                                                                                ),
                                                                                              ].divide(SizedBox(height: 10.0)),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 20.0),
                                                                                      child: Container(
                                                                                        width: double.infinity,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    listViewAnnouncementsCoursesRecord.title,
                                                                                                    'Sin Titulo',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        fontSize: 16.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                      ),
                                                                                                ),
                                                                                                Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    listViewAnnouncementsCoursesRecord.text,
                                                                                                    'Sin Contenido',
                                                                                                  ),
                                                                                                  textAlign: TextAlign.start,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        fontSize: 16.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ].divide(SizedBox(height: 5.0)),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 15.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                StreamBuilder<List<AnnouncementCommentsRecord>>(
                                                                                  stream: queryAnnouncementCommentsRecord(
                                                                                    queryBuilder: (announcementCommentsRecord) => announcementCommentsRecord
                                                                                        .where(
                                                                                          'uid_Announcements_course',
                                                                                          isEqualTo: listViewAnnouncementsCoursesRecord.reference.id != '' ? listViewAnnouncementsCoursesRecord.reference.id : null,
                                                                                        )
                                                                                        .orderBy('Created_Date', descending: true),
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
                                                                                    List<AnnouncementCommentsRecord> containerAnnouncementCommentsRecordList = snapshot.data!;

                                                                                    return Container(
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 15.0),
                                                                                            child: wrapWithModel(
                                                                                              model: _model.txtComentarioPublicacionCursoModels.getModel(
                                                                                                listViewAnnouncementsCoursesRecord.reference.id,
                                                                                                listViewIndex,
                                                                                              ),
                                                                                              updateCallback: () => safeSetState(() {}),
                                                                                              child: TxtComentarioPublicacionCursoWidget(
                                                                                                key: Key(
                                                                                                  'Key0bo_${listViewAnnouncementsCoursesRecord.reference.id}',
                                                                                                ),
                                                                                                parameter1: valueOrDefault<String>(
                                                                                                  widget.refUser?.photoUrl,
                                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/kpacita-ssg7c7/assets/kom25ftm37kk/Frame_1171276035.png',
                                                                                                ),
                                                                                                parameter2: widget.refUser?.reference.id,
                                                                                                parameter3: listViewAnnouncementsCoursesRecord.reference.id,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          if ((containerAnnouncementCommentsRecordList.isNotEmpty) && !_model.listAnuncio.contains(listViewAnnouncementsCoursesRecord.reference.id))
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                              child: InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  _model.addToListAnuncio(listViewAnnouncementsCoursesRecord.reference.id);
                                                                                                  safeSetState(() {});
                                                                                                },
                                                                                                child: RichText(
                                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                                  text: TextSpan(
                                                                                                    children: [
                                                                                                      TextSpan(
                                                                                                        text: 'Mostrar comentarios (',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Poppins',
                                                                                                              fontSize: 16.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.bold,
                                                                                                              decoration: TextDecoration.underline,
                                                                                                            ),
                                                                                                      ),
                                                                                                      TextSpan(
                                                                                                        text: valueOrDefault<String>(
                                                                                                          containerAnnouncementCommentsRecordList.length.toString(),
                                                                                                          '0',
                                                                                                        ),
                                                                                                        style: TextStyle(
                                                                                                          decoration: TextDecoration.underline,
                                                                                                        ),
                                                                                                      ),
                                                                                                      TextSpan(
                                                                                                        text: ')',
                                                                                                        style: TextStyle(
                                                                                                          decoration: TextDecoration.underline,
                                                                                                        ),
                                                                                                      )
                                                                                                    ],
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontSize: 16.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          if (_model.listAnuncio.contains(listViewAnnouncementsCoursesRecord.reference.id))
                                                                                            Builder(
                                                                                              builder: (context) {
                                                                                                final listaComentariosAnuncios = containerAnnouncementCommentsRecordList.toList();

                                                                                                return ListView.builder(
                                                                                                  padding: EdgeInsets.zero,
                                                                                                  shrinkWrap: true,
                                                                                                  scrollDirection: Axis.vertical,
                                                                                                  itemCount: listaComentariosAnuncios.length,
                                                                                                  itemBuilder: (context, listaComentariosAnunciosIndex) {
                                                                                                    final listaComentariosAnunciosItem = listaComentariosAnuncios[listaComentariosAnunciosIndex];
                                                                                                    return StreamBuilder<List<UsersRecord>>(
                                                                                                      stream: queryUsersRecord(
                                                                                                        queryBuilder: (usersRecord) => usersRecord.where(
                                                                                                          'uid',
                                                                                                          isEqualTo: listaComentariosAnunciosItem.createdBy != '' ? listaComentariosAnunciosItem.createdBy : null,
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
                                                                                                        List<UsersRecord> containerUsersRecordList = snapshot.data!;
                                                                                                        final containerUsersRecord = containerUsersRecordList.isNotEmpty ? containerUsersRecordList.first : null;

                                                                                                        return Container(
                                                                                                          decoration: BoxDecoration(),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
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
                                                                                                                      image: CachedNetworkImageProvider(
                                                                                                                        valueOrDefault<String>(
                                                                                                                          containerUsersRecord?.photoUrl,
                                                                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/kpacita-ssg7c7/assets/kom25ftm37kk/Frame_1171276035.png',
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    borderRadius: BorderRadius.circular(42.0),
                                                                                                                    border: Border.all(
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Flexible(
                                                                                                                  child: Container(
                                                                                                                    width: double.infinity,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                    ),
                                                                                                                    child: Container(
                                                                                                                      decoration: BoxDecoration(),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Column(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                            children: [
                                                                                                                              Text(
                                                                                                                                valueOrDefault<String>(
                                                                                                                                  containerUsersRecord?.displayName,
                                                                                                                                  'Sistema',
                                                                                                                                ),
                                                                                                                                maxLines: 2,
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                      fontFamily: 'Poppins',
                                                                                                                                      fontSize: 16.0,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      fontWeight: FontWeight.bold,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                              Text(
                                                                                                                                valueOrDefault<String>(
                                                                                                                                  listaComentariosAnunciosItem.text,
                                                                                                                                  '--',
                                                                                                                                ),
                                                                                                                                maxLines: 5,
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                      fontFamily: 'Poppins',
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                          Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              RichText(
                                                                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                                                                text: TextSpan(
                                                                                                                                  children: [
                                                                                                                                    TextSpan(
                                                                                                                                      text: valueOrDefault<String>(
                                                                                                                                        dateTimeFormat(
                                                                                                                                          "relative",
                                                                                                                                          listaComentariosAnunciosItem.createdDate,
                                                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                                                        ),
                                                                                                                                        'Sin Fecha',
                                                                                                                                      ),
                                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                            fontFamily: 'Poppins',
                                                                                                                                            letterSpacing: 0.0,
                                                                                                                                          ),
                                                                                                                                    )
                                                                                                                                  ],
                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                        fontFamily: 'Poppins',
                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ].divide(SizedBox(width: 20.0)),
                                                                                                                          ),
                                                                                                                        ].divide(SizedBox(height: 10.0)),
                                                                                                                      ),
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
                                                                                        ],
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                    ),
                                                                    StreamBuilder<
                                                                        List<
                                                                            QualificationRecord>>(
                                                                      stream:
                                                                          queryQualificationRecord(
                                                                        queryBuilder:
                                                                            (qualificationRecord) =>
                                                                                qualificationRecord.where(
                                                                          'uidCourse',
                                                                          isEqualTo: widget
                                                                              .refCourses
                                                                              ?.reference
                                                                              .id,
                                                                        ),
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
                                                                        List<QualificationRecord>
                                                                            containerQualificationRecordList =
                                                                            snapshot.data!;

                                                                        return Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            primary:
                                                                                false,
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 20.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsets.all(20.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              Text(
                                                                                                valueOrDefault<String>(
                                                                                                  ((List<double> puntajes) {
                                                                                                    return puntajes.isEmpty ? 0.0 : puntajes.reduce((a, b) => a + b) / puntajes.length;
                                                                                                  }(containerQualificationRecordList
                                                                                                          .map((e) => valueOrDefault<double>(
                                                                                                                e.amount,
                                                                                                                0.0,
                                                                                                              ))
                                                                                                          .toList()))
                                                                                                      .toString(),
                                                                                                  '0',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      fontSize: 64.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      lineHeight: 1.0,
                                                                                                    ),
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  RatingBarIndicator(
                                                                                                    itemBuilder: (context, index) => Icon(
                                                                                                      Icons.star_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                    ),
                                                                                                    direction: Axis.horizontal,
                                                                                                    rating: valueOrDefault<double>(
                                                                                                      (List<double> puntajes) {
                                                                                                        return puntajes.isEmpty ? 0.0 : puntajes.reduce((a, b) => a + b) / puntajes.length;
                                                                                                      }(containerQualificationRecordList
                                                                                                          .map((e) => valueOrDefault<double>(
                                                                                                                e.amount,
                                                                                                                0.0,
                                                                                                              ))
                                                                                                          .toList()),
                                                                                                      0.0,
                                                                                                    ),
                                                                                                    unratedColor: FlutterFlowTheme.of(context).alternate,
                                                                                                    itemCount: 5,
                                                                                                    itemSize: 24.0,
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 10.0)).around(SizedBox(width: 10.0)),
                                                                                              ),
                                                                                              Text(
                                                                                                'Valoración del curso',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                    ),
                                                                                              ),
                                                                                            ].divide(SizedBox(height: 5.0)),
                                                                                          ),
                                                                                        ),
                                                                                        Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                              children: [
                                                                                                Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        LinearPercentIndicator(
                                                                                                          percent: valueOrDefault<double>(
                                                                                                            (List<double> puntajes) {
                                                                                                              return puntajes.isEmpty ? 0.0 : puntajes.where((p) => p == 5.0).length / puntajes.length;
                                                                                                            }(containerQualificationRecordList
                                                                                                                .map((e) => valueOrDefault<double>(
                                                                                                                      e.amount,
                                                                                                                      0.0,
                                                                                                                    ))
                                                                                                                .toList()),
                                                                                                            0.0,
                                                                                                          ),
                                                                                                          width: 333.0,
                                                                                                          lineHeight: 17.0,
                                                                                                          animation: true,
                                                                                                          animateFromLastPercent: true,
                                                                                                          progressColor: FlutterFlowTheme.of(context).primary,
                                                                                                          backgroundColor: FlutterFlowTheme.of(context).alternate,
                                                                                                          padding: EdgeInsets.zero,
                                                                                                        ),
                                                                                                        RatingBarIndicator(
                                                                                                          itemBuilder: (context, index) => Icon(
                                                                                                            Icons.star_rounded,
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                          ),
                                                                                                          direction: Axis.horizontal,
                                                                                                          rating: 5.0,
                                                                                                          unratedColor: FlutterFlowTheme.of(context).alternate,
                                                                                                          itemCount: 5,
                                                                                                          itemSize: 24.0,
                                                                                                        ),
                                                                                                        RichText(
                                                                                                          textScaler: MediaQuery.of(context).textScaler,
                                                                                                          text: TextSpan(
                                                                                                            children: [
                                                                                                              TextSpan(
                                                                                                                text: valueOrDefault<String>(
                                                                                                                  ((List<double> puntajes) {
                                                                                                                    return puntajes.isEmpty ? 0.0 : (puntajes.where((p) => p == 5.0).length / puntajes.length) * 100;
                                                                                                                  }(containerQualificationRecordList
                                                                                                                          .map((e) => valueOrDefault<double>(
                                                                                                                                e.amount,
                                                                                                                                0.0,
                                                                                                                              ))
                                                                                                                          .toList()))
                                                                                                                      .toString(),
                                                                                                                  '0',
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                              TextSpan(
                                                                                                                text: '%',
                                                                                                                style: TextStyle(),
                                                                                                              )
                                                                                                            ],
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Poppins',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ].divide(SizedBox(width: 10.0)),
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        LinearPercentIndicator(
                                                                                                          percent: valueOrDefault<double>(
                                                                                                            (List<double> puntajes) {
                                                                                                              return puntajes.isEmpty ? 0.0 : puntajes.where((p) => p == 4.0).length / puntajes.length;
                                                                                                            }(containerQualificationRecordList
                                                                                                                .map((e) => valueOrDefault<double>(
                                                                                                                      e.amount,
                                                                                                                      0.0,
                                                                                                                    ))
                                                                                                                .toList()),
                                                                                                            0.0,
                                                                                                          ),
                                                                                                          width: 333.0,
                                                                                                          lineHeight: 17.0,
                                                                                                          animation: true,
                                                                                                          animateFromLastPercent: true,
                                                                                                          progressColor: FlutterFlowTheme.of(context).primary,
                                                                                                          backgroundColor: FlutterFlowTheme.of(context).alternate,
                                                                                                          padding: EdgeInsets.zero,
                                                                                                        ),
                                                                                                        RatingBarIndicator(
                                                                                                          itemBuilder: (context, index) => Icon(
                                                                                                            Icons.star_rounded,
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                          ),
                                                                                                          direction: Axis.horizontal,
                                                                                                          rating: 4.0,
                                                                                                          unratedColor: FlutterFlowTheme.of(context).alternate,
                                                                                                          itemCount: 5,
                                                                                                          itemSize: 24.0,
                                                                                                        ),
                                                                                                        RichText(
                                                                                                          textScaler: MediaQuery.of(context).textScaler,
                                                                                                          text: TextSpan(
                                                                                                            children: [
                                                                                                              TextSpan(
                                                                                                                text: valueOrDefault<String>(
                                                                                                                  ((List<double> puntajes) {
                                                                                                                    return puntajes.isEmpty ? 0.0 : (puntajes.where((p) => p == 4.0).length / puntajes.length) * 100;
                                                                                                                  }(containerQualificationRecordList
                                                                                                                          .map((e) => valueOrDefault<double>(
                                                                                                                                e.amount,
                                                                                                                                0.0,
                                                                                                                              ))
                                                                                                                          .toList()))
                                                                                                                      .toString(),
                                                                                                                  '0',
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                              TextSpan(
                                                                                                                text: '%',
                                                                                                                style: TextStyle(),
                                                                                                              )
                                                                                                            ],
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Poppins',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ].divide(SizedBox(width: 10.0)),
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        LinearPercentIndicator(
                                                                                                          percent: valueOrDefault<double>(
                                                                                                            (List<double> puntajes) {
                                                                                                              return puntajes.isEmpty ? 0.0 : puntajes.where((p) => p == 3.0).length / puntajes.length;
                                                                                                            }(containerQualificationRecordList
                                                                                                                .map((e) => valueOrDefault<double>(
                                                                                                                      e.amount,
                                                                                                                      0.0,
                                                                                                                    ))
                                                                                                                .toList()),
                                                                                                            0.0,
                                                                                                          ),
                                                                                                          width: 333.0,
                                                                                                          lineHeight: 17.0,
                                                                                                          animation: true,
                                                                                                          animateFromLastPercent: true,
                                                                                                          progressColor: FlutterFlowTheme.of(context).primary,
                                                                                                          backgroundColor: FlutterFlowTheme.of(context).alternate,
                                                                                                          padding: EdgeInsets.zero,
                                                                                                        ),
                                                                                                        RatingBarIndicator(
                                                                                                          itemBuilder: (context, index) => Icon(
                                                                                                            Icons.star_rounded,
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                          ),
                                                                                                          direction: Axis.horizontal,
                                                                                                          rating: 3.0,
                                                                                                          unratedColor: FlutterFlowTheme.of(context).alternate,
                                                                                                          itemCount: 5,
                                                                                                          itemSize: 24.0,
                                                                                                        ),
                                                                                                        RichText(
                                                                                                          textScaler: MediaQuery.of(context).textScaler,
                                                                                                          text: TextSpan(
                                                                                                            children: [
                                                                                                              TextSpan(
                                                                                                                text: valueOrDefault<String>(
                                                                                                                  ((List<double> puntajes) {
                                                                                                                    return puntajes.isEmpty ? 0.0 : (puntajes.where((p) => p == 3.0).length / puntajes.length) * 100;
                                                                                                                  }(containerQualificationRecordList
                                                                                                                          .map((e) => valueOrDefault<double>(
                                                                                                                                e.amount,
                                                                                                                                0.0,
                                                                                                                              ))
                                                                                                                          .toList()))
                                                                                                                      .toString(),
                                                                                                                  '0',
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                              TextSpan(
                                                                                                                text: '%',
                                                                                                                style: TextStyle(),
                                                                                                              )
                                                                                                            ],
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Poppins',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ].divide(SizedBox(width: 10.0)),
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        LinearPercentIndicator(
                                                                                                          percent: valueOrDefault<double>(
                                                                                                            (List<double> puntajes) {
                                                                                                              return puntajes.isEmpty ? 0.0 : puntajes.where((p) => p == 2.0).length / puntajes.length;
                                                                                                            }(containerQualificationRecordList
                                                                                                                .map((e) => valueOrDefault<double>(
                                                                                                                      e.amount,
                                                                                                                      0.0,
                                                                                                                    ))
                                                                                                                .toList()),
                                                                                                            0.0,
                                                                                                          ),
                                                                                                          width: 333.0,
                                                                                                          lineHeight: 17.0,
                                                                                                          animation: true,
                                                                                                          animateFromLastPercent: true,
                                                                                                          progressColor: FlutterFlowTheme.of(context).primary,
                                                                                                          backgroundColor: FlutterFlowTheme.of(context).alternate,
                                                                                                          padding: EdgeInsets.zero,
                                                                                                        ),
                                                                                                        RatingBarIndicator(
                                                                                                          itemBuilder: (context, index) => Icon(
                                                                                                            Icons.star_rounded,
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                          ),
                                                                                                          direction: Axis.horizontal,
                                                                                                          rating: 2.0,
                                                                                                          unratedColor: FlutterFlowTheme.of(context).alternate,
                                                                                                          itemCount: 5,
                                                                                                          itemSize: 24.0,
                                                                                                        ),
                                                                                                        RichText(
                                                                                                          textScaler: MediaQuery.of(context).textScaler,
                                                                                                          text: TextSpan(
                                                                                                            children: [
                                                                                                              TextSpan(
                                                                                                                text: valueOrDefault<String>(
                                                                                                                  ((List<double> puntajes) {
                                                                                                                    return puntajes.isEmpty ? 0.0 : (puntajes.where((p) => p == 2.0).length / puntajes.length) * 100;
                                                                                                                  }(containerQualificationRecordList
                                                                                                                          .map((e) => valueOrDefault<double>(
                                                                                                                                e.amount,
                                                                                                                                0.0,
                                                                                                                              ))
                                                                                                                          .toList()))
                                                                                                                      .toString(),
                                                                                                                  '0',
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                              TextSpan(
                                                                                                                text: '%',
                                                                                                                style: TextStyle(),
                                                                                                              )
                                                                                                            ],
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Poppins',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ].divide(SizedBox(width: 10.0)),
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        LinearPercentIndicator(
                                                                                                          percent: valueOrDefault<double>(
                                                                                                            (List<double> puntajes) {
                                                                                                              return puntajes.isEmpty ? 0.0 : puntajes.where((p) => p == 1.0).length / puntajes.length;
                                                                                                            }(containerQualificationRecordList
                                                                                                                .map((e) => valueOrDefault<double>(
                                                                                                                      e.amount,
                                                                                                                      0.0,
                                                                                                                    ))
                                                                                                                .toList()),
                                                                                                            0.0,
                                                                                                          ),
                                                                                                          width: 333.0,
                                                                                                          lineHeight: 17.0,
                                                                                                          animation: true,
                                                                                                          animateFromLastPercent: true,
                                                                                                          progressColor: FlutterFlowTheme.of(context).primary,
                                                                                                          backgroundColor: FlutterFlowTheme.of(context).alternate,
                                                                                                          padding: EdgeInsets.zero,
                                                                                                        ),
                                                                                                        RatingBarIndicator(
                                                                                                          itemBuilder: (context, index) => Icon(
                                                                                                            Icons.star_rounded,
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                          ),
                                                                                                          direction: Axis.horizontal,
                                                                                                          rating: 1.0,
                                                                                                          unratedColor: FlutterFlowTheme.of(context).alternate,
                                                                                                          itemCount: 5,
                                                                                                          itemSize: 24.0,
                                                                                                        ),
                                                                                                        RichText(
                                                                                                          textScaler: MediaQuery.of(context).textScaler,
                                                                                                          text: TextSpan(
                                                                                                            children: [
                                                                                                              TextSpan(
                                                                                                                text: valueOrDefault<String>(
                                                                                                                  ((List<double> puntajes) {
                                                                                                                    return puntajes.isEmpty ? 0.0 : (puntajes.where((p) => p == 1.0).length / puntajes.length) * 100;
                                                                                                                  }(containerQualificationRecordList
                                                                                                                          .map((e) => valueOrDefault<double>(
                                                                                                                                e.amount,
                                                                                                                                0.0,
                                                                                                                              ))
                                                                                                                          .toList()))
                                                                                                                      .toString(),
                                                                                                                  '0',
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                              TextSpan(
                                                                                                                text: '%',
                                                                                                                style: TextStyle(),
                                                                                                              )
                                                                                                            ],
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Poppins',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ].divide(SizedBox(width: 10.0)),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(height: 10.0)),
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 10.0)),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Valoraciones',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              fontSize: 16.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                              decoration: TextDecoration.underline,
                                                                                            ),
                                                                                      ),
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.end,
                                                                                            children: [
                                                                                              Flexible(
                                                                                                child: Container(
                                                                                                  width: double.infinity,
                                                                                                  height: 44.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    borderRadius: BorderRadius.circular(4.0),
                                                                                                    border: Border.all(
                                                                                                      color: Colors.black,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: Container(
                                                                                                          width: 200.0,
                                                                                                          child: TextFormField(
                                                                                                            controller: _model.textController3,
                                                                                                            focusNode: _model.textFieldFocusNode3,
                                                                                                            autofocus: false,
                                                                                                            obscureText: false,
                                                                                                            decoration: InputDecoration(
                                                                                                              isDense: true,
                                                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                    fontFamily: 'Poppins',
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                              hintText: 'Buscar Todas las preguntas del curso',
                                                                                                              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                    fontFamily: 'Poppins',
                                                                                                                    color: Color(0xFF767676),
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                              enabledBorder: OutlineInputBorder(
                                                                                                                borderSide: BorderSide(
                                                                                                                  color: Color(0x00000000),
                                                                                                                  width: 1.0,
                                                                                                                ),
                                                                                                                borderRadius: BorderRadius.only(
                                                                                                                  bottomLeft: Radius.circular(4.0),
                                                                                                                  bottomRight: Radius.circular(0.0),
                                                                                                                  topLeft: Radius.circular(4.0),
                                                                                                                  topRight: Radius.circular(0.0),
                                                                                                                ),
                                                                                                              ),
                                                                                                              focusedBorder: OutlineInputBorder(
                                                                                                                borderSide: BorderSide(
                                                                                                                  color: Color(0x00000000),
                                                                                                                  width: 1.0,
                                                                                                                ),
                                                                                                                borderRadius: BorderRadius.only(
                                                                                                                  bottomLeft: Radius.circular(4.0),
                                                                                                                  bottomRight: Radius.circular(0.0),
                                                                                                                  topLeft: Radius.circular(4.0),
                                                                                                                  topRight: Radius.circular(0.0),
                                                                                                                ),
                                                                                                              ),
                                                                                                              errorBorder: OutlineInputBorder(
                                                                                                                borderSide: BorderSide(
                                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                                  width: 1.0,
                                                                                                                ),
                                                                                                                borderRadius: BorderRadius.only(
                                                                                                                  bottomLeft: Radius.circular(4.0),
                                                                                                                  bottomRight: Radius.circular(0.0),
                                                                                                                  topLeft: Radius.circular(4.0),
                                                                                                                  topRight: Radius.circular(0.0),
                                                                                                                ),
                                                                                                              ),
                                                                                                              focusedErrorBorder: OutlineInputBorder(
                                                                                                                borderSide: BorderSide(
                                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                                  width: 1.0,
                                                                                                                ),
                                                                                                                borderRadius: BorderRadius.only(
                                                                                                                  bottomLeft: Radius.circular(4.0),
                                                                                                                  bottomRight: Radius.circular(0.0),
                                                                                                                  topLeft: Radius.circular(4.0),
                                                                                                                  topRight: Radius.circular(0.0),
                                                                                                                ),
                                                                                                              ),
                                                                                                              filled: true,
                                                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Poppins',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                            cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                            validator: _model.textController3Validator.asValidator(context),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      FlutterFlowIconButton(
                                                                                                        borderColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                        borderRadius: 30.0,
                                                                                                        buttonSize: 46.0,
                                                                                                        fillColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                        icon: FaIcon(
                                                                                                          FontAwesomeIcons.search,
                                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                                          size: 24.0,
                                                                                                        ),
                                                                                                        onPressed: () {
                                                                                                          print('IconButton pressed ...');
                                                                                                        },
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Filtrar Valoraciones',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                        ),
                                                                                                  ),
                                                                                                  FlutterFlowDropDown<String>(
                                                                                                    controller: _model.dropDownValueController5 ??= FormFieldController<String>(null),
                                                                                                    options: <String>[],
                                                                                                    onChanged: (val) => safeSetState(() => _model.dropDownValue5 = val),
                                                                                                    width: 200.0,
                                                                                                    height: 40.0,
                                                                                                    maxHeight: 300.0,
                                                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                    hintText: 'Todas las Valoraciones',
                                                                                                    icon: FaIcon(
                                                                                                      FontAwesomeIcons.caretDown,
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      size: 15.0,
                                                                                                    ),
                                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    elevation: 0.0,
                                                                                                    borderColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                    borderWidth: 0.0,
                                                                                                    borderRadius: 4.0,
                                                                                                    margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                    hidesUnderline: true,
                                                                                                    isOverButton: false,
                                                                                                    isSearchable: false,
                                                                                                    isMultiSelect: false,
                                                                                                  ),
                                                                                                ].divide(SizedBox(height: 5.0)),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 20.0)),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Builder(
                                                                                      builder: (context) {
                                                                                        final listqualification = containerQualificationRecordList.toList();

                                                                                        return ListView.separated(
                                                                                          padding: EdgeInsets.zero,
                                                                                          shrinkWrap: true,
                                                                                          scrollDirection: Axis.vertical,
                                                                                          itemCount: listqualification.length,
                                                                                          separatorBuilder: (_, __) => SizedBox(height: 20.0),
                                                                                          itemBuilder: (context, listqualificationIndex) {
                                                                                            final listqualificationItem = listqualification[listqualificationIndex];
                                                                                            return StreamBuilder<List<UsersRecord>>(
                                                                                              stream: queryUsersRecord(
                                                                                                queryBuilder: (usersRecord) => usersRecord.where(
                                                                                                  'uid',
                                                                                                  isEqualTo: listqualificationItem.uidUser,
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
                                                                                                List<UsersRecord> containerUsersRecordList = snapshot.data!;
                                                                                                final containerUsersRecord = containerUsersRecordList.isNotEmpty ? containerUsersRecordList.first : null;

                                                                                                return Container(
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(35.0, 0.0, 0.0, 0.0),
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
                                                                                                              image: CachedNetworkImageProvider(
                                                                                                                valueOrDefault<String>(
                                                                                                                  containerUsersRecord?.photoUrl,
                                                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/kpacita-ssg7c7/assets/mouvjylm6zw7/Risk_Peru_rebranding_final_Mesa_de_trabajo_1_copia_11.png',
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(42.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Flexible(
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Flexible(
                                                                                                                  child: Container(
                                                                                                                    width: double.infinity,
                                                                                                                    decoration: BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Column(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                          children: [
                                                                                                                            Text(
                                                                                                                              valueOrDefault<String>(
                                                                                                                                containerUsersRecord?.displayName,
                                                                                                                                '-',
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'Poppins',
                                                                                                                                    fontSize: 16.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FontWeight.bold,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              children: [
                                                                                                                                RatingBarIndicator(
                                                                                                                                  itemBuilder: (context, index) => Icon(
                                                                                                                                    Icons.star_rounded,
                                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                                  ),
                                                                                                                                  direction: Axis.horizontal,
                                                                                                                                  rating: listqualificationItem.amount,
                                                                                                                                  unratedColor: FlutterFlowTheme.of(context).alternate,
                                                                                                                                  itemCount: 5,
                                                                                                                                  itemSize: 24.0,
                                                                                                                                ),
                                                                                                                                Text(
                                                                                                                                  dateTimeFormat(
                                                                                                                                    "relative",
                                                                                                                                    listqualificationItem.createdDate!,
                                                                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                                                                  ),
                                                                                                                                  maxLines: 1,
                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                        fontFamily: 'Poppins',
                                                                                                                                        fontSize: 16.0,
                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                              ].divide(SizedBox(width: 10.0)),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                        Column(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                          children: [
                                                                                                                            Text(
                                                                                                                              listqualificationItem.text,
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'Poppins',
                                                                                                                                    color: Color(0xFF9F9F9F),
                                                                                                                                    fontSize: 16.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ].divide(SizedBox(height: 10.0)),
                                                                                                                        ),
                                                                                                                      ].divide(SizedBox(height: 10.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
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
                                                                                    RichText(
                                                                                      textScaler: MediaQuery.of(context).textScaler,
                                                                                      text: TextSpan(
                                                                                        children: [
                                                                                          TextSpan(
                                                                                            text: 'Mostrar comentarios (',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  decoration: TextDecoration.underline,
                                                                                                ),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: '0',
                                                                                            style: TextStyle(
                                                                                              fontWeight: FontWeight.bold,
                                                                                              decoration: TextDecoration.underline,
                                                                                            ),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: ')',
                                                                                            style: TextStyle(
                                                                                              fontWeight: FontWeight.bold,
                                                                                              decoration: TextDecoration.underline,
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                              decoration: TextDecoration.underline,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ].divide(SizedBox(height: 20.0)),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 20.0)),
                                              ),
                                            ),
                                            StreamBuilder<List<SessionRecord>>(
                                              stream: querySessionRecord(
                                                queryBuilder: (sessionRecord) =>
                                                    sessionRecord
                                                        .where(
                                                          'uid_Course',
                                                          isEqualTo: widget
                                                              .refCourses
                                                              ?.reference
                                                              .id,
                                                        )
                                                        .orderBy(
                                                            'Created_Date'),
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
                                                List<SessionRecord>
                                                    containerSessionRecordList =
                                                    snapshot.data!;

                                                return Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.25,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 424.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
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
                                                                  Text(
                                                                    'Contenido del curso',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              Color(0xFF094B90),
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                  Container(
                                                                    width:
                                                                        230.0,
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
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                final listSession =
                                                                    containerSessionRecordList
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
                                                                      listSession
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          listSessionIndex) {
                                                                    final listSessionItem =
                                                                        listSession[
                                                                            listSessionIndex];
                                                                    return StreamBuilder<
                                                                        List<
                                                                            ModuleRecord>>(
                                                                      stream:
                                                                          queryModuleRecord(
                                                                        queryBuilder: (moduleRecord) => moduleRecord
                                                                            .where(
                                                                              'uid_Session',
                                                                              isEqualTo: listSessionItem.reference.id,
                                                                            )
                                                                            .orderBy('Created_date'),
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
                                                                        List<ModuleRecord>
                                                                            containerModuleRecordList =
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
                                                                                  if (_model.listViewSession.contains(listSessionItem.reference.id)) {
                                                                                    _model.removeFromListViewSession(listSessionItem.reference.id);
                                                                                    safeSetState(() {});
                                                                                  } else {
                                                                                    _model.addToListViewSession(listSessionItem.reference.id);
                                                                                    safeSetState(() {});
                                                                                  }

                                                                                  await Future.delayed(const Duration(milliseconds: 1000));
                                                                                },
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFFF1F1F1),
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
                                                                                                      text: 'Sesión ',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Poppins',
                                                                                                            fontSize: 16.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                          ),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: (listSessionIndex + 1).toString(),
                                                                                                      style: TextStyle(
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                        fontSize: 16.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: ':  ',
                                                                                                      style: TextStyle(
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                        fontSize: 16.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: valueOrDefault<String>(
                                                                                                        listSessionItem.name,
                                                                                                        '--',
                                                                                                      ),
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
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              if (_model.listViewSession.contains(listSessionItem.reference.id))
                                                                                Builder(
                                                                                  builder: (context) {
                                                                                    final listModulo = containerModuleRecordList.toList();

                                                                                    return ListView.builder(
                                                                                      padding: EdgeInsets.zero,
                                                                                      primary: false,
                                                                                      shrinkWrap: true,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      itemCount: listModulo.length,
                                                                                      itemBuilder: (context, listModuloIndex) {
                                                                                        final listModuloItem = listModulo[listModuloIndex];
                                                                                        return StreamBuilder<List<ModuleClassRecord>>(
                                                                                          stream: queryModuleClassRecord(
                                                                                            queryBuilder: (moduleClassRecord) => moduleClassRecord
                                                                                                .where(
                                                                                                  'uid_Module',
                                                                                                  isEqualTo: listModuloItem.reference.id != '' ? listModuloItem.reference.id : null,
                                                                                                )
                                                                                                .orderBy('Created_date'),
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
                                                                                            List<ModuleClassRecord> containerModuleClassRecordList = snapshot.data!;

                                                                                            return Container(
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      if (_model.listViewModule.contains(listModuloItem.reference.id)) {
                                                                                                        _model.removeFromListViewModule(listModuloItem.reference.id);
                                                                                                        safeSetState(() {});
                                                                                                      } else {
                                                                                                        _model.addToListViewModule(listModuloItem.reference.id);
                                                                                                        safeSetState(() {});
                                                                                                      }

                                                                                                      await Future.delayed(const Duration(milliseconds: 1000));
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: Color(0x82F1F1F1),
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
                                                                                                                          text: 'Módulo ',
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                fontSize: 16.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                        TextSpan(
                                                                                                                          text: (listModuloIndex + 1).toString(),
                                                                                                                          style: TextStyle(
                                                                                                                            fontWeight: FontWeight.bold,
                                                                                                                            fontSize: 16.0,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        TextSpan(
                                                                                                                          text: ':  ',
                                                                                                                          style: TextStyle(
                                                                                                                            fontWeight: FontWeight.bold,
                                                                                                                            fontSize: 16.0,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        TextSpan(
                                                                                                                          text: listModuloItem.name,
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
                                                                                                                StreamBuilder<List<UsersModuleclassRecord>>(
                                                                                                                  stream: queryUsersModuleclassRecord(
                                                                                                                    queryBuilder: (usersModuleclassRecord) => usersModuleclassRecord
                                                                                                                        .where(
                                                                                                                          'uid_user',
                                                                                                                          isEqualTo: widget.refUser?.reference.id,
                                                                                                                        )
                                                                                                                        .where(
                                                                                                                          'uid_module',
                                                                                                                          isEqualTo: listModuloItem.reference.id,
                                                                                                                        )
                                                                                                                        .where(
                                                                                                                          'stateView',
                                                                                                                          isEqualTo: true,
                                                                                                                        )
                                                                                                                        .where(
                                                                                                                          'uid_curse',
                                                                                                                          isEqualTo: widget.refCourses?.reference.id,
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
                                                                                                                    List<UsersModuleclassRecord> richTextUsersModuleclassRecordList = snapshot.data!;

                                                                                                                    return RichText(
                                                                                                                      textScaler: MediaQuery.of(context).textScaler,
                                                                                                                      text: TextSpan(
                                                                                                                        children: [
                                                                                                                          TextSpan(
                                                                                                                            text: valueOrDefault<String>(
                                                                                                                              formatNumber(
                                                                                                                                richTextUsersModuleclassRecordList.length,
                                                                                                                                formatType: FormatType.compact,
                                                                                                                              ),
                                                                                                                              '0',
                                                                                                                            ),
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
                                                                                                                              formatNumber(
                                                                                                                                containerModuleClassRecordList.length,
                                                                                                                                formatType: FormatType.compact,
                                                                                                                              ),
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
                                                                                                                    );
                                                                                                                  },
                                                                                                                ),
                                                                                                                Text(
                                                                                                                  '|',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Poppins',
                                                                                                                        letterSpacing: 0.0,
                                                                                                                      ),
                                                                                                                ),
                                                                                                                RichText(
                                                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                                                  text: TextSpan(
                                                                                                                    children: [
                                                                                                                      TextSpan(
                                                                                                                        text: '10 ',
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'Poppins',
                                                                                                                              fontSize: 16.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                      TextSpan(
                                                                                                                        text: 'Min',
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
                                                                                                  if (_model.listViewModule.contains(listModuloItem.reference.id))
                                                                                                    Builder(
                                                                                                      builder: (context) {
                                                                                                        final listaModuloClases = containerModuleClassRecordList.toList();

                                                                                                        return ListView.builder(
                                                                                                          padding: EdgeInsets.zero,
                                                                                                          shrinkWrap: true,
                                                                                                          scrollDirection: Axis.vertical,
                                                                                                          itemCount: listaModuloClases.length,
                                                                                                          itemBuilder: (context, listaModuloClasesIndex) {
                                                                                                            final listaModuloClasesItem = listaModuloClases[listaModuloClasesIndex];
                                                                                                            return InkWell(
                                                                                                              splashColor: Colors.transparent,
                                                                                                              focusColor: Colors.transparent,
                                                                                                              hoverColor: Colors.transparent,
                                                                                                              highlightColor: Colors.transparent,
                                                                                                              onTap: () async {
                                                                                                                _model.refCourseClass = listaModuloClasesItem;
                                                                                                                safeSetState(() {});
                                                                                                              },
                                                                                                              child: Container(
                                                                                                                width: double.infinity,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: valueOrDefault<Color>(
                                                                                                                    _model.refCourseClass?.reference == listaModuloClasesItem.reference ? FlutterFlowTheme.of(context).alternate : Colors.white,
                                                                                                                    FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                        children: [
                                                                                                                          StreamBuilder<List<UsersModuleclassRecord>>(
                                                                                                                            stream: queryUsersModuleclassRecord(
                                                                                                                              queryBuilder: (usersModuleclassRecord) => usersModuleclassRecord
                                                                                                                                  .where(
                                                                                                                                    'uid_user',
                                                                                                                                    isEqualTo: widget.refUser?.reference.id,
                                                                                                                                  )
                                                                                                                                  .where(
                                                                                                                                    'uid_moduleclass',
                                                                                                                                    isEqualTo: listaModuloClasesItem.reference.id,
                                                                                                                                  )
                                                                                                                                  .where(
                                                                                                                                    'uid_module',
                                                                                                                                    isEqualTo: listModuloItem.reference.id,
                                                                                                                                  )
                                                                                                                                  .where(
                                                                                                                                    'uid_curse',
                                                                                                                                    isEqualTo: widget.refCourses?.reference.id,
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
                                                                                                                              List<UsersModuleclassRecord> checkboxUsersModuleclassRecordList = snapshot.data!;
                                                                                                                              final checkboxUsersModuleclassRecord = checkboxUsersModuleclassRecordList.isNotEmpty ? checkboxUsersModuleclassRecordList.first : null;

                                                                                                                              return Theme(
                                                                                                                                data: ThemeData(
                                                                                                                                  checkboxTheme: CheckboxThemeData(
                                                                                                                                    visualDensity: VisualDensity.compact,
                                                                                                                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                                                    shape: RoundedRectangleBorder(
                                                                                                                                      borderRadius: BorderRadius.circular(4.0),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                ),
                                                                                                                                child: Checkbox(
                                                                                                                                  value: _model.checkboxValueMap[listaModuloClasesItem] ??= checkboxUsersModuleclassRecord != null ? checkboxUsersModuleclassRecord.stateView : false,
                                                                                                                                  onChanged: (newValue) async {
                                                                                                                                    safeSetState(() => _model.checkboxValueMap[listaModuloClasesItem] = newValue!);
                                                                                                                                    if (newValue!) {
                                                                                                                                      if (checkboxUsersModuleclassRecord != null) {
                                                                                                                                        await checkboxUsersModuleclassRecord.reference.update(createUsersModuleclassRecordData(
                                                                                                                                          stateView: true,
                                                                                                                                        ));
                                                                                                                                      } else {
                                                                                                                                        var usersModuleclassRecordReference = UsersModuleclassRecord.collection.doc();
                                                                                                                                        await usersModuleclassRecordReference.set(createUsersModuleclassRecordData(
                                                                                                                                          uidUser: widget.refUser?.reference.id,
                                                                                                                                          uidModuleclass: listaModuloClasesItem.reference.id,
                                                                                                                                          stateView: true,
                                                                                                                                          uidModule: listModuloItem.reference.id,
                                                                                                                                          uidCurse: widget.refCourses?.reference.id,
                                                                                                                                        ));
                                                                                                                                        _model.refstatemoduleclasss = UsersModuleclassRecord.getDocumentFromData(
                                                                                                                                            createUsersModuleclassRecordData(
                                                                                                                                              uidUser: widget.refUser?.reference.id,
                                                                                                                                              uidModuleclass: listaModuloClasesItem.reference.id,
                                                                                                                                              stateView: true,
                                                                                                                                              uidModule: listModuloItem.reference.id,
                                                                                                                                              uidCurse: widget.refCourses?.reference.id,
                                                                                                                                            ),
                                                                                                                                            usersModuleclassRecordReference);

                                                                                                                                        await _model.refstatemoduleclasss!.reference.update(createUsersModuleclassRecordData(
                                                                                                                                          uid: _model.refstatemoduleclasss?.reference.id,
                                                                                                                                        ));
                                                                                                                                      }

                                                                                                                                      safeSetState(() {});
                                                                                                                                    } else {
                                                                                                                                      if (checkboxUsersModuleclassRecord != null) {
                                                                                                                                        await checkboxUsersModuleclassRecord.reference.update(createUsersModuleclassRecordData(
                                                                                                                                          stateView: false,
                                                                                                                                        ));
                                                                                                                                      } else {
                                                                                                                                        var usersModuleclassRecordReference = UsersModuleclassRecord.collection.doc();
                                                                                                                                        await usersModuleclassRecordReference.set(createUsersModuleclassRecordData(
                                                                                                                                          uidUser: widget.refUser?.reference.id,
                                                                                                                                          uidModuleclass: listaModuloClasesItem.reference.id,
                                                                                                                                          stateView: false,
                                                                                                                                          uidModule: listModuloItem.reference.id,
                                                                                                                                          uidCurse: widget.refCourses?.reference.id,
                                                                                                                                        ));
                                                                                                                                        _model.refstatemoduleclasssOff = UsersModuleclassRecord.getDocumentFromData(
                                                                                                                                            createUsersModuleclassRecordData(
                                                                                                                                              uidUser: widget.refUser?.reference.id,
                                                                                                                                              uidModuleclass: listaModuloClasesItem.reference.id,
                                                                                                                                              stateView: false,
                                                                                                                                              uidModule: listModuloItem.reference.id,
                                                                                                                                              uidCurse: widget.refCourses?.reference.id,
                                                                                                                                            ),
                                                                                                                                            usersModuleclassRecordReference);

                                                                                                                                        await _model.refstatemoduleclasssOff!.reference.update(createUsersModuleclassRecordData(
                                                                                                                                          uid: _model.refstatemoduleclasssOff?.reference.id,
                                                                                                                                        ));
                                                                                                                                      }

                                                                                                                                      safeSetState(() {});
                                                                                                                                    }
                                                                                                                                  },
                                                                                                                                  side: BorderSide(
                                                                                                                                    width: 2,
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                  ),
                                                                                                                                  activeColor: FlutterFlowTheme.of(context).accent1,
                                                                                                                                  checkColor: FlutterFlowTheme.of(context).info,
                                                                                                                                ),
                                                                                                                              );
                                                                                                                            },
                                                                                                                          ),
                                                                                                                          Flexible(
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                                                                                                                              child: RichText(
                                                                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                                                                text: TextSpan(
                                                                                                                                  children: [
                                                                                                                                    TextSpan(
                                                                                                                                      text: 'Actividad ',
                                                                                                                                      style: TextStyle(
                                                                                                                                        fontSize: 14.0,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                    TextSpan(
                                                                                                                                      text: valueOrDefault<String>(
                                                                                                                                        (listaModuloClasesIndex + 1).toString(),
                                                                                                                                        '1',
                                                                                                                                      ),
                                                                                                                                      style: TextStyle(),
                                                                                                                                    ),
                                                                                                                                    TextSpan(
                                                                                                                                      text: '.-',
                                                                                                                                      style: TextStyle(),
                                                                                                                                    ),
                                                                                                                                    TextSpan(
                                                                                                                                      text: ' ',
                                                                                                                                      style: TextStyle(),
                                                                                                                                    ),
                                                                                                                                    TextSpan(
                                                                                                                                      text: listaModuloClasesItem.name,
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
                                                                                                                          ),
                                                                                                                        ].divide(SizedBox(width: 10.0)),
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(35.0, 0.0, 20.0, 0.0),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                          children: [
                                                                                                                            Flexible(
                                                                                                                              child: Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                children: [
                                                                                                                                  Icon(
                                                                                                                                    Icons.video_settings,
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    size: 24.0,
                                                                                                                                  ),
                                                                                                                                  Text(
                                                                                                                                    '${valueOrDefault<String>(
                                                                                                                                      listaModuloClasesItem.minutes.toString(),
                                                                                                                                      '0',
                                                                                                                                    )} Min.',
                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                          fontFamily: 'Poppins',
                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                        ),
                                                                                                                                  ),
                                                                                                                                ].divide(SizedBox(width: 10.0)),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            if (listaModuloClasesItem.archives.isNotEmpty)
                                                                                                                              Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                                child: FFButtonWidget(
                                                                                                                                  onPressed: () async {
                                                                                                                                    while (listaModuloClasesItem.archives.length >= ((_model.indiceRecourse!) + 1)) {
                                                                                                                                      await downloadFile(
                                                                                                                                        filename: 'Recurso ${((_model.indiceRecourse!) + 1).toString()}: ${valueOrDefault<String>(
                                                                                                                                          listaModuloClasesItem.name,
                                                                                                                                          '-',
                                                                                                                                        )}',
                                                                                                                                        url: valueOrDefault<String>(
                                                                                                                                          listaModuloClasesItem.archives.elementAtOrNull(_model.indiceRecourse!),
                                                                                                                                          '0',
                                                                                                                                        ),
                                                                                                                                      );
                                                                                                                                      _model.indiceRecourse = _model.indiceRecourse! + 1;
                                                                                                                                      safeSetState(() {});
                                                                                                                                    }
                                                                                                                                    _model.indiceRecourse = 0;
                                                                                                                                    safeSetState(() {});
                                                                                                                                  },
                                                                                                                                  text: 'Recursos',
                                                                                                                                  options: FFButtonOptions(
                                                                                                                                    height: 25.0,
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                          fontFamily: 'Poppins',
                                                                                                                                          color: Colors.white,
                                                                                                                                          fontSize: 12.0,
                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                        ),
                                                                                                                                    elevation: 0.0,
                                                                                                                                    borderRadius: BorderRadius.circular(4.0),
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
                                                                            ],
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      StreamBuilder<
                                                          List<
                                                              UsersModuleclassRecord>>(
                                                        stream:
                                                            queryUsersModuleclassRecord(
                                                          queryBuilder:
                                                              (usersModuleclassRecord) =>
                                                                  usersModuleclassRecord
                                                                      .where(
                                                                        'uid_user',
                                                                        isEqualTo: widget.refUser?.reference.id !=
                                                                                ''
                                                                            ? widget.refUser?.reference.id
                                                                            : null,
                                                                      )
                                                                      .where(
                                                                        'uid_curse',
                                                                        isEqualTo: widget.refCourses?.reference.id !=
                                                                                ''
                                                                            ? widget.refCourses?.reference.id
                                                                            : null,
                                                                      ),
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
                                                          List<UsersModuleclassRecord>
                                                              containerUsersModuleclassRecordList =
                                                              snapshot.data!;

                                                          return Container(
                                                            width: 424.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        10.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        10.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          20.0),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
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
                                                                    RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                'Finalizacion del Curso:  ',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: Colors.black,
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                valueOrDefault<String>(
                                                                              formatNumber(
                                                                                (valueOrDefault<double>(
                                                                                      containerUsersModuleclassRecordList.where((e) => e.stateView).toList().length.toDouble(),
                                                                                      0.0,
                                                                                    ) /
                                                                                    valueOrDefault<double>(
                                                                                      _model.totalActividades,
                                                                                      0.0,
                                                                                    ) *
                                                                                    100),
                                                                                formatType: FormatType.custom,
                                                                                format: '0',
                                                                                locale: '',
                                                                              ),
                                                                              '0',
                                                                            ),
                                                                            style:
                                                                                TextStyle(
                                                                              color: Color(0xFFB2B2B2),
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                '%',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Color(0xFFB2B2B2),
                                                                            ),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Colors.black,
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed: (valueOrDefault<String>(
                                                                                  formatNumber(
                                                                                    (valueOrDefault<double>(
                                                                                          containerUsersModuleclassRecordList.where((e) => e.stateView).toList().length.toDouble(),
                                                                                          0.0,
                                                                                        ) /
                                                                                        valueOrDefault<double>(
                                                                                          _model.totalActividades,
                                                                                          0.0,
                                                                                        ) *
                                                                                        100),
                                                                                    formatType: FormatType.custom,
                                                                                    format: '0',
                                                                                    locale: '',
                                                                                  ),
                                                                                  '0',
                                                                                ) !=
                                                                                '100')
                                                                            ? null
                                                                            : () async {
                                                                                if (valueOrDefault<String>(
                                                                                      formatNumber(
                                                                                        (valueOrDefault<double>(
                                                                                              containerUsersModuleclassRecordList.where((e) => e.stateView).toList().length.toDouble(),
                                                                                              0.0,
                                                                                            ) /
                                                                                            valueOrDefault<double>(
                                                                                              _model.totalActividades,
                                                                                              0.0,
                                                                                            ) *
                                                                                            100),
                                                                                        formatType: FormatType.custom,
                                                                                        format: '0',
                                                                                        locale: '',
                                                                                      ),
                                                                                      '0',
                                                                                    ) ==
                                                                                    '100') {
                                                                                  context.pushNamed(
                                                                                    CourseTestWidget.routeName,
                                                                                    queryParameters: {
                                                                                      'refCourse': serializeParam(
                                                                                        widget.refCourses,
                                                                                        ParamType.Document,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                    extra: <String, dynamic>{
                                                                                      'refCourse': widget.refCourses,
                                                                                      kTransitionInfoKey: TransitionInfo(
                                                                                        hasTransition: true,
                                                                                        transitionType: PageTransitionType.fade,
                                                                                        duration: Duration(milliseconds: 0),
                                                                                      ),
                                                                                    },
                                                                                  );

                                                                                  await Future.delayed(const Duration(milliseconds: 1000));
                                                                                }
                                                                              },
                                                                        text:
                                                                            'Confirmar Finalización',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              176.0,
                                                                          height:
                                                                              34.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              16.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              Color(0xFF17236A),
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: Colors.white,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                          elevation:
                                                                              0.0,
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.0),
                                                                          disabledColor:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          disabledTextColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          10.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
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
