import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cbo_estado_model.dart';
export 'cbo_estado_model.dart';

class CboEstadoWidget extends StatefulWidget {
  const CboEstadoWidget({
    super.key,
    this.parameter1,
    this.parameter3,
  });

  final bool? parameter1;
  final DocumentReference? parameter3;

  @override
  State<CboEstadoWidget> createState() => _CboEstadoWidgetState();
}

class _CboEstadoWidgetState extends State<CboEstadoWidget> {
  late CboEstadoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CboEstadoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: FlutterFlowDropDown<bool>(
        controller: _model.cboEstadoValueController ??=
            FormFieldController<bool>(null),
        options: List<bool>.from([true, false]),
        optionLabels: ['Activo', 'Inactivo'],
        onChanged: (val) async {
          safeSetState(() => _model.cboEstadoValue = val);
          await widget.parameter3!.update(createResultadosRecordData(
            estado: _model.cboEstadoValue,
          ));
          safeSetState(() {
            _model.cboEstadoValueController?.reset();
          });
        },
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              font: GoogleFonts.montserrat(
                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
              color: FlutterFlowTheme.of(context).secondaryBackground,
              letterSpacing: 0.0,
              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            ),
        hintText: valueOrDefault<String>(
          widget.parameter1! ? 'Activo' : 'Inactivo',
          'Activo',
        ),
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: FlutterFlowTheme.of(context).secondaryBackground,
          size: 24.0,
        ),
        fillColor: valueOrDefault<Color>(
          widget.parameter1!
              ? FlutterFlowTheme.of(context).success
              : FlutterFlowTheme.of(context).error,
          Color(0xFF00AC7E),
        ),
        elevation: 2.0,
        borderColor: FlutterFlowTheme.of(context).secondaryBackground,
        borderWidth: 0.0,
        borderRadius: 4.0,
        margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
        hidesUnderline: true,
        isOverButton: false,
        isSearchable: false,
        isMultiSelect: false,
      ),
    );
  }
}
