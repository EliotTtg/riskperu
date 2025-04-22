import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/empty_preguntas_frecuentes_respuestas/empty_preguntas_frecuentes_respuestas_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'lista_preguntas_examen_model.dart';
export 'lista_preguntas_examen_model.dart';

class ListaPreguntasExamenWidget extends StatefulWidget {
  const ListaPreguntasExamenWidget({
    super.key,
    required this.refExamen,
  });

  final ExamenesRecord? refExamen;

  @override
  State<ListaPreguntasExamenWidget> createState() =>
      _ListaPreguntasExamenWidgetState();
}

class _ListaPreguntasExamenWidgetState
    extends State<ListaPreguntasExamenWidget> {
  late ListaPreguntasExamenModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListaPreguntasExamenModel());

    _model.txttituloTextController ??=
        TextEditingController(text: widget.refExamen?.nombre);
    _model.txttituloFocusNode ??= FocusNode();

    _model.txttiempolimiteTextController ??= TextEditingController(
        text: widget.refExamen?.tiempoLimite.toString());
    _model.txttiempolimiteFocusNode ??= FocusNode();

    _model.txtencargadoTextController ??= TextEditingController();
    _model.txtencargadoFocusNode ??= FocusNode();

    _model.txtenunciadoTextController ??= TextEditingController();
    _model.txtenunciadoFocusNode ??= FocusNode();

    _model.txtpreguntaTextController ??= TextEditingController();
    _model.txtpreguntaFocusNode ??= FocusNode();

    _model.txtexplicacionTextController ??= TextEditingController();
    _model.txtexplicacionFocusNode ??= FocusNode();

    _model.txtrespuestaTextController ??= TextEditingController();
    _model.txtrespuestaFocusNode ??= FocusNode();

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
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0x18000000),
      ),
      child: SingleChildScrollView(
        primary: false,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(80.0, 50.0, 80.0, 50.0),
              child: Material(
                color: Colors.transparent,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF3F5FB),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(30.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Examen',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFF094B90),
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Container(
                                          width: 146.0,
                                          height: 3.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFDB0B17),
                                            borderRadius:
                                                BorderRadius.circular(3.0),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 2.0)),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Titulo',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Color(0xFF17232B),
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              child: TextFormField(
                                                controller: _model
                                                    .txttituloTextController,
                                                focusNode:
                                                    _model.txttituloFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.txttituloTextController',
                                                  Duration(milliseconds: 1000),
                                                  () => safeSetState(() {}),
                                                ),
                                                autofocus: false,
                                                readOnly: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintText: '---',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            Color(0xFFA8A8A8),
                                                        letterSpacing: 0.0,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xFFE4E4E7),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xFFE4E4E7),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor: Color(0xFFE4E4E7),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          letterSpacing: 0.0,
                                                        ),
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .txttituloTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 5.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Tiempo Limite (minutos)',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color:
                                                              Color(0xFF17232B),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .txttiempolimiteTextController,
                                                      focusNode: _model
                                                          .txttiempolimiteFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.txttiempolimiteTextController',
                                                        Duration(
                                                            milliseconds: 1000),
                                                        () =>
                                                            safeSetState(() {}),
                                                      ),
                                                      autofocus: false,
                                                      readOnly: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        hintText: '---',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Color(
                                                                      0xFFA8A8A8),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFFE4E4E7),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFFE4E4E7),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            Color(0xFFE4E4E7),
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            letterSpacing: 0.0,
                                                          ),
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .txttiempolimiteTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 5.0)),
                                              ),
                                            ),
                                            Flexible(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Profesor Encargado',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color:
                                                              Color(0xFF17232B),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .txtencargadoTextController,
                                                      focusNode: _model
                                                          .txtencargadoFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.txtencargadoTextController',
                                                        Duration(
                                                            milliseconds: 1000),
                                                        () =>
                                                            safeSetState(() {}),
                                                      ),
                                                      autofocus: false,
                                                      readOnly: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        hintText: '---',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Color(
                                                                      0xFFA8A8A8),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFFE4E4E7),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFFE4E4E7),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            Color(0xFFE4E4E7),
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            letterSpacing: 0.0,
                                                          ),
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .txtencargadoTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 5.0)),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 40.0)),
                                        ),
                                      ].divide(SizedBox(height: 10.0)),
                                    ),
                                    Divider(
                                      height: 2.0,
                                      thickness: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ].divide(SizedBox(height: 20.0)),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            _model.refPreguntaUpdate != null
                                                ? 'Actualizar Pregunta'
                                                : 'Agregar Pregunta',
                                            'Agregar Pregunta',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFF094B90),
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Container(
                                          width: 146.0,
                                          height: 3.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFDB0B17),
                                            borderRadius:
                                                BorderRadius.circular(3.0),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 2.0)),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Form(
                                          key: _model.formKey2,
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Enunciado',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color:
                                                              Color(0xFF17232B),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .txtenunciadoTextController,
                                                      focusNode: _model
                                                          .txtenunciadoFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.txtenunciadoTextController',
                                                        Duration(
                                                            milliseconds: 1000),
                                                        () =>
                                                            safeSetState(() {}),
                                                      ),
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        hintText: 'Escriba',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Color(
                                                                      0xFFA8A8A8),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFFE4E4E7),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFFE4E4E7),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            letterSpacing: 0.0,
                                                          ),
                                                      maxLines: null,
                                                      minLines: 5,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .txtenunciadoTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 5.0)),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Flexible(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Pregunta',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFF17232B),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          child: Container(
                                                            width: 250.0,
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .txtpreguntaTextController,
                                                              focusNode: _model
                                                                  .txtpreguntaFocusNode,
                                                              onChanged: (_) =>
                                                                  EasyDebounce
                                                                      .debounce(
                                                                '_model.txtpreguntaTextController',
                                                                Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                () =>
                                                                    safeSetState(
                                                                        () {}),
                                                              ),
                                                              autofocus: false,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                isDense: true,
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                hintText:
                                                                    'Escriba',
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: Color(
                                                                          0xFFA8A8A8),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xFFE4E4E7),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xFFE4E4E7),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                filled: true,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                              cursorColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              validator: _model
                                                                  .txtpreguntaTextControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Dominio',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFF17232B),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                        Container(
                                                          child:
                                                              FlutterFlowDropDown<
                                                                  int>(
                                                            controller: _model
                                                                    .cbodominiosValueController ??=
                                                                FormFieldController<
                                                                    int>(null),
                                                            options:
                                                                List<int>.from(
                                                                    [0, 1, 2]),
                                                            optionLabels: [
                                                              'Personas',
                                                              'Entorno de Negocio',
                                                              'Procesos'
                                                            ],
                                                            onChanged: (val) =>
                                                                safeSetState(() =>
                                                                    _model.cbodominiosValue =
                                                                        val),
                                                            height: 38.0,
                                                            maxHeight: 300.0,
                                                            searchHintTextStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            searchTextStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintText:
                                                                'Seleccione',
                                                            searchHintText:
                                                                'Buscar estudiantes..',
                                                            icon: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            elevation: 2.0,
                                                            borderColor: Color(
                                                                0xFFE4E4E7),
                                                            borderWidth: 0.0,
                                                            borderRadius: 4.0,
                                                            margin:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                            hidesUnderline:
                                                                true,
                                                            isOverButton: false,
                                                            isSearchable: true,
                                                            isMultiSelect:
                                                                false,
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 20.0)),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Explicacion de respuesta',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color:
                                                              Color(0xFF17232B),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .txtexplicacionTextController,
                                                      focusNode: _model
                                                          .txtexplicacionFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.txtexplicacionTextController',
                                                        Duration(
                                                            milliseconds: 1000),
                                                        () =>
                                                            safeSetState(() {}),
                                                      ),
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        hintText: 'Escriba',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Color(
                                                                      0xFFA8A8A8),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFFE4E4E7),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFFE4E4E7),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            letterSpacing: 0.0,
                                                          ),
                                                      maxLines: null,
                                                      minLines: 5,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .txtexplicacionTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 5.0)),
                                              ),
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  if (_model.formKey2
                                                              .currentState ==
                                                          null ||
                                                      !_model.formKey2
                                                          .currentState!
                                                          .validate()) {
                                                    return;
                                                  }
                                                  if (_model
                                                          .refPreguntaUpdate !=
                                                      null) {
                                                    await _model
                                                        .refPreguntaUpdate!
                                                        .reference
                                                        .update(
                                                            createPreguntasRecordData(
                                                      texto: _model
                                                          .txtpreguntaTextController
                                                          .text,
                                                      enunciado: _model
                                                          .txtenunciadoTextController
                                                          .text,
                                                      explicacion: _model
                                                          .txtexplicacionTextController
                                                          .text,
                                                      type: _model
                                                          .cbodominiosValue,
                                                    ));

                                                    var actionsRecordReference1 =
                                                        ActionsRecord.collection
                                                            .doc();
                                                    await actionsRecordReference1
                                                        .set(
                                                            createActionsRecordData(
                                                      uidUser:
                                                          currentUserReference
                                                              ?.id,
                                                      descripction:
                                                          'Actualizo la pregunta ${_model.refPreguntaUpdate?.texto} al examen ${widget.refExamen?.nombre}',
                                                      createdDate:
                                                          getCurrentTimestamp,
                                                    ));
                                                    _model.refActionUpdates =
                                                        ActionsRecord
                                                            .getDocumentFromData(
                                                                createActionsRecordData(
                                                                  uidUser:
                                                                      currentUserReference
                                                                          ?.id,
                                                                  descripction:
                                                                      'Actualizo la pregunta ${_model.refPreguntaUpdate?.texto} al examen ${widget.refExamen?.nombre}',
                                                                  createdDate:
                                                                      getCurrentTimestamp,
                                                                ),
                                                                actionsRecordReference1);

                                                    await _model
                                                        .refActionUpdates!
                                                        .reference
                                                        .update(
                                                            createActionsRecordData(
                                                      uid: _model
                                                          .refActionUpdates
                                                          ?.reference
                                                          .id,
                                                    ));
                                                  } else {
                                                    _model.countPreguntas =
                                                        await queryPreguntasRecordCount(
                                                      queryBuilder:
                                                          (preguntasRecord) =>
                                                              preguntasRecord
                                                                  .where(
                                                        'examen_ref',
                                                        isEqualTo: widget
                                                            .refExamen
                                                            ?.reference
                                                            .id,
                                                      ),
                                                    );
                                                    if (_model.countPreguntas! <
                                                        30) {
                                                      var preguntasRecordReference1 =
                                                          PreguntasRecord
                                                              .collection
                                                              .doc();
                                                      await preguntasRecordReference1
                                                          .set(
                                                              createPreguntasRecordData(
                                                        texto: _model
                                                            .txtpreguntaTextController
                                                            .text,
                                                        examenRef: widget
                                                            .refExamen
                                                            ?.reference
                                                            .id,
                                                        enunciado: _model
                                                            .txtenunciadoTextController
                                                            .text,
                                                        explicacion: _model
                                                            .txtexplicacionTextController
                                                            .text,
                                                        createdTime:
                                                            getCurrentTimestamp,
                                                        type: _model
                                                            .cbodominiosValue,
                                                      ));
                                                      _model.refQuestionCreate =
                                                          PreguntasRecord
                                                              .getDocumentFromData(
                                                                  createPreguntasRecordData(
                                                                    texto: _model
                                                                        .txtpreguntaTextController
                                                                        .text,
                                                                    examenRef: widget
                                                                        .refExamen
                                                                        ?.reference
                                                                        .id,
                                                                    enunciado: _model
                                                                        .txtenunciadoTextController
                                                                        .text,
                                                                    explicacion:
                                                                        _model
                                                                            .txtexplicacionTextController
                                                                            .text,
                                                                    createdTime:
                                                                        getCurrentTimestamp,
                                                                    type: _model
                                                                        .cbodominiosValue,
                                                                  ),
                                                                  preguntasRecordReference1);

                                                      await _model
                                                          .refQuestionCreate!
                                                          .reference
                                                          .update(
                                                              createPreguntasRecordData(
                                                        uid: _model
                                                            .refQuestionCreate
                                                            ?.reference
                                                            .id,
                                                      ));

                                                      var actionsRecordReference2 =
                                                          ActionsRecord
                                                              .collection
                                                              .doc();
                                                      await actionsRecordReference2
                                                          .set(
                                                              createActionsRecordData(
                                                        uidUser:
                                                            currentUserReference
                                                                ?.id,
                                                        descripction:
                                                            'Agregó la pregunta ${_model.refPreguntaUpdate?.texto} al examen ${widget.refExamen?.nombre}',
                                                        createdDate:
                                                            getCurrentTimestamp,
                                                      ));
                                                      _model.refActionCreate =
                                                          ActionsRecord
                                                              .getDocumentFromData(
                                                                  createActionsRecordData(
                                                                    uidUser:
                                                                        currentUserReference
                                                                            ?.id,
                                                                    descripction:
                                                                        'Agregó la pregunta ${_model.refPreguntaUpdate?.texto} al examen ${widget.refExamen?.nombre}',
                                                                    createdDate:
                                                                        getCurrentTimestamp,
                                                                  ),
                                                                  actionsRecordReference2);

                                                      await _model
                                                          .refActionCreate!
                                                          .reference
                                                          .update(
                                                              createActionsRecordData(
                                                        uid: _model
                                                            .refActionCreate
                                                            ?.reference
                                                            .id,
                                                      ));
                                                      _model.refOfQuestion =
                                                          await PreguntasRecord
                                                              .getDocumentOnce(_model
                                                                  .refQuestionCreate!
                                                                  .reference);
                                                      _model.refPreguntaUpdate =
                                                          _model.refOfQuestion;
                                                      safeSetState(() {});
                                                    }
                                                  }

                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 1000));

                                                  safeSetState(() {});
                                                },
                                                text: 'Guardar Pregunta',
                                                options: FFButtonOptions(
                                                  height: 50.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          50.0, 0.0, 50.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 10.0)),
                                          ),
                                        ),
                                        if (_model.refPreguntaUpdate != null)
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Divider(
                                                height: 2.0,
                                                thickness: 2.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Agregar Respuestas',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color:
                                                              Color(0xFF094B90),
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  Container(
                                                    width: 146.0,
                                                    height: 3.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFDB0B17),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3.0),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 2.0)),
                                              ),
                                              StreamBuilder<
                                                  List<RespuestasRecord>>(
                                                stream: queryRespuestasRecord(
                                                  queryBuilder:
                                                      (respuestasRecord) =>
                                                          respuestasRecord
                                                              .where(
                                                                'uid_pregunta',
                                                                isEqualTo: _model
                                                                    .refPreguntaUpdate
                                                                    ?.reference
                                                                    .id,
                                                              )
                                                              .orderBy(
                                                                  'created_date',
                                                                  descending:
                                                                      true),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 14.0,
                                                        height: 14.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<RespuestasRecord>
                                                      containerRespuestasRecordList =
                                                      snapshot.data!;

                                                  return Container(
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        RichText(
                                                          textScaler:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    'Alternativas ',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: Color(
                                                                          0xFF17232B),
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: '(',
                                                                style:
                                                                    TextStyle(),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  containerRespuestasRecordList
                                                                      .length
                                                                      .toString(),
                                                                  '0',
                                                                ),
                                                                style:
                                                                    TextStyle(),
                                                              ),
                                                              TextSpan(
                                                                text: ')',
                                                                style:
                                                                    TextStyle(),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Color(
                                                                      0xFF17232B),
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                        Form(
                                                          key: _model.formKey1,
                                                          autovalidateMode:
                                                              AutovalidateMode
                                                                  .disabled,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .txtrespuestaTextController,
                                                                    focusNode:
                                                                        _model
                                                                            .txtrespuestaFocusNode,
                                                                    onChanged: (_) =>
                                                                        EasyDebounce
                                                                            .debounce(
                                                                      '_model.txtrespuestaTextController',
                                                                      Duration(
                                                                          milliseconds:
                                                                              1000),
                                                                      () => safeSetState(
                                                                          () {}),
                                                                    ),
                                                                    autofocus:
                                                                        false,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      isDense:
                                                                          true,
                                                                      labelStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      hintText:
                                                                          'Escriba',
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                Color(0xFFA8A8A8),
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0xFFE4E4E7),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0xFFE4E4E7),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    cursorColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    validator: _model
                                                                        .txtrespuestaTextControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                ),
                                                              ),
                                                              FlutterFlowIconButton(
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                borderRadius:
                                                                    4.0,
                                                                buttonSize:
                                                                    39.0,
                                                                fillColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                icon: Icon(
                                                                  Icons
                                                                      .add_circle_outline,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  if (_model.formKey1
                                                                              .currentState ==
                                                                          null ||
                                                                      !_model
                                                                          .formKey1
                                                                          .currentState!
                                                                          .validate()) {
                                                                    return;
                                                                  }
                                                                  if (_model
                                                                          .refRespuesta !=
                                                                      null) {
                                                                    await _model
                                                                        .refRespuesta!
                                                                        .reference
                                                                        .update(
                                                                            createRespuestasRecordData(
                                                                      textoRespuesta: _model
                                                                          .txtrespuestaTextController
                                                                          .text,
                                                                    ));

                                                                    var actionsRecordReference1 =
                                                                        ActionsRecord
                                                                            .collection
                                                                            .doc();
                                                                    await actionsRecordReference1
                                                                        .set(
                                                                            createActionsRecordData(
                                                                      uidUser:
                                                                          currentUserReference
                                                                              ?.id,
                                                                      descripction:
                                                                          'Actualizo la respuesta ${_model.txtrespuestaTextController.text}de la pregunta ${_model.refPreguntaUpdate?.texto} del examen ${widget.refExamen?.nombre}',
                                                                      createdDate:
                                                                          getCurrentTimestamp,
                                                                    ));
                                                                    _model.refQuestionUpdates =
                                                                        ActionsRecord.getDocumentFromData(
                                                                            createActionsRecordData(
                                                                              uidUser: currentUserReference?.id,
                                                                              descripction: 'Actualizo la respuesta ${_model.txtrespuestaTextController.text}de la pregunta ${_model.refPreguntaUpdate?.texto} del examen ${widget.refExamen?.nombre}',
                                                                              createdDate: getCurrentTimestamp,
                                                                            ),
                                                                            actionsRecordReference1);

                                                                    await _model
                                                                        .refQuestionUpdates!
                                                                        .reference
                                                                        .update(
                                                                            createActionsRecordData(
                                                                      uid: _model
                                                                          .refQuestionUpdates
                                                                          ?.reference
                                                                          .id,
                                                                    ));
                                                                    _model.refRespuesta =
                                                                        null;
                                                                    safeSetState(
                                                                        () {});
                                                                  } else {
                                                                    var respuestasRecordReference =
                                                                        RespuestasRecord
                                                                            .collection
                                                                            .doc();
                                                                    await respuestasRecordReference
                                                                        .set(
                                                                            createRespuestasRecordData(
                                                                      uidPregunta: _model
                                                                          .refPreguntaUpdate
                                                                          ?.reference
                                                                          .id,
                                                                      textoRespuesta: _model
                                                                          .txtrespuestaTextController
                                                                          .text,
                                                                      createdDate:
                                                                          getCurrentTimestamp,
                                                                      esCorrecta:
                                                                          false,
                                                                    ));
                                                                    _model.refRespuestaCreate =
                                                                        RespuestasRecord.getDocumentFromData(
                                                                            createRespuestasRecordData(
                                                                              uidPregunta: _model.refPreguntaUpdate?.reference.id,
                                                                              textoRespuesta: _model.txtrespuestaTextController.text,
                                                                              createdDate: getCurrentTimestamp,
                                                                              esCorrecta: false,
                                                                            ),
                                                                            respuestasRecordReference);

                                                                    await _model
                                                                        .refRespuestaCreate!
                                                                        .reference
                                                                        .update(
                                                                            createRespuestasRecordData(
                                                                      uid: _model
                                                                          .refRespuestaCreate
                                                                          ?.reference
                                                                          .id,
                                                                    ));

                                                                    var actionsRecordReference2 =
                                                                        ActionsRecord
                                                                            .collection
                                                                            .doc();
                                                                    await actionsRecordReference2
                                                                        .set(
                                                                            createActionsRecordData(
                                                                      uidUser:
                                                                          currentUserReference
                                                                              ?.id,
                                                                      descripction:
                                                                          'Agregó la respuesta ${_model.txtrespuestaTextController.text} de la pregunta ${_model.refPreguntaUpdate?.texto} del examen ${widget.refExamen?.nombre}',
                                                                      createdDate:
                                                                          getCurrentTimestamp,
                                                                    ));
                                                                    _model.refActionCreateQuestionss =
                                                                        ActionsRecord.getDocumentFromData(
                                                                            createActionsRecordData(
                                                                              uidUser: currentUserReference?.id,
                                                                              descripction: 'Agregó la respuesta ${_model.txtrespuestaTextController.text} de la pregunta ${_model.refPreguntaUpdate?.texto} del examen ${widget.refExamen?.nombre}',
                                                                              createdDate: getCurrentTimestamp,
                                                                            ),
                                                                            actionsRecordReference2);

                                                                    await _model
                                                                        .refActionCreateQuestionss!
                                                                        .reference
                                                                        .update(
                                                                            createActionsRecordData(
                                                                      uid: _model
                                                                          .refActionCreateQuestionss
                                                                          ?.reference
                                                                          .id,
                                                                    ));
                                                                  }

                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .txtrespuestaTextController
                                                                        ?.clear();
                                                                  });

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                              ),
                                                              Builder(
                                                                builder:
                                                                    (context) {
                                                                  if (_model
                                                                      .stateViewQuestion) {
                                                                    return FlutterFlowIconButton(
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      borderRadius:
                                                                          4.0,
                                                                      buttonSize:
                                                                          39.0,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .visibility_off,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        _model.stateViewQuestion =
                                                                            false;
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                    );
                                                                  } else {
                                                                    return FlutterFlowIconButton(
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      borderRadius:
                                                                          4.0,
                                                                      buttonSize:
                                                                          39.0,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .visibility,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        _model.stateViewQuestion =
                                                                            true;
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 10.0)),
                                                          ),
                                                        ),
                                                        if (_model
                                                            .stateViewQuestion)
                                                          Builder(
                                                            builder: (context) {
                                                              final listRespuestas =
                                                                  containerRespuestasRecordList
                                                                      .toList();
                                                              if (listRespuestas
                                                                  .isEmpty) {
                                                                return Center(
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        250.0,
                                                                    child:
                                                                        EmptyPreguntasFrecuentesRespuestasWidget(),
                                                                  ),
                                                                );
                                                              }

                                                              return ListView
                                                                  .separated(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    listRespuestas
                                                                        .length,
                                                                separatorBuilder: (_,
                                                                        __) =>
                                                                    SizedBox(
                                                                        height:
                                                                            5.0),
                                                                itemBuilder:
                                                                    (context,
                                                                        listRespuestasIndex) {
                                                                  final listRespuestasItem =
                                                                      listRespuestas[
                                                                          listRespuestasIndex];
                                                                  return Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Flexible(
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            if (listRespuestasItem.esCorrecta) {
                                                                              await listRespuestasItem.reference.update(createRespuestasRecordData(
                                                                                esCorrecta: false,
                                                                              ));
                                                                            } else {
                                                                              await listRespuestasItem.reference.update(createRespuestasRecordData(
                                                                                esCorrecta: true,
                                                                              ));
                                                                            }

                                                                            await Future.delayed(const Duration(milliseconds: 1000));
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: valueOrDefault<Color>(
                                                                                listRespuestasItem.esCorrecta ? Color(0xFFC8E5CC) : Color(0xFFEFF3F6),
                                                                                Color(0xFFEFF3F6),
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Container(
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Builder(
                                                                                    builder: (context) {
                                                                                      if (listRespuestasItem.esCorrecta) {
                                                                                        return Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                          child: Icon(
                                                                                            Icons.check_circle,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            size: 16.0,
                                                                                          ),
                                                                                        );
                                                                                      } else {
                                                                                        return Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                          child: Icon(
                                                                                            Icons.circle_outlined,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            size: 16.0,
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                                Flexible(
                                                                                  child: Text(
                                                                                    listRespuestasItem.textoRespuesta,
                                                                                    textAlign: TextAlign.justify,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 5.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          FlutterFlowIconButton(
                                                                            borderColor:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            borderRadius:
                                                                                4.0,
                                                                            buttonSize:
                                                                                39.0,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.edit,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              _model.refRespuesta = listRespuestasItem;
                                                                              safeSetState(() {});
                                                                              safeSetState(() {
                                                                                _model.txtrespuestaTextController?.text = listRespuestasItem.textoRespuesta;
                                                                              });
                                                                            },
                                                                          ),
                                                                          FlutterFlowIconButton(
                                                                            borderColor:
                                                                                Color(0xFFE0E3E7),
                                                                            borderRadius:
                                                                                4.0,
                                                                            buttonSize:
                                                                                39.0,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.delete,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              if (_model.refRespuesta?.reference == listRespuestasItem.reference) {
                                                                                _model.refRespuesta = null;
                                                                                safeSetState(() {});
                                                                              }

                                                                              var actionsRecordReference = ActionsRecord.collection.doc();
                                                                              await actionsRecordReference.set(createActionsRecordData(
                                                                                uidUser: currentUserReference?.id,
                                                                                descripction: 'Elimino la respuesta ${listRespuestasItem.textoRespuesta} de la pregunta ${_model.refPreguntaUpdate?.texto} del examen ${widget.refExamen?.nombre}',
                                                                                createdDate: getCurrentTimestamp,
                                                                              ));
                                                                              _model.refQuestionDelete = ActionsRecord.getDocumentFromData(
                                                                                  createActionsRecordData(
                                                                                    uidUser: currentUserReference?.id,
                                                                                    descripction: 'Elimino la respuesta ${listRespuestasItem.textoRespuesta} de la pregunta ${_model.refPreguntaUpdate?.texto} del examen ${widget.refExamen?.nombre}',
                                                                                    createdDate: getCurrentTimestamp,
                                                                                  ),
                                                                                  actionsRecordReference);

                                                                              await _model.refQuestionDelete!.reference.update(createActionsRecordData(
                                                                                uid: _model.refQuestionDelete?.reference.id,
                                                                              ));
                                                                              await listRespuestasItem.reference.delete();

                                                                              safeSetState(() {});
                                                                            },
                                                                          ),
                                                                        ].divide(SizedBox(width: 10.0)),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            10.0)),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        Text(
                                                          'Por favor, asegúrate de marcar una opción como correcta antes de continuar.',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              if (containerRespuestasRecordList
                                                                  .where((e) =>
                                                                      e.esCorrecta)
                                                                  .toList()
                                                                  .isNotEmpty) {
                                                                _model.refPreguntaUpdate =
                                                                    null;
                                                                _model.refRespuesta =
                                                                    null;
                                                                safeSetState(
                                                                    () {});
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .txtenunciadoTextController
                                                                      ?.clear();
                                                                  _model
                                                                      .txtexplicacionTextController
                                                                      ?.clear();
                                                                  _model
                                                                      .txtpreguntaTextController
                                                                      ?.clear();
                                                                });
                                                              }
                                                            },
                                                            text: 'Finalizar',
                                                            options:
                                                                FFButtonOptions(
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          50.0,
                                                                          0.0,
                                                                          50.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ].divide(SizedBox(height: 10.0)),
                                          ),
                                      ].divide(SizedBox(height: 10.0)),
                                    ),
                                  ].divide(SizedBox(height: 20.0)),
                                ),
                                StreamBuilder<List<PreguntasRecord>>(
                                  stream: queryPreguntasRecord(
                                    queryBuilder: (preguntasRecord) =>
                                        preguntasRecord
                                            .where(
                                              'examen_ref',
                                              isEqualTo: widget.refExamen
                                                          ?.reference.id !=
                                                      ''
                                                  ? widget
                                                      .refExamen?.reference.id
                                                  : null,
                                            )
                                            .orderBy('created_time'),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 14.0,
                                          height: 14.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<PreguntasRecord>
                                        containerPreguntasRecordList =
                                        snapshot.data!;

                                    return Container(
                                      decoration: BoxDecoration(),
                                      child: Visibility(
                                        visible: containerPreguntasRecordList
                                            .isNotEmpty,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Divider(
                                              height: 2.0,
                                              thickness: 2.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Lista de Preguntas',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            Color(0xFF094B90),
                                                        fontSize: 24.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                Container(
                                                  width: 146.0,
                                                  height: 3.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFDB0B17),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3.0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 580.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final preguntas =
                                                          containerPreguntasRecordList
                                                              .toList();

                                                      return Container(
                                                        width: double.infinity,
                                                        child: Stack(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          40.0),
                                                              child: PageView
                                                                  .builder(
                                                                controller: _model
                                                                        .pageViewController ??=
                                                                    PageController(
                                                                        initialPage: max(
                                                                            0,
                                                                            min(0,
                                                                                preguntas.length - 1))),
                                                                onPageChanged: (_) =>
                                                                    safeSetState(
                                                                        () {}),
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                itemCount:
                                                                    preguntas
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        preguntasIndex) {
                                                                  final preguntasItem =
                                                                      preguntas[
                                                                          preguntasIndex];
                                                                  return SingleChildScrollView(
                                                                    primary:
                                                                        false,
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(20.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    RichText(
                                                                                      textScaler: MediaQuery.of(context).textScaler,
                                                                                      text: TextSpan(
                                                                                        children: [
                                                                                          TextSpan(
                                                                                            text: 'Pregunta',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  fontSize: 24.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: ' ',
                                                                                            style: TextStyle(),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: (preguntasIndex + 1).toString(),
                                                                                            style: TextStyle(),
                                                                                          )
                                                                                        ],
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              fontSize: 24.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        FlutterFlowIconButton(
                                                                                          borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                          borderRadius: 4.0,
                                                                                          buttonSize: 45.0,
                                                                                          icon: Icon(
                                                                                            Icons.edit,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            size: 24.0,
                                                                                          ),
                                                                                          onPressed: () async {
                                                                                            _model.refPreguntaUpdate = preguntasItem;
                                                                                            safeSetState(() {});
                                                                                            safeSetState(() {
                                                                                              _model.cbodominiosValueController?.value = preguntasItem.type;
                                                                                            });
                                                                                            safeSetState(() {
                                                                                              _model.txtenunciadoTextController?.text = preguntasItem.enunciado;
                                                                                            });
                                                                                            safeSetState(() {
                                                                                              _model.txtpreguntaTextController?.text = preguntasItem.texto;
                                                                                            });
                                                                                            safeSetState(() {
                                                                                              _model.txtexplicacionTextController?.text = preguntasItem.explicacion;
                                                                                            });
                                                                                          },
                                                                                        ),
                                                                                        FlutterFlowIconButton(
                                                                                          borderColor: Color(0xFFE0E3E7),
                                                                                          borderRadius: 4.0,
                                                                                          buttonSize: 45.0,
                                                                                          icon: Icon(
                                                                                            Icons.delete,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            size: 24.0,
                                                                                          ),
                                                                                          onPressed: () async {
                                                                                            if (_model.refPreguntaUpdate != null) {
                                                                                              safeSetState(() {
                                                                                                _model.txtenunciadoTextController?.clear();
                                                                                                _model.txtexplicacionTextController?.clear();
                                                                                                _model.txtrespuestaTextController?.clear();
                                                                                                _model.txtpreguntaTextController?.clear();
                                                                                              });
                                                                                              _model.refRespuesta = null;
                                                                                              _model.refPreguntaUpdate = null;
                                                                                              safeSetState(() {});
                                                                                            }

                                                                                            var actionsRecordReference = ActionsRecord.collection.doc();
                                                                                            await actionsRecordReference.set(createActionsRecordData(
                                                                                              uidUser: currentUserReference?.id,
                                                                                              descripction: 'Elimino la pregunta ${preguntasItem.texto} del examen ${widget.refExamen?.nombre}',
                                                                                              createdDate: getCurrentTimestamp,
                                                                                            ));
                                                                                            _model.refQuestionDeletes = ActionsRecord.getDocumentFromData(
                                                                                                createActionsRecordData(
                                                                                                  uidUser: currentUserReference?.id,
                                                                                                  descripction: 'Elimino la pregunta ${preguntasItem.texto} del examen ${widget.refExamen?.nombre}',
                                                                                                  createdDate: getCurrentTimestamp,
                                                                                                ),
                                                                                                actionsRecordReference);

                                                                                            await _model.refQuestionDeletes!.reference.update(createActionsRecordData(
                                                                                              uid: _model.refQuestionDeletes?.reference.id,
                                                                                            ));
                                                                                            await preguntasItem.reference.delete();

                                                                                            safeSetState(() {});
                                                                                          },
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 5.0)),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                if (preguntasItem.enunciado != '')
                                                                                  Text(
                                                                                    preguntasItem.enunciado,
                                                                                    textAlign: TextAlign.start,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          fontSize: 18.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    RichText(
                                                                                      textScaler: MediaQuery.of(context).textScaler,
                                                                                      text: TextSpan(
                                                                                        children: [
                                                                                          TextSpan(
                                                                                            text: preguntasItem.texto,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  fontSize: 18.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                ),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: ' ',
                                                                                            style: TextStyle(),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: '(',
                                                                                            style: TextStyle(
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontWeight: FontWeight.w300,
                                                                                            ),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: valueOrDefault<String>(
                                                                                              () {
                                                                                                if (preguntasItem.type == 0) {
                                                                                                  return 'PERSONAS';
                                                                                                } else if (preguntasItem.type == 1) {
                                                                                                  return 'ENTORNO DE NEGOCIO';
                                                                                                } else if (preguntasItem.type == 2) {
                                                                                                  return 'PROCESOS';
                                                                                                } else {
                                                                                                  return 'SIN DOMINIO';
                                                                                                }
                                                                                              }(),
                                                                                              'SIN DOMINIO',
                                                                                            ),
                                                                                            style: TextStyle(
                                                                                              color: Colors.black,
                                                                                              fontWeight: FontWeight.w300,
                                                                                            ),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: ')',
                                                                                            style: TextStyle(
                                                                                              color: Colors.black,
                                                                                              fontWeight: FontWeight.w300,
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              fontSize: 18.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                            ),
                                                                                      ),
                                                                                      textAlign: TextAlign.start,
                                                                                    ),
                                                                                    StreamBuilder<List<RespuestasRecord>>(
                                                                                      stream: queryRespuestasRecord(
                                                                                        queryBuilder: (respuestasRecord) => respuestasRecord
                                                                                            .where(
                                                                                              'uid_pregunta',
                                                                                              isEqualTo: preguntasItem.reference.id != '' ? preguntasItem.reference.id : null,
                                                                                            )
                                                                                            .orderBy('created_date', descending: true),
                                                                                      ),
                                                                                      builder: (context, snapshot) {
                                                                                        // Customize what your widget looks like when it's loading.
                                                                                        if (!snapshot.hasData) {
                                                                                          return Center(
                                                                                            child: SizedBox(
                                                                                              width: 14.0,
                                                                                              height: 14.0,
                                                                                              child: CircularProgressIndicator(
                                                                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        }
                                                                                        List<RespuestasRecord> listViewRespuestasRecordList = snapshot.data!;

                                                                                        return ListView.separated(
                                                                                          padding: EdgeInsets.zero,
                                                                                          shrinkWrap: true,
                                                                                          scrollDirection: Axis.vertical,
                                                                                          itemCount: listViewRespuestasRecordList.length,
                                                                                          separatorBuilder: (_, __) => SizedBox(height: 5.0),
                                                                                          itemBuilder: (context, listViewIndex) {
                                                                                            final listViewRespuestasRecord = listViewRespuestasRecordList[listViewIndex];
                                                                                            return Container(
                                                                                              decoration: BoxDecoration(
                                                                                                color: valueOrDefault<Color>(
                                                                                                  listViewRespuestasRecord.esCorrecta ? Color(0xFFC8E5CC) : Color(0xFFEFF3F6),
                                                                                                  Color(0xFFEFF3F6),
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                children: [
                                                                                                  Container(
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Builder(
                                                                                                      builder: (context) {
                                                                                                        if (listViewRespuestasRecord.esCorrecta) {
                                                                                                          return Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                            child: Icon(
                                                                                                              Icons.check_circle,
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              size: 16.0,
                                                                                                            ),
                                                                                                          );
                                                                                                        } else {
                                                                                                          return Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                            child: Icon(
                                                                                                              Icons.circle_outlined,
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              size: 16.0,
                                                                                                            ),
                                                                                                          );
                                                                                                        }
                                                                                                      },
                                                                                                    ),
                                                                                                  ),
                                                                                                  Flexible(
                                                                                                    child: Text(
                                                                                                      listViewRespuestasRecord.textoRespuesta,
                                                                                                      textAlign: TextAlign.justify,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Montserrat',
                                                                                                            fontSize: 14.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 5.0)),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 10.0)),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFFEFF3F6),
                                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                                      border: Border.all(
                                                                                        color: Color(0xFFCECECE),
                                                                                      ),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(20.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            'Correcto',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  color: FlutterFlowTheme.of(context).success,
                                                                                                  fontSize: 16.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                          Text(
                                                                                            'Respuesta Correcta',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                          Text(
                                                                                            preguntasItem.explicacion,
                                                                                            textAlign: TextAlign.start,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  fontSize: 16.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 10.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(height: 10.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 1.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            16.0),
                                                                child: smooth_page_indicator
                                                                    .SmoothPageIndicator(
                                                                  controller: _model
                                                                          .pageViewController ??=
                                                                      PageController(
                                                                          initialPage: max(
                                                                              0,
                                                                              min(0, preguntas.length - 1))),
                                                                  count: preguntas
                                                                      .length,
                                                                  axisDirection:
                                                                      Axis.horizontal,
                                                                  onDotClicked:
                                                                      (i) async {
                                                                    await _model
                                                                        .pageViewController!
                                                                        .animateToPage(
                                                                      i,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              500),
                                                                      curve: Curves
                                                                          .ease,
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  effect: smooth_page_indicator
                                                                      .SlideEffect(
                                                                    spacing:
                                                                        8.0,
                                                                    radius: 8.0,
                                                                    dotWidth:
                                                                        8.0,
                                                                    dotHeight:
                                                                        8.0,
                                                                    dotColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent1,
                                                                    activeDotColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    paintStyle:
                                                                        PaintingStyle
                                                                            .fill,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 4.0,
                                                          buttonSize: 40.0,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          icon: Icon(
                                                            Icons
                                                                .keyboard_double_arrow_left_sharp,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await _model
                                                                .pageViewController
                                                                ?.animateToPage(
                                                              0,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      500),
                                                              curve:
                                                                  Curves.ease,
                                                            );
                                                          },
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 4.0,
                                                          buttonSize: 40.0,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          icon: Icon(
                                                            Icons.chevron_left,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await _model
                                                                .pageViewController
                                                                ?.previousPage(
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      300),
                                                              curve:
                                                                  Curves.ease,
                                                            );
                                                          },
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 4.0,
                                                          buttonSize: 40.0,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          icon: Icon(
                                                            Icons.chevron_right,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await _model
                                                                .pageViewController
                                                                ?.nextPage(
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      300),
                                                              curve:
                                                                  Curves.ease,
                                                            );
                                                          },
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 4.0,
                                                          buttonSize: 40.0,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          icon: Icon(
                                                            Icons
                                                                .keyboard_double_arrow_right_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await _model
                                                                .pageViewController
                                                                ?.animateToPage(
                                                              containerPreguntasRecordList
                                                                  .length,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      500),
                                                              curve:
                                                                  Curves.ease,
                                                            );
                                                          },
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 5.0)),
                                                    ),
                                                    RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                (_model.pageViewCurrentIndex +
                                                                        1)
                                                                    .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text: ' de ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                containerPreguntasRecordList
                                                                    .length
                                                                    .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 5.0)),
                                                ),
                                              ].divide(SizedBox(height: 20.0)),
                                            ),
                                          ].divide(SizedBox(height: 20.0)),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Divider(
                                  height: 2.0,
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            Navigator.pop(context);
                                          },
                                          text: 'Cerrar Ventana',
                                          options: FFButtonOptions(
                                            height: 50.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    50.0, 0.0, 50.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 20.0)),
                                    ),
                                  ].divide(SizedBox(height: 20.0)),
                                ),
                              ].divide(SizedBox(height: 20.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ].divide(SizedBox(height: 50.0)).around(SizedBox(height: 50.0)),
        ),
      ),
    );
  }
}
