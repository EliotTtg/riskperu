import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'anuncio_plans_model.dart';
export 'anuncio_plans_model.dart';

class AnuncioPlansWidget extends StatefulWidget {
  const AnuncioPlansWidget({super.key});

  @override
  State<AnuncioPlansWidget> createState() => _AnuncioPlansWidgetState();
}

class _AnuncioPlansWidgetState extends State<AnuncioPlansWidget> {
  late AnuncioPlansModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnuncioPlansModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.asset(
            'assets/images/Frame_1171276047.png',
          ).image,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(25.0, 20.0, 25.0, 20.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Suscribete a un plan y conéctate con nuestra comunidad de profesionales.',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Montserrat',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          fontSize: 16.0,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.normal,
                          lineHeight: 1.0,
                        ),
                  ),
                  Container(
                    width: 247.0,
                    height: 3.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ].divide(SizedBox(height: 15.0)),
              ),
            ),
            Flexible(
              child: FFButtonWidget(
                onPressed: () async {
                  context.pushNamed(
                    BusinessPlansWidget.routeName,
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
                text: 'Ver Planes',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).error,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
