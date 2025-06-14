import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/create_update_blogs/create_update_blogs_widget.dart';
import '/pages/create_update_category/create_update_category_widget.dart';
import '/pages/create_update_category_examen/create_update_category_examen_widget.dart';
import '/pages/create_update_courses/create_update_courses_widget.dart';
import '/pages/create_update_examen/create_update_examen_widget.dart';
import '/pages/create_update_usuario/create_update_usuario_widget.dart';
import '/pages/delete_usuario/delete_usuario_widget.dart';
import '/pages/empty_course/empty_course_widget.dart';
import '/pages/empty_student/empty_student_widget.dart';
import '/pages/empty_users/empty_users_widget.dart';
import '/pages/header/header_widget.dart';
import '/pages/lista_cursos_estudiantes/lista_cursos_estudiantes_widget.dart';
import '/pages/lista_estudiantes_courses/lista_estudiantes_courses_widget.dart';
import '/pages/lista_estudiantes_examen/lista_estudiantes_examen_widget.dart';
import '/pages/lista_preguntas_examen/lista_preguntas_examen_widget.dart';
import '/pages/mostar_eleccion_curso/mostar_eleccion_curso_widget.dart';
import '/pages/navbar/navbar_widget.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';
import 'administration_model.dart';
export 'administration_model.dart';

class AdministrationWidget extends StatefulWidget {
  const AdministrationWidget({super.key});

  static String routeName = 'Administration';
  static String routePath = 'administration';

  @override
  State<AdministrationWidget> createState() => _AdministrationWidgetState();
}

class _AdministrationWidgetState extends State<AdministrationWidget>
    with TickerProviderStateMixin {
  late AdministrationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdministrationModel());

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
      await Future.delayed(const Duration(milliseconds: 1000));
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 6,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.txtbuscarUsuarioTextController ??= TextEditingController();
    _model.txtbuscarUsuarioFocusNode ??= FocusNode();

    _model.txtbuscarExamenTextController1 ??= TextEditingController();
    _model.txtbuscarExamenFocusNode1 ??= FocusNode();

    _model.txtbuscarExamenTextController2 ??= TextEditingController();
    _model.txtbuscarExamenFocusNode2 ??= FocusNode();

    _model.txtbuscarCursoTextController1 ??= TextEditingController();
    _model.txtbuscarCursoFocusNode1 ??= FocusNode();

    _model.txtbuscarEstudianteTextController ??= TextEditingController();
    _model.txtbuscarEstudianteFocusNode ??= FocusNode();

    _model.txtbuscarCategoriaTextController ??= TextEditingController();
    _model.txtbuscarCategoriaFocusNode ??= FocusNode();

    _model.txtbuscarExamenTextController3 ??= TextEditingController();
    _model.txtbuscarExamenFocusNode3 ??= FocusNode();

    _model.txtbuscarExamenTextController4 ??= TextEditingController();
    _model.txtbuscarExamenFocusNode4 ??= FocusNode();

    _model.txtbuscarCursoTextController2 ??= TextEditingController();
    _model.txtbuscarCursoFocusNode2 ??= FocusNode();

    _model.txtbuscarBlogsTextController ??= TextEditingController();
    _model.txtbuscarBlogsFocusNode ??= FocusNode();

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
                                        state: 1,
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
                                                                  color: Color(
                                                                      0xFF01203F),
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
                                                        'La administración de la página de cursos se encarga de gestionar los diferentes cursos ofrecidos, organizando los contenidos y evaluaciones que forman parte del proceso de aprendizaje y certificación.',
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
                                                                  color: Color(
                                                                      0xFF979797),
                                                                  fontSize:
                                                                      12.0,
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
                                                      Flexible(
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
                                                                      font: GoogleFonts
                                                                          .glory(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .fontStyle,
                                                                    ),
                                                                unselectedLabelStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.glory(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                          ),
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .fontStyle,
                                                                        ),
                                                                indicatorColor:
                                                                    Color(
                                                                        0xFF094B90),
                                                                tabs: [
                                                                  Tab(
                                                                    text:
                                                                        'Usuarios',
                                                                  ),
                                                                  Tab(
                                                                    text:
                                                                        'Cursos',
                                                                  ),
                                                                  Tab(
                                                                    text:
                                                                        'Estudiantes',
                                                                  ),
                                                                  Tab(
                                                                    text:
                                                                        'Áreas de Estudio',
                                                                  ),
                                                                  Tab(
                                                                    text:
                                                                        'Simuladores',
                                                                  ),
                                                                  Tab(
                                                                    text:
                                                                        'Blogs',
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
                                                                                      font: GoogleFonts.montserrat(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                              Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Container(
                                                                                  width: 200.0,
                                                                                  child: TextFormField(
                                                                                    controller: _model.txtbuscarUsuarioTextController,
                                                                                    focusNode: _model.txtbuscarUsuarioFocusNode,
                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                      '_model.txtbuscarUsuarioTextController',
                                                                                      Duration(milliseconds: 1000),
                                                                                      () async {
                                                                                        await queryUsersRecordOnce()
                                                                                            .then(
                                                                                              (records) => _model.simpleSearchResults1 = TextSearch(
                                                                                                records
                                                                                                    .map(
                                                                                                      (record) => TextSearchItem.fromTerms(record, [record.displayName]),
                                                                                                    )
                                                                                                    .toList(),
                                                                                              ).search(_model.txtbuscarUsuarioTextController.text).map((r) => r.object).toList(),
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
                                                                                            font: GoogleFonts.montserrat(
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                          ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            font: GoogleFonts.montserrat(
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
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
                                                                                          font: GoogleFonts.montserrat(
                                                                                            fontWeight: FontWeight.normal,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    validator: _model.txtbuscarUsuarioTextControllerValidator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 10.0)),
                                                                          ),
                                                                          Builder(
                                                                            builder: (context) =>
                                                                                FFButtonWidget(
                                                                              onPressed: () async {
                                                                                if (valueOrDefault(currentUserDocument?.userType, 0) == 0) {
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
                                                                                } else {
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
                                                                              },
                                                                              text: 'Agregar',
                                                                              options: FFButtonOptions(
                                                                                height: 23.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      font: GoogleFonts.montserrat(
                                                                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
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
                                                                              _model.usuarios(
                                                                            requestFn: () =>
                                                                                queryUsersRecord(
                                                                              queryBuilder: (usersRecord) => usersRecord.whereIn('display_name', _model.simpleSearchResults1.map((e) => e.displayName).toList() != '' ? _model.simpleSearchResults1.map((e) => e.displayName).toList() : null).orderBy('created_time', descending: true),
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
                                                                            List<UsersRecord>
                                                                                containerUsersRecordList =
                                                                                snapshot.data!.where((u) => u.uid != currentUserUid).toList();

                                                                            return Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  final listausuarios = containerUsersRecordList.toList();
                                                                                  if (listausuarios.isEmpty) {
                                                                                    return Center(
                                                                                      child: EmptyUsersWidget(),
                                                                                    );
                                                                                  }

                                                                                  return FlutterFlowDataTable<UsersRecord>(
                                                                                    controller: _model.paginatedDataTableController1,
                                                                                    data: listausuarios,
                                                                                    columnsBuilder: (onSortChanged) => [
                                                                                      DataColumn2(
                                                                                        label: DefaultTextStyle.merge(
                                                                                          softWrap: true,
                                                                                          child: Text(
                                                                                            'Fecha de creación',
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  font: GoogleFonts.montserrat(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  ),
                                                                                                  color: Color(0xFF212529),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  lineHeight: 1.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      DataColumn2(
                                                                                        label: DefaultTextStyle.merge(
                                                                                          softWrap: true,
                                                                                          child: Text(
                                                                                            'Código',
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  font: GoogleFonts.montserrat(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  ),
                                                                                                  color: Color(0xFF212529),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  lineHeight: 1.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      DataColumn2(
                                                                                        label: DefaultTextStyle.merge(
                                                                                          softWrap: true,
                                                                                          child: Text(
                                                                                            'Rol',
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  font: GoogleFonts.montserrat(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  ),
                                                                                                  color: Color(0xFF212529),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                  font: GoogleFonts.montserrat(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  ),
                                                                                                  color: Color(0xFF212529),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  lineHeight: 1.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      DataColumn2(
                                                                                        label: DefaultTextStyle.merge(
                                                                                          softWrap: true,
                                                                                          child: Text(
                                                                                            'Email',
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  font: GoogleFonts.montserrat(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  ),
                                                                                                  color: Color(0xFF212529),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                              'Estado',
                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                    font: GoogleFonts.montserrat(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                    ),
                                                                                                    color: Color(0xFF212529),
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                    font: GoogleFonts.montserrat(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                    ),
                                                                                                    color: Color(0xFF212529),
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                    lineHeight: 1.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                    dataRowBuilder: (listausuariosItem, listausuariosIndex, selected, onSelectChanged) => DataRow(
                                                                                      color: WidgetStateProperty.all(
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
                                                                                                font: GoogleFonts.montserrat(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            listausuariosItem.codigo,
                                                                                            '---',
                                                                                          ),
                                                                                          maxLines: 1,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.montserrat(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            () {
                                                                                              if (listausuariosItem.userType == 0) {
                                                                                                return 'Administrador';
                                                                                              } else if (listausuariosItem.userType == 1) {
                                                                                                return 'Docente';
                                                                                              } else if (listausuariosItem.userType == 2) {
                                                                                                return 'Estudiante';
                                                                                              } else {
                                                                                                return 'Estudiante';
                                                                                              }
                                                                                            }(),
                                                                                            '---',
                                                                                          ),
                                                                                          maxLines: 1,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.montserrat(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            listausuariosItem.displayName,
                                                                                            '---',
                                                                                          ),
                                                                                          maxLines: 1,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.montserrat(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            listausuariosItem.email,
                                                                                            '---',
                                                                                          ),
                                                                                          maxLines: 1,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.montserrat(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              if (listausuariosItem.state) {
                                                                                                await listausuariosItem.reference.update(createUsersRecordData(
                                                                                                  state: false,
                                                                                                ));
                                                                                              } else {
                                                                                                await listausuariosItem.reference.update(createUsersRecordData(
                                                                                                  state: true,
                                                                                                ));
                                                                                              }

                                                                                              await Future.delayed(const Duration(milliseconds: 1000));
                                                                                            },
                                                                                            child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                listausuariosItem.state ? 'Activo' : 'Inactivo',
                                                                                                'Activo',
                                                                                              ),
                                                                                              maxLines: 1,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.montserrat(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
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
                                                                                      child: EmptyUsersWidget(),
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
                                                                            if (_model.refCategoryExamen != null &&
                                                                                _model.refCategoryExamen != '') {
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
                                                                                                    font: GoogleFonts.montserrat(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                                            (records) => _model.simpleSearchResults2 = TextSearch(
                                                                                                              records
                                                                                                                  .map(
                                                                                                                    (record) => TextSearchItem.fromTerms(record, [record.nombre]),
                                                                                                                  )
                                                                                                                  .toList(),
                                                                                                            ).search(_model.txtbuscarExamenTextController1.text).map((r) => r.object).toList(),
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
                                                                                                          font: GoogleFonts.montserrat(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 13.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                        ),
                                                                                                    hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          font: GoogleFonts.montserrat(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 13.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
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
                                                                                                        font: GoogleFonts.montserrat(
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                                      font: GoogleFonts.montserrat(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                      ),
                                                                                                      color: Colors.white,
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                    ),
                                                                                                elevation: 0.0,
                                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          FFButtonWidget(
                                                                                            onPressed: () async {
                                                                                              _model.refCategoryExamen = null;
                                                                                              safeSetState(() {});
                                                                                            },
                                                                                            text: 'Volver',
                                                                                            options: FFButtonOptions(
                                                                                              height: 20.0,
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                    font: GoogleFonts.montserrat(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                    ),
                                                                                                    color: Colors.white,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
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
                                                                                              isEqualTo: _model.refCategoryExamen != '' ? _model.refCategoryExamen : null,
                                                                                            )
                                                                                            .whereIn('uid', _model.simpleSearchResults2.map((e) => e.uid).toList() != '' ? _model.simpleSearchResults2.map((e) => e.uid).toList() : null)
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
                                                                                                controller: _model.paginatedDataTableController2,
                                                                                                data: listExamenes,
                                                                                                columnsBuilder: (onSortChanged) => [
                                                                                                  DataColumn2(
                                                                                                    label: DefaultTextStyle.merge(
                                                                                                      softWrap: true,
                                                                                                      child: Text(
                                                                                                        'Fecha de creación',
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              font: GoogleFonts.montserrat(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                              ),
                                                                                                              color: Color(0xFF212529),
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                              font: GoogleFonts.montserrat(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                              ),
                                                                                                              color: Color(0xFF212529),
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                              font: GoogleFonts.montserrat(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                              ),
                                                                                                              color: Color(0xFF212529),
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                              font: GoogleFonts.montserrat(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                              ),
                                                                                                              color: Color(0xFF212529),
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                                font: GoogleFonts.montserrat(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                                ),
                                                                                                                color: Color(0xFF212529),
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                                lineHeight: 1.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                                dataRowBuilder: (listExamenesItem, listExamenesIndex, selected, onSelectChanged) => DataRow(
                                                                                                  color: WidgetStateProperty.all(
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
                                                                                                            font: GoogleFonts.montserrat(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        listExamenesItem.nombre,
                                                                                                        '---',
                                                                                                      ),
                                                                                                      maxLines: 1,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.montserrat(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                                                font: GoogleFonts.montserrat(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                                            font: GoogleFonts.montserrat(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                                                        refCategoryExamen: _model.refCategoryExamen!,
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
                                                                                                    font: GoogleFonts.montserrat(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                                            (records) => _model.simpleSearchResults3 = TextSearch(
                                                                                                              records
                                                                                                                  .map(
                                                                                                                    (record) => TextSearchItem.fromTerms(record, [record.name]),
                                                                                                                  )
                                                                                                                  .toList(),
                                                                                                            ).search(_model.txtbuscarExamenTextController2.text).map((r) => r.object).toList(),
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
                                                                                                          font: GoogleFonts.montserrat(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 13.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                        ),
                                                                                                    hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          font: GoogleFonts.montserrat(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 13.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
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
                                                                                                        font: GoogleFonts.montserrat(
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                                      font: GoogleFonts.montserrat(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                      ),
                                                                                                      color: Colors.white,
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
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
                                                                                                    font: GoogleFonts.montserrat(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                    ),
                                                                                                    color: Colors.white,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
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
                                                                                                controller: _model.paginatedDataTableController3,
                                                                                                data: listacategoriasexamen,
                                                                                                columnsBuilder: (onSortChanged) => [
                                                                                                  DataColumn2(
                                                                                                    label: DefaultTextStyle.merge(
                                                                                                      softWrap: true,
                                                                                                      child: Text(
                                                                                                        'Fecha de creación',
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              font: GoogleFonts.montserrat(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                              ),
                                                                                                              color: Color(0xFF212529),
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                              font: GoogleFonts.montserrat(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                              ),
                                                                                                              color: Color(0xFF212529),
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                              font: GoogleFonts.montserrat(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                              ),
                                                                                                              color: Color(0xFF212529),
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                                font: GoogleFonts.montserrat(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                                ),
                                                                                                                color: Color(0xFF212529),
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                                font: GoogleFonts.montserrat(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                                ),
                                                                                                                color: Color(0xFF212529),
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                                lineHeight: 1.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                                dataRowBuilder: (listacategoriasexamenItem, listacategoriasexamenIndex, selected, onSelectChanged) => DataRow(
                                                                                                  color: WidgetStateProperty.all(
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
                                                                                                            font: GoogleFonts.montserrat(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        listacategoriasexamenItem.name,
                                                                                                        '---',
                                                                                                      ),
                                                                                                      maxLines: 1,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.montserrat(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                                                font: GoogleFonts.montserrat(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: FFButtonWidget(
                                                                                                        onPressed: () async {
                                                                                                          _model.refCategoryExamen = listacategoriasexamenItem.reference.id;
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
                                                                                                                font: GoogleFonts.montserrat(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                                ),
                                                                                                                color: Colors.white,
                                                                                                                fontSize: 12.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
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
                                                                                              font: GoogleFonts.montserrat(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                      Container(
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Container(
                                                                                          width: 200.0,
                                                                                          child: TextFormField(
                                                                                            controller: _model.txtbuscarCursoTextController1,
                                                                                            focusNode: _model.txtbuscarCursoFocusNode1,
                                                                                            onChanged: (_) => EasyDebounce.debounce(
                                                                                              '_model.txtbuscarCursoTextController1',
                                                                                              Duration(milliseconds: 50),
                                                                                              () async {
                                                                                                await queryCoursesRecordOnce()
                                                                                                    .then(
                                                                                                      (records) => _model.simpleSearchResults4 = TextSearch(
                                                                                                        records
                                                                                                            .map(
                                                                                                              (record) => TextSearchItem.fromTerms(record, [record.name]),
                                                                                                            )
                                                                                                            .toList(),
                                                                                                      ).search(_model.txtbuscarCursoTextController1.text).map((r) => r.object).toList(),
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
                                                                                                    font: GoogleFonts.montserrat(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                  ),
                                                                                              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    font: GoogleFonts.montserrat(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
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
                                                                                                  font: GoogleFonts.montserrat(
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                            cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                            validator: _model.txtbuscarCursoTextController1Validator.asValidator(context),
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
                                                                                            font: GoogleFonts.montserrat(
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                            color: Colors.white,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
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
                                                                                      .whereIn('Name', _model.simpleSearchResults4.map((e) => e.name).toList() != '' ? _model.simpleSearchResults4.map((e) => e.name).toList() : null)
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
                                                                                          controller: _model.paginatedDataTableController4,
                                                                                          data: listCourses,
                                                                                          columnsBuilder: (onSortChanged) => [
                                                                                            DataColumn2(
                                                                                              label: DefaultTextStyle.merge(
                                                                                                softWrap: true,
                                                                                                child: Text(
                                                                                                  'Fecha de creación',
                                                                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                        font: GoogleFonts.montserrat(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                        ),
                                                                                                        color: Color(0xFF212529),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                        font: GoogleFonts.montserrat(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                        ),
                                                                                                        color: Color(0xFF212529),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                        font: GoogleFonts.montserrat(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                        ),
                                                                                                        color: Color(0xFF212529),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                        font: GoogleFonts.montserrat(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                        ),
                                                                                                        color: Color(0xFF212529),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                        font: GoogleFonts.montserrat(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                        ),
                                                                                                        color: Color(0xFF212529),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                          font: GoogleFonts.montserrat(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                          ),
                                                                                                          color: Color(0xFF212529),
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                          font: GoogleFonts.montserrat(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                          ),
                                                                                                          color: Color(0xFF212529),
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                          lineHeight: 1.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                          dataRowBuilder: (listCoursesItem, listCoursesIndex, selected, onSelectChanged) => DataRow(
                                                                                            color: WidgetStateProperty.all(
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
                                                                                                      font: GoogleFonts.montserrat(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                              Text(
                                                                                                valueOrDefault<String>(
                                                                                                  listCoursesItem.name,
                                                                                                  '---',
                                                                                                ),
                                                                                                maxLines: 1,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.montserrat(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                                          font: GoogleFonts.montserrat(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                                          font: GoogleFonts.montserrat(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                                        font: GoogleFonts.montserrat(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                                          font: GoogleFonts.montserrat(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                          ),
                                                                                                          color: Colors.white,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
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
                                                                                      font: GoogleFonts.montserrat(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                              (records) => _model.simpleSearchResults5 = TextSearch(
                                                                                                records
                                                                                                    .map(
                                                                                                      (record) => TextSearchItem.fromTerms(record, [record.displayName]),
                                                                                                    )
                                                                                                    .toList(),
                                                                                              ).search(_model.txtbuscarEstudianteTextController.text).map((r) => r.object).toList(),
                                                                                            )
                                                                                            .onError((_, __) => _model.simpleSearchResults5 = [])
                                                                                            .whenComplete(() => safeSetState(() {}));
                                                                                      },
                                                                                    ),
                                                                                    autofocus: false,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            font: GoogleFonts.montserrat(
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                          ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            font: GoogleFonts.montserrat(
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
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
                                                                                          font: GoogleFonts.montserrat(
                                                                                            fontWeight: FontWeight.normal,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                      font: GoogleFonts.montserrat(
                                                                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
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
                                                                                .whereIn('uid', _model.simpleSearchResults5.map((e) => e.displayName).toList() != '' ? _model.simpleSearchResults5.map((e) => e.displayName).toList() : null)
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
                                                                                    controller: _model.paginatedDataTableController5,
                                                                                    data: listausuarios,
                                                                                    columnsBuilder: (onSortChanged) => [
                                                                                      DataColumn2(
                                                                                        label: DefaultTextStyle.merge(
                                                                                          softWrap: true,
                                                                                          child: Text(
                                                                                            'Fecha de creación',
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  font: GoogleFonts.montserrat(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  ),
                                                                                                  color: Color(0xFF212529),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                  font: GoogleFonts.montserrat(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  ),
                                                                                                  color: Color(0xFF212529),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                  font: GoogleFonts.montserrat(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  ),
                                                                                                  color: Color(0xFF212529),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                  font: GoogleFonts.montserrat(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  ),
                                                                                                  color: Color(0xFF212529),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                  font: GoogleFonts.montserrat(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  ),
                                                                                                  color: Color(0xFF212529),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                    font: GoogleFonts.montserrat(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                    ),
                                                                                                    color: Color(0xFF212529),
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                    lineHeight: 1.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                    dataRowBuilder: (listausuariosItem, listausuariosIndex, selected, onSelectChanged) => DataRow(
                                                                                      color: WidgetStateProperty.all(
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
                                                                                                font: GoogleFonts.montserrat(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            listausuariosItem.displayName,
                                                                                            '---',
                                                                                          ),
                                                                                          maxLines: 1,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.montserrat(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            listausuariosItem.email,
                                                                                            '---',
                                                                                          ),
                                                                                          maxLines: 1,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.montserrat(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            listausuariosItem.phoneNumber,
                                                                                            '---',
                                                                                          ),
                                                                                          maxLines: 1,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.montserrat(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                                    font: GoogleFonts.montserrat(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                    ),
                                                                                                    color: Colors.white,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
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
                                                                                      font: GoogleFonts.montserrat(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                              Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Container(
                                                                                  width: 200.0,
                                                                                  child: TextFormField(
                                                                                    controller: _model.txtbuscarCategoriaTextController,
                                                                                    focusNode: _model.txtbuscarCategoriaFocusNode,
                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                      '_model.txtbuscarCategoriaTextController',
                                                                                      Duration(milliseconds: 2000),
                                                                                      () async {
                                                                                        await queryCategoryCoursesRecordOnce()
                                                                                            .then(
                                                                                              (records) => _model.simpleSearchResults6 = TextSearch(
                                                                                                records
                                                                                                    .map(
                                                                                                      (record) => TextSearchItem.fromTerms(record, [record.name]),
                                                                                                    )
                                                                                                    .toList(),
                                                                                              ).search(_model.txtbuscarCategoriaTextController.text).map((r) => r.object).toList(),
                                                                                            )
                                                                                            .onError((_, __) => _model.simpleSearchResults6 = [])
                                                                                            .whenComplete(() => safeSetState(() {}));
                                                                                      },
                                                                                    ),
                                                                                    autofocus: false,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            font: GoogleFonts.montserrat(
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                          ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            font: GoogleFonts.montserrat(
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
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
                                                                                          font: GoogleFonts.montserrat(
                                                                                            fontWeight: FontWeight.normal,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    validator: _model.txtbuscarCategoriaTextControllerValidator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 10.0)),
                                                                          ),
                                                                          Builder(
                                                                            builder: (context) =>
                                                                                FFButtonWidget(
                                                                              onPressed: () async {
                                                                                if (valueOrDefault(currentUserDocument?.userType, 0) == 0) {
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
                                                                                          child: CreateUpdateCategoryWidget(),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                } else {
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
                                                                              },
                                                                              text: 'Agregar',
                                                                              options: FFButtonOptions(
                                                                                height: 23.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      font: GoogleFonts.montserrat(
                                                                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
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
                                                                            List<CategoryCoursesRecord>>(
                                                                          stream:
                                                                              queryCategoryCoursesRecord(
                                                                            queryBuilder: (categoryCoursesRecord) =>
                                                                                categoryCoursesRecord.whereIn('Name', _model.simpleSearchResults6.map((e) => e.name).toList() != '' ? _model.simpleSearchResults6.map((e) => e.name).toList() : null).orderBy('Created_Date', descending: true),
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
                                                                            List<CategoryCoursesRecord>
                                                                                containerCategoryCoursesRecordList =
                                                                                snapshot.data!;

                                                                            return Container(
                                                                              width: double.infinity,
                                                                              height: 803.0,
                                                                              decoration: BoxDecoration(),
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  final listacategorias = containerCategoryCoursesRecordList.toList();
                                                                                  if (listacategorias.isEmpty) {
                                                                                    return Center(
                                                                                      child: EmptyStudentWidget(),
                                                                                    );
                                                                                  }

                                                                                  return FlutterFlowDataTable<CategoryCoursesRecord>(
                                                                                    controller: _model.paginatedDataTableController6,
                                                                                    data: listacategorias,
                                                                                    columnsBuilder: (onSortChanged) => [
                                                                                      DataColumn2(
                                                                                        label: DefaultTextStyle.merge(
                                                                                          softWrap: true,
                                                                                          child: Text(
                                                                                            'Fecha de creación',
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  font: GoogleFonts.montserrat(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  ),
                                                                                                  color: Color(0xFF212529),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                  font: GoogleFonts.montserrat(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  ),
                                                                                                  color: Color(0xFF212529),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  lineHeight: 1.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        fixedWidth: MediaQuery.sizeOf(context).width * 0.5,
                                                                                      ),
                                                                                      DataColumn2(
                                                                                        label: DefaultTextStyle.merge(
                                                                                          softWrap: true,
                                                                                          child: Text(
                                                                                            'Creado por',
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  font: GoogleFonts.montserrat(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  ),
                                                                                                  color: Color(0xFF212529),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                    font: GoogleFonts.montserrat(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                    ),
                                                                                                    color: Color(0xFF212529),
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                    lineHeight: 1.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                    dataRowBuilder: (listacategoriasItem, listacategoriasIndex, selected, onSelectChanged) => DataRow(
                                                                                      color: WidgetStateProperty.all(
                                                                                        listacategoriasIndex % 2 == 0 ? Color(0xFFF6F6F6) : Colors.white,
                                                                                      ),
                                                                                      cells: [
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            dateTimeFormat(
                                                                                              "d/M/y",
                                                                                              listacategoriasItem.createdDate,
                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                            ),
                                                                                            '--/--/----',
                                                                                          ),
                                                                                          maxLines: 1,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.montserrat(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            listacategoriasItem.name,
                                                                                            '---',
                                                                                          ),
                                                                                          maxLines: 1,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.montserrat(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                        StreamBuilder<List<UsersRecord>>(
                                                                                          stream: queryUsersRecord(
                                                                                            queryBuilder: (usersRecord) => usersRecord.where(
                                                                                              'uid',
                                                                                              isEqualTo: listacategoriasItem.createdBy,
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
                                                                                                    font: GoogleFonts.montserrat(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                            );
                                                                                          },
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
                                                                                                          child: CreateUpdateCategoryWidget(
                                                                                                            refCategory: listacategoriasItem,
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
                                                                                                _model.refCoursesCategory = await queryCoursesRecordOnce(
                                                                                                  queryBuilder: (coursesRecord) => coursesRecord.where(
                                                                                                    'uid_CategoryCourses',
                                                                                                    isEqualTo: listacategoriasItem.reference.id,
                                                                                                  ),
                                                                                                );
                                                                                                if (_model.refCoursesCategory != null && (_model.refCoursesCategory)!.isNotEmpty) {
                                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                                    SnackBar(
                                                                                                      content: Text(
                                                                                                        'Esta área de estudio está actualmente en uso por un curso',
                                                                                                        style: TextStyle(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        ),
                                                                                                      ),
                                                                                                      duration: Duration(milliseconds: 4000),
                                                                                                      backgroundColor: FlutterFlowTheme.of(context).warning,
                                                                                                    ),
                                                                                                  );
                                                                                                } else {
                                                                                                  await listacategoriasItem.reference.delete();
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
                                                                    ]
                                                                        .divide(SizedBox(
                                                                            height:
                                                                                10.0))
                                                                        .addToStart(SizedBox(
                                                                            height:
                                                                                10.0)),
                                                                  ),
                                                                  Builder(
                                                                    builder:
                                                                        (context) {
                                                                      if (_model.refCourseSimulator !=
                                                                              null &&
                                                                          _model.refCourseSimulator !=
                                                                              '') {
                                                                        return Builder(
                                                                          builder:
                                                                              (context) {
                                                                            if (_model.refCategoryExamenSimulator != null &&
                                                                                _model.refCategoryExamenSimulator != '') {
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
                                                                                                    font: GoogleFonts.montserrat(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                            Container(
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Container(
                                                                                                width: 200.0,
                                                                                                child: TextFormField(
                                                                                                  controller: _model.txtbuscarExamenTextController3,
                                                                                                  focusNode: _model.txtbuscarExamenFocusNode3,
                                                                                                  onChanged: (_) => EasyDebounce.debounce(
                                                                                                    '_model.txtbuscarExamenTextController3',
                                                                                                    Duration(milliseconds: 50),
                                                                                                    () async {
                                                                                                      await queryExamenesRecordOnce()
                                                                                                          .then(
                                                                                                            (records) => _model.simpleSearchResults7 = TextSearch(
                                                                                                              records
                                                                                                                  .map(
                                                                                                                    (record) => TextSearchItem.fromTerms(record, [record.nombre]),
                                                                                                                  )
                                                                                                                  .toList(),
                                                                                                            ).search(_model.txtbuscarExamenTextController3.text).map((r) => r.object).toList(),
                                                                                                          )
                                                                                                          .onError((_, __) => _model.simpleSearchResults7 = [])
                                                                                                          .whenComplete(() => safeSetState(() {}));
                                                                                                    },
                                                                                                  ),
                                                                                                  autofocus: false,
                                                                                                  obscureText: false,
                                                                                                  decoration: InputDecoration(
                                                                                                    isDense: true,
                                                                                                    labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          font: GoogleFonts.montserrat(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 13.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                        ),
                                                                                                    hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          font: GoogleFonts.montserrat(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 13.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
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
                                                                                                        font: GoogleFonts.montserrat(
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                  validator: _model.txtbuscarExamenTextController3Validator.asValidator(context),
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
                                                                                                          refCategoryExamen: _model.refCategoryExamenSimulator!,
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
                                                                                                      font: GoogleFonts.montserrat(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                      ),
                                                                                                      color: Colors.white,
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                    ),
                                                                                                elevation: 0.0,
                                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          FFButtonWidget(
                                                                                            onPressed: () async {
                                                                                              _model.refCategoryExamenSimulator = null;
                                                                                              safeSetState(() {});
                                                                                            },
                                                                                            text: 'Volver',
                                                                                            options: FFButtonOptions(
                                                                                              height: 20.0,
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                    font: GoogleFonts.montserrat(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                    ),
                                                                                                    color: Colors.white,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
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
                                                                                              isEqualTo: _model.refCategoryExamenSimulator != '' ? _model.refCategoryExamenSimulator : null,
                                                                                            )
                                                                                            .whereIn('uid', _model.simpleSearchResults9.map((e) => e.uid).toList() != '' ? _model.simpleSearchResults9.map((e) => e.uid).toList() : null)
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
                                                                                                controller: _model.paginatedDataTableController7,
                                                                                                data: listExamenes,
                                                                                                columnsBuilder: (onSortChanged) => [
                                                                                                  DataColumn2(
                                                                                                    label: DefaultTextStyle.merge(
                                                                                                      softWrap: true,
                                                                                                      child: Text(
                                                                                                        'Fecha de creación',
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              font: GoogleFonts.montserrat(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                              ),
                                                                                                              color: Color(0xFF212529),
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                              font: GoogleFonts.montserrat(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                              ),
                                                                                                              color: Color(0xFF212529),
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                              font: GoogleFonts.montserrat(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                              ),
                                                                                                              color: Color(0xFF212529),
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                              font: GoogleFonts.montserrat(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                              ),
                                                                                                              color: Color(0xFF212529),
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                                font: GoogleFonts.montserrat(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                                ),
                                                                                                                color: Color(0xFF212529),
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                                lineHeight: 1.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                                dataRowBuilder: (listExamenesItem, listExamenesIndex, selected, onSelectChanged) => DataRow(
                                                                                                  color: WidgetStateProperty.all(
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
                                                                                                            font: GoogleFonts.montserrat(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        listExamenesItem.nombre,
                                                                                                        '---',
                                                                                                      ),
                                                                                                      maxLines: 1,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.montserrat(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                                                font: GoogleFonts.montserrat(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                                            font: GoogleFonts.montserrat(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                                                        refCategoryExamen: _model.refCategoryExamenSimulator!,
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
                                                                                                    font: GoogleFonts.montserrat(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                            Container(
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Container(
                                                                                                width: 200.0,
                                                                                                child: TextFormField(
                                                                                                  controller: _model.txtbuscarExamenTextController4,
                                                                                                  focusNode: _model.txtbuscarExamenFocusNode4,
                                                                                                  onChanged: (_) => EasyDebounce.debounce(
                                                                                                    '_model.txtbuscarExamenTextController4',
                                                                                                    Duration(milliseconds: 50),
                                                                                                    () async {
                                                                                                      await queryExamGroupsRecordOnce()
                                                                                                          .then(
                                                                                                            (records) => _model.simpleSearchResults8 = TextSearch(
                                                                                                              records
                                                                                                                  .map(
                                                                                                                    (record) => TextSearchItem.fromTerms(record, [record.name]),
                                                                                                                  )
                                                                                                                  .toList(),
                                                                                                            ).search(_model.txtbuscarExamenTextController4.text).map((r) => r.object).toList(),
                                                                                                          )
                                                                                                          .onError((_, __) => _model.simpleSearchResults8 = [])
                                                                                                          .whenComplete(() => safeSetState(() {}));
                                                                                                    },
                                                                                                  ),
                                                                                                  autofocus: false,
                                                                                                  obscureText: false,
                                                                                                  decoration: InputDecoration(
                                                                                                    isDense: true,
                                                                                                    labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          font: GoogleFonts.montserrat(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 13.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                        ),
                                                                                                    hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          font: GoogleFonts.montserrat(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 13.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
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
                                                                                                        font: GoogleFonts.montserrat(
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                  validator: _model.txtbuscarExamenTextController4Validator.asValidator(context),
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
                                                                                                          refCourse: _model.refCourseSimulator!,
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
                                                                                                      font: GoogleFonts.montserrat(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                      ),
                                                                                                      color: Colors.white,
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                    ),
                                                                                                elevation: 0.0,
                                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          FFButtonWidget(
                                                                                            onPressed: () async {
                                                                                              _model.refCourseSimulator = null;
                                                                                              safeSetState(() {});
                                                                                            },
                                                                                            text: 'Volver',
                                                                                            options: FFButtonOptions(
                                                                                              height: 20.0,
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                    font: GoogleFonts.montserrat(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                    ),
                                                                                                    color: Colors.white,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
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
                                                                                              isEqualTo: _model.refCourseSimulator != '' ? _model.refCourseSimulator : null,
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
                                                                                                controller: _model.paginatedDataTableController8,
                                                                                                data: listacategoriasexamen,
                                                                                                columnsBuilder: (onSortChanged) => [
                                                                                                  DataColumn2(
                                                                                                    label: DefaultTextStyle.merge(
                                                                                                      softWrap: true,
                                                                                                      child: Text(
                                                                                                        'Fecha de creación',
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              font: GoogleFonts.montserrat(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                              ),
                                                                                                              color: Color(0xFF212529),
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                              font: GoogleFonts.montserrat(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                              ),
                                                                                                              color: Color(0xFF212529),
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                              font: GoogleFonts.montserrat(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                              ),
                                                                                                              color: Color(0xFF212529),
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                                font: GoogleFonts.montserrat(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                                ),
                                                                                                                color: Color(0xFF212529),
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                                font: GoogleFonts.montserrat(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                                ),
                                                                                                                color: Color(0xFF212529),
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                                lineHeight: 1.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                                dataRowBuilder: (listacategoriasexamenItem, listacategoriasexamenIndex, selected, onSelectChanged) => DataRow(
                                                                                                  color: WidgetStateProperty.all(
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
                                                                                                            font: GoogleFonts.montserrat(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        listacategoriasexamenItem.name,
                                                                                                        '---',
                                                                                                      ),
                                                                                                      maxLines: 1,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.montserrat(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                                                font: GoogleFonts.montserrat(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: FFButtonWidget(
                                                                                                        onPressed: () async {
                                                                                                          _model.refCategoryExamenSimulator = listacategoriasexamenItem.reference.id;
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
                                                                                                                font: GoogleFonts.montserrat(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                                ),
                                                                                                                color: Colors.white,
                                                                                                                fontSize: 12.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
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
                                                                                                                        refCourse: _model.refCourseSimulator!,
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
                                                                                                            _model.refCategorySimulator = await queryExamGroupsRecordOnce(
                                                                                                              queryBuilder: (examGroupsRecord) => examGroupsRecord.where(
                                                                                                                'uid_Course',
                                                                                                                isEqualTo: _model.refCourseSimulator,
                                                                                                              ),
                                                                                                            );
                                                                                                            if (_model.refCategorySimulator != null && (_model.refCategorySimulator)!.isNotEmpty) {
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
                                                                                              font: GoogleFonts.montserrat(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                      Container(
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Container(
                                                                                          width: 200.0,
                                                                                          child: TextFormField(
                                                                                            controller: _model.txtbuscarCursoTextController2,
                                                                                            focusNode: _model.txtbuscarCursoFocusNode2,
                                                                                            onChanged: (_) => EasyDebounce.debounce(
                                                                                              '_model.txtbuscarCursoTextController2',
                                                                                              Duration(milliseconds: 50),
                                                                                              () async {
                                                                                                await queryCoursesRecordOnce()
                                                                                                    .then(
                                                                                                      (records) => _model.simpleSearchResults9 = TextSearch(
                                                                                                        records
                                                                                                            .map(
                                                                                                              (record) => TextSearchItem.fromTerms(record, [record.name]),
                                                                                                            )
                                                                                                            .toList(),
                                                                                                      ).search(_model.txtbuscarCursoTextController2.text).map((r) => r.object).toList(),
                                                                                                    )
                                                                                                    .onError((_, __) => _model.simpleSearchResults9 = [])
                                                                                                    .whenComplete(() => safeSetState(() {}));
                                                                                              },
                                                                                            ),
                                                                                            autofocus: false,
                                                                                            obscureText: false,
                                                                                            decoration: InputDecoration(
                                                                                              isDense: true,
                                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    font: GoogleFonts.montserrat(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                  ),
                                                                                              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    font: GoogleFonts.montserrat(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
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
                                                                                                  font: GoogleFonts.montserrat(
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                            cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                            validator: _model.txtbuscarCursoTextController2Validator.asValidator(context),
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
                                                                                            font: GoogleFonts.montserrat(
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                            color: Colors.white,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
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
                                                                                        isEqualTo: 2,
                                                                                      )
                                                                                      .whereIn('uid', _model.simpleSearchResults9.map((e) => e.uid).toList() != '' ? _model.simpleSearchResults9.map((e) => e.uid).toList() : null)
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
                                                                                          controller: _model.paginatedDataTableController9,
                                                                                          data: listCourses,
                                                                                          columnsBuilder: (onSortChanged) => [
                                                                                            DataColumn2(
                                                                                              label: DefaultTextStyle.merge(
                                                                                                softWrap: true,
                                                                                                child: Text(
                                                                                                  'Fecha de creación',
                                                                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                        font: GoogleFonts.montserrat(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                        ),
                                                                                                        color: Color(0xFF212529),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                        font: GoogleFonts.montserrat(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                        ),
                                                                                                        color: Color(0xFF212529),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                        font: GoogleFonts.montserrat(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                        ),
                                                                                                        color: Color(0xFF212529),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                        font: GoogleFonts.montserrat(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                        ),
                                                                                                        color: Color(0xFF212529),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                        font: GoogleFonts.montserrat(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                        ),
                                                                                                        color: Color(0xFF212529),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                          font: GoogleFonts.montserrat(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                          ),
                                                                                                          color: Color(0xFF212529),
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                          font: GoogleFonts.montserrat(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                          ),
                                                                                                          color: Color(0xFF212529),
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                          lineHeight: 1.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              fixedWidth: MediaQuery.sizeOf(context).width * 0.15,
                                                                                            ),
                                                                                          ],
                                                                                          dataRowBuilder: (listCoursesItem, listCoursesIndex, selected, onSelectChanged) => DataRow(
                                                                                            color: WidgetStateProperty.all(
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
                                                                                                      font: GoogleFonts.montserrat(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                              Text(
                                                                                                valueOrDefault<String>(
                                                                                                  listCoursesItem.name,
                                                                                                  '---',
                                                                                                ),
                                                                                                maxLines: 1,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.montserrat(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                                          font: GoogleFonts.montserrat(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                                          font: GoogleFonts.montserrat(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                                        font: GoogleFonts.montserrat(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: FFButtonWidget(
                                                                                                  onPressed: () async {
                                                                                                    _model.refCourseSimulator = listCoursesItem.reference.id;
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
                                                                                                          font: GoogleFonts.montserrat(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                          ),
                                                                                                          color: Colors.white,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
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
                                                                                                  Builder(
                                                                                                    builder: (context) {
                                                                                                      if (listCoursesItem.set) {
                                                                                                        return FlutterFlowIconButton(
                                                                                                          borderColor: Colors.transparent,
                                                                                                          borderRadius: 8.0,
                                                                                                          buttonSize: 46.0,
                                                                                                          icon: Icon(
                                                                                                            Icons.star,
                                                                                                            color: Color(0xFF707070),
                                                                                                            size: 13.5,
                                                                                                          ),
                                                                                                          onPressed: () async {
                                                                                                            final firestoreBatch = FirebaseFirestore.instance.batch();
                                                                                                            try {
                                                                                                              if (listCoursesItem.set) {
                                                                                                                firestoreBatch.update(
                                                                                                                    listCoursesItem.reference,
                                                                                                                    createCoursesRecordData(
                                                                                                                      set: false,
                                                                                                                    ));
                                                                                                              } else {
                                                                                                                firestoreBatch.update(
                                                                                                                    listCoursesItem.reference,
                                                                                                                    createCoursesRecordData(
                                                                                                                      set: true,
                                                                                                                    ));
                                                                                                              }
                                                                                                            } finally {
                                                                                                              await firestoreBatch.commit();
                                                                                                            }
                                                                                                          },
                                                                                                        );
                                                                                                      } else {
                                                                                                        return FlutterFlowIconButton(
                                                                                                          borderColor: Colors.transparent,
                                                                                                          borderRadius: 8.0,
                                                                                                          buttonSize: 46.0,
                                                                                                          icon: Icon(
                                                                                                            Icons.star_border,
                                                                                                            color: Color(0xFF707070),
                                                                                                            size: 13.5,
                                                                                                          ),
                                                                                                          onPressed: () async {
                                                                                                            final firestoreBatch = FirebaseFirestore.instance.batch();
                                                                                                            try {
                                                                                                              if (listCoursesItem.set) {
                                                                                                                firestoreBatch.update(
                                                                                                                    listCoursesItem.reference,
                                                                                                                    createCoursesRecordData(
                                                                                                                      set: false,
                                                                                                                    ));
                                                                                                              } else {
                                                                                                                firestoreBatch.update(
                                                                                                                    listCoursesItem.reference,
                                                                                                                    createCoursesRecordData(
                                                                                                                      set: true,
                                                                                                                    ));
                                                                                                              }
                                                                                                            } finally {
                                                                                                              await firestoreBatch.commit();
                                                                                                            }
                                                                                                          },
                                                                                                        );
                                                                                                      }
                                                                                                    },
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
                                                                                          minWidth: 1400.0,
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
                                                                                      font: GoogleFonts.montserrat(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                              Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Container(
                                                                                  width: 200.0,
                                                                                  child: TextFormField(
                                                                                    controller: _model.txtbuscarBlogsTextController,
                                                                                    focusNode: _model.txtbuscarBlogsFocusNode,
                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                      '_model.txtbuscarBlogsTextController',
                                                                                      Duration(milliseconds: 2000),
                                                                                      () async {
                                                                                        await queryBlogsRecordOnce()
                                                                                            .then(
                                                                                              (records) => _model.simpleSearchResults10 = TextSearch(
                                                                                                records
                                                                                                    .map(
                                                                                                      (record) => TextSearchItem.fromTerms(record, [record.title]),
                                                                                                    )
                                                                                                    .toList(),
                                                                                              ).search(_model.txtbuscarBlogsTextController.text).map((r) => r.object).toList(),
                                                                                            )
                                                                                            .onError((_, __) => _model.simpleSearchResults10 = [])
                                                                                            .whenComplete(() => safeSetState(() {}));
                                                                                      },
                                                                                    ),
                                                                                    autofocus: false,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            font: GoogleFonts.montserrat(
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                          ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            font: GoogleFonts.montserrat(
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
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
                                                                                          font: GoogleFonts.montserrat(
                                                                                            fontWeight: FontWeight.normal,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    validator: _model.txtbuscarBlogsTextControllerValidator.asValidator(context),
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
                                                                                        child: CreateUpdateBlogsWidget(),
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
                                                                                      font: GoogleFonts.montserrat(
                                                                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
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
                                                                            List<BlogsRecord>>(
                                                                          stream:
                                                                              queryBlogsRecord(
                                                                            queryBuilder: (blogsRecord) =>
                                                                                blogsRecord.whereIn('uid', _model.simpleSearchResults10.map((e) => e.uid).toList() != '' ? _model.simpleSearchResults10.map((e) => e.uid).toList() : null).orderBy('created_time', descending: true),
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
                                                                            List<BlogsRecord>
                                                                                containerBlogsRecordList =
                                                                                snapshot.data!;

                                                                            return Container(
                                                                              width: double.infinity,
                                                                              height: 803.0,
                                                                              decoration: BoxDecoration(),
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  final listacategorias = containerBlogsRecordList.toList();
                                                                                  if (listacategorias.isEmpty) {
                                                                                    return Center(
                                                                                      child: EmptyStudentWidget(),
                                                                                    );
                                                                                  }

                                                                                  return FlutterFlowDataTable<BlogsRecord>(
                                                                                    controller: _model.paginatedDataTableController10,
                                                                                    data: listacategorias,
                                                                                    columnsBuilder: (onSortChanged) => [
                                                                                      DataColumn2(
                                                                                        label: DefaultTextStyle.merge(
                                                                                          softWrap: true,
                                                                                          child: Text(
                                                                                            'Fecha de creación',
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  font: GoogleFonts.montserrat(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  ),
                                                                                                  color: Color(0xFF212529),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                  font: GoogleFonts.montserrat(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  ),
                                                                                                  color: Color(0xFF212529),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  lineHeight: 1.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        fixedWidth: MediaQuery.sizeOf(context).width * 0.5,
                                                                                      ),
                                                                                      DataColumn2(
                                                                                        label: DefaultTextStyle.merge(
                                                                                          softWrap: true,
                                                                                          child: Text(
                                                                                            'Creado por',
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  font: GoogleFonts.montserrat(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  ),
                                                                                                  color: Color(0xFF212529),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
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
                                                                                                    font: GoogleFonts.montserrat(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                    ),
                                                                                                    color: Color(0xFF212529),
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                    lineHeight: 1.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                    dataRowBuilder: (listacategoriasItem, listacategoriasIndex, selected, onSelectChanged) => DataRow(
                                                                                      color: WidgetStateProperty.all(
                                                                                        listacategoriasIndex % 2 == 0 ? Color(0xFFF6F6F6) : Colors.white,
                                                                                      ),
                                                                                      cells: [
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            dateTimeFormat(
                                                                                              "d/M/y",
                                                                                              listacategoriasItem.createdTime,
                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                            ),
                                                                                            '--/--/----',
                                                                                          ),
                                                                                          maxLines: 1,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.montserrat(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            listacategoriasItem.title,
                                                                                            '---',
                                                                                          ),
                                                                                          maxLines: 1,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.montserrat(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                        StreamBuilder<List<UsersRecord>>(
                                                                                          stream: queryUsersRecord(
                                                                                            queryBuilder: (usersRecord) => usersRecord.where(
                                                                                              'uid',
                                                                                              isEqualTo: listacategoriasItem.createdBy,
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
                                                                                                    font: GoogleFonts.montserrat(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                            );
                                                                                          },
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
                                                                                                          child: CreateUpdateBlogsWidget(
                                                                                                            refBlog: listacategoriasItem,
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
                                                                                                if (listacategoriasItem.type == 'image') {
                                                                                                  await FirebaseStorage.instance.refFromURL(listacategoriasItem.url).delete();
                                                                                                }
                                                                                                await listacategoriasItem.reference.delete();
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
