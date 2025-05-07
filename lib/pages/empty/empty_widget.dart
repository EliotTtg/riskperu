import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'empty_model.dart';
export 'empty_model.dart';

class EmptyWidget extends StatefulWidget {
  const EmptyWidget({
    super.key,
    this.tex,
  });

  final String? tex;

  @override
  State<EmptyWidget> createState() => _EmptyWidgetState();
}

class _EmptyWidgetState extends State<EmptyWidget> {
  late EmptyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyModel());

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
        valueOrDefault<String>(
          widget.tex,
          'No se encontraron datos',
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              font: GoogleFonts.montserrat(
                fontWeight: FontWeight.w300,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
              color: FlutterFlowTheme.of(context).alternate,
              fontSize: 16.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w300,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            ),
      ),
    );
  }
}
