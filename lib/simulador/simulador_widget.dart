import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/empty_simulator/empty_simulator_widget.dart';
import '/pages/header/header_widget.dart';
import '/pages/header_mobil/header_mobil_widget.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';
import 'simulador_model.dart';
export 'simulador_model.dart';

class SimuladorWidget extends StatefulWidget {
  const SimuladorWidget({super.key});

  static String routeName = 'Simulador';
  static String routePath = 'simulador';

  @override
  State<SimuladorWidget> createState() => _SimuladorWidgetState();
}

class _SimuladorWidgetState extends State<SimuladorWidget> {
  late SimuladorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SimuladorModel());

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
                            state: 2,
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
                            color: FlutterFlowTheme.of(context).secondary,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                40.0, 10.0, 40.0, 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          'Simulador',
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
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'En este apartado encontrarás los simuladores ordenados para que te resulte lo más sencillo de seguir. ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.montserrat(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 12.0,
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
                                  ].divide(SizedBox(height: 10.0)),
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
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                ))
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
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
                                                                  fontSize:
                                                                      14.0,
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
                                                                height: 35.0,
                                                                maxHeight:
                                                                    300.0,
                                                                searchHintTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.montserrat(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                searchTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.montserrat(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                textStyle: FlutterFlowTheme.of(
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          14.0,
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
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFF454545),
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        hoverColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                        hoverBorderSide:
                                                            BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        hoverTextColor:
                                                            Color(0xFF454545),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 10.0)),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 200.0,
                                                    child: TextFormField(
                                                      controller:
                                                          _model.textController,
                                                      focusNode: _model
                                                          .textFieldFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.textController',
                                                        Duration(
                                                            milliseconds: 2000),
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
                                                                        .map((r) =>
                                                                            r.object)
                                                                        .take(29)
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
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        hintText:
                                                            'Buscar mis simuladores',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
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
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .textControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderRadius: 10.0,
                                                    buttonSize: 36.0,
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
                                                      size: 20.0,
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
                                            ].divide(SizedBox(width: 10.0)),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                                            'course_type',
                                                            isEqualTo: 2,
                                                          )
                                                          .where(
                                                            'State',
                                                            isEqualTo: true,
                                                          )
                                                          .whereIn('uid',
                                                              _model.uidsCourse)
                                                          .where(
                                                            'uid_CategoryCourses',
                                                            isEqualTo: _model
                                                                .courseCategory,
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
                                                  List<CoursesRecord>
                                                      wrapCoursesRecordList =
                                                      snapshot.data!;
                                                  if (wrapCoursesRecordList
                                                      .isEmpty) {
                                                    return Center(
                                                      child: Container(
                                                        height: 250.0,
                                                        child:
                                                            EmptySimulatorWidget(),
                                                      ),
                                                    );
                                                  }

                                                  return Wrap(
                                                    spacing: 20.0,
                                                    runSpacing: 20.0,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                    direction: Axis.horizontal,
                                                    runAlignment:
                                                        WrapAlignment.start,
                                                    verticalDirection:
                                                        VerticalDirection.down,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    children: List.generate(
                                                        wrapCoursesRecordList
                                                            .length,
                                                        (wrapIndex) {
                                                      final wrapCoursesRecord =
                                                          wrapCoursesRecordList[
                                                              wrapIndex];
                                                      return Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 1.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    20.0),
                                                            child: Row(
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
                                                                              8.0),
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
                                                                        wrapCoursesRecord
                                                                            .imageCourse,
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.2,
                                                                    height:
                                                                        200.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    errorWidget: (context,
                                                                            error,
                                                                            stackTrace) =>
                                                                        Image
                                                                            .asset(
                                                                      'assets/images/error_image.png',
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.2,
                                                                      height:
                                                                          200.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Flexible(
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
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
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Flexible(
                                                                                  child: Text(
                                                                                    wrapCoursesRecord.name,
                                                                                    maxLines: 2,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.montserrat(
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          fontSize: 24.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                RichText(
                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                  text: TextSpan(
                                                                                    children: [
                                                                                      TextSpan(
                                                                                        text: 'S/. ',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.montserrat(
                                                                                                fontWeight: FontWeight.bold,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 18.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: valueOrDefault<String>(
                                                                                          wrapCoursesRecord.price,
                                                                                          '0',
                                                                                        ),
                                                                                        style: TextStyle(),
                                                                                      )
                                                                                    ],
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.montserrat(
                                                                                            fontWeight: FontWeight.bold,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          fontSize: 18.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 10.0)),
                                                                            ),
                                                                            StreamBuilder<List<ExamenesRecord>>(
                                                                              stream: queryExamenesRecord(
                                                                                queryBuilder: (examenesRecord) => examenesRecord.where(
                                                                                  'uid_Course',
                                                                                  isEqualTo: wrapCoursesRecord.reference.id,
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
                                                                                List<ExamenesRecord> containerExamenesRecordList = snapshot.data!;

                                                                                return Container(
                                                                                  decoration: BoxDecoration(),
                                                                                  child: StreamBuilder<List<PreguntasRecord>>(
                                                                                    stream: queryPreguntasRecord(
                                                                                      queryBuilder: (preguntasRecord) => preguntasRecord.whereIn('examen_ref', containerExamenesRecordList.map((e) => e.reference.id).toList()),
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
                                                                                              text: valueOrDefault<String>(
                                                                                                richTextPreguntasRecordList.length.toString(),
                                                                                                '0',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.montserrat(
                                                                                                      fontWeight: FontWeight.w300,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 18.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w300,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: ' ',
                                                                                              style: TextStyle(),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: valueOrDefault<String>(
                                                                                                valueOrDefault<int>(
                                                                                                          richTextPreguntasRecordList.length,
                                                                                                          0,
                                                                                                        ) >
                                                                                                        1
                                                                                                    ? 'preguntas'
                                                                                                    : 'pregunta',
                                                                                                'pregunta',
                                                                                              ),
                                                                                              style: TextStyle(),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: ' y ',
                                                                                              style: TextStyle(),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: valueOrDefault<String>(
                                                                                                containerExamenesRecordList.length.toString(),
                                                                                                '0',
                                                                                              ),
                                                                                              style: TextStyle(),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: ' ',
                                                                                              style: TextStyle(),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: valueOrDefault<String>(
                                                                                                containerExamenesRecordList.length > 1 ? 'examenes' : 'examen',
                                                                                                'examen',
                                                                                              ),
                                                                                              style: TextStyle(),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: ' de practicas para el examen de certificación',
                                                                                              style: TextStyle(),
                                                                                            )
                                                                                          ],
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.montserrat(
                                                                                                  fontWeight: FontWeight.w300,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                fontSize: 18.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w300,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ].divide(SizedBox(height: 10.0)),
                                                                        ),
                                                                        FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            context.pushNamed(
                                                                              SimulatorWidget.routeName,
                                                                              queryParameters: {
                                                                                'refCourse': serializeParam(
                                                                                  wrapCoursesRecord,
                                                                                  ParamType.Document,
                                                                                ),
                                                                              }.withoutNulls,
                                                                              extra: <String, dynamic>{
                                                                                'refCourse': wrapCoursesRecord,
                                                                                kTransitionInfoKey: TransitionInfo(
                                                                                  hasTransition: true,
                                                                                  transitionType: PageTransitionType.fade,
                                                                                  duration: Duration(milliseconds: 0),
                                                                                ),
                                                                              },
                                                                            );
                                                                          },
                                                                          text:
                                                                              'Conoce más',
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                50.0,
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
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  font: GoogleFonts.montserrat(
                                                                                    fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                  ),
                                                                                  color: Colors.white,
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                ),
                                                                            elevation:
                                                                                0.0,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 10.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 20.0)),
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
                                if (responsiveVisibility(
                                  context: context,
                                  tablet: false,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Container(
                                    constraints: BoxConstraints(
                                      minHeight: 700.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: StreamBuilder<
                                                List<CoursesRecord>>(
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
                                                        .whereIn(
                                                            'uid',
                                                            _model.uidsCourse !=
                                                                    ''
                                                                ? _model
                                                                    .uidsCourse
                                                                : null)
                                                        .where(
                                                          'uid_CategoryCourses',
                                                          isEqualTo: _model
                                                                      .courseCategory !=
                                                                  ''
                                                              ? _model
                                                                  .courseCategory
                                                              : null,
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
                                                List<CoursesRecord>
                                                    wrapCoursesRecordList =
                                                    snapshot.data!;
                                                if (wrapCoursesRecordList
                                                    .isEmpty) {
                                                  return Center(
                                                    child: Container(
                                                      height: 250.0,
                                                      child:
                                                          EmptySimulatorWidget(),
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
                                                    return Material(
                                                      color: Colors.transparent,
                                                      elevation: 1.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  20.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
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
                                                                      wrapCoursesRecord
                                                                          .imageCourse,
                                                                  width: 100.0,
                                                                  height: 100.0,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                  errorWidget: (context,
                                                                          error,
                                                                          stackTrace) =>
                                                                      Image
                                                                          .asset(
                                                                    'assets/images/error_image.png',
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        100.0,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                  ),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children:
                                                                                [
                                                                              Flexible(
                                                                                child: Text(
                                                                                  wrapCoursesRecord.name,
                                                                                  maxLines: 2,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.montserrat(
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: 'S/. ',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.montserrat(
                                                                                              fontWeight: FontWeight.bold,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: valueOrDefault<String>(
                                                                                        wrapCoursesRecord.price,
                                                                                        '0',
                                                                                      ),
                                                                                      style: TextStyle(),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.montserrat(
                                                                                          fontWeight: FontWeight.bold,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 10.0)),
                                                                          ),
                                                                          StreamBuilder<
                                                                              List<ExamenesRecord>>(
                                                                            stream:
                                                                                queryExamenesRecord(
                                                                              queryBuilder: (examenesRecord) => examenesRecord.where(
                                                                                'uid_Course',
                                                                                isEqualTo: wrapCoursesRecord.reference.id,
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
                                                                              List<ExamenesRecord> containerExamenesRecordList = snapshot.data!;

                                                                              return Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: StreamBuilder<List<PreguntasRecord>>(
                                                                                  stream: queryPreguntasRecord(
                                                                                    queryBuilder: (preguntasRecord) => preguntasRecord.whereIn('examen_ref', containerExamenesRecordList.map((e) => e.reference.id).toList()),
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
                                                                                            text: valueOrDefault<String>(
                                                                                              richTextPreguntasRecordList.length.toString(),
                                                                                              '0',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.montserrat(
                                                                                                    fontWeight: FontWeight.w300,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w300,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: ' ',
                                                                                            style: TextStyle(),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: valueOrDefault<String>(
                                                                                              valueOrDefault<int>(
                                                                                                        richTextPreguntasRecordList.length,
                                                                                                        0,
                                                                                                      ) >
                                                                                                      1
                                                                                                  ? 'preguntas'
                                                                                                  : 'pregunta',
                                                                                              'pregunta',
                                                                                            ),
                                                                                            style: TextStyle(),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: ' y ',
                                                                                            style: TextStyle(),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: valueOrDefault<String>(
                                                                                              containerExamenesRecordList.length.toString(),
                                                                                              '0',
                                                                                            ),
                                                                                            style: TextStyle(),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: ' ',
                                                                                            style: TextStyle(),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: valueOrDefault<String>(
                                                                                              containerExamenesRecordList.length > 1 ? 'examenes' : 'examen',
                                                                                              'examen',
                                                                                            ),
                                                                                            style: TextStyle(),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: ' de practicas para el examen de certificación',
                                                                                            style: TextStyle(),
                                                                                          )
                                                                                        ],
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.montserrat(
                                                                                                fontWeight: FontWeight.w300,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w300,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ].divide(SizedBox(height: 10.0)),
                                                                      ),
                                                                      FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          context
                                                                              .pushNamed(
                                                                            SimulatorWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'refCourse': serializeParam(
                                                                                wrapCoursesRecord,
                                                                                ParamType.Document,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              'refCourse': wrapCoursesRecord,
                                                                              kTransitionInfoKey: TransitionInfo(
                                                                                hasTransition: true,
                                                                                transitionType: PageTransitionType.fade,
                                                                                duration: Duration(milliseconds: 0),
                                                                              ),
                                                                            },
                                                                          );
                                                                        },
                                                                        text:
                                                                            'Conoce más',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              30.0,
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
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
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
                                                                          elevation:
                                                                              0.0,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            10.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 20.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          ),
                                        ]
                                            .divide(SizedBox(height: 20.0))
                                            .around(SizedBox(height: 20.0)),
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
          ),
        ));
  }
}
