import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/empty_course/empty_course_widget.dart';
import 'dart:ui';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'lista_cursos_estudiantes_model.dart';
export 'lista_cursos_estudiantes_model.dart';

class ListaCursosEstudiantesWidget extends StatefulWidget {
  const ListaCursosEstudiantesWidget({
    super.key,
    required this.user,
  });

  final UsersRecord? user;

  @override
  State<ListaCursosEstudiantesWidget> createState() =>
      _ListaCursosEstudiantesWidgetState();
}

class _ListaCursosEstudiantesWidgetState
    extends State<ListaCursosEstudiantesWidget> {
  late ListaCursosEstudiantesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListaCursosEstudiantesModel());

    _model.txttituloTextController ??=
        TextEditingController(text: widget!.user?.displayName);
    _model.txttituloFocusNode ??= FocusNode();

    _model.txtencargadoTextController ??=
        TextEditingController(text: widget!.user?.email);
    _model.txtencargadoFocusNode ??= FocusNode();

    _model.txttiempolimiteFocusNode ??= FocusNode();

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
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0x18000000),
      ),
      child: SingleChildScrollView(
        primary: false,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(80.0, 50.0, 80.0, 50.0),
              child: Material(
                color: Colors.transparent,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF3F5FB),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Lista de Cursos',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF094B90),
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Container(
                                  width: 146.0,
                                  height: 3.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFDB0B17),
                                    borderRadius: BorderRadius.circular(3.0),
                                  ),
                                ),
                              ].divide(SizedBox(height: 2.0)),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nombre del Estudiante',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF17232B),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller:
                                            _model.txttituloTextController,
                                        focusNode: _model.txttituloFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.txttituloTextController',
                                          Duration(milliseconds: 1000),
                                          () => safeSetState(() {}),
                                        ),
                                        autofocus: false,
                                        readOnly: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: '---',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xFFA8A8A8),
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFE4E4E7),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFE4E4E7),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor: Color(0xFFE4E4E7),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .txttituloTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 5.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Correo electronico',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF17232B),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            child: TextFormField(
                                              controller: _model
                                                  .txtencargadoTextController,
                                              focusNode:
                                                  _model.txtencargadoFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.txtencargadoTextController',
                                                Duration(milliseconds: 1000),
                                                () => safeSetState(() {}),
                                              ),
                                              autofocus: false,
                                              readOnly: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText: '---',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFFA8A8A8),
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFE4E4E7),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFE4E4E7),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor: Color(0xFFE4E4E7),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              validator: _model
                                                  .txtencargadoTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 5.0)),
                                      ),
                                    ),
                                    Flexible(
                                      child:
                                          StreamBuilder<List<UsersPlansRecord>>(
                                        stream: queryUsersPlansRecord(
                                          queryBuilder: (usersPlansRecord) =>
                                              usersPlansRecord.where(
                                            'uid_user',
                                            isEqualTo:
                                                widget!.user?.reference.id,
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
                                                    FlutterFlowTheme.of(context)
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
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Tipo de Plan',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF17232B),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                StreamBuilder<
                                                    List<PlansRecord>>(
                                                  stream: queryPlansRecord(
                                                    queryBuilder:
                                                        (plansRecord) =>
                                                            plansRecord.where(
                                                      'uid',
                                                      isEqualTo:
                                                          containerUsersPlansRecord
                                                              ?.uidPlan,
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
                                                    List<PlansRecord>
                                                        txttiempolimitePlansRecordList =
                                                        snapshot.data!;
                                                    final txttiempolimitePlansRecord =
                                                        txttiempolimitePlansRecordList
                                                                .isNotEmpty
                                                            ? txttiempolimitePlansRecordList
                                                                .first
                                                            : null;

                                                    return Container(
                                                      width: double.infinity,
                                                      child: TextFormField(
                                                        controller: _model
                                                                .txttiempolimiteTextController ??=
                                                            TextEditingController(
                                                          text:
                                                              txttiempolimitePlansRecord
                                                                  ?.name,
                                                        ),
                                                        focusNode: _model
                                                            .txttiempolimiteFocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.txttiempolimiteTextController',
                                                          Duration(
                                                              milliseconds:
                                                                  1000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        readOnly: true,
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
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          hintText: '---',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Color(
                                                                        0xFFA8A8A8),
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xFFE4E4E7),
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
                                                              color: Color(
                                                                  0xFFE4E4E7),
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
                                                          fillColor:
                                                              Color(0xFFE4E4E7),
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
                                                            .txttiempolimiteTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ].divide(SizedBox(height: 5.0)),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 40.0)),
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                    maxHeight: 300.0,
                                  ),
                                  decoration: BoxDecoration(),
                                  child:
                                      StreamBuilder<List<UsersCoursesRecord>>(
                                    stream: queryUsersCoursesRecord(
                                      queryBuilder: (usersCoursesRecord) =>
                                          usersCoursesRecord
                                              .where(
                                                'uid_user',
                                                isEqualTo: widget!.user
                                                            ?.reference.id !=
                                                        ''
                                                    ? widget!.user?.reference.id
                                                    : null,
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
                                      List<UsersCoursesRecord>
                                          listViewUsersCoursesRecordList =
                                          snapshot.data!;
                                      if (listViewUsersCoursesRecordList
                                          .isEmpty) {
                                        return Center(
                                          child: Container(
                                            height: 300.0,
                                            child: EmptyCourseWidget(),
                                          ),
                                        );
                                      }

                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewUsersCoursesRecordList
                                                .length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 5.0),
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewUsersCoursesRecord =
                                              listViewUsersCoursesRecordList[
                                                  listViewIndex];
                                          return StreamBuilder<
                                              List<CoursesRecord>>(
                                            stream: queryCoursesRecord(
                                              queryBuilder: (coursesRecord) =>
                                                  coursesRecord.where(
                                                'uid',
                                                isEqualTo:
                                                    listViewUsersCoursesRecord
                                                                .uidCourses !=
                                                            ''
                                                        ? listViewUsersCoursesRecord
                                                            .uidCourses
                                                        : null,
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
                                              List<CoursesRecord>
                                                  containerCoursesRecordList =
                                                  snapshot.data!;
                                              final containerCoursesRecord =
                                                  containerCoursesRecordList
                                                          .isNotEmpty
                                                      ? containerCoursesRecordList
                                                          .first
                                                      : null;

                                              return Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF3F5FB),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(5.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FaIcon(
                                                            FontAwesomeIcons
                                                                .play,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 8.0,
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              containerCoursesRecord
                                                                  ?.name,
                                                              '--',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          RichText(
                                                            textScaler:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text:
                                                                      'Agregado el ',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Color(
                                                                            0xFFC3C3C3),
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                TextSpan(
                                                                  text: valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      "d/M/y",
                                                                      listViewUsersCoursesRecord
                                                                          .createdDate,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    '--/--/----',
                                                                  ),
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xFFC3C3C3),
                                                                  ),
                                                                )
                                                              ],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Color(
                                                                        0xFFC3C3C3),
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 4.0,
                                                            buttonSize: 40.0,
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            icon: Icon(
                                                              Icons.computer,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              size: 24.0,
                                                            ),
                                                            onPressed: () {
                                                              print(
                                                                  'IconButton pressed ...');
                                                            },
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ],
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
                              ].divide(SizedBox(height: 10.0)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                  text: 'Cerrar Ventana',
                                  options: FFButtonOptions(
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        50.0, 0.0, 50.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                              ].divide(SizedBox(width: 20.0)),
                            ),
                          ].divide(SizedBox(height: 20.0)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ].divide(SizedBox(height: 50.0)).around(SizedBox(height: 50.0)),
        ),
      ),
    );
  }
}
