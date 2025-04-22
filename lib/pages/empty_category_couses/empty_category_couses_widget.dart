import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_category_couses_model.dart';
export 'empty_category_couses_model.dart';

class EmptyCategoryCousesWidget extends StatefulWidget {
  const EmptyCategoryCousesWidget({super.key});

  @override
  State<EmptyCategoryCousesWidget> createState() =>
      _EmptyCategoryCousesWidgetState();
}

class _EmptyCategoryCousesWidgetState extends State<EmptyCategoryCousesWidget> {
  late EmptyCategoryCousesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyCategoryCousesModel());

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
        'No se encontraron cursos',
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
