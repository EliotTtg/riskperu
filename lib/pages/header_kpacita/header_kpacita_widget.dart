import '/auth/base_auth_user_provider.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'header_kpacita_model.dart';
export 'header_kpacita_model.dart';

class HeaderKpacitaWidget extends StatefulWidget {
  const HeaderKpacitaWidget({
    super.key,
    int? state,
  }) : this.state = state ?? 1;

  final int state;

  @override
  State<HeaderKpacitaWidget> createState() => _HeaderKpacitaWidgetState();
}

class _HeaderKpacitaWidgetState extends State<HeaderKpacitaWidget> {
  late HeaderKpacitaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderKpacitaModel());

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
      height: 100.0,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Material(
            color: Colors.transparent,
            elevation: 0.0,
            child: Container(
              width: double.infinity,
              height: 60.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/logo_kapacita.png',
                        width: 100.0,
                        height: 200.0,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (!loggedIn)
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 50.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: 40.0,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Para Individuos',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Container(
                            width: 120.0,
                            height: 3.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                widget.state == 1
                                    ? FlutterFlowTheme.of(context)
                                        .secondaryBackground
                                    : Color(0xFF2E2E2E),
                                FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              borderRadius: BorderRadius.circular(100.0),
                              border: Border.all(
                                width: 0.0,
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 1.0)),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          HomeEnterpriseWidget.routeName,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      child: Container(
                        height: 40.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Para Empresas',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Container(
                              width: 120.0,
                              height: 3.0,
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  widget.state == 2
                                      ? FlutterFlowTheme.of(context)
                                          .secondaryBackground
                                      : Color(0xFF2E2E2E),
                                  Color(0xFF2E2E2E),
                                ),
                                borderRadius: BorderRadius.circular(100.0),
                                border: Border.all(
                                  width: 0.0,
                                ),
                              ),
                            ),
                          ].divide(SizedBox(height: 1.0)),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          HomeGovernmentWidget.routeName,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      child: Container(
                        height: 40.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Para Gobiernos',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Container(
                              width: 120.0,
                              height: 3.0,
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  widget.state == 3
                                      ? FlutterFlowTheme.of(context)
                                          .secondaryBackground
                                      : Color(0xFF2E2E2E),
                                  Color(0xFF2E2E2E),
                                ),
                                borderRadius: BorderRadius.circular(100.0),
                                border: Border.all(
                                  width: 0.0,
                                ),
                              ),
                            ),
                          ].divide(SizedBox(height: 1.0)),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 30.0)),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
