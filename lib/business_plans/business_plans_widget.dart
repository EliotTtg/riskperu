import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/footer/footer_widget.dart';
import '/pages/header/header_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'business_plans_model.dart';
export 'business_plans_model.dart';

class BusinessPlansWidget extends StatefulWidget {
  const BusinessPlansWidget({super.key});

  static String routeName = 'BusinessPlans';
  static String routePath = 'businessPlans';

  @override
  State<BusinessPlansWidget> createState() => _BusinessPlansWidgetState();
}

class _BusinessPlansWidgetState extends State<BusinessPlansWidget> {
  late BusinessPlansModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BusinessPlansModel());

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
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/Plan_de_Precios.png',
                                ).image,
                              ),
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 1090.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 20.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              context.safePop();
                                            },
                                            text: 'Regresar',
                                            options: FFButtonOptions(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        letterSpacing: 0.0,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
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
                                          Text(
                                            'Planes de Precios',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 64.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Container(
                                            width: 68.5,
                                            height: 3.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'En la era del internet, la creación de aplicaciones web sin depender de\nun desarrollador es una habilidad muy demandada',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ]
                                        .divide(SizedBox(height: 10.0))
                                        .addToEnd(SizedBox(height: 20.0)),
                                  ),
                                ),
                                StreamBuilder<List<PlansRecord>>(
                                  stream: queryPlansRecord(
                                    queryBuilder: (plansRecord) =>
                                        plansRecord.orderBy('Created_date'),
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
                                    List<PlansRecord> wrapPlansRecordList =
                                        snapshot.data!;

                                    return Wrap(
                                      spacing: 50.0,
                                      runSpacing: 50.0,
                                      alignment: WrapAlignment.center,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: List.generate(
                                          wrapPlansRecordList.length,
                                          (wrapIndex) {
                                        final wrapPlansRecord =
                                            wrapPlansRecordList[wrapIndex];
                                        return Material(
                                          color: Colors.transparent,
                                          elevation: 3.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Container(
                                            width: 397.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                    border: Border.all(
                                                      color: Color(0xFF17236A),
                                                    ),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration: Duration(
                                                          milliseconds: 500),
                                                      fadeOutDuration: Duration(
                                                          milliseconds: 500),
                                                      imageUrl:
                                                          wrapPlansRecord.image,
                                                      width: 200.0,
                                                      height: 200.0,
                                                      fit: BoxFit.cover,
                                                      errorWidget: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Image.asset(
                                                        'assets/images/error_image.png',
                                                        width: 200.0,
                                                        height: 200.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            wrapPlansRecord
                                                                .name,
                                                            '--',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 35.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                        Container(
                                                          width: 68.5,
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
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  70.0,
                                                                  0.0,
                                                                  70.0,
                                                                  0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final listDescription =
                                                              wrapPlansRecord
                                                                  .descripcion
                                                                  .toList();

                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: List.generate(
                                                                listDescription
                                                                    .length,
                                                                (listDescriptionIndex) {
                                                              final listDescriptionItem =
                                                                  listDescription[
                                                                      listDescriptionIndex];
                                                              return Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/Frame_63_(1).png',
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    child: Text(
                                                                      listDescriptionItem,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                20.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        10.0)),
                                                              );
                                                            }).divide(SizedBox(
                                                                height: 5.0)),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 10.0)),
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
                                                                )
                                                                .where(
                                                                  'uid_plan',
                                                                  isEqualTo:
                                                                      wrapPlansRecord
                                                                          .reference
                                                                          .id,
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
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: FFButtonWidget(
                                                        onPressed: (loggedIn &&
                                                                (containerUsersPlansRecord !=
                                                                    null))
                                                            ? null
                                                            : () async {
                                                                if (wrapPlansRecord
                                                                        .uid ==
                                                                    '9T75Yb8XEX6YMb8KupV6') {
                                                                  await containerUsersPlansRecord!
                                                                      .reference
                                                                      .update(
                                                                          createUsersPlansRecordData(
                                                                    uidPlan:
                                                                        wrapPlansRecord
                                                                            .reference
                                                                            .id,
                                                                  ));
                                                                } else {
                                                                  _model.qDevisa =
                                                                      await GetCambioDevisaCall
                                                                          .call();

                                                                  _model.codigoPasarela =
                                                                      functions
                                                                          .generarCodigoPasrela();
                                                                  safeSetState(
                                                                      () {});
                                                                  _model.tokenAccesoPaypal =
                                                                      await actions
                                                                          .getPaypalAccessToken();
                                                                  _model.id =
                                                                      await actions
                                                                          .createPaypalOrder(
                                                                    _model
                                                                        .tokenAccesoPaypal!,
                                                                    'https://aularisk.com/businessPlans',
                                                                    _model
                                                                        .codigoPasarela!,
                                                                    1.0,
                                                                    GetCambioDevisaCall
                                                                        .cambioDolar(
                                                                      (_model.qDevisa
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )!,
                                                                    'https://aularisk.com/loading',
                                                                  );

                                                                  await PasarelaPagosRecord
                                                                      .collection
                                                                      .doc()
                                                                      .set({
                                                                    ...createPasarelaPagosRecordData(
                                                                      token: _model
                                                                          .tokenAccesoPaypal,
                                                                      ordenID:
                                                                          _model
                                                                              .id,
                                                                      codigo: _model
                                                                          .codigoPasarela,
                                                                      estado:
                                                                          'pendiente',
                                                                      uidPlan: wrapPlansRecord
                                                                          .reference
                                                                          .id,
                                                                      uidUser:
                                                                          currentUserReference
                                                                              ?.id,
                                                                    ),
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'created_time':
                                                                            FieldValue.serverTimestamp(),
                                                                      },
                                                                    ),
                                                                  });
                                                                  await launchURL(
                                                                      functions.redirectToPaypalURL(
                                                                          _model
                                                                              .id!));
                                                                }

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                        text: valueOrDefault<
                                                            String>(
                                                          wrapPlansRecord
                                                                      .priceD ==
                                                                  0.0
                                                              ? 'Únanse Gratis'
                                                              : 'Únanse por s/${valueOrDefault<String>(
                                                                  formatNumber(
                                                                    wrapPlansRecord
                                                                        .priceD,
                                                                    formatType:
                                                                        FormatType
                                                                            .custom,
                                                                    format: '',
                                                                    locale: '',
                                                                  ),
                                                                  '0',
                                                                )} / Mes',
                                                          'Únanse Gratis',
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width: 242.0,
                                                          height: 51.0,
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
                                                                    fontSize:
                                                                        15.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          disabledColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                          disabledTextColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryBackground,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ]
                                                  .divide(
                                                      SizedBox(height: 30.0))
                                                  .around(
                                                      SizedBox(height: 30.0)),
                                            ),
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ]
                                  .divide(SizedBox(height: 30.0))
                                  .around(SizedBox(height: 30.0)),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: wrapWithModel(
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
          ),
        ));
  }
}
