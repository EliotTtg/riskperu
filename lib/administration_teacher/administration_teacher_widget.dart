import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/create_update_category_examen/create_update_category_examen_widget.dart';
import '/pages/create_update_courses/create_update_courses_widget.dart';
import '/pages/create_update_examen/create_update_examen_widget.dart';
import '/pages/create_update_usuario/create_update_usuario_widget.dart';
import '/pages/delete_usuario/delete_usuario_widget.dart';
import '/pages/empty_course/empty_course_widget.dart';
import '/pages/empty_student/empty_student_widget.dart';
import '/pages/header/header_widget.dart';
import '/pages/lista_cursos_estudiantes/lista_cursos_estudiantes_widget.dart';
import '/pages/lista_estudiantes_courses/lista_estudiantes_courses_widget.dart';
import '/pages/lista_estudiantes_examen/lista_estudiantes_examen_widget.dart';
import '/pages/lista_preguntas_examen/lista_preguntas_examen_widget.dart';
import '/pages/mostar_eleccion_curso/mostar_eleccion_curso_widget.dart';
import '/pages/navbar/navbar_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'administration_teacher_model.dart';
export 'administration_teacher_model.dart';

class AdministrationTeacherWidget extends StatefulWidget {
  const AdministrationTeacherWidget({super.key});

  static String routeName = 'Administration_Teacher';
  static String routePath = 'administration_techear';

  @override
  State<AdministrationTeacherWidget> createState() =>
      _AdministrationTeacherWidgetState();
}

class _AdministrationTeacherWidgetState
    extends State<AdministrationTeacherWidget> with TickerProviderStateMixin {
  late AdministrationTeacherModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdministrationTeacherModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (valueOrDefault(currentUserDocument?.userType, 0) == 2) {
        context.goNamed(
          HomeWidget.routeName,
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.txtbuscarExamenTextController1 ??= TextEditingController();
    _model.txtbuscarExamenFocusNode1 ??= FocusNode();

    _model.txtbuscarExamenTextController2 ??= TextEditingController();
    _model.txtbuscarExamenFocusNode2 ??= FocusNode();

    _model.txtbuscarCursoTextController ??= TextEditingController();
    _model.txtbuscarCursoFocusNode ??= FocusNode();

    _model.txtbuscarEstudianteTextController ??= TextEditingController();
    _model.txtbuscarEstudianteFocusNode ??= FocusNode();

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
                                child: wrapWithModel(
                                  model: _model.navbarModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: NavbarWidget(
                                    state: 1,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  100.0, 50.0, 100.0, 50.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: 700.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(25.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Administración',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF01203F),
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  lineHeight:
                                                                      1.0,
                                                                ),
                                                          ),
                                                          Container(
                                                            width: 113.0,
                                                            height: 3.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 2.0)),
                                                      ),
                                                      Text(
                                                        'Este diseño permite a los profesores gestionar de manera eficiente los elementos esenciales de su labor educativa: los cursos, los exámenes y la administración de los estudiantes, todo a través de una interfaz intuitiva y fácil de utilizar.',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: Color(
                                                                  0xFF979797),
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  Alignment(
                                                                      -1.0, 0),
                                                              child: TabBar(
                                                                isScrollable:
                                                                    true,
                                                                tabAlignment:
                                                                    TabAlignment
                                                                        .start,
                                                                labelColor: Color(
                                                                    0xFF094B90),
                                                                unselectedLabelColor:
                                                                    Color(
                                                                        0xFFC9C9C9),
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
                                                                unselectedLabelStyle:
                                                                    FlutterFlowTheme.of(
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
                                                                    Color(
                                                                        0xFF094B90),
                                                                tabs: [
                                                                  Tab(
                                                                    text:
                                                                        'Cursos',
                                                                  ),
                                                                  Tab(
                                                                    text:
                                                                        'Estudiantes',
                                                                  ),
                                                                ],
                                                                controller: _model
                                                                    .tabBarController,
                                                                onTap:
                                                                    (i) async {
                                                                  [
                                                                    () async {},
                                                                    () async {}
                                                                  ][i]();
                                                                },
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: TabBarView(
                                                                controller: _model
                                                                    .tabBarController,
                                                                children: [
                                                                  Builder(
                                                                    builder:
                                                                        (context) {
                                                                      if (_model.refCourse !=
                                                                              null &&
                                                                          _model.refCourse !=
                                                                              '') {
                                                                        return Builder(
                                                                          builder:
                                                                              (context) {
                                                                            if (_model.refCategory != null &&
                                                                                _model.refCategory != '') {
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Flexible(
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Buscar:',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                            Container(
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Container(
                                                                                                width: 200.0,
                                                                                                child: TextFormField(
                                                                                                  controller: _model.txtbuscarExamenTextController1,
                                                                                                  focusNode: _model.txtbuscarExamenFocusNode1,
                                                                                                  onChanged: (_) => EasyDebounce.debounce(
                                                                                                    '_model.txtbuscarExamenTextController1',
                                                                                                    Duration(milliseconds: 50),
                                                                                                    () async {
                                                                                                      await queryExamenesRecordOnce()
                                                                                                          .then(
                                                                                                            (records) => _model.simpleSearchResults1 = TextSearch(
                                                                                                              records
                                                                                                                  .map(
                                                                                                                    (record) => TextSearchItem.fromTerms(record, [record.nombre!]),
                                                                                                                  )
                                                                                                                  .toList(),
                                                                                                            ).search(_model.txtbuscarExamenTextController1.text).map((r) => r.object).toList(),
                                                                                                          )
                                                                                                          .onError((_, __) => _model.simpleSearchResults1 = [])
                                                                                                          .whenComplete(() => safeSetState(() {}));
                                                                                                    },
                                                                                                  ),
                                                                                                  autofocus: false,
                                                                                                  obscureText: false,
                                                                                                  decoration: InputDecoration(
                                                                                                    isDense: true,
                                                                                                    labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontSize: 13.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                    hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontSize: 13.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                    enabledBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(
                                                                                                        color: Color(0xFFCED4DA),
                                                                                                        width: 1.0,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(3.2),
                                                                                                    ),
                                                                                                    focusedBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(
                                                                                                        color: Color(0xFFCED4DA),
                                                                                                        width: 1.0,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(3.2),
                                                                                                    ),
                                                                                                    errorBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(
                                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                                        width: 1.0,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(3.2),
                                                                                                    ),
                                                                                                    focusedErrorBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(
                                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                                        width: 1.0,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(3.2),
                                                                                                    ),
                                                                                                    filled: true,
                                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                      ),
                                                                                                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                  validator: _model.txtbuscarExamenTextController1Validator.asValidator(context),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 10.0)),
                                                                                        ),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
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
                                                                                                        child: CreateUpdateExamenWidget(
                                                                                                          refCategoryExamen: '',
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                );
                                                                                              },
                                                                                              text: 'Agregar',
                                                                                              options: FFButtonOptions(
                                                                                                height: 20.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
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
                                                                                          FFButtonWidget(
                                                                                            onPressed: () async {
                                                                                              _model.refCategory = null;
                                                                                              safeSetState(() {});
                                                                                            },
                                                                                            text: 'Volver',
                                                                                            options: FFButtonOptions(
                                                                                              height: 20.0,
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
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
                                                                                        ].divide(SizedBox(width: 20.0)),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 10.0)),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: StreamBuilder<List<ExamenesRecord>>(
                                                                                      stream: queryExamenesRecord(
                                                                                        queryBuilder: (examenesRecord) => examenesRecord
                                                                                            .where(
                                                                                              'uid_Group',
                                                                                              isEqualTo: _model.refCategory != '' ? _model.refCategory : null,
                                                                                            )
                                                                                            .whereIn('uid', _model.simpleSearchResults1.map((e) => e.uid).toList() != '' ? _model.simpleSearchResults1.map((e) => e.uid).toList() : null)
                                                                                            .orderBy('fecha_creacion', descending: true),
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
                                                                                        List<ExamenesRecord> containerExamenesRecordList = snapshot.data!;

                                                                                        return Container(
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Builder(
                                                                                            builder: (context) {
                                                                                              final listExamenes = containerExamenesRecordList.toList();
                                                                                              if (listExamenes.isEmpty) {
                                                                                                return Center(
                                                                                                  child: EmptyCourseWidget(),
                                                                                                );
                                                                                              }

                                                                                              return FlutterFlowDataTable<ExamenesRecord>(
                                                                                                controller: _model.paginatedDataTableController1,
                                                                                                data: listExamenes,
                                                                                                columnsBuilder: (onSortChanged) => [
                                                                                                  DataColumn2(
                                                                                                    label: DefaultTextStyle.merge(
                                                                                                      softWrap: true,
                                                                                                      child: Text(
                                                                                                        'Fecha de creación',
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              fontFamily: 'Poppins',
                                                                                                              color: Color(0xFF212529),
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              lineHeight: 1.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  DataColumn2(
                                                                                                    label: DefaultTextStyle.merge(
                                                                                                      softWrap: true,
                                                                                                      child: Text(
                                                                                                        'Nombre',
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              fontFamily: 'Poppins',
                                                                                                              color: Color(0xFF212529),
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              lineHeight: 1.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  DataColumn2(
                                                                                                    label: DefaultTextStyle.merge(
                                                                                                      softWrap: true,
                                                                                                      child: Text(
                                                                                                        'Encargado',
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              fontFamily: 'Poppins',
                                                                                                              color: Color(0xFF212529),
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              lineHeight: 1.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  DataColumn2(
                                                                                                    label: DefaultTextStyle.merge(
                                                                                                      softWrap: true,
                                                                                                      child: Text(
                                                                                                        'Tiempo Limite',
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              fontFamily: 'Poppins',
                                                                                                              color: Color(0xFF212529),
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              lineHeight: 1.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  DataColumn2(
                                                                                                    label: DefaultTextStyle.merge(
                                                                                                      softWrap: true,
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          'Acción',
                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                color: Color(0xFF212529),
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                lineHeight: 1.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                                dataRowBuilder: (listExamenesItem, listExamenesIndex, selected, onSelectChanged) => DataRow(
                                                                                                  color: MaterialStateProperty.all(
                                                                                                    listExamenesIndex % 2 == 0 ? Color(0xFFF6F6F6) : Colors.white,
                                                                                                  ),
                                                                                                  cells: [
                                                                                                    Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        dateTimeFormat(
                                                                                                          "d/M/y",
                                                                                                          listExamenesItem.fechaCreacion,
                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                        ),
                                                                                                        '--/--/----',
                                                                                                      ),
                                                                                                      maxLines: 1,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Poppins',
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        listExamenesItem.nombre,
                                                                                                        '---',
                                                                                                      ),
                                                                                                      maxLines: 1,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Poppins',
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                    StreamBuilder<List<UsersRecord>>(
                                                                                                      stream: queryUsersRecord(
                                                                                                        queryBuilder: (usersRecord) => usersRecord.where(
                                                                                                          'uid',
                                                                                                          isEqualTo: listExamenesItem.uidTeacher,
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
                                                                                                        final textUsersRecord = textUsersRecordList.isNotEmpty ? textUsersRecordList.first : null;

                                                                                                        return Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            textUsersRecord?.displayName,
                                                                                                            '--',
                                                                                                          ),
                                                                                                          maxLines: 1,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                    Text(
                                                                                                      '${valueOrDefault<String>(
                                                                                                        listExamenesItem.tiempoLimite.toString(),
                                                                                                        '0',
                                                                                                      )} Min.',
                                                                                                      maxLines: 1,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Poppins',
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      children: [
                                                                                                        Builder(
                                                                                                          builder: (context) => FlutterFlowIconButton(
                                                                                                            borderColor: Colors.transparent,
                                                                                                            borderRadius: 8.0,
                                                                                                            buttonSize: 46.0,
                                                                                                            icon: Icon(
                                                                                                              Icons.document_scanner,
                                                                                                              color: Color(0xFF707070),
                                                                                                              size: 13.5,
                                                                                                            ),
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
                                                                                                                      child: ListaPreguntasExamenWidget(
                                                                                                                        refExamen: listExamenesItem,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ),
                                                                                                        Builder(
                                                                                                          builder: (context) => FlutterFlowIconButton(
                                                                                                            borderColor: Colors.transparent,
                                                                                                            borderRadius: 8.0,
                                                                                                            buttonSize: 46.0,
                                                                                                            icon: Icon(
                                                                                                              Icons.edit,
                                                                                                              color: Color(0xFF707070),
                                                                                                              size: 13.5,
                                                                                                            ),
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
                                                                                                                      child: CreateUpdateExamenWidget(
                                                                                                                        refExamen: listExamenesItem,
                                                                                                                        refCategoryExamen: _model.refCategory!,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ),
                                                                                                        Builder(
                                                                                                          builder: (context) => FlutterFlowIconButton(
                                                                                                            borderColor: Colors.transparent,
                                                                                                            borderRadius: 8.0,
                                                                                                            buttonSize: 46.0,
                                                                                                            icon: FaIcon(
                                                                                                              FontAwesomeIcons.streetView,
                                                                                                              color: Color(0xFF707070),
                                                                                                              size: 13.5,
                                                                                                            ),
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
                                                                                                                      child: ListaEstudiantesExamenWidget(
                                                                                                                        refExamen: listExamenesItem,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ].map((c) => DataCell(c)).toList(),
                                                                                                ),
                                                                                                emptyBuilder: () => Center(
                                                                                                  child: EmptyCourseWidget(),
                                                                                                ),
                                                                                                paginated: true,
                                                                                                selectable: false,
                                                                                                hidePaginator: false,
                                                                                                showFirstLastButtons: true,
                                                                                                headingRowHeight: 56.0,
                                                                                                dataRowHeight: 48.0,
                                                                                                columnSpacing: 20.0,
                                                                                                headingRowColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                addHorizontalDivider: true,
                                                                                                addTopAndBottomDivider: false,
                                                                                                hideDefaultHorizontalDivider: true,
                                                                                                horizontalDividerColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                horizontalDividerThickness: 1.0,
                                                                                                addVerticalDivider: false,
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 10.0)).addToStart(SizedBox(height: 10.0)),
                                                                              );
                                                                            } else {
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Flexible(
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Buscar:',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                            Container(
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Container(
                                                                                                width: 200.0,
                                                                                                child: TextFormField(
                                                                                                  controller: _model.txtbuscarExamenTextController2,
                                                                                                  focusNode: _model.txtbuscarExamenFocusNode2,
                                                                                                  onChanged: (_) => EasyDebounce.debounce(
                                                                                                    '_model.txtbuscarExamenTextController2',
                                                                                                    Duration(milliseconds: 50),
                                                                                                    () async {
                                                                                                      await queryExamGroupsRecordOnce()
                                                                                                          .then(
                                                                                                            (records) => _model.simpleSearchResults2 = TextSearch(
                                                                                                              records
                                                                                                                  .map(
                                                                                                                    (record) => TextSearchItem.fromTerms(record, [record.name!]),
                                                                                                                  )
                                                                                                                  .toList(),
                                                                                                            ).search(_model.txtbuscarExamenTextController2.text).map((r) => r.object).toList(),
                                                                                                          )
                                                                                                          .onError((_, __) => _model.simpleSearchResults2 = [])
                                                                                                          .whenComplete(() => safeSetState(() {}));
                                                                                                    },
                                                                                                  ),
                                                                                                  autofocus: false,
                                                                                                  obscureText: false,
                                                                                                  decoration: InputDecoration(
                                                                                                    isDense: true,
                                                                                                    labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontSize: 13.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                    hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontSize: 13.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                    enabledBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(
                                                                                                        color: Color(0xFFCED4DA),
                                                                                                        width: 1.0,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(3.2),
                                                                                                    ),
                                                                                                    focusedBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(
                                                                                                        color: Color(0xFFCED4DA),
                                                                                                        width: 1.0,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(3.2),
                                                                                                    ),
                                                                                                    errorBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(
                                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                                        width: 1.0,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(3.2),
                                                                                                    ),
                                                                                                    focusedErrorBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(
                                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                                        width: 1.0,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(3.2),
                                                                                                    ),
                                                                                                    filled: true,
                                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                      ),
                                                                                                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                  validator: _model.txtbuscarExamenTextController2Validator.asValidator(context),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 10.0)),
                                                                                        ),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
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
                                                                                                        child: CreateUpdateCategoryExamenWidget(
                                                                                                          refCourse: _model.refCourse!,
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                );
                                                                                              },
                                                                                              text: 'Agregar',
                                                                                              options: FFButtonOptions(
                                                                                                height: 20.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
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
                                                                                          FFButtonWidget(
                                                                                            onPressed: () async {
                                                                                              _model.refCourse = null;
                                                                                              safeSetState(() {});
                                                                                            },
                                                                                            text: 'Volver',
                                                                                            options: FFButtonOptions(
                                                                                              height: 20.0,
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
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
                                                                                        ].divide(SizedBox(width: 20.0)),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 10.0)),
                                                                                  ),
                                                                                  Flexible(
                                                                                    child: StreamBuilder<List<ExamGroupsRecord>>(
                                                                                      stream: queryExamGroupsRecord(
                                                                                        queryBuilder: (examGroupsRecord) => examGroupsRecord
                                                                                            .where(
                                                                                              'uid_Course',
                                                                                              isEqualTo: _model.refCourse != '' ? _model.refCourse : null,
                                                                                            )
                                                                                            .orderBy('Created_date', descending: true),
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
                                                                                        List<ExamGroupsRecord> containerExamGroupsRecordList = snapshot.data!;

                                                                                        return Container(
                                                                                          width: double.infinity,
                                                                                          height: 803.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Builder(
                                                                                            builder: (context) {
                                                                                              final listacategoriasexamen = containerExamGroupsRecordList.toList();
                                                                                              if (listacategoriasexamen.isEmpty) {
                                                                                                return Center(
                                                                                                  child: EmptyStudentWidget(),
                                                                                                );
                                                                                              }

                                                                                              return FlutterFlowDataTable<ExamGroupsRecord>(
                                                                                                controller: _model.paginatedDataTableController2,
                                                                                                data: listacategoriasexamen,
                                                                                                columnsBuilder: (onSortChanged) => [
                                                                                                  DataColumn2(
                                                                                                    label: DefaultTextStyle.merge(
                                                                                                      softWrap: true,
                                                                                                      child: Text(
                                                                                                        'Fecha de creación',
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              fontFamily: 'Poppins',
                                                                                                              color: Color(0xFF212529),
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              lineHeight: 1.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  DataColumn2(
                                                                                                    label: DefaultTextStyle.merge(
                                                                                                      softWrap: true,
                                                                                                      child: Text(
                                                                                                        'Nombre',
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              fontFamily: 'Poppins',
                                                                                                              color: Color(0xFF212529),
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              lineHeight: 1.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  DataColumn2(
                                                                                                    label: DefaultTextStyle.merge(
                                                                                                      softWrap: true,
                                                                                                      child: Text(
                                                                                                        'Creado por',
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              fontFamily: 'Poppins',
                                                                                                              color: Color(0xFF212529),
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              lineHeight: 1.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  DataColumn2(
                                                                                                    label: DefaultTextStyle.merge(
                                                                                                      softWrap: true,
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          'Examenes',
                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                color: Color(0xFF212529),
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                lineHeight: 1.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  DataColumn2(
                                                                                                    label: DefaultTextStyle.merge(
                                                                                                      softWrap: true,
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          'Acción',
                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                color: Color(0xFF212529),
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                lineHeight: 1.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                                dataRowBuilder: (listacategoriasexamenItem, listacategoriasexamenIndex, selected, onSelectChanged) => DataRow(
                                                                                                  color: MaterialStateProperty.all(
                                                                                                    listacategoriasexamenIndex % 2 == 0 ? Color(0xFFF6F6F6) : Colors.white,
                                                                                                  ),
                                                                                                  cells: [
                                                                                                    Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        dateTimeFormat(
                                                                                                          "d/M/y",
                                                                                                          listacategoriasexamenItem.createdDate,
                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                        ),
                                                                                                        '--/--/----',
                                                                                                      ),
                                                                                                      maxLines: 1,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Poppins',
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        listacategoriasexamenItem.name,
                                                                                                        '---',
                                                                                                      ),
                                                                                                      maxLines: 1,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Poppins',
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                    StreamBuilder<List<UsersRecord>>(
                                                                                                      stream: queryUsersRecord(
                                                                                                        queryBuilder: (usersRecord) => usersRecord.where(
                                                                                                          'uid',
                                                                                                          isEqualTo: listacategoriasexamenItem.createdBy,
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
                                                                                                        final textUsersRecord = textUsersRecordList.isNotEmpty ? textUsersRecordList.first : null;

                                                                                                        return Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            textUsersRecord?.displayName,
                                                                                                            '--',
                                                                                                          ),
                                                                                                          maxLines: 1,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: FFButtonWidget(
                                                                                                        onPressed: () async {
                                                                                                          _model.refCategory = listacategoriasexamenItem.reference.id;
                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        text: 'Ver',
                                                                                                        options: FFButtonOptions(
                                                                                                          width: 74.0,
                                                                                                          height: 23.0,
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                          color: Color(0xFF094B90),
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
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      children: [
                                                                                                        Builder(
                                                                                                          builder: (context) => FlutterFlowIconButton(
                                                                                                            borderColor: Colors.transparent,
                                                                                                            borderRadius: 8.0,
                                                                                                            buttonSize: 46.0,
                                                                                                            icon: Icon(
                                                                                                              Icons.edit,
                                                                                                              color: Color(0xFF707070),
                                                                                                              size: 13.5,
                                                                                                            ),
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
                                                                                                                      child: CreateUpdateCategoryExamenWidget(
                                                                                                                        refGroupExamen: listacategoriasexamenItem,
                                                                                                                        refCourse: _model.refCourse!,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ),
                                                                                                        FlutterFlowIconButton(
                                                                                                          borderColor: Colors.transparent,
                                                                                                          borderRadius: 8.0,
                                                                                                          buttonSize: 46.0,
                                                                                                          icon: Icon(
                                                                                                            Icons.close,
                                                                                                            color: Color(0xFF707070),
                                                                                                            size: 13.5,
                                                                                                          ),
                                                                                                          onPressed: () async {
                                                                                                            _model.refCategoryExamens = await queryExamGroupsRecordOnce(
                                                                                                              queryBuilder: (examGroupsRecord) => examGroupsRecord.where(
                                                                                                                'uid_Course',
                                                                                                                isEqualTo: _model.refCourse,
                                                                                                              ),
                                                                                                            );
                                                                                                            if (_model.refCategoryExamens != null && (_model.refCategoryExamens)!.isNotEmpty) {
                                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                SnackBar(
                                                                                                                  content: Text(
                                                                                                                    'El grupo de examenes actualmente tiene examenes.',
                                                                                                                    style: TextStyle(
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  duration: Duration(milliseconds: 4000),
                                                                                                                  backgroundColor: FlutterFlowTheme.of(context).warning,
                                                                                                                ),
                                                                                                              );
                                                                                                            } else {
                                                                                                              await listacategoriasexamenItem.reference.delete();
                                                                                                            }

                                                                                                            await Future.delayed(const Duration(milliseconds: 1000));

                                                                                                            safeSetState(() {});
                                                                                                          },
                                                                                                        ),
                                                                                                        FlutterFlowIconButton(
                                                                                                          borderColor: Colors.transparent,
                                                                                                          borderRadius: 8.0,
                                                                                                          buttonSize: 46.0,
                                                                                                          icon: Icon(
                                                                                                            Icons.info,
                                                                                                            color: FlutterFlowTheme.of(context).accent1,
                                                                                                            size: 13.5,
                                                                                                          ),
                                                                                                          onPressed: () {
                                                                                                            print('IconButton pressed ...');
                                                                                                          },
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ].map((c) => DataCell(c)).toList(),
                                                                                                ),
                                                                                                emptyBuilder: () => Center(
                                                                                                  child: EmptyStudentWidget(),
                                                                                                ),
                                                                                                paginated: true,
                                                                                                selectable: false,
                                                                                                hidePaginator: false,
                                                                                                showFirstLastButtons: true,
                                                                                                headingRowHeight: 56.0,
                                                                                                dataRowHeight: 48.0,
                                                                                                columnSpacing: 20.0,
                                                                                                headingRowColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                addHorizontalDivider: true,
                                                                                                addTopAndBottomDivider: false,
                                                                                                hideDefaultHorizontalDivider: true,
                                                                                                horizontalDividerColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                horizontalDividerThickness: 1.0,
                                                                                                addVerticalDivider: false,
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 10.0)).addToStart(SizedBox(height: 10.0)),
                                                                              );
                                                                            }
                                                                          },
                                                                        );
                                                                      } else {
                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Flexible(
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Buscar:',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                      Container(
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Container(
                                                                                          width: 200.0,
                                                                                          child: TextFormField(
                                                                                            controller: _model.txtbuscarCursoTextController,
                                                                                            focusNode: _model.txtbuscarCursoFocusNode,
                                                                                            onChanged: (_) => EasyDebounce.debounce(
                                                                                              '_model.txtbuscarCursoTextController',
                                                                                              Duration(milliseconds: 50),
                                                                                              () async {
                                                                                                await queryCoursesRecordOnce()
                                                                                                    .then(
                                                                                                      (records) => _model.simpleSearchResults3 = TextSearch(
                                                                                                        records
                                                                                                            .map(
                                                                                                              (record) => TextSearchItem.fromTerms(record, [record.name!]),
                                                                                                            )
                                                                                                            .toList(),
                                                                                                      ).search(_model.txtbuscarCursoTextController.text).map((r) => r.object).toList(),
                                                                                                    )
                                                                                                    .onError((_, __) => _model.simpleSearchResults3 = [])
                                                                                                    .whenComplete(() => safeSetState(() {}));
                                                                                              },
                                                                                            ),
                                                                                            autofocus: false,
                                                                                            obscureText: false,
                                                                                            decoration: InputDecoration(
                                                                                              isDense: true,
                                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                              enabledBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: Color(0xFFCED4DA),
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(3.2),
                                                                                              ),
                                                                                              focusedBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: Color(0xFFCED4DA),
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(3.2),
                                                                                              ),
                                                                                              errorBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(3.2),
                                                                                              ),
                                                                                              focusedErrorBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(3.2),
                                                                                              ),
                                                                                              filled: true,
                                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                ),
                                                                                            cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                            validator: _model.txtbuscarCursoTextControllerValidator.asValidator(context),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 10.0)),
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
                                                                                              child: CreateUpdateCoursesWidget(
                                                                                                set: false,
                                                                                                type: 1,
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                    text: 'Agregar',
                                                                                    options: FFButtonOptions(
                                                                                      height: 20.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
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
                                                                              ].divide(SizedBox(width: 10.0)),
                                                                            ),
                                                                            Expanded(
                                                                              child: StreamBuilder<List<CoursesRecord>>(
                                                                                stream: queryCoursesRecord(
                                                                                  queryBuilder: (coursesRecord) => coursesRecord
                                                                                      .where(
                                                                                        'course_type',
                                                                                        isEqualTo: 1,
                                                                                      )
                                                                                      .whereIn('Name', _model.simpleSearchResults3.map((e) => e.name).toList() != '' ? _model.simpleSearchResults3.map((e) => e.name).toList() : null)
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
                                                                                  List<CoursesRecord> containerCoursesRecordList = snapshot.data!;

                                                                                  return Container(
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Builder(
                                                                                      builder: (context) {
                                                                                        final listCourses = containerCoursesRecordList.toList();
                                                                                        if (listCourses.isEmpty) {
                                                                                          return Center(
                                                                                            child: EmptyCourseWidget(),
                                                                                          );
                                                                                        }

                                                                                        return FlutterFlowDataTable<CoursesRecord>(
                                                                                          controller: _model.paginatedDataTableController3,
                                                                                          data: listCourses,
                                                                                          columnsBuilder: (onSortChanged) => [
                                                                                            DataColumn2(
                                                                                              label: DefaultTextStyle.merge(
                                                                                                softWrap: true,
                                                                                                child: Text(
                                                                                                  'Fecha de creación',
                                                                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        color: Color(0xFF212529),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        lineHeight: 1.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            DataColumn2(
                                                                                              label: DefaultTextStyle.merge(
                                                                                                softWrap: true,
                                                                                                child: Text(
                                                                                                  'Nombre',
                                                                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        color: Color(0xFF212529),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        lineHeight: 1.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            DataColumn2(
                                                                                              label: DefaultTextStyle.merge(
                                                                                                softWrap: true,
                                                                                                child: Text(
                                                                                                  'Encargado',
                                                                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        color: Color(0xFF212529),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        lineHeight: 1.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            DataColumn2(
                                                                                              label: DefaultTextStyle.merge(
                                                                                                softWrap: true,
                                                                                                child: Text(
                                                                                                  'Categoria',
                                                                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        color: Color(0xFF212529),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        lineHeight: 1.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            DataColumn2(
                                                                                              label: DefaultTextStyle.merge(
                                                                                                softWrap: true,
                                                                                                child: Text(
                                                                                                  'Estado',
                                                                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        color: Color(0xFF212529),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        lineHeight: 1.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            DataColumn2(
                                                                                              label: DefaultTextStyle.merge(
                                                                                                softWrap: true,
                                                                                                child: Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'Grupo de Examenes',
                                                                                                    textAlign: TextAlign.center,
                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: Color(0xFF212529),
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          lineHeight: 1.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            DataColumn2(
                                                                                              label: DefaultTextStyle.merge(
                                                                                                softWrap: true,
                                                                                                child: Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'Acción',
                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: Color(0xFF212529),
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          lineHeight: 1.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                          dataRowBuilder: (listCoursesItem, listCoursesIndex, selected, onSelectChanged) => DataRow(
                                                                                            color: MaterialStateProperty.all(
                                                                                              listCoursesIndex % 2 == 0 ? Color(0xFFF6F6F6) : Colors.white,
                                                                                            ),
                                                                                            cells: [
                                                                                              Text(
                                                                                                valueOrDefault<String>(
                                                                                                  dateTimeFormat(
                                                                                                    "d/M/y",
                                                                                                    listCoursesItem.createdDate,
                                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                                  ),
                                                                                                  '--/--/----',
                                                                                                ),
                                                                                                maxLines: 1,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                              Text(
                                                                                                valueOrDefault<String>(
                                                                                                  listCoursesItem.name,
                                                                                                  '---',
                                                                                                ),
                                                                                                maxLines: 1,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                              StreamBuilder<List<UsersRecord>>(
                                                                                                stream: queryUsersRecord(
                                                                                                  queryBuilder: (usersRecord) => usersRecord.where(
                                                                                                    'uid',
                                                                                                    isEqualTo: listCoursesItem.uidTechear,
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
                                                                                                  final textUsersRecord = textUsersRecordList.isNotEmpty ? textUsersRecordList.first : null;

                                                                                                  return Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      textUsersRecord?.displayName,
                                                                                                      '--',
                                                                                                    ),
                                                                                                    maxLines: 1,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                              StreamBuilder<List<CategoryCoursesRecord>>(
                                                                                                stream: queryCategoryCoursesRecord(
                                                                                                  queryBuilder: (categoryCoursesRecord) => categoryCoursesRecord.where(
                                                                                                    'uid',
                                                                                                    isEqualTo: listCoursesItem.uidCategoryCourses,
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
                                                                                                  List<CategoryCoursesRecord> textCategoryCoursesRecordList = snapshot.data!;
                                                                                                  final textCategoryCoursesRecord = textCategoryCoursesRecordList.isNotEmpty ? textCategoryCoursesRecordList.first : null;

                                                                                                  return Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      textCategoryCoursesRecord?.name,
                                                                                                      '--',
                                                                                                    ),
                                                                                                    maxLines: 1,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                              InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  if (listCoursesItem.state) {
                                                                                                    await listCoursesItem.reference.update(createCoursesRecordData(
                                                                                                      state: false,
                                                                                                    ));
                                                                                                  } else {
                                                                                                    await listCoursesItem.reference.update(createCoursesRecordData(
                                                                                                      state: true,
                                                                                                    ));
                                                                                                  }

                                                                                                  await Future.delayed(const Duration(milliseconds: 1000));
                                                                                                },
                                                                                                child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    listCoursesItem.state ? 'Activo' : 'Inactivo',
                                                                                                    'Inactivo',
                                                                                                  ),
                                                                                                  maxLines: 1,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: FFButtonWidget(
                                                                                                  onPressed: () async {
                                                                                                    _model.refCourse = listCoursesItem.reference.id;
                                                                                                    safeSetState(() {});
                                                                                                  },
                                                                                                  text: 'Ver',
                                                                                                  options: FFButtonOptions(
                                                                                                    width: 74.0,
                                                                                                    height: 23.0,
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    color: Color(0xFF094B90),
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
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  Builder(
                                                                                                    builder: (context) => FlutterFlowIconButton(
                                                                                                      borderColor: Colors.transparent,
                                                                                                      borderRadius: 8.0,
                                                                                                      buttonSize: 46.0,
                                                                                                      icon: Icon(
                                                                                                        Icons.view_module,
                                                                                                        color: Color(0xFF707070),
                                                                                                        size: 13.5,
                                                                                                      ),
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
                                                                                                                child: MostarEleccionCursoWidget(
                                                                                                                  refCurse: listCoursesItem,
                                                                                                                ),
                                                                                                              ),
                                                                                                            );
                                                                                                          },
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  ),
                                                                                                  Builder(
                                                                                                    builder: (context) => FlutterFlowIconButton(
                                                                                                      borderColor: Colors.transparent,
                                                                                                      borderRadius: 8.0,
                                                                                                      buttonSize: 46.0,
                                                                                                      icon: Icon(
                                                                                                        Icons.edit,
                                                                                                        color: Color(0xFF707070),
                                                                                                        size: 13.5,
                                                                                                      ),
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
                                                                                                                child: CreateUpdateCoursesWidget(
                                                                                                                  refCourses: listCoursesItem,
                                                                                                                  set: false,
                                                                                                                  type: 1,
                                                                                                                ),
                                                                                                              ),
                                                                                                            );
                                                                                                          },
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  ),
                                                                                                  Builder(
                                                                                                    builder: (context) => FlutterFlowIconButton(
                                                                                                      borderColor: Colors.transparent,
                                                                                                      borderRadius: 8.0,
                                                                                                      buttonSize: 46.0,
                                                                                                      icon: FaIcon(
                                                                                                        FontAwesomeIcons.streetView,
                                                                                                        color: Color(0xFF707070),
                                                                                                        size: 13.5,
                                                                                                      ),
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
                                                                                                                child: ListaEstudiantesCoursesWidget(
                                                                                                                  refCourses: listCoursesItem,
                                                                                                                ),
                                                                                                              ),
                                                                                                            );
                                                                                                          },
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ].map((c) => DataCell(c)).toList(),
                                                                                          ),
                                                                                          emptyBuilder: () => Center(
                                                                                            child: EmptyCourseWidget(),
                                                                                          ),
                                                                                          paginated: true,
                                                                                          selectable: false,
                                                                                          hidePaginator: false,
                                                                                          showFirstLastButtons: true,
                                                                                          headingRowHeight: 56.0,
                                                                                          dataRowHeight: 48.0,
                                                                                          columnSpacing: 20.0,
                                                                                          headingRowColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                          addHorizontalDivider: true,
                                                                                          addTopAndBottomDivider: false,
                                                                                          hideDefaultHorizontalDivider: true,
                                                                                          horizontalDividerColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          horizontalDividerThickness: 1.0,
                                                                                          addVerticalDivider: false,
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 10.0)).addToStart(SizedBox(height: 10.0)),
                                                                        );
                                                                      }
                                                                    },
                                                                  ),
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                'Buscar:',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Container(
                                                                                  width: 200.0,
                                                                                  child: TextFormField(
                                                                                    controller: _model.txtbuscarEstudianteTextController,
                                                                                    focusNode: _model.txtbuscarEstudianteFocusNode,
                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                      '_model.txtbuscarEstudianteTextController',
                                                                                      Duration(milliseconds: 2000),
                                                                                      () async {
                                                                                        await queryUsersRecordOnce()
                                                                                            .then(
                                                                                              (records) => _model.simpleSearchResults4 = TextSearch(
                                                                                                records
                                                                                                    .map(
                                                                                                      (record) => TextSearchItem.fromTerms(record, [record.displayName!]),
                                                                                                    )
                                                                                                    .toList(),
                                                                                              ).search(_model.txtbuscarEstudianteTextController.text).map((r) => r.object).toList(),
                                                                                            )
                                                                                            .onError((_, __) => _model.simpleSearchResults4 = [])
                                                                                            .whenComplete(() => safeSetState(() {}));
                                                                                      },
                                                                                    ),
                                                                                    autofocus: false,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFFCED4DA),
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(3.2),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFFCED4DA),
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(3.2),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(3.2),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(3.2),
                                                                                      ),
                                                                                      filled: true,
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    validator: _model.txtbuscarEstudianteTextControllerValidator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 10.0)),
                                                                          ),
                                                                          Builder(
                                                                            builder: (context) =>
                                                                                FFButtonWidget(
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
                                                                                        child: CreateUpdateUsuarioWidget(),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                              text: 'Agregar',
                                                                              options: FFButtonOptions(
                                                                                height: 23.0,
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
                                                                      Flexible(
                                                                        child: StreamBuilder<
                                                                            List<UsersRecord>>(
                                                                          stream:
                                                                              queryUsersRecord(
                                                                            queryBuilder: (usersRecord) => usersRecord
                                                                                .where(
                                                                                  'userType',
                                                                                  isEqualTo: 2,
                                                                                )
                                                                                .whereIn('uid', _model.simpleSearchResults4.map((e) => e.displayName).toList() != '' ? _model.simpleSearchResults4.map((e) => e.displayName).toList() : null)
                                                                                .orderBy('created_time', descending: true),
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
                                                                            List<UsersRecord>
                                                                                containerUsersRecordList =
                                                                                snapshot.data!;

                                                                            return Container(
                                                                              width: double.infinity,
                                                                              height: 803.0,
                                                                              decoration: BoxDecoration(),
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  final listausuarios = containerUsersRecordList.toList();
                                                                                  if (listausuarios.isEmpty) {
                                                                                    return Center(
                                                                                      child: EmptyStudentWidget(),
                                                                                    );
                                                                                  }

                                                                                  return FlutterFlowDataTable<UsersRecord>(
                                                                                    controller: _model.paginatedDataTableController4,
                                                                                    data: listausuarios,
                                                                                    columnsBuilder: (onSortChanged) => [
                                                                                      DataColumn2(
                                                                                        label: DefaultTextStyle.merge(
                                                                                          softWrap: true,
                                                                                          child: Text(
                                                                                            'Fecha de creación',
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: Color(0xFF212529),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  lineHeight: 1.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      DataColumn2(
                                                                                        label: DefaultTextStyle.merge(
                                                                                          softWrap: true,
                                                                                          child: Text(
                                                                                            'Nombre y Apellido',
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: Color(0xFF212529),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  lineHeight: 1.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      DataColumn2(
                                                                                        label: DefaultTextStyle.merge(
                                                                                          softWrap: true,
                                                                                          child: Text(
                                                                                            'Correo',
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: Color(0xFF212529),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  lineHeight: 1.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      DataColumn2(
                                                                                        label: DefaultTextStyle.merge(
                                                                                          softWrap: true,
                                                                                          child: Text(
                                                                                            'Número',
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: Color(0xFF212529),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  lineHeight: 1.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      DataColumn2(
                                                                                        label: DefaultTextStyle.merge(
                                                                                          softWrap: true,
                                                                                          child: Text(
                                                                                            'Cursos',
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: Color(0xFF212529),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  lineHeight: 1.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      DataColumn2(
                                                                                        label: DefaultTextStyle.merge(
                                                                                          softWrap: true,
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Text(
                                                                                              'Acción',
                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: Color(0xFF212529),
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    lineHeight: 1.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                    dataRowBuilder: (listausuariosItem, listausuariosIndex, selected, onSelectChanged) => DataRow(
                                                                                      color: MaterialStateProperty.all(
                                                                                        listausuariosIndex % 2 == 0 ? Color(0xFFF6F6F6) : Colors.white,
                                                                                      ),
                                                                                      cells: [
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            dateTimeFormat(
                                                                                              "d/M/y",
                                                                                              listausuariosItem.createdTime,
                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                            ),
                                                                                            '--/--/----',
                                                                                          ),
                                                                                          maxLines: 1,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Poppins',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            listausuariosItem.displayName,
                                                                                            '---',
                                                                                          ),
                                                                                          maxLines: 1,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Poppins',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            listausuariosItem.email,
                                                                                            '---',
                                                                                          ),
                                                                                          maxLines: 1,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Poppins',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            listausuariosItem.phoneNumber,
                                                                                            '---',
                                                                                          ),
                                                                                          maxLines: 1,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Poppins',
                                                                                                letterSpacing: 0.0,
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
                                                                                                      child: ListaCursosEstudiantesWidget(
                                                                                                        user: listausuariosItem,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              );
                                                                                            },
                                                                                            text: 'Ver',
                                                                                            options: FFButtonOptions(
                                                                                              width: 74.0,
                                                                                              height: 23.0,
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                              color: Color(0xFF094B90),
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
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Builder(
                                                                                              builder: (context) => FlutterFlowIconButton(
                                                                                                borderColor: Colors.transparent,
                                                                                                borderRadius: 8.0,
                                                                                                buttonSize: 46.0,
                                                                                                icon: Icon(
                                                                                                  Icons.edit,
                                                                                                  color: Color(0xFF707070),
                                                                                                  size: 13.5,
                                                                                                ),
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
                                                                                                          child: CreateUpdateUsuarioWidget(
                                                                                                            refUser: listausuariosItem,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                            Builder(
                                                                                              builder: (context) => FlutterFlowIconButton(
                                                                                                borderColor: Colors.transparent,
                                                                                                borderRadius: 8.0,
                                                                                                buttonSize: 46.0,
                                                                                                icon: Icon(
                                                                                                  Icons.close,
                                                                                                  color: Color(0xFF707070),
                                                                                                  size: 13.5,
                                                                                                ),
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
                                                                                                          child: DeleteUsuarioWidget(
                                                                                                            refUser: listausuariosItem,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                            FlutterFlowIconButton(
                                                                                              borderColor: Colors.transparent,
                                                                                              borderRadius: 8.0,
                                                                                              buttonSize: 46.0,
                                                                                              icon: Icon(
                                                                                                Icons.info,
                                                                                                color: FlutterFlowTheme.of(context).accent1,
                                                                                                size: 13.5,
                                                                                              ),
                                                                                              onPressed: () {
                                                                                                print('IconButton pressed ...');
                                                                                              },
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].map((c) => DataCell(c)).toList(),
                                                                                    ),
                                                                                    emptyBuilder: () => Center(
                                                                                      child: EmptyStudentWidget(),
                                                                                    ),
                                                                                    paginated: true,
                                                                                    selectable: false,
                                                                                    hidePaginator: false,
                                                                                    showFirstLastButtons: true,
                                                                                    minWidth: 1500.0,
                                                                                    headingRowHeight: 56.0,
                                                                                    dataRowHeight: 48.0,
                                                                                    columnSpacing: 20.0,
                                                                                    headingRowColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    addHorizontalDivider: true,
                                                                                    addTopAndBottomDivider: false,
                                                                                    hideDefaultHorizontalDivider: true,
                                                                                    horizontalDividerColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    horizontalDividerThickness: 1.0,
                                                                                    addVerticalDivider: false,
                                                                                  );
                                                                                },
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ]
                                                                        .divide(SizedBox(
                                                                            height:
                                                                                10.0))
                                                                        .addToStart(SizedBox(
                                                                            height:
                                                                                10.0)),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 20.0)),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 50.0)),
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
