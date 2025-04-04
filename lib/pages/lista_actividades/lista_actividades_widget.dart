import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/create_update_actividad/create_update_actividad_widget.dart';
import '/pages/eliminar_actividad/eliminar_actividad_widget.dart';
import '/pages/empty_actividades/empty_actividades_widget.dart';
import '/pages/lista_modules/lista_modules_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'lista_actividades_model.dart';
export 'lista_actividades_model.dart';

class ListaActividadesWidget extends StatefulWidget {
  const ListaActividadesWidget({
    super.key,
    required this.refModulo,
    required this.refSession,
    required this.refCourse,
  });

  final ModuleRecord? refModulo;
  final SessionRecord? refSession;
  final CoursesRecord? refCourse;

  @override
  State<ListaActividadesWidget> createState() => _ListaActividadesWidgetState();
}

class _ListaActividadesWidgetState extends State<ListaActividadesWidget> {
  late ListaActividadesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListaActividadesModel());

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
              child: Stack(
                alignment: AlignmentDirectional(1.0, -1.0),
                children: [
                  Material(
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
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(30.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Builder(
                                    builder: (context) => FFButtonWidget(
                                      onPressed: () async {
                                        Navigator.pop(context);
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: ListaModulesWidget(
                                                refSession: widget!.refSession!,
                                                refCourse: widget!.refCourse!,
                                              ),
                                            );
                                          },
                                        );

                                        await Future.delayed(
                                            const Duration(milliseconds: 1000));
                                      },
                                      text: 'Regresar',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Sistema'),
                                              content: Text(widget!
                                                  .refModulo!.reference.id),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Text(
                                        'Lista de Actividades',
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
                                    ),
                                    Container(
                                      width: 146.0,
                                      height: 3.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFDB0B17),
                                        borderRadius:
                                            BorderRadius.circular(3.0),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 2.0)),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Builder(
                                            builder: (context) =>
                                                FFButtonWidget(
                                              onPressed: () async {
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child:
                                                          CreateUpdateActividadWidget(
                                                        refModule:
                                                            widget!.refModulo!,
                                                        refSession:
                                                            widget!.refSession!,
                                                        refCourse:
                                                            widget!.refCourse!,
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              text: 'Agregar Actividad',
                                              icon: Icon(
                                                Icons.add_circle_outline,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                size: 12.0,
                                              ),
                                              options: FFButtonOptions(
                                                height: 30.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 10.0)),
                                      ),
                                    ),
                                    StreamBuilder<List<ModuleClassRecord>>(
                                      stream: queryModuleClassRecord(
                                        queryBuilder: (moduleClassRecord) =>
                                            moduleClassRecord
                                                .where(
                                                  'uid_Module',
                                                  isEqualTo: widget!.refModulo
                                                              ?.reference.id !=
                                                          ''
                                                      ? widget!.refModulo
                                                          ?.reference.id
                                                      : null,
                                                )
                                                .orderBy('Created_date',
                                                    descending: true),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: LinearProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          );
                                        }
                                        List<ModuleClassRecord>
                                            containerModuleClassRecordList =
                                            snapshot.data!;

                                        return Container(
                                          height: 350.0,
                                          decoration: BoxDecoration(),
                                          child: Builder(
                                            builder: (context) {
                                              final listaActividades =
                                                  containerModuleClassRecordList
                                                      .toList();
                                              if (listaActividades.isEmpty) {
                                                return Center(
                                                  child: Container(
                                                    height: 250.0,
                                                    child:
                                                        EmptyActividadesWidget(),
                                                  ),
                                                );
                                              }

                                              return FlutterFlowDataTable<
                                                  ModuleClassRecord>(
                                                controller: _model
                                                    .paginatedDataTableController,
                                                data: listaActividades,
                                                columnsBuilder:
                                                    (onSortChanged) => [
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Text(
                                                        'Nombre',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: Color(
                                                                  0xFF212529),
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Text(
                                                        'Url del video',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: Color(
                                                                  0xFF212529),
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          'Acciones',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF212529),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                                dataRowBuilder:
                                                    (listaActividadesItem,
                                                            listaActividadesIndex,
                                                            selected,
                                                            onSelectChanged) =>
                                                        DataRow(
                                                  color:
                                                      MaterialStateProperty.all(
                                                    listaActividadesIndex % 2 ==
                                                            0
                                                        ? Color(0xFFF6F6F6)
                                                        : Colors.white,
                                                  ),
                                                  cells: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        listaActividadesItem
                                                            .name,
                                                        '---',
                                                      ),
                                                      maxLines: 1,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: Colors.black,
                                                            fontSize: 13.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        listaActividadesItem
                                                            .linkVideo,
                                                        '---',
                                                      ),
                                                      maxLines: 1,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Builder(
                                                          builder: (context) =>
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 8.0,
                                                            buttonSize: 46.0,
                                                            icon: Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xFF707070),
                                                              size: 13.5,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    elevation:
                                                                        0,
                                                                    insetPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    child:
                                                                        CreateUpdateActividadWidget(
                                                                      refActividad:
                                                                          listaActividadesItem,
                                                                      refModule:
                                                                          widget!
                                                                              .refModulo!,
                                                                      refSession:
                                                                          widget!
                                                                              .refSession!,
                                                                      refCourse:
                                                                          widget!
                                                                              .refCourse!,
                                                                    ),
                                                                  );
                                                                },
                                                              );

                                                              await Future.delayed(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          1000));
                                                            },
                                                          ),
                                                        ),
                                                        Builder(
                                                          builder: (context) =>
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 8.0,
                                                            buttonSize: 46.0,
                                                            icon: Icon(
                                                              Icons.close,
                                                              color: Color(
                                                                  0xFF707070),
                                                              size: 13.5,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    elevation:
                                                                        0,
                                                                    insetPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    child:
                                                                        EliminarActividadWidget(
                                                                      refActividad:
                                                                          listaActividadesItem,
                                                                      refModule:
                                                                          widget!
                                                                              .refModulo!,
                                                                      refSession:
                                                                          widget!
                                                                              .refSession!,
                                                                      refCourse:
                                                                          widget!
                                                                              .refCourse!,
                                                                    ),
                                                                  );
                                                                },
                                                              );

                                                              await Future.delayed(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          1000));
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ]
                                                      .map((c) => DataCell(c))
                                                      .toList(),
                                                ),
                                                emptyBuilder: () => Center(
                                                  child: Container(
                                                    height: 250.0,
                                                    child:
                                                        EmptyActividadesWidget(),
                                                  ),
                                                ),
                                                paginated: true,
                                                selectable: false,
                                                hidePaginator: false,
                                                showFirstLastButtons: false,
                                                minWidth: 800.0,
                                                headingRowHeight: 56.0,
                                                dataRowHeight: 48.0,
                                                columnSpacing: 20.0,
                                                headingRowColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                addHorizontalDivider: true,
                                                addTopAndBottomDivider: false,
                                                hideDefaultHorizontalDivider:
                                                    true,
                                                horizontalDividerColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                horizontalDividerThickness: 1.0,
                                                addVerticalDivider: false,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ].divide(SizedBox(height: 10.0)),
                                ),
                              ].divide(SizedBox(height: 20.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 12.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderRadius: 20.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).secondary,
                      icon: Icon(
                        Icons.close,
                        color: FlutterFlowTheme.of(context).info,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ].divide(SizedBox(height: 50.0)).around(SizedBox(height: 50.0)),
        ),
      ),
    );
  }
}
