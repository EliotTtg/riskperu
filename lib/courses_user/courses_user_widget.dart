import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/anuncio_simulator/anuncio_simulator_widget.dart';
import '/pages/empty_course/empty_course_widget.dart';
import '/pages/header/header_widget.dart';
import '/pages/navbar/navbar_widget.dart';
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'courses_user_model.dart';
export 'courses_user_model.dart';

class CoursesUserWidget extends StatefulWidget {
  const CoursesUserWidget({super.key});

  static String routeName = 'CoursesUser';
  static String routePath = 'coursesUser';

  @override
  State<CoursesUserWidget> createState() => _CoursesUserWidgetState();
}

class _CoursesUserWidgetState extends State<CoursesUserWidget> {
  late CoursesUserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoursesUserModel());

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
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding: EdgeInsets.all(50.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              wrapWithModel(
                                                model: _model
                                                    .anuncioSimulatorModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: AnuncioSimulatorWidget(),
                                              ),
                                              StreamBuilder<
                                                  List<UsersPlansRecord>>(
                                                stream: queryUsersPlansRecord(
                                                  queryBuilder:
                                                      (usersPlansRecord) =>
                                                          usersPlansRecord
                                                              .where(
                                                    'uid_user',
                                                    isEqualTo:
                                                        currentUserReference
                                                            ?.id,
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
                                                  List<UsersPlansRecord>
                                                      containerUsersPlansRecordList =
                                                      snapshot.data!;
                                                  final containerUsersPlansRecord =
                                                      containerUsersPlansRecordList
                                                              .isNotEmpty
                                                          ? containerUsersPlansRecordList
                                                              .first
                                                          : null;

                                                  return Container(
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
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
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
                                                                  'Cursos',
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
                                                                            20.0,
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
                                                                  width: double
                                                                      .infinity,
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
                                                          StreamBuilder<
                                                              List<
                                                                  CategoryCoursesRecord>>(
                                                            stream:
                                                                queryCategoryCoursesRecord(
                                                              queryBuilder: (categoryCoursesRecord) =>
                                                                  categoryCoursesRecord.orderBy(
                                                                      'Created_Date',
                                                                      descending:
                                                                          true),
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
                                                              List<CategoryCoursesRecord>
                                                                  listViewCategoryCoursesRecordList =
                                                                  snapshot
                                                                      .data!;

                                                              return ListView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    listViewCategoryCoursesRecordList
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        listViewIndex) {
                                                                  final listViewCategoryCoursesRecord =
                                                                      listViewCategoryCoursesRecordList[
                                                                          listViewIndex];
                                                                  return StreamBuilder<
                                                                      List<
                                                                          CoursesRecord>>(
                                                                    stream:
                                                                        queryCoursesRecord(
                                                                      queryBuilder: (coursesRecord) => coursesRecord
                                                                          .where(
                                                                            'course_type',
                                                                            isEqualTo:
                                                                                1,
                                                                          )
                                                                          .where(
                                                                            'uid_CategoryCourses',
                                                                            isEqualTo: listViewCategoryCoursesRecord.reference.id != ''
                                                                                ? listViewCategoryCoursesRecord.reference.id
                                                                                : null,
                                                                          )
                                                                          .orderBy('Created_Date', descending: true),
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
                                                                      List<CoursesRecord>
                                                                          containerCoursesRecordList =
                                                                          snapshot
                                                                              .data!;

                                                                      return Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Visibility(
                                                                          visible:
                                                                              containerCoursesRecordList.isNotEmpty,
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                20.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 10.0),
                                                                                  child: Text(
                                                                                    listViewCategoryCoursesRecord.name,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.montserrat(
                                                                                            fontWeight: FontWeight.bold,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          lineHeight: 1.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) {
                                                                                    final listCourse = containerCoursesRecordList.toList();
                                                                                    if (listCourse.isEmpty) {
                                                                                      return Center(
                                                                                        child: Container(
                                                                                          height: 250.0,
                                                                                          child: EmptyCourseWidget(),
                                                                                        ),
                                                                                      );
                                                                                    }

                                                                                    return SingleChildScrollView(
                                                                                      scrollDirection: Axis.horizontal,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: List.generate(listCourse.length, (listCourseIndex) {
                                                                                          final listCourseItem = listCourse[listCourseIndex];
                                                                                          return Padding(
                                                                                            padding: EdgeInsets.all(5.0),
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                _model.refSessionStudent = await querySessionRecordOnce(
                                                                                                  queryBuilder: (sessionRecord) => sessionRecord
                                                                                                      .where(
                                                                                                        'uid_Course',
                                                                                                        isEqualTo: listCourseItem.reference.id,
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
                                                                                                      _model.refUserCourse = await queryUsersRecordOnce(
                                                                                                        queryBuilder: (usersRecord) => usersRecord.where(
                                                                                                          'uid',
                                                                                                          isEqualTo: currentUserUid,
                                                                                                        ),
                                                                                                        singleRecord: true,
                                                                                                      ).then((s) => s.firstOrNull);
                                                                                                      _model.refCourseExistCourse = await queryUsersCoursesRecordOnce(
                                                                                                        queryBuilder: (usersCoursesRecord) => usersCoursesRecord
                                                                                                            .where(
                                                                                                              'uid_user',
                                                                                                              isEqualTo: currentUserReference?.id,
                                                                                                            )
                                                                                                            .where(
                                                                                                              'uid_courses',
                                                                                                              isEqualTo: listCourseItem.reference.id,
                                                                                                            ),
                                                                                                        singleRecord: true,
                                                                                                      ).then((s) => s.firstOrNull);
                                                                                                      _model.userCourse = _model.refCourseExistCourse;
                                                                                                      safeSetState(() {});
                                                                                                      if (!(_model.userCourse != null)) {
                                                                                                        var usersCoursesRecordReference = UsersCoursesRecord.collection.doc();
                                                                                                        await usersCoursesRecordReference.set({
                                                                                                          ...createUsersCoursesRecordData(
                                                                                                            uidCourses: listCourseItem.reference.id,
                                                                                                            uidUser: currentUserReference?.id,
                                                                                                          ),
                                                                                                          ...mapToFirestore(
                                                                                                            {
                                                                                                              'created_date': FieldValue.serverTimestamp(),
                                                                                                            },
                                                                                                          ),
                                                                                                        });
                                                                                                        _model.refUserCourseCreateCourse = UsersCoursesRecord.getDocumentFromData({
                                                                                                          ...createUsersCoursesRecordData(
                                                                                                            uidCourses: listCourseItem.reference.id,
                                                                                                            uidUser: currentUserReference?.id,
                                                                                                          ),
                                                                                                          ...mapToFirestore(
                                                                                                            {
                                                                                                              'created_date': DateTime.now(),
                                                                                                            },
                                                                                                          ),
                                                                                                        }, usersCoursesRecordReference);

                                                                                                        await _model.refUserCourseCreateCourse!.reference.update(createUsersCoursesRecordData(
                                                                                                          uid: _model.refUserCourseCreateCourse?.reference.id,
                                                                                                        ));
                                                                                                      }
                                                                                                      if (listCourseItem.courseType == 1) {
                                                                                                        context.pushNamed(
                                                                                                          CourseDatailsWidget.routeName,
                                                                                                          queryParameters: {
                                                                                                            'refCourses': serializeParam(
                                                                                                              listCourseItem,
                                                                                                              ParamType.Document,
                                                                                                            ),
                                                                                                            'refCoursesClass': serializeParam(
                                                                                                              _model.refClassCourse,
                                                                                                              ParamType.Document,
                                                                                                            ),
                                                                                                            'refUser': serializeParam(
                                                                                                              _model.refUserCourse,
                                                                                                              ParamType.Document,
                                                                                                            ),
                                                                                                          }.withoutNulls,
                                                                                                          extra: <String, dynamic>{
                                                                                                            'refCourses': listCourseItem,
                                                                                                            'refCoursesClass': _model.refClassCourse,
                                                                                                            'refUser': _model.refUserCourse,
                                                                                                            kTransitionInfoKey: TransitionInfo(
                                                                                                              hasTransition: true,
                                                                                                              transitionType: PageTransitionType.fade,
                                                                                                              duration: Duration(milliseconds: 0),
                                                                                                            ),
                                                                                                          },
                                                                                                        );
                                                                                                      } else {
                                                                                                        context.pushNamed(
                                                                                                          CourseTestWidget.routeName,
                                                                                                          queryParameters: {
                                                                                                            'refCourse': serializeParam(
                                                                                                              listCourseItem,
                                                                                                              ParamType.Document,
                                                                                                            ),
                                                                                                          }.withoutNulls,
                                                                                                          extra: <String, dynamic>{
                                                                                                            'refCourse': listCourseItem,
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
                                                                                                }

                                                                                                safeSetState(() {});
                                                                                              },
                                                                                              child: Material(
                                                                                                color: Colors.transparent,
                                                                                                elevation: 2.0,
                                                                                                shape: RoundedRectangleBorder(
                                                                                                  borderRadius: BorderRadius.circular(5.0),
                                                                                                ),
                                                                                                child: Container(
                                                                                                  width: 310.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    borderRadius: BorderRadius.circular(5.0),
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsets.all(10.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(5.0),
                                                                                                          child: Image.network(
                                                                                                            valueOrDefault<String>(
                                                                                                              listCourseItem.imageCourse,
                                                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/kpacita-ssg7c7/assets/mouvjylm6zw7/Risk_Peru_rebranding_final_Mesa_de_trabajo_1_copia_11.png',
                                                                                                            ),
                                                                                                            width: double.infinity,
                                                                                                            height: 140.0,
                                                                                                            fit: BoxFit.cover,
                                                                                                            errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                                              'assets/images/error_image.png',
                                                                                                              width: double.infinity,
                                                                                                              height: 140.0,
                                                                                                              fit: BoxFit.cover,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              valueOrDefault<String>(
                                                                                                                listCourseItem.name,
                                                                                                                '-',
                                                                                                              ),
                                                                                                              maxLines: 2,
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    font: GoogleFonts.montserrat(
                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                                    fontSize: 14.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            StreamBuilder<List<UsersRecord>>(
                                                                                                              stream: queryUsersRecord(
                                                                                                                queryBuilder: (usersRecord) => usersRecord.where(
                                                                                                                  'uid',
                                                                                                                  isEqualTo: listCourseItem.uidTechear,
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
                                                                                                                List<UsersRecord> textUsersRecordList = snapshot.data!;
                                                                                                                // Return an empty Container when the item does not exist.
                                                                                                                if (snapshot.data!.isEmpty) {
                                                                                                                  return Container();
                                                                                                                }
                                                                                                                final textUsersRecord = textUsersRecordList.isNotEmpty ? textUsersRecordList.first : null;

                                                                                                                return Text(
                                                                                                                  valueOrDefault<String>(
                                                                                                                    textUsersRecord?.displayName,
                                                                                                                    '--',
                                                                                                                  ),
                                                                                                                  maxLines: 1,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        font: GoogleFonts.montserrat(
                                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                        ),
                                                                                                                        fontSize: 10.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                );
                                                                                                              },
                                                                                                            ),
                                                                                                          ].addToEnd(SizedBox(height: 10.0)),
                                                                                                        ),
                                                                                                      ].divide(SizedBox(height: 10.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        }).divide(SizedBox(width: 30.0)),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ],
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
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ].divide(SizedBox(height: 20.0)),
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
