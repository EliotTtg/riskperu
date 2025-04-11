import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/course_calification/course_calification_widget.dart';
import '/pages/empty_course/empty_course_widget.dart';
import '/pages/footer/footer_widget.dart';
import '/pages/header/header_widget.dart';
import '/pages/header_mobil/header_mobil_widget.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:text_search/text_search.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  static String routeName = 'Home';
  static String routePath = 'home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
              child: Column(
                mainAxisSize: MainAxisSize.max,
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
                            state: 1,
                          ),
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
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF17236A),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                40.0, 10.0, 10.0, 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          'Cursos',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    minHeight: 700.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        40.0, 0.0, 40.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            if (responsiveVisibility(
                                              context: context,
                                              phone: false,
                                            ))
                                              Flexible(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Flexible(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Filtrar por',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
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
                                                                  cboCategoryCategoryCoursesRecordList =
                                                                  snapshot
                                                                      .data!;

                                                              return FlutterFlowDropDown<
                                                                  String>(
                                                                controller: _model
                                                                        .cboCategoryValueController ??=
                                                                    FormFieldController<
                                                                        String>(
                                                                  _model.cboCategoryValue ??=
                                                                      '',
                                                                ),
                                                                options: List<
                                                                        String>.from(
                                                                    cboCategoryCategoryCoursesRecordList
                                                                        .map((e) => e
                                                                            .reference
                                                                            .id)
                                                                        .toList()),
                                                                optionLabels:
                                                                    cboCategoryCategoryCoursesRecordList
                                                                        .map((e) =>
                                                                            e.name)
                                                                        .toList(),
                                                                onChanged:
                                                                    (val) async {
                                                                  safeSetState(() =>
                                                                      _model.cboCategoryValue =
                                                                          val);
                                                                  _model.courseCategory =
                                                                      _model
                                                                          .cboCategoryValue;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                width: 200.0,
                                                                height: 40.0,
                                                                maxHeight:
                                                                    300.0,
                                                                searchHintTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                searchTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                hintText:
                                                                    'Categorias',
                                                                searchHintText:
                                                                    'Buscar categoria',
                                                                icon: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                elevation: 2.0,
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                borderWidth:
                                                                    0.0,
                                                                borderRadius:
                                                                    8.0,
                                                                margin: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                                hidesUnderline:
                                                                    true,
                                                                isOverButton:
                                                                    false,
                                                                isSearchable:
                                                                    true,
                                                                isMultiSelect:
                                                                    false,
                                                              );
                                                            },
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 5.0)),
                                                      ),
                                                    ),
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        _model.courseCategory =
                                                            null;
                                                        safeSetState(() {});
                                                        safeSetState(() {
                                                          _model
                                                              .cboCategoryValueController
                                                              ?.reset();
                                                        });
                                                      },
                                                      text: 'Restablecer',
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    20.0,
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
                                                            .secondaryBackground,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF454545),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 10.0)),
                                                ),
                                              ),
                                            Flexible(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Flexible(
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textController,
                                                        focusNode: _model
                                                            .textFieldFocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () async {
                                                            await queryCoursesRecordOnce()
                                                                .then(
                                                                  (records) => _model
                                                                          .simpleSearchResults =
                                                                      TextSearch(
                                                                    records
                                                                        .map(
                                                                          (record) => TextSearchItem.fromTerms(
                                                                              record,
                                                                              [
                                                                                record.name
                                                                              ]),
                                                                        )
                                                                        .toList(),
                                                                  )
                                                                          .search(_model
                                                                              .textController
                                                                              .text)
                                                                          .map((r) => r
                                                                              .object)
                                                                          .take(
                                                                              29)
                                                                          .toList(),
                                                                )
                                                                .onError((_,
                                                                        __) =>
                                                                    _model.simpleSearchResults =
                                                                        [])
                                                                .whenComplete(() =>
                                                                    safeSetState(
                                                                        () {}));
                                                          },
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          hintText:
                                                              'Buscar mis cursos',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          filled: true,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        cursorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        validator: _model
                                                            .textControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderRadius: 10.0,
                                                    buttonSize: 40.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    icon: Icon(
                                                      Icons.search_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      if (_model.textController
                                                                  .text !=
                                                              '') {
                                                        _model.uidsCourse = _model
                                                            .simpleSearchResults
                                                            .map((e) => e.uid)
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                      } else {
                                                        _model.uidsCourse = [];
                                                        safeSetState(() {});
                                                      }
                                                    },
                                                  ),
                                                ].divide(SizedBox(width: 10.0)),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 10.0)),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(20.0),
                                            child: StreamBuilder<
                                                List<CoursesRecord>>(
                                              stream: queryCoursesRecord(
                                                queryBuilder: (coursesRecord) =>
                                                    coursesRecord
                                                        .where(
                                                          'State',
                                                          isEqualTo: true,
                                                        )
                                                        .where(
                                                          'uid_CategoryCourses',
                                                          isEqualTo: _model
                                                                      .courseCategory !=
                                                                  ''
                                                              ? _model
                                                                  .courseCategory
                                                              : null,
                                                        )
                                                        .whereIn(
                                                            'uid',
                                                            _model.uidsCourse !=
                                                                    ''
                                                                ? _model
                                                                    .uidsCourse
                                                                : null)
                                                        .orderBy('Created_Date',
                                                            descending: true),
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
                                                    wrapCoursesRecordList =
                                                    snapshot.data!;
                                                if (wrapCoursesRecordList
                                                    .isEmpty) {
                                                  return Center(
                                                    child: Container(
                                                      height: 250.0,
                                                      child:
                                                          EmptyCourseWidget(),
                                                    ),
                                                  );
                                                }

                                                return Wrap(
                                                  spacing: 20.0,
                                                  runSpacing: 20.0,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.antiAlias,
                                                  children: List.generate(
                                                      wrapCoursesRecordList
                                                          .length, (wrapIndex) {
                                                    final wrapCoursesRecord =
                                                        wrapCoursesRecordList[
                                                            wrapIndex];
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        _model.refCourseUser =
                                                            await queryUsersCoursesRecordOnce(
                                                          queryBuilder:
                                                              (usersCoursesRecord) =>
                                                                  usersCoursesRecord
                                                                      .where(
                                                                        'uid_user',
                                                                        isEqualTo:
                                                                            currentUserReference?.id,
                                                                      )
                                                                      .where(
                                                                        'uid_courses',
                                                                        isEqualTo: wrapCoursesRecord
                                                                            .reference
                                                                            .id,
                                                                      ),
                                                          singleRecord: true,
                                                        ).then((s) =>
                                                                s.firstOrNull);
                                                        if (_model
                                                                .refCourseUser !=
                                                            null) {
                                                          if (wrapCoursesRecord
                                                                  .courseType ==
                                                              1) {
                                                            _model.refSessionStudent =
                                                                await querySessionRecordOnce(
                                                              queryBuilder: (sessionRecord) =>
                                                                  sessionRecord
                                                                      .where(
                                                                        'uid_Course',
                                                                        isEqualTo: wrapCoursesRecord
                                                                            .reference
                                                                            .id,
                                                                      )
                                                                      .orderBy(
                                                                          'Created_Date'),
                                                              singleRecord:
                                                                  true,
                                                            ).then((s) => s
                                                                    .firstOrNull);
                                                            if (_model
                                                                    .refSessionStudent !=
                                                                null) {
                                                              _model.refModulesCourse =
                                                                  await queryModuleRecordOnce(
                                                                queryBuilder: (moduleRecord) =>
                                                                    moduleRecord
                                                                        .where(
                                                                          'uid_Session',
                                                                          isEqualTo: _model
                                                                              .refSessionStudent
                                                                              ?.reference
                                                                              .id,
                                                                        )
                                                                        .orderBy(
                                                                            'Created_date'),
                                                                singleRecord:
                                                                    true,
                                                              ).then((s) => s
                                                                      .firstOrNull);
                                                              if (_model
                                                                      .refModulesCourse !=
                                                                  null) {
                                                                _model.refClassCourse =
                                                                    await queryModuleClassRecordOnce(
                                                                  queryBuilder: (moduleClassRecord) =>
                                                                      moduleClassRecord
                                                                          .where(
                                                                            'uid_Module',
                                                                            isEqualTo:
                                                                                _model.refModulesCourse?.reference.id,
                                                                          )
                                                                          .orderBy(
                                                                              'Created_date'),
                                                                  singleRecord:
                                                                      true,
                                                                ).then((s) => s
                                                                        .firstOrNull);
                                                                if (_model
                                                                        .refClassCourse !=
                                                                    null) {
                                                                  _model.refUser =
                                                                      await queryUsersRecordOnce(
                                                                    queryBuilder:
                                                                        (usersRecord) =>
                                                                            usersRecord.where(
                                                                      'uid',
                                                                      isEqualTo:
                                                                          currentUserReference
                                                                              ?.id,
                                                                    ),
                                                                    singleRecord:
                                                                        true,
                                                                  ).then((s) =>
                                                                          s.firstOrNull);

                                                                  context
                                                                      .pushNamed(
                                                                    CourseDatailsWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'refCourses':
                                                                          serializeParam(
                                                                        wrapCoursesRecord,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                      'refCoursesClass':
                                                                          serializeParam(
                                                                        _model
                                                                            .refClassCourse,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                      'refUser':
                                                                          serializeParam(
                                                                        _model
                                                                            .refUser,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'refCourses':
                                                                          wrapCoursesRecord,
                                                                      'refCoursesClass':
                                                                          _model
                                                                              .refClassCourse,
                                                                      'refUser':
                                                                          _model
                                                                              .refUser,
                                                                      kTransitionInfoKey:
                                                                          TransitionInfo(
                                                                        hasTransition:
                                                                            true,
                                                                        transitionType:
                                                                            PageTransitionType.fade,
                                                                        duration:
                                                                            Duration(milliseconds: 0),
                                                                      ),
                                                                    },
                                                                  );
                                                                }
                                                              }
                                                            }
                                                          } else {
                                                            _model.refGroup =
                                                                await queryExamGroupsRecordOnce(
                                                              queryBuilder: (examGroupsRecord) =>
                                                                  examGroupsRecord
                                                                      .where(
                                                                        'uid_Course',
                                                                        isEqualTo: wrapCoursesRecord
                                                                            .reference
                                                                            .id,
                                                                      )
                                                                      .where(
                                                                        'is_demo',
                                                                        isEqualTo:
                                                                            false,
                                                                      )
                                                                      .where(
                                                                        'state',
                                                                        isEqualTo:
                                                                            true,
                                                                      )
                                                                      .orderBy(
                                                                          'Created_date'),
                                                              singleRecord:
                                                                  true,
                                                            ).then((s) => s
                                                                    .firstOrNull);
                                                            if (_model
                                                                    .refGroup !=
                                                                null) {
                                                              _model.refExamen =
                                                                  await queryExamenesRecordOnce(
                                                                queryBuilder: (examenesRecord) =>
                                                                    examenesRecord
                                                                        .where(
                                                                          'uid_Group',
                                                                          isEqualTo: _model
                                                                              .refGroup
                                                                              ?.reference
                                                                              .id,
                                                                        )
                                                                        .where(
                                                                          'state',
                                                                          isEqualTo:
                                                                              true,
                                                                        )
                                                                        .orderBy(
                                                                            'fecha_creacion'),
                                                                singleRecord:
                                                                    true,
                                                              ).then((s) => s
                                                                      .firstOrNull);
                                                              if (_model
                                                                      .refExamen !=
                                                                  null) {
                                                                context
                                                                    .pushNamed(
                                                                  ExaminationQuestionsViewWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'refExamination':
                                                                        serializeParam(
                                                                      _model
                                                                          .refExamen,
                                                                      ParamType
                                                                          .Document,
                                                                    ),
                                                                    'refCourse':
                                                                        serializeParam(
                                                                      wrapCoursesRecord,
                                                                      ParamType
                                                                          .Document,
                                                                    ),
                                                                    'refUser':
                                                                        serializeParam(
                                                                      currentUserReference,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                    'type':
                                                                        serializeParam(
                                                                      2,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                    'isdemo':
                                                                        serializeParam(
                                                                      false,
                                                                      ParamType
                                                                          .bool,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    'refExamination':
                                                                        _model
                                                                            .refExamen,
                                                                    'refCourse':
                                                                        wrapCoursesRecord,
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

                                                                var registerSimulatorRecordReference =
                                                                    RegisterSimulatorRecord
                                                                        .collection
                                                                        .doc();
                                                                await registerSimulatorRecordReference
                                                                    .set({
                                                                  ...createRegisterSimulatorRecordData(
                                                                    uidUser:
                                                                        currentUserReference
                                                                            ?.id,
                                                                    uidCourse:
                                                                        wrapCoursesRecord
                                                                            .reference
                                                                            .id,
                                                                  ),
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'created_date':
                                                                          FieldValue
                                                                              .serverTimestamp(),
                                                                    },
                                                                  ),
                                                                });
                                                                _model.refHistory =
                                                                    RegisterSimulatorRecord
                                                                        .getDocumentFromData({
                                                                  ...createRegisterSimulatorRecordData(
                                                                    uidUser:
                                                                        currentUserReference
                                                                            ?.id,
                                                                    uidCourse:
                                                                        wrapCoursesRecord
                                                                            .reference
                                                                            .id,
                                                                  ),
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'created_date':
                                                                          DateTime
                                                                              .now(),
                                                                    },
                                                                  ),
                                                                }, registerSimulatorRecordReference);

                                                                await _model
                                                                    .refHistory!
                                                                    .reference
                                                                    .update(
                                                                        createRegisterSimulatorRecordData(
                                                                  uid: _model
                                                                      .refHistory
                                                                      ?.reference
                                                                      .id,
                                                                ));
                                                              }
                                                            }
                                                          }
                                                        } else {
                                                          if (wrapCoursesRecord
                                                                  .courseType ==
                                                              1) {
                                                            context.pushNamed(
                                                              CoursePriceWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'refCourse':
                                                                    serializeParam(
                                                                  wrapCoursesRecord,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'refCourse':
                                                                    wrapCoursesRecord,
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
                                                          } else {
                                                            context.pushNamed(
                                                              SimulatorWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'refCourse':
                                                                    serializeParam(
                                                                  wrapCoursesRecord,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'refCourse':
                                                                    wrapCoursesRecord,
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
                                                      child: Container(
                                                        width: 310.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  fadeInDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  fadeOutDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  imageUrl:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    wrapCoursesRecord
                                                                        .imageCourse,
                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/kpacita-ssg7c7/assets/mouvjylm6zw7/Risk_Peru_rebranding_final_Mesa_de_trabajo_1_copia_11.png',
                                                                  ),
                                                                  width: double
                                                                      .infinity,
                                                                  height: 140.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  errorWidget: (context,
                                                                          error,
                                                                          stackTrace) =>
                                                                      Image
                                                                          .asset(
                                                                    'assets/images/error_image.png',
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        140.0,
                                                                    fit: BoxFit
                                                                        .cover,
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
                                                                  Text(
                                                                    wrapCoursesRecord
                                                                        .name,
                                                                    maxLines: 2,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                  StreamBuilder<
                                                                      List<
                                                                          UsersRecord>>(
                                                                    stream:
                                                                        queryUsersRecord(
                                                                      queryBuilder:
                                                                          (usersRecord) =>
                                                                              usersRecord.where(
                                                                        'uid',
                                                                        isEqualTo:
                                                                            wrapCoursesRecord.uidTechear,
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
                                                                      List<UsersRecord>
                                                                          textUsersRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      // Return an empty Container when the item does not exist.
                                                                      if (snapshot
                                                                          .data!
                                                                          .isEmpty) {
                                                                        return Container();
                                                                      }
                                                                      final textUsersRecord = textUsersRecordList
                                                                              .isNotEmpty
                                                                          ? textUsersRecordList
                                                                              .first
                                                                          : null;

                                                                      return Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          textUsersRecord
                                                                              ?.displayName,
                                                                          '--',
                                                                        ),
                                                                        maxLines:
                                                                            1,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontSize: 10.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      );
                                                                    },
                                                                  ),
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
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            '4,1',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).warning,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                          wrapWithModel(
                                                                            model:
                                                                                _model.courseCalificationModels.getModel(
                                                                              wrapCoursesRecord.reference.id,
                                                                              wrapIndex,
                                                                            ),
                                                                            updateCallback: () =>
                                                                                safeSetState(() {}),
                                                                            child:
                                                                                CourseCalificationWidget(
                                                                              key: Key(
                                                                                'Keyxei_${wrapCoursesRecord.reference.id}',
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            '(411)',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 5.0)),
                                                                      ),
                                                                      RichText(
                                                                        textScaler:
                                                                            MediaQuery.of(context).textScaler,
                                                                        text:
                                                                            TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text: ' S/',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: wrapCoursesRecord.price,
                                                                              style: TextStyle(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 15.0,
                                                                              ),
                                                                            )
                                                                          ],
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            5.0)),
                                                                  ),
                                                                ].addToEnd(
                                                                    SizedBox(
                                                                        height:
                                                                            10.0)),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 10.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ]
                                          .divide(SizedBox(height: 20.0))
                                          .around(SizedBox(height: 20.0)),
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
                ],
              ),
            ),
          ),
        ));
  }
}
