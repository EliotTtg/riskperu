import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'loading_cart_model.dart';
export 'loading_cart_model.dart';

class LoadingCartWidget extends StatefulWidget {
  const LoadingCartWidget({super.key});

  static String routeName = 'LoadingCart';
  static String routePath = 'loadingCart';

  @override
  State<LoadingCartWidget> createState() => _LoadingCartWidgetState();
}

class _LoadingCartWidgetState extends State<LoadingCartWidget> {
  late LoadingCartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingCartModel());

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
        while (FFAppState().shoppingcart.length != 0) {
          var usersCoursesRecordReference = UsersCoursesRecord.collection.doc();
          await usersCoursesRecordReference.set({
            ...createUsersCoursesRecordData(
              uidUser: currentUserReference?.id,
              uidCourses: FFAppState().shoppingcart.elementAtOrNull(0),
            ),
            ...mapToFirestore(
              {
                'created_date': FieldValue.serverTimestamp(),
              },
            ),
          });
          _model.refCourseUser = UsersCoursesRecord.getDocumentFromData({
            ...createUsersCoursesRecordData(
              uidUser: currentUserReference?.id,
              uidCourses: FFAppState().shoppingcart.elementAtOrNull(0),
            ),
            ...mapToFirestore(
              {
                'created_date': DateTime.now(),
              },
            ),
          }, usersCoursesRecordReference);

          await _model.refCourseUser!.reference
              .update(createUsersCoursesRecordData(
            uid: _model.refCourseUser?.reference.id,
          ));
          FFAppState().removeAtIndexFromShoppingcart(0);
          safeSetState(() {});
        }
        _model.refuserplan = await queryPasarelaPagosRecordOnce(
          queryBuilder: (pasarelaPagosRecord) => pasarelaPagosRecord
              .where(
                'uid_user',
                isEqualTo: currentUserReference?.id,
              )
              .orderBy('created_time', descending: true),
          singleRecord: true,
        ).then((s) => s.firstOrNull);

        await _model.qPasarela!.reference.update(createPasarelaPagosRecordData(
          estado: 'pagado Carrito',
        ));

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

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'LoadingCart',
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
