import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'txtcontenido_model.dart';
export 'txtcontenido_model.dart';

class TxtcontenidoWidget extends StatefulWidget {
  const TxtcontenidoWidget({super.key});

  @override
  State<TxtcontenidoWidget> createState() => _TxtcontenidoWidgetState();
}

class _TxtcontenidoWidgetState extends State<TxtcontenidoWidget> {
  late TxtcontenidoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TxtcontenidoModel());

    _model.txtcontenidoTextController ??= TextEditingController();
    _model.txtcontenidoFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextFormField(
        controller: _model.txtcontenidoTextController,
        focusNode: _model.txtcontenidoFocusNode,
        onChanged: (_) => EasyDebounce.debounce(
          '_model.txtcontenidoTextController',
          Duration(milliseconds: 2000),
          () => safeSetState(() {}),
        ),
        autofocus: false,
        obscureText: false,
        decoration: InputDecoration(
          isDense: true,
          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Poppins',
                letterSpacing: 0.0,
              ),
          hintText: 'P.ej.: En el minuto 05:28...',
          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Poppins',
                color: Color(0xFFA2A2A2),
                letterSpacing: 0.0,
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          filled: true,
          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Poppins',
              letterSpacing: 0.0,
            ),
        maxLines: 5,
        maxLength: 255,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        buildCounter: (context,
                {required currentLength, required isFocused, maxLength}) =>
            null,
        cursorColor: FlutterFlowTheme.of(context).primaryText,
        validator:
            _model.txtcontenidoTextControllerValidator.asValidator(context),
      ),
    );
  }
}
