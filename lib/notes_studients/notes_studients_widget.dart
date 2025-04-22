import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/empty_notes/empty_notes_widget.dart';
import '/pages/footer/footer_widget.dart';
import '/pages/header/header_widget.dart';
import '/pages/header_mobil/header_mobil_widget.dart';
import 'package:flutter/material.dart';
import 'notes_studients_model.dart';
export 'notes_studients_model.dart';

/// spelling correct
class NotesStudientsWidget extends StatefulWidget {
  const NotesStudientsWidget({super.key});

  static String routeName = 'NotesStudients';
  static String routePath = 'notesStudients';

  @override
  State<NotesStudientsWidget> createState() => _NotesStudientsWidgetState();
}

class _NotesStudientsWidgetState extends State<NotesStudientsWidget> {
  late NotesStudientsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotesStudientsModel());

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
                          child: HeaderWidget(
                            state: 3,
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                    child: SingleChildScrollView(
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
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.6,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x3F000000),
                                          offset: Offset(
                                            0.0,
                                            4.0,
                                          ),
                                          spreadRadius: 0.0,
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              RichText(
                                                textScaler:
                                                    MediaQuery.of(context)
                                                        .textScaler,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Registro de Notas',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: Color(
                                                                0xFF003366),
                                                            fontSize: 24.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            Color(0xFF003366),
                                                        fontSize: 40.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Container(
                                                width: 68.5,
                                                height: 3.0,
                                                decoration: BoxDecoration(
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
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                                          'Examen',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFF17232B),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                        Container(
                                                          child: StreamBuilder<
                                                              List<
                                                                  ExamenesRecord>>(
                                                            stream:
                                                                queryExamenesRecord(
                                                              queryBuilder: (examenesRecord) =>
                                                                  examenesRecord.orderBy(
                                                                      'fecha_creacion',
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
                                                              List<ExamenesRecord>
                                                                  cboExamenesExamenesRecordList =
                                                                  snapshot
                                                                      .data!;

                                                              return FlutterFlowDropDown<
                                                                  String>(
                                                                controller: _model
                                                                        .cboExamenesValueController ??=
                                                                    FormFieldController<
                                                                            String>(
                                                                        null),
                                                                options: List<
                                                                        String>.from(
                                                                    cboExamenesExamenesRecordList
                                                                        .map((e) => e
                                                                            .reference
                                                                            .id)
                                                                        .toList()),
                                                                optionLabels:
                                                                    cboExamenesExamenesRecordList
                                                                        .map((e) =>
                                                                            valueOrDefault<String>(
                                                                              e.nombre,
                                                                              '--',
                                                                            ))
                                                                        .toList(),
                                                                onChanged: (val) =>
                                                                    safeSetState(() =>
                                                                        _model.cboExamenesValue =
                                                                            val),
                                                                height: 38.0,
                                                                maxHeight:
                                                                    300.0,
                                                                searchHintTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                searchTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                hintText:
                                                                    'Seleccione',
                                                                searchHintText:
                                                                    'Buscar estudiantes..',
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
                                                                borderColor: Color(
                                                                    0xFFE4E4E7),
                                                                borderWidth:
                                                                    0.0,
                                                                borderRadius:
                                                                    4.0,
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
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Estado',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFF17232B),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                        Container(
                                                          child:
                                                              FlutterFlowDropDown<
                                                                  bool>(
                                                            controller: _model
                                                                    .cboResultadoValueController ??=
                                                                FormFieldController<
                                                                    bool>(null),
                                                            options: List<
                                                                    bool>.from(
                                                                [true, false]),
                                                            optionLabels: [
                                                              'Activo',
                                                              'Inactivo'
                                                            ],
                                                            onChanged: (val) =>
                                                                safeSetState(() =>
                                                                    _model.cboResultadoValue =
                                                                        val),
                                                            height: 38.0,
                                                            maxHeight: 300.0,
                                                            searchHintTextStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            searchTextStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintText:
                                                                'Seleccione',
                                                            searchHintText:
                                                                'Buscar estudiantes..',
                                                            icon: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            elevation: 2.0,
                                                            borderColor: Color(
                                                                0xFFE4E4E7),
                                                            borderWidth: 0.0,
                                                            borderRadius: 4.0,
                                                            margin:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                            hidesUnderline:
                                                                true,
                                                            isOverButton: false,
                                                            isSearchable: true,
                                                            isMultiSelect:
                                                                false,
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 20.0)),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                                          'Fecha Inicio',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFF17232B),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if (_model.date1 !=
                                                                null) {
                                                              _model.date1 =
                                                                  null;
                                                              safeSetState(
                                                                  () {});
                                                              if (_model
                                                                      .date2 !=
                                                                  null) {
                                                                _model.date2 =
                                                                    null;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            } else {
                                                              final _datePicked1Date =
                                                                  await showDatePicker(
                                                                context:
                                                                    context,
                                                                initialDate:
                                                                    getCurrentTimestamp,
                                                                firstDate:
                                                                    DateTime(
                                                                        1900),
                                                                lastDate:
                                                                    DateTime(
                                                                        2050),
                                                                builder:
                                                                    (context,
                                                                        child) {
                                                                  return wrapInMaterialDatePickerTheme(
                                                                    context,
                                                                    child!,
                                                                    headerBackgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    headerForegroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .info,
                                                                    headerTextStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Glory',
                                                                          fontSize:
                                                                              32.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                    pickerBackgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                    pickerForegroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    selectedDateTimeBackgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    selectedDateTimeForegroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .info,
                                                                    actionButtonForegroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    iconSize:
                                                                        24.0,
                                                                  );
                                                                },
                                                              );

                                                              if (_datePicked1Date !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked1 =
                                                                      DateTime(
                                                                    _datePicked1Date
                                                                        .year,
                                                                    _datePicked1Date
                                                                        .month,
                                                                    _datePicked1Date
                                                                        .day,
                                                                  );
                                                                });
                                                              } else if (_model
                                                                      .datePicked1 !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked1 =
                                                                      getCurrentTimestamp;
                                                                });
                                                              }
                                                              _model.date1 = _model
                                                                  .datePicked1;
                                                              safeSetState(
                                                                  () {});
                                                            }

                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        1000));
                                                          },
                                                          child: Container(
                                                            child:
                                                                FlutterFlowDropDown<
                                                                    String>(
                                                              controller: _model
                                                                      .cbodate1ValueController ??=
                                                                  FormFieldController<
                                                                          String>(
                                                                      null),
                                                              options: <String>[],
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.cbodate1Value =
                                                                          val),
                                                              height: 38.0,
                                                              maxHeight: 300.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              hintText:
                                                                  valueOrDefault<
                                                                      String>(
                                                                _model.date1 !=
                                                                        null
                                                                    ? valueOrDefault<
                                                                        String>(
                                                                        dateTimeFormat(
                                                                          "d/M/y",
                                                                          _model
                                                                              .date1,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        'Seleccione',
                                                                      )
                                                                    : 'Seleccione',
                                                                'Seleccione',
                                                              ),
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor: Color(
                                                                  0xFFE4E4E7),
                                                              borderWidth: 0.0,
                                                              borderRadius: 4.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
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
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Fecha Final',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFF17232B),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if (_model.date1 !=
                                                                null) {
                                                              if (_model
                                                                      .date2 !=
                                                                  null) {
                                                                _model.date2 =
                                                                    null;
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                final _datePicked2Date =
                                                                    await showDatePicker(
                                                                  context:
                                                                      context,
                                                                  initialDate: (_model
                                                                          .date1 ??
                                                                      DateTime
                                                                          .now()),
                                                                  firstDate: (_model
                                                                          .date1 ??
                                                                      DateTime(
                                                                          1900)),
                                                                  lastDate:
                                                                      DateTime(
                                                                          2050),
                                                                  builder:
                                                                      (context,
                                                                          child) {
                                                                    return wrapInMaterialDatePickerTheme(
                                                                      context,
                                                                      child!,
                                                                      headerBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      headerForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      headerTextStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Glory',
                                                                            fontSize:
                                                                                32.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                      pickerBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      pickerForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      selectedDateTimeBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      selectedDateTimeForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      actionButtonForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      iconSize:
                                                                          24.0,
                                                                    );
                                                                  },
                                                                );

                                                                if (_datePicked2Date !=
                                                                    null) {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.datePicked2 =
                                                                        DateTime(
                                                                      _datePicked2Date
                                                                          .year,
                                                                      _datePicked2Date
                                                                          .month,
                                                                      _datePicked2Date
                                                                          .day,
                                                                    );
                                                                  });
                                                                } else if (_model
                                                                        .datePicked2 !=
                                                                    null) {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.datePicked2 =
                                                                        _model
                                                                            .date1;
                                                                  });
                                                                }
                                                                if (_model
                                                                        .datePicked2! >=
                                                                    _model
                                                                        .date1!) {
                                                                  _model.date2 =
                                                                      _model
                                                                          .datePicked2;
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              }
                                                            }
                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        1000));
                                                          },
                                                          child: Container(
                                                            child:
                                                                FlutterFlowDropDown<
                                                                    String>(
                                                              controller: _model
                                                                      .cbodate2ValueController ??=
                                                                  FormFieldController<
                                                                          String>(
                                                                      null),
                                                              options: <String>[],
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.cbodate2Value =
                                                                          val),
                                                              height: 38.0,
                                                              maxHeight: 300.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              hintText:
                                                                  valueOrDefault<
                                                                      String>(
                                                                _model.date2 !=
                                                                        null
                                                                    ? valueOrDefault<
                                                                        String>(
                                                                        dateTimeFormat(
                                                                          "d/M/y",
                                                                          _model
                                                                              .date2,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        'Seleccione',
                                                                      )
                                                                    : 'Seleccione',
                                                                'Seleccione',
                                                              ),
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor: Color(
                                                                  0xFFE4E4E7),
                                                              borderWidth: 0.0,
                                                              borderRadius: 4.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
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
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 20.0)),
                                              ),
                                            ].divide(SizedBox(height: 20.0)),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  _model.searchdate1 =
                                                      _model.date1;
                                                  _model.searchdate2 =
                                                      _model.date2;
                                                  _model.refExamen =
                                                      _model.cboExamenesValue;
                                                  _model.estado =
                                                      _model.cboResultadoValue;
                                                  safeSetState(() {});
                                                },
                                                text: 'Buscar',
                                                options: FFButtonOptions(
                                                  height: 50.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          30.0, 0.0, 30.0, 0.0),
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
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: Colors.white,
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                              ),
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  safeSetState(() {
                                                    _model
                                                        .cboExamenesValueController
                                                        ?.reset();
                                                    _model
                                                        .cboResultadoValueController
                                                        ?.reset();
                                                  });
                                                  _model.date1 = null;
                                                  _model.date2 = null;
                                                  _model.searchdate1 = null;
                                                  _model.searchdate2 = null;
                                                  _model.refExamen = null;
                                                  _model.estado = null;
                                                  safeSetState(() {});
                                                },
                                                text: 'Limpiar',
                                                options: FFButtonOptions(
                                                  height: 50.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          30.0, 0.0, 30.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 50.0)),
                                          ),
                                        ].divide(SizedBox(height: 30.0)),
                                      ),
                                    ),
                                  ),
                                  StreamBuilder<List<ResultadosRecord>>(
                                    stream: queryResultadosRecord(
                                      queryBuilder: (resultadosRecord) =>
                                          resultadosRecord
                                              .where(
                                                'estudiante_ref',
                                                isEqualTo:
                                                    currentUserReference?.id,
                                              )
                                              .where(
                                                'created_date',
                                                isGreaterThanOrEqualTo:
                                                    _model.searchdate1,
                                              )
                                              .where(
                                                'created_date',
                                                isLessThanOrEqualTo:
                                                    _model.searchdate2,
                                              )
                                              .where(
                                                'examen_ref',
                                                isEqualTo: _model.refExamen,
                                              )
                                              .where(
                                                'estado',
                                                isEqualTo: _model.estado,
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
                                      List<ResultadosRecord>
                                          containerResultadosRecordList =
                                          snapshot.data!;

                                      return Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.8,
                                        height: 350.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: 'Usuario: ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                valueOrDefault<
                                                                    String>(
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.codigo,
                                                                  ''),
                                                              '--',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text: ' / ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                valueOrDefault<
                                                                    String>(
                                                              currentUserDisplayName,
                                                              '--',
                                                            ),
                                                            style: TextStyle(),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Registro Total',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(width: 20.0)),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height: 3.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFDCDCDC),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                              Expanded(
                                                child: Builder(
                                                  builder: (context) {
                                                    final listNotes =
                                                        containerResultadosRecordList
                                                            .toList();
                                                    if (listNotes.isEmpty) {
                                                      return Center(
                                                        child:
                                                            EmptyNotesWidget(),
                                                      );
                                                    }

                                                    return FlutterFlowDataTable<
                                                        ResultadosRecord>(
                                                      controller: _model
                                                          .paginatedDataTableController,
                                                      data: listNotes,
                                                      columnsBuilder:
                                                          (onSortChanged) => [
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              'Fecha',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: Color(
                                                                        0xFF212529),
                                                                    fontSize:
                                                                        15.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              'Examen',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: Color(
                                                                        0xFF212529),
                                                                    fontSize:
                                                                        15.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Text(
                                                                'Nota General',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: Color(
                                                                          0xFF212529),
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Text(
                                                                'Resultado',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: Color(
                                                                          0xFF212529),
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Text(
                                                                'Personas',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: Color(
                                                                          0xFF212529),
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Text(
                                                                'Entorno',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: Color(
                                                                          0xFF212529),
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Text(
                                                                'Procesos',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: Color(
                                                                          0xFF212529),
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                      dataRowBuilder: (listNotesItem,
                                                              listNotesIndex,
                                                              selected,
                                                              onSelectChanged) =>
                                                          DataRow(
                                                        color:
                                                            WidgetStateProperty
                                                                .all(
                                                          listNotesIndex % 2 ==
                                                                  0
                                                              ? Color(
                                                                  0xFFF6F6F6)
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                        ),
                                                        cells: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              dateTimeFormat(
                                                                "d/M/y",
                                                                listNotesItem
                                                                    .createdDate,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                              '--  /  -- /  ----',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          StreamBuilder<
                                                              List<
                                                                  ExamenesRecord>>(
                                                            stream:
                                                                queryExamenesRecord(
                                                              queryBuilder:
                                                                  (examenesRecord) =>
                                                                      examenesRecord
                                                                          .where(
                                                                'uid',
                                                                isEqualTo:
                                                                    listNotesItem
                                                                        .examenRef,
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
                                                              List<ExamenesRecord>
                                                                  textExamenesRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              final textExamenesRecord =
                                                                  textExamenesRecordList
                                                                          .isNotEmpty
                                                                      ? textExamenesRecordList
                                                                          .first
                                                                      : null;

                                                              return Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  textExamenesRecord !=
                                                                          null
                                                                      ? valueOrDefault<
                                                                          String>(
                                                                          textExamenesRecord
                                                                              .nombre,
                                                                          '--',
                                                                        )
                                                                      : '--',
                                                                  '--',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              );
                                                            },
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                formatNumber(
                                                                  listNotesItem
                                                                      .calificacion,
                                                                  formatType:
                                                                      FormatType
                                                                          .custom,
                                                                  format: '',
                                                                  locale: '',
                                                                ),
                                                                '0',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                () {
                                                                  if (listNotesItem
                                                                          .calificacion >=
                                                                      14.0) {
                                                                    return 'Aprobado';
                                                                  } else if ((listNotesItem
                                                                              .calificacion <=
                                                                          13.0) &&
                                                                      (listNotesItem
                                                                              .calificacion >=
                                                                          0.0)) {
                                                                    return 'Desaprobado';
                                                                  } else {
                                                                    return 'Pendiente';
                                                                  }
                                                                }(),
                                                                'Pendiente',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
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
                                                                              isEqualTo: listNotesItem.reference.id,
                                                                            )
                                                                            .where(
                                                                              'type',
                                                                              isEqualTo: 0,
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
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<DetallesResultadosRecord>
                                                                    textDetallesResultadosRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                final textDetallesResultadosRecord =
                                                                    textDetallesResultadosRecordList
                                                                            .isNotEmpty
                                                                        ? textDetallesResultadosRecordList
                                                                            .first
                                                                        : null;

                                                                return Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    textDetallesResultadosRecord !=
                                                                            null
                                                                        ? valueOrDefault<
                                                                            String>(
                                                                            '${valueOrDefault<String>(
                                                                              textDetallesResultadosRecord.porcentaje.toString(),
                                                                              '0',
                                                                            )}%',
                                                                            '0%',
                                                                          )
                                                                        : '0%',
                                                                    '0%',
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        letterSpacing:
                                                                            0.0,
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
                                                                List<
                                                                    DetallesResultadosRecord>>(
                                                              stream:
                                                                  queryDetallesResultadosRecord(
                                                                queryBuilder:
                                                                    (detallesResultadosRecord) =>
                                                                        detallesResultadosRecord
                                                                            .where(
                                                                              'uidResultado',
                                                                              isEqualTo: listNotesItem.reference.id,
                                                                            )
                                                                            .where(
                                                                              'type',
                                                                              isEqualTo: 1,
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
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<DetallesResultadosRecord>
                                                                    textDetallesResultadosRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                final textDetallesResultadosRecord =
                                                                    textDetallesResultadosRecordList
                                                                            .isNotEmpty
                                                                        ? textDetallesResultadosRecordList
                                                                            .first
                                                                        : null;

                                                                return Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    textDetallesResultadosRecord !=
                                                                            null
                                                                        ? valueOrDefault<
                                                                            String>(
                                                                            '${valueOrDefault<String>(
                                                                              textDetallesResultadosRecord.porcentaje.toString(),
                                                                              '0',
                                                                            )}%',
                                                                            '0%',
                                                                          )
                                                                        : '0%',
                                                                    '0%',
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        letterSpacing:
                                                                            0.0,
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
                                                                List<
                                                                    DetallesResultadosRecord>>(
                                                              stream:
                                                                  queryDetallesResultadosRecord(
                                                                queryBuilder:
                                                                    (detallesResultadosRecord) =>
                                                                        detallesResultadosRecord
                                                                            .where(
                                                                              'uidResultado',
                                                                              isEqualTo: listNotesItem.reference.id,
                                                                            )
                                                                            .where(
                                                                              'type',
                                                                              isEqualTo: 2,
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
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<DetallesResultadosRecord>
                                                                    textDetallesResultadosRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                final textDetallesResultadosRecord =
                                                                    textDetallesResultadosRecordList
                                                                            .isNotEmpty
                                                                        ? textDetallesResultadosRecordList
                                                                            .first
                                                                        : null;

                                                                return Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    textDetallesResultadosRecord !=
                                                                            null
                                                                        ? valueOrDefault<
                                                                            String>(
                                                                            '${valueOrDefault<String>(
                                                                              textDetallesResultadosRecord.porcentaje.toString(),
                                                                              '0',
                                                                            )}%',
                                                                            '0%',
                                                                          )
                                                                        : '0%',
                                                                    '0%',
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ]
                                                            .map((c) =>
                                                                DataCell(c))
                                                            .toList(),
                                                      ),
                                                      emptyBuilder: () =>
                                                          Center(
                                                        child:
                                                            EmptyNotesWidget(),
                                                      ),
                                                      paginated: true,
                                                      selectable: false,
                                                      hidePaginator: false,
                                                      showFirstLastButtons:
                                                          true,
                                                      headingRowHeight: 56.0,
                                                      dataRowHeight: 48.0,
                                                      columnSpacing: 20.0,
                                                      headingRowColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      addHorizontalDivider:
                                                          true,
                                                      addTopAndBottomDivider:
                                                          false,
                                                      hideDefaultHorizontalDivider:
                                                          true,
                                                      horizontalDividerColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      horizontalDividerThickness:
                                                          1.0,
                                                      addVerticalDivider: false,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 5.0)),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ].divide(SizedBox(height: 50.0)),
                              ),
                            ),
                          ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                          ))
                            wrapWithModel(
                              model: _model.footerModel,
                              updateCallback: () => safeSetState(() {}),
                              child: FooterWidget(),
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
