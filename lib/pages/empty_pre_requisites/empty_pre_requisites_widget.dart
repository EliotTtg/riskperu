import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_pre_requisites_model.dart';
export 'empty_pre_requisites_model.dart';

class EmptyPreRequisitesWidget extends StatefulWidget {
  const EmptyPreRequisitesWidget({super.key});

  @override
  State<EmptyPreRequisitesWidget> createState() =>
      _EmptyPreRequisitesWidgetState();
}

class _EmptyPreRequisitesWidgetState extends State<EmptyPreRequisitesWidget> {
  late EmptyPreRequisitesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyPreRequisitesModel());

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
        'No se encontraron acciones',
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
