import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'empty_student_model.dart';
export 'empty_student_model.dart';

class EmptyStudentWidget extends StatefulWidget {
  const EmptyStudentWidget({super.key});

  @override
  State<EmptyStudentWidget> createState() => _EmptyStudentWidgetState();
}

class _EmptyStudentWidgetState extends State<EmptyStudentWidget> {
  late EmptyStudentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyStudentModel());

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
        'No se encontraron estudiantes',
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
