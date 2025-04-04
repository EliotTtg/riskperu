import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navbar_model.dart';
export 'navbar_model.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({
    super.key,
    int? state,
  }) : this.state = state ?? 1;

  final int state;

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  late NavbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: responsiveVisibility(
        context: context,
        phone: false,
        tablet: false,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 1.0, 0.0),
        child: Container(
          width: 73.0,
          decoration: BoxDecoration(
            color: Color(0xFF17236A),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (valueOrDefault(currentUserDocument?.userType, 0) ==
                            0) {
                          context.goNamed(
                            DashboardAdminWidget.routeName,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        } else {
                          if (valueOrDefault(
                                  currentUserDocument?.userType, 0) ==
                              1) {
                            context.goNamed(
                              DashboardTeacherWidget.routeName,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
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
                        }
                      },
                      child: Builder(
                        builder: (context) {
                          if (widget!.state == 2) {
                            return Container(
                              width: double.infinity,
                              height: 45.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Image.asset(
                                  'assets/images/descarga.png',
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            );
                          } else {
                            return Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 45.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF001830),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Image.asset(
                                    'assets/images/home_(2).png',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  if (valueOrDefault(currentUserDocument?.userType, 0) == 0)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (valueOrDefault(
                                    currentUserDocument?.userType, 0) ==
                                2) {
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
                              context.pushNamed(
                                AdministrationWidget.routeName,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            }

                            await Future.delayed(
                                const Duration(milliseconds: 1000));
                          },
                          child: Builder(
                            builder: (context) {
                              if (widget!.state == 1) {
                                return Container(
                                  width: double.infinity,
                                  height: 45.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Image.asset(
                                      'assets/images/727520.png',
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                );
                              } else {
                                return Container(
                                  width: double.infinity,
                                  height: 45.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF001830),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Image.asset(
                                      'assets/images/image_(4).png',
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  if (valueOrDefault(currentUserDocument?.userType, 0) == 1)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (valueOrDefault(
                                    currentUserDocument?.userType, 0) ==
                                2) {
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
                              context.pushNamed(
                                AdministrationTeacherWidget.routeName,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            }

                            await Future.delayed(
                                const Duration(milliseconds: 1000));
                          },
                          child: Builder(
                            builder: (context) {
                              if (widget!.state == 1) {
                                return Container(
                                  width: double.infinity,
                                  height: 45.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Image.asset(
                                      'assets/images/727520.png',
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                );
                              } else {
                                return Container(
                                  width: double.infinity,
                                  height: 45.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF001830),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Image.asset(
                                      'assets/images/image_(4).png',
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  if (loggedIn)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (valueOrDefault(
                                  currentUserDocument?.userType, 0) ==
                              2) {
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
                            context.pushNamed(
                              InformationWidget.routeName,
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
                        child: Builder(
                          builder: (context) {
                            if (widget!.state == 3) {
                              return Container(
                                width: double.infinity,
                                height: 45.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Image.asset(
                                    'assets/images/images_(1).png',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              );
                            } else {
                              return Container(
                                width: double.infinity,
                                height: 45.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF001830),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Image.asset(
                                    'assets/images/image_(3).png',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (valueOrDefault(currentUserDocument?.userType, 0) ==
                            2) {
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
                          context.pushNamed(
                            CoursesUserWidget.routeName,
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
                      child: Builder(
                        builder: (context) {
                          if (widget!.state == 4) {
                            return Container(
                              width: double.infinity,
                              height: 45.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Image.asset(
                                  'assets/images/learning_(1).png',
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            );
                          } else {
                            return Container(
                              width: double.infinity,
                              height: 45.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF001830),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Image.asset(
                                  'assets/images/learning.png',
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          NotesWidget.routeName,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      child: Builder(
                        builder: (context) {
                          if (widget!.state == 5) {
                            return Container(
                              width: double.infinity,
                              height: 45.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Image.asset(
                                  'assets/images/writing-tool_(1).png',
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            );
                          } else {
                            return Container(
                              width: double.infinity,
                              height: 45.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF001830),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Image.asset(
                                  'assets/images/writing-tool.png',
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (valueOrDefault(currentUserDocument?.userType, 0) ==
                            2) {
                          context.pushNamed(
                            CertificatesWidget.routeName,
                            queryParameters: {
                              'uidUser': serializeParam(
                                currentUserReference?.id,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        } else {
                          context.pushNamed(
                            CertificatesWidget.routeName,
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
                      child: Builder(
                        builder: (context) {
                          if (widget!.state == 6) {
                            return Container(
                              width: double.infinity,
                              height: 45.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Image.asset(
                                  'assets/images/quality_(1).png',
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            );
                          } else {
                            return Container(
                              width: double.infinity,
                              height: 45.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF001830),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Image.asset(
                                  'assets/images/quality_(2).png',
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
