import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'empty_preguntas_frecuentes_model.dart';
export 'empty_preguntas_frecuentes_model.dart';

class EmptyPreguntasFrecuentesWidget extends StatefulWidget {
  const EmptyPreguntasFrecuentesWidget({super.key});

  @override
  State<EmptyPreguntasFrecuentesWidget> createState() =>
      _EmptyPreguntasFrecuentesWidgetState();
}

class _EmptyPreguntasFrecuentesWidgetState
    extends State<EmptyPreguntasFrecuentesWidget> {
  late EmptyPreguntasFrecuentesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyPreguntasFrecuentesModel());

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
        'No se encontraron preguntas frecuentes',
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
