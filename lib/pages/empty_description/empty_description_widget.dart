import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_description_model.dart';
export 'empty_description_model.dart';

class EmptyDescriptionWidget extends StatefulWidget {
  const EmptyDescriptionWidget({super.key});

  @override
  State<EmptyDescriptionWidget> createState() => _EmptyDescriptionWidgetState();
}

class _EmptyDescriptionWidgetState extends State<EmptyDescriptionWidget> {
  late EmptyDescriptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyDescriptionModel());

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
        'No se encontraron descripciones',
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
