import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'loading_model.dart';
export 'loading_model.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key});

  static String routeName = 'Loading';
  static String routePath = 'loading';

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  late LoadingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.returnURLcodigo = await actions.obtenerLinkPaypalRegreso(
        context,
        'riskperu://riskperu.com${GoRouterState.of(context).uri.toString()}',
      );
      _model.qPasarela = await queryPasarelaPagosRecordOnce(
        queryBuilder: (pasarelaPagosRecord) => pasarelaPagosRecord.where(
          'codigo',
          isEqualTo: _model.returnURLcodigo,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.returnOrder = await actions.approveOrderPaypal(
        _model.qPasarela!.token,
        _model.qPasarela!.ordenID,
        _model.qPasarela!.codigo,
      );
      if (_model.returnOrder == 'exito') {
        _model.refuserplan = await queryPasarelaPagosRecordOnce(
          queryBuilder: (pasarelaPagosRecord) => pasarelaPagosRecord
              .where(
                'uid_user',
                isEqualTo: currentUserReference?.id,
              )
              .orderBy('created_time', descending: true),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        _model.userPlan = await queryUsersPlansRecordOnce(
          queryBuilder: (usersPlansRecord) => usersPlansRecord.where(
            'uid_user',
            isEqualTo: _model.refuserplan?.uidUser,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);

        await _model.userPlan!.reference.update({
          ...createUsersPlansRecordData(
            uidPlan: _model.refuserplan?.uidPlan,
          ),
          ...mapToFirestore(
            {
              'Update_date': FieldValue.serverTimestamp(),
            },
          ),
        });

        context.goNamed(
          BusinessPlansWidget.routeName,
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text('Error'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
      }

      await Future.delayed(const Duration(milliseconds: 5000));
    });

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
        title: 'Loading',
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
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/kpacita-ssg7c7/assets/mouvjylm6zw7/Risk_Peru_rebranding_final_Mesa_de_trabajo_1_copia_11.png',
                    ).image,
                  ),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0x5FFFFFFF),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).alternate,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Procesando tu pago, por favor espera un momento.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
