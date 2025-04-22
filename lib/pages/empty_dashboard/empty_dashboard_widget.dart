import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_dashboard_model.dart';
export 'empty_dashboard_model.dart';

class EmptyDashboardWidget extends StatefulWidget {
  const EmptyDashboardWidget({super.key});

  @override
  State<EmptyDashboardWidget> createState() => _EmptyDashboardWidgetState();
}

class _EmptyDashboardWidgetState extends State<EmptyDashboardWidget> {
  late EmptyDashboardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyDashboardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Text(
        'No se encontraron cursos recientes',
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Montserrat',
              color: FlutterFlowTheme.of(context).alternate,
              fontSize: 16.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w300,
            ),
      ),
    );
  }
}
