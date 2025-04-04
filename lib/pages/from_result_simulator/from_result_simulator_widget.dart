import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/timer/timer_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'from_result_simulator_model.dart';
export 'from_result_simulator_model.dart';

class FromResultSimulatorWidget extends StatefulWidget {
  const FromResultSimulatorWidget({
    super.key,
    required this.refExamen,
    required this.refUser,
    required this.refCourse,
    required this.type,
  });

  final ExamenesRecord? refExamen;
  final DocumentReference? refUser;
  final CoursesRecord? refCourse;
  final int? type;

  @override
  State<FromResultSimulatorWidget> createState() =>
      _FromResultSimulatorWidgetState();
}

class _FromResultSimulatorWidgetState extends State<FromResultSimulatorWidget> {
  late FromResultSimulatorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FromResultSimulatorModel());

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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Material(
                color: Colors.transparent,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 1237.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 15.0, 15.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: StreamBuilder<List<UsersRecord>>(
                                        stream: queryUsersRecord(
                                          queryBuilder: (usersRecord) =>
                                              usersRecord.where(
                                            'uid',
                                            isEqualTo: widget!.refUser?.id != ''
                                                ? widget!.refUser?.id
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
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<UsersRecord>
                                              richTextUsersRecordList =
                                              snapshot.data!;
                                          final richTextUsersRecord =
                                              richTextUsersRecordList.isNotEmpty
                                                  ? richTextUsersRecordList
                                                      .first
                                                  : null;

                                          return RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      'ESTADISTICAS DE USUARIO: ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: valueOrDefault<String>(
                                                    richTextUsersRecord
                                                        ?.displayName,
                                                    '--',
                                                  ),
                                                  style: TextStyle(),
                                                )
                                              ],
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        functions.dateTimeFormat(
                                            getCurrentTimestamp),
                                        'Sin Limite',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 3.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ].divide(SizedBox(height: 5.0)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 15.0),
                            child: StreamBuilder<List<ResultadosRecord>>(
                              stream: queryResultadosRecord(
                                queryBuilder: (resultadosRecord) =>
                                    resultadosRecord
                                        .where(
                                          'estudiante_ref',
                                          isEqualTo: widget!.refUser?.id != ''
                                              ? widget!.refUser?.id
                                              : null,
                                        )
                                        .where(
                                          'examen_ref',
                                          isEqualTo: widget!.refExamen
                                                      ?.reference.id !=
                                                  ''
                                              ? widget!.refExamen?.reference.id
                                              : null,
                                        )
                                        .where(
                                          'type',
                                          isEqualTo: widget!.type,
                                        )
                                        .where(
                                          'estado',
                                          isEqualTo: true,
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<ResultadosRecord>
                                    containerResultadosRecordList =
                                    snapshot.data!;

                                return Material(
                                  color: Colors.transparent,
                                  elevation: 3.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color: Colors.transparent,
                                        width: 0.0,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        StreamBuilder<List<PreguntasRecord>>(
                                          stream: queryPreguntasRecord(
                                            queryBuilder: (preguntasRecord) =>
                                                preguntasRecord
                                                    .where(
                                                      'examen_ref',
                                                      isEqualTo: widget!
                                                                  .refExamen
                                                                  ?.reference
                                                                  .id !=
                                                              ''
                                                          ? widget!.refExamen
                                                              ?.reference.id
                                                          : null,
                                                    )
                                                    .orderBy('created_time',
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
                                            List<PreguntasRecord>
                                                containerPreguntasRecordList =
                                                snapshot.data!;

                                            return Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(10.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft:
                                                      Radius.circular(10.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(20.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Resultado de Examen',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            fontSize: 30.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                    Stack(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      children: [
                                                        CircularPercentIndicator(
                                                          percent:
                                                              valueOrDefault<
                                                                  double>(
                                                            functions
                                                                .convertirCalificacion(
                                                                    valueOrDefault<
                                                                        double>(
                                                              containerResultadosRecordList
                                                                  .firstOrNull
                                                                  ?.calificacion,
                                                              0.0,
                                                            )),
                                                            0.0,
                                                          ),
                                                          radius: 75.0,
                                                          lineWidth: 5.0,
                                                          animation: true,
                                                          animateFromLastPercent:
                                                              true,
                                                          progressColor:
                                                              valueOrDefault<
                                                                  Color>(
                                                            functions
                                                                .colorCalificacion(
                                                                    valueOrDefault<
                                                                        double>(
                                                              containerResultadosRecordList
                                                                  .firstOrNull
                                                                  ?.calificacion,
                                                              0.0,
                                                            )),
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                          ),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryBackground,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'Puntaje Final',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                              RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: valueOrDefault<
                                                                          String>(
                                                                        formatNumber(
                                                                          containerResultadosRecordList
                                                                              .firstOrNull
                                                                              ?.calificacion,
                                                                          formatType:
                                                                              FormatType.custom,
                                                                          format:
                                                                              '0',
                                                                          locale:
                                                                              '',
                                                                        ),
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            fontSize:
                                                                                24.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text:
                                                                          ' Puntos',
                                                                      style:
                                                                          TextStyle(),
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        fontSize:
                                                                            24.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                              ),
                                                              RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: valueOrDefault<
                                                                          String>(
                                                                        containerResultadosRecordList
                                                                            .firstOrNull
                                                                            ?.cantidadCorrectas
                                                                            ?.toString(),
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text:
                                                                          ' de ',
                                                                      style:
                                                                          TextStyle(),
                                                                    ),
                                                                    TextSpan(
                                                                      text: valueOrDefault<
                                                                          String>(
                                                                        containerPreguntasRecordList
                                                                            .length
                                                                            .toString(),
                                                                        '0',
                                                                      ),
                                                                      style:
                                                                          TextStyle(),
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Tiempo Transcurrido',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                        FlutterFlowTimer(
                                                          initialTime:
                                                              valueOrDefault<
                                                                  int>(
                                                            containerResultadosRecordList
                                                                .firstOrNull
                                                                ?.tiempoTranscurrido,
                                                            0,
                                                          ),
                                                          getDisplayTime: (value) =>
                                                              StopWatchTimer
                                                                  .getDisplayTime(
                                                                      value,
                                                                      milliSecond:
                                                                          false),
                                                          controller: _model
                                                              .timerController,
                                                          updateStateInterval:
                                                              Duration(
                                                                  milliseconds:
                                                                      10000),
                                                          onChanged: (value,
                                                              displayTime,
                                                              shouldUpdate) {
                                                            _model.timerMilliseconds =
                                                                value;
                                                            _model.timerValue =
                                                                displayTime;
                                                            if (shouldUpdate)
                                                              safeSetState(
                                                                  () {});
                                                          },
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 10.0)),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Preguntas Correctas',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                        StreamBuilder<
                                                            List<
                                                                PreguntasRecord>>(
                                                          stream:
                                                              queryPreguntasRecord(
                                                            queryBuilder: (preguntasRecord) =>
                                                                preguntasRecord
                                                                    .where(
                                                                      'examen_ref',
                                                                      isEqualTo: widget!.refExamen?.reference.id !=
                                                                              ''
                                                                          ? widget!
                                                                              .refExamen
                                                                              ?.reference
                                                                              .id
                                                                          : null,
                                                                    )
                                                                    .orderBy(
                                                                        'created_time',
                                                                        descending:
                                                                            true),
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
                                                            List<PreguntasRecord>
                                                                richTextPreguntasRecordList =
                                                                snapshot.data!;

                                                            return RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: valueOrDefault<
                                                                        String>(
                                                                      containerResultadosRecordList
                                                                          .firstOrNull
                                                                          ?.cantidadCorrectas
                                                                          ?.toString(),
                                                                      '0',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                  TextSpan(
                                                                    text:
                                                                        ' de ',
                                                                    style:
                                                                        TextStyle(),
                                                                  ),
                                                                  TextSpan(
                                                                    text: valueOrDefault<
                                                                        String>(
                                                                      richTextPreguntasRecordList
                                                                          .length
                                                                          .toString(),
                                                                      '0',
                                                                    ),
                                                                    style:
                                                                        TextStyle(),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 10.0)),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Estado',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                        FFButtonWidget(
                                                          onPressed: () {
                                                            print(
                                                                'Button pressed ...');
                                                          },
                                                          text: valueOrDefault<
                                                              String>(
                                                            containerResultadosRecordList
                                                                        .firstOrNull!
                                                                        .calificacion >=
                                                                    14.0
                                                                ? 'Aprobado'
                                                                : 'Desaprobado',
                                                            'Desaprobado',
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 26.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              containerResultadosRecordList
                                                                          .firstOrNull!
                                                                          .calificacion >=
                                                                      14.0
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .greenResult
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .error,
                                                            ),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 10.0)),
                                                    ),
                                                  ]
                                                      .divide(SizedBox(
                                                          height: 20.0))
                                                      .addToEnd(SizedBox(
                                                          height: 60.0)),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        Flexible(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(10.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(10.0),
                                              ),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
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
                                                            'Historial',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                          Container(
                                                            width: 66.0,
                                                            height: 3.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 10.0)),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        height: 400.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final listResultados =
                                                                containerResultadosRecordList
                                                                    .toList();

                                                            return FlutterFlowDataTable<
                                                                ResultadosRecord>(
                                                              controller: _model
                                                                  .paginatedDataTableController,
                                                              data:
                                                                  listResultados,
                                                              columnsBuilder:
                                                                  (onSortChanged) =>
                                                                      [
                                                                DataColumn2(
                                                                  label:
                                                                      DefaultTextStyle
                                                                          .merge(
                                                                    softWrap:
                                                                        true,
                                                                    child: Text(
                                                                      'Fecha',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                    softWrap:
                                                                        true,
                                                                    child: Text(
                                                                      'Intento',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                    softWrap:
                                                                        true,
                                                                    child: Text(
                                                                      'Tiempo',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                    softWrap:
                                                                        true,
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        'Puntuaje',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                              dataRowBuilder:
                                                                  (listResultadosItem,
                                                                          listResultadosIndex,
                                                                          selected,
                                                                          onSelectChanged) =>
                                                                      DataRow(
                                                                color:
                                                                    MaterialStateProperty
                                                                        .all(
                                                                  listResultadosIndex %
                                                                              2 ==
                                                                          0
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                ),
                                                                cells: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      dateTimeFormat(
                                                                        "d/M/y",
                                                                        listResultadosItem
                                                                            .fechaInicioExamen,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      '-- / -- / ----',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          letterSpacing:
                                                                              0.0,
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
                                                                              'Intento ',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              valueOrDefault<String>(
                                                                            (((containerResultadosRecordList.length - 1) + 1) - listResultadosIndex).toString(),
                                                                            '1',
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  wrapWithModel(
                                                                    model: _model
                                                                        .timerModels
                                                                        .getModel(
                                                                      listResultadosItem
                                                                          .reference
                                                                          .id,
                                                                      listResultadosIndex,
                                                                    ),
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        TimerWidget(
                                                                      key: Key(
                                                                        'Key42f_${listResultadosItem.reference.id}',
                                                                      ),
                                                                      parameter1:
                                                                          valueOrDefault<
                                                                              int>(
                                                                        listResultadosItem
                                                                            .tiempoTranscurrido,
                                                                        0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: StreamBuilder<
                                                                        List<
                                                                            PreguntasRecord>>(
                                                                      stream:
                                                                          queryPreguntasRecord(
                                                                        queryBuilder: (preguntasRecord) => preguntasRecord
                                                                            .where(
                                                                              'examen_ref',
                                                                              isEqualTo: widget!.refExamen?.reference.id != '' ? widget!.refExamen?.reference.id : null,
                                                                            )
                                                                            .orderBy('created_time', descending: true),
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
                                                                        List<PreguntasRecord>
                                                                            richTextPreguntasRecordList =
                                                                            snapshot.data!;

                                                                        return RichText(
                                                                          textScaler:
                                                                              MediaQuery.of(context).textScaler,
                                                                          text:
                                                                              TextSpan(
                                                                            children: [
                                                                              TextSpan(
                                                                                text: valueOrDefault<String>(
                                                                                  listResultadosItem.cantidadCorrectas.toString(),
                                                                                  '0',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                              TextSpan(
                                                                                text: ' de ',
                                                                                style: TextStyle(),
                                                                              ),
                                                                              TextSpan(
                                                                                text: valueOrDefault<String>(
                                                                                  richTextPreguntasRecordList.length.toString(),
                                                                                  '0',
                                                                                ),
                                                                                style: TextStyle(),
                                                                              )
                                                                            ],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ]
                                                                    .map((c) =>
                                                                        DataCell(
                                                                            c))
                                                                    .toList(),
                                                              ),
                                                              paginated: true,
                                                              selectable: false,
                                                              hidePaginator:
                                                                  false,
                                                              showFirstLastButtons:
                                                                  true,
                                                              headingRowHeight:
                                                                  56.0,
                                                              dataRowHeight:
                                                                  48.0,
                                                              columnSpacing:
                                                                  20.0,
                                                              headingRowColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
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
                                                              addVerticalDivider:
                                                                  false,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 10.0)),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        text: 'Cerrar',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 112.0,
                                                          height: 40.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
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
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                        ),
                                                      ),
                                                      if (((containerResultadosRecordList
                                                                      .length <=
                                                                  2) &&
                                                              (widget!.type ==
                                                                  1)) ||
                                                          (widget!.type == 2))
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      50.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);

                                                              await containerResultadosRecordList
                                                                  .firstOrNull!
                                                                  .reference
                                                                  .update(
                                                                      createResultadosRecordData(
                                                                estado: false,
                                                              ));

                                                              var resultadosRecordReference1 =
                                                                  ResultadosRecord
                                                                      .collection
                                                                      .doc();
                                                              await resultadosRecordReference1
                                                                  .set({
                                                                ...createResultadosRecordData(
                                                                  estudianteRef:
                                                                      widget!
                                                                          .refUser
                                                                          ?.id,
                                                                  estado: true,
                                                                  examenRef: widget!
                                                                      .refExamen
                                                                      ?.reference
                                                                      .id,
                                                                  type: widget!
                                                                      .type,
                                                                ),
                                                                ...mapToFirestore(
                                                                  {
                                                                    'created_date':
                                                                        FieldValue
                                                                            .serverTimestamp(),
                                                                  },
                                                                ),
                                                              });
                                                              _model.refResult =
                                                                  ResultadosRecord
                                                                      .getDocumentFromData({
                                                                ...createResultadosRecordData(
                                                                  estudianteRef:
                                                                      widget!
                                                                          .refUser
                                                                          ?.id,
                                                                  estado: true,
                                                                  examenRef: widget!
                                                                      .refExamen
                                                                      ?.reference
                                                                      .id,
                                                                  type: widget!
                                                                      .type,
                                                                ),
                                                                ...mapToFirestore(
                                                                  {
                                                                    'created_date':
                                                                        DateTime
                                                                            .now(),
                                                                  },
                                                                ),
                                                              }, resultadosRecordReference1);

                                                              await _model
                                                                  .refResult!
                                                                  .reference
                                                                  .update(
                                                                      createResultadosRecordData(
                                                                uid: _model
                                                                    .refResult
                                                                    ?.reference
                                                                    .id,
                                                              ));
                                                              if (widget!
                                                                      .type ==
                                                                  2) {
                                                                var registerSimulatorRecordReference =
                                                                    RegisterSimulatorRecord
                                                                        .collection
                                                                        .doc();
                                                                await registerSimulatorRecordReference
                                                                    .set({
                                                                  ...createRegisterSimulatorRecordData(
                                                                    uidUser: widget!
                                                                        .refUser
                                                                        ?.id,
                                                                    uidCourse: widget!
                                                                        .refCourse
                                                                        ?.reference
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
                                                                _model.refRegister =
                                                                    RegisterSimulatorRecord
                                                                        .getDocumentFromData({
                                                                  ...createRegisterSimulatorRecordData(
                                                                    uidUser: widget!
                                                                        .refUser
                                                                        ?.id,
                                                                    uidCourse: widget!
                                                                        .refCourse
                                                                        ?.reference
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
                                                                    .refRegister!
                                                                    .reference
                                                                    .update(
                                                                        createRegisterSimulatorRecordData(
                                                                  uid: _model
                                                                      .refRegister
                                                                      ?.reference
                                                                      .id,
                                                                ));
                                                              }
                                                              _model.referenciaResultado =
                                                                  await ResultadosRecord
                                                                      .getDocumentOnce(_model
                                                                          .refResult!
                                                                          .reference);
                                                              await Future.delayed(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          1000));

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            text:
                                                                'Reintentar examen',
                                                            options:
                                                                FFButtonOptions(
                                                              height: 40.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
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
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.0),
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 15.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ].divide(SizedBox(height: 20.0)),
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
