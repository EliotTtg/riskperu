import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_users_model.dart';
export 'empty_users_model.dart';

class EmptyUsersWidget extends StatefulWidget {
  const EmptyUsersWidget({super.key});

  @override
  State<EmptyUsersWidget> createState() => _EmptyUsersWidgetState();
}

class _EmptyUsersWidgetState extends State<EmptyUsersWidget> {
  late EmptyUsersModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyUsersModel());

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
        'No se encontraron usuarios',
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
