import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_preguntas_frecuentes_respuestas_model.dart';
export 'empty_preguntas_frecuentes_respuestas_model.dart';

class EmptyPreguntasFrecuentesRespuestasWidget extends StatefulWidget {
  const EmptyPreguntasFrecuentesRespuestasWidget({super.key});

  @override
  State<EmptyPreguntasFrecuentesRespuestasWidget> createState() =>
      _EmptyPreguntasFrecuentesRespuestasWidgetState();
}

class _EmptyPreguntasFrecuentesRespuestasWidgetState
    extends State<EmptyPreguntasFrecuentesRespuestasWidget> {
  late EmptyPreguntasFrecuentesRespuestasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => EmptyPreguntasFrecuentesRespuestasModel());

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
        'No se encontraron respuestas',
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Poppins',
              color: FlutterFlowTheme.of(context).alternate,
              fontSize: 16.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w300,
            ),
      ),
    );
  }
}
