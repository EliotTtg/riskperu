import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/cbo_estado/cbo_estado_widget.dart';
import '/pages/empty_students/empty_students_widget.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'lista_estudiantes_examen_model.dart';
export 'lista_estudiantes_examen_model.dart';

class ListaEstudiantesExamenWidget extends StatefulWidget {
  const ListaEstudiantesExamenWidget({
    super.key,
    required this.refExamen,
  });

  final ExamenesRecord? refExamen;

  @override
  State<ListaEstudiantesExamenWidget> createState() =>
      _ListaEstudiantesExamenWidgetState();
}

class _ListaEstudiantesExamenWidgetState
    extends State<ListaEstudiantesExamenWidget> {
  late ListaEstudiantesExamenModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListaEstudiantesExamenModel());

    _model.txttituloTextController ??=
        TextEditingController(text: widget.refExamen?.nombre);
    _model.txttituloFocusNode ??= FocusNode();

    _model.txttiempolimiteTextController ??= TextEditingController(
        text: widget.refExamen?.tiempoLimite.toString());
    _model.txttiempolimiteFocusNode ??= FocusNode();

    _model.txtencargadoTextController ??= TextEditingController();
    _model.txtencargadoFocusNode ??= FocusNode();

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
                  child: Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                Text(
                                  'Lista de Estudiantes',
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
                                    borderRadius: BorderRadius.circular(3.0),
                                  ),
                                ),
                              ].divide(SizedBox(height: 2.0)),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nombre del Examen',
                                      style: FlutterFlowTheme.of(context)
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
                                        controller:
                                            _model.txttituloTextController,
                                        focusNode: _model.txttituloFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
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
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: '---',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Color(0xFFA8A8A8),
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFE4E4E7),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFE4E4E7),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor: Color(0xFFE4E4E7),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Tiempo Limite (minutos)',
                                            style: FlutterFlowTheme.of(context)
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
                                                  .txttiempolimiteTextController,
                                              focusNode: _model
                                                  .txttiempolimiteFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.txttiempolimiteTextController',
                                                Duration(milliseconds: 1000),
                                                () => safeSetState(() {}),
                                              ),
                                              autofocus: false,
                                              readOnly: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText: '---',
                                                hintStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xFFA8A8A8),
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
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
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
                                                    color: FlutterFlowTheme.of(
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
                                            style: FlutterFlowTheme.of(context)
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
                                                  .txtencargadoTextController,
                                              focusNode:
                                                  _model.txtencargadoFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.txtencargadoTextController',
                                                Duration(milliseconds: 1000),
                                                () => safeSetState(() {}),
                                              ),
                                              autofocus: false,
                                              readOnly: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText: '---',
                                                hintStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xFFA8A8A8),
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
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
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
                                                    color: FlutterFlowTheme.of(
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
                                                  .txtencargadoTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 5.0)),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 40.0)),
                                ),
                                StreamBuilder<List<ResultadosRecord>>(
                                  stream: queryResultadosRecord(
                                    queryBuilder: (resultadosRecord) =>
                                        resultadosRecord
                                            .where(
                                              'examen_ref',
                                              isEqualTo: widget.refExamen
                                                          ?.reference.id !=
                                                      ''
                                                  ? widget
                                                      .refExamen?.reference.id
                                                  : null,
                                            )
                                            .where(
                                              'type',
                                              isEqualTo: 1,
                                            )
                                            .orderBy('created_date',
                                                descending: true),
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
                                    List<ResultadosRecord>
                                        containerResultadosRecordList =
                                        snapshot.data!;

                                    return Container(
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Estudiantes',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xFF17232B),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Flexible(
                                                child: StreamBuilder<
                                                    List<UsersRecord>>(
                                                  stream: queryUsersRecord(
                                                    queryBuilder: (usersRecord) =>
                                                        usersRecord
                                                            .where(
                                                              'userType',
                                                              isEqualTo: 2,
                                                            )
                                                            .whereNotIn(
                                                                'uid',
                                                                containerResultadosRecordList
                                                                            .map((e) => e
                                                                                .estudianteRef)
                                                                            .toList() !=
                                                                        ''
                                                                    ? containerResultadosRecordList
                                                                        .map((e) => e
                                                                            .estudianteRef)
                                                                        .toList()
                                                                    : null)
                                                            .orderBy(
                                                                'created_time',
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
                                                    List<UsersRecord>
                                                        cboencargadosUsersRecordList =
                                                        snapshot.data!;

                                                    return FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .cboencargadosValueController ??=
                                                          FormFieldController<
                                                              String>(
                                                        _model.cboencargadosValue ??=
                                                            '',
                                                      ),
                                                      options: List<
                                                              String>.from(
                                                          cboencargadosUsersRecordList
                                                              .map((e) => e
                                                                  .reference.id)
                                                              .toList()),
                                                      optionLabels:
                                                          cboencargadosUsersRecordList
                                                              .map((e) =>
                                                                  e.displayName)
                                                              .toList(),
                                                      onChanged: (val) async {
                                                        safeSetState(() => _model
                                                                .cboencargadosValue =
                                                            val);
                                                        _model.refEstudiant =
                                                            await queryUsersRecordOnce(
                                                          queryBuilder:
                                                              (usersRecord) =>
                                                                  usersRecord
                                                                      .where(
                                                            'uid',
                                                            isEqualTo: _model
                                                                .cboencargadosValue,
                                                          ),
                                                          singleRecord: true,
                                                        ).then((s) =>
                                                                s.firstOrNull);
                                                        _model.refUser =
                                                            _model.refEstudiant;
                                                        _model
                                                            .updatePage(() {});

                                                        safeSetState(() {});
                                                      },
                                                      height: 39.0,
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
                                                      hintText: 'Seleccione',
                                                      searchHintText:
                                                          'Buscar estudiantes..',
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      elevation: 2.0,
                                                      borderColor:
                                                          Color(0xFFE4E4E7),
                                                      borderWidth: 0.0,
                                                      borderRadius: 4.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      hidesUnderline: true,
                                                      isOverButton: false,
                                                      isSearchable: true,
                                                      isMultiSelect: false,
                                                    );
                                                  },
                                                ),
                                              ),
                                              FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                buttonSize: 39.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                icon: Icon(
                                                  Icons.add_circle_outline,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 25.0,
                                                ),
                                                onPressed: () async {
                                                  final firestoreBatch =
                                                      FirebaseFirestore.instance
                                                          .batch();
                                                  try {
                                                    if (_model.refUser !=
                                                        null) {
                                                      var resultadosRecordReference =
                                                          ResultadosRecord
                                                              .collection
                                                              .doc();
                                                      firestoreBatch.set(
                                                          resultadosRecordReference,
                                                          createResultadosRecordData(
                                                            createdDate:
                                                                getCurrentTimestamp,
                                                            estudianteRef:
                                                                _model
                                                                    .refUser
                                                                    ?.reference
                                                                    .id,
                                                            examenRef: widget
                                                                .refExamen
                                                                ?.reference
                                                                .id,
                                                            estado: true,
                                                          ));
                                                      _model.refUserExamen =
                                                          ResultadosRecord
                                                              .getDocumentFromData(
                                                                  createResultadosRecordData(
                                                                    createdDate:
                                                                        getCurrentTimestamp,
                                                                    estudianteRef: _model
                                                                        .refUser
                                                                        ?.reference
                                                                        .id,
                                                                    examenRef: widget
                                                                        .refExamen
                                                                        ?.reference
                                                                        .id,
                                                                    estado:
                                                                        true,
                                                                  ),
                                                                  resultadosRecordReference);

                                                      firestoreBatch.update(
                                                          _model.refUserExamen!
                                                              .reference,
                                                          createResultadosRecordData(
                                                            uid: _model
                                                                .refUserExamen
                                                                ?.reference
                                                                .id,
                                                          ));

                                                      var actionsRecordReference =
                                                          ActionsRecord
                                                              .collection
                                                              .doc();
                                                      firestoreBatch.set(
                                                          actionsRecordReference,
                                                          {
                                                            ...createActionsRecordData(
                                                              uidUser:
                                                                  currentUserReference
                                                                      ?.id,
                                                              descripction:
                                                                  'Agrego al estudiante ${_model.refEstudiant?.displayName} al examen ${_model.txttituloTextController.text}',
                                                            ),
                                                            ...mapToFirestore(
                                                              {
                                                                'Created_Date':
                                                                    FieldValue
                                                                        .serverTimestamp(),
                                                              },
                                                            ),
                                                          });
                                                      _model.refAction =
                                                          ActionsRecord
                                                              .getDocumentFromData({
                                                        ...createActionsRecordData(
                                                          uidUser:
                                                              currentUserReference
                                                                  ?.id,
                                                          descripction:
                                                              'Agrego al estudiante ${_model.refEstudiant?.displayName} al examen ${_model.txttituloTextController.text}',
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'Created_Date':
                                                                DateTime.now(),
                                                          },
                                                        ),
                                                      }, actionsRecordReference);

                                                      firestoreBatch.update(
                                                          _model.refAction!
                                                              .reference,
                                                          createActionsRecordData(
                                                            uid: _model
                                                                .refAction
                                                                ?.reference
                                                                .id,
                                                          ));
                                                      _model.refUser = null;
                                                      _model.updatePage(() {});
                                                    }
                                                  } finally {
                                                    await firestoreBatch
                                                        .commit();
                                                  }

                                                  safeSetState(() {});
                                                },
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: 250.0,
                                            decoration: BoxDecoration(),
                                            child: Builder(
                                              builder: (context) {
                                                final listaResultados =
                                                    containerResultadosRecordList
                                                        .toList();
                                                if (listaResultados.isEmpty) {
                                                  return Center(
                                                    child: Container(
                                                      height: 250.0,
                                                      child:
                                                          EmptyStudentsWidget(),
                                                    ),
                                                  );
                                                }

                                                return FlutterFlowDataTable<
                                                    ResultadosRecord>(
                                                  controller: _model
                                                      .paginatedDataTableController,
                                                  data: listaResultados,
                                                  columnsBuilder:
                                                      (onSortChanged) => [
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Text(
                                                          'Nombre Completo',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFF212529),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Text(
                                                          'Estado',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFF212529),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Text(
                                                          'Fecha de inicio',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFF212529),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Text(
                                                          'Fecha de finalización\t',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFF212529),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Text(
                                                          'Calificación',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFF212529),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Text(
                                                          'Resultado\t',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFF212529),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                  dataRowBuilder:
                                                      (listaResultadosItem,
                                                              listaResultadosIndex,
                                                              selected,
                                                              onSelectChanged) =>
                                                          DataRow(
                                                    color: WidgetStateProperty
                                                        .all(
                                                      listaResultadosIndex %
                                                                  2 ==
                                                              0
                                                          ? Color(0xFFF6F6F6)
                                                          : Colors.white,
                                                    ),
                                                    cells: [
                                                      FutureBuilder<
                                                          List<UsersRecord>>(
                                                        future:
                                                            queryUsersRecordOnce(
                                                          queryBuilder:
                                                              (usersRecord) =>
                                                                  usersRecord
                                                                      .where(
                                                            'uid',
                                                            isEqualTo:
                                                                listaResultadosItem
                                                                    .estudianteRef,
                                                          ),
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          List<UsersRecord>
                                                              textUsersRecordList =
                                                              snapshot.data!;
                                                          final textUsersRecord =
                                                              textUsersRecordList
                                                                      .isNotEmpty
                                                                  ? textUsersRecordList
                                                                      .first
                                                                  : null;

                                                          return Text(
                                                            valueOrDefault<
                                                                String>(
                                                              textUsersRecord
                                                                  ?.displayName,
                                                              '---',
                                                            ),
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          );
                                                        },
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .cboEstadoModels
                                                            .getModel(
                                                          listaResultadosItem
                                                              .reference.id,
                                                          listaResultadosIndex,
                                                        ),
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        updateOnChange: true,
                                                        child: CboEstadoWidget(
                                                          key: Key(
                                                            'Key2vs_${listaResultadosItem.reference.id}',
                                                          ),
                                                          parameter1: listaResultadosItem
                                                                      .estado !=
                                                                  null
                                                              ? listaResultadosItem
                                                                  .estado
                                                              : false,
                                                          parameter3:
                                                              listaResultadosItem
                                                                  .reference,
                                                        ),
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          dateTimeFormat(
                                                            "d/M/y",
                                                            listaResultadosItem
                                                                .fechaInicioExamen,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          '-- / -- / ----',
                                                        ),
                                                        maxLines: 1,
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
                                                      Text(
                                                        valueOrDefault<String>(
                                                          dateTimeFormat(
                                                            "d/M/y",
                                                            listaResultadosItem
                                                                .fechaFinExamen,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          '-- / -- / ----',
                                                        ),
                                                        maxLines: 1,
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
                                                      Text(
                                                        valueOrDefault<String>(
                                                          formatNumber(
                                                            listaResultadosItem
                                                                .calificacion,
                                                            formatType:
                                                                FormatType
                                                                    .custom,
                                                            format: '0.00',
                                                            locale: '',
                                                          ),
                                                          '--',
                                                        ),
                                                        maxLines: 1,
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
                                                      Text(
                                                        valueOrDefault<String>(
                                                          () {
                                                            if (listaResultadosItem
                                                                    .calificacion >=
                                                                14.0) {
                                                              return 'Aprobado';
                                                            } else if ((listaResultadosItem
                                                                        .calificacion <=
                                                                    13.0) &&
                                                                (listaResultadosItem
                                                                        .calificacion >=
                                                                    0.0)) {
                                                              return 'Desaprobado';
                                                            } else {
                                                              return 'Pendiente';
                                                            }
                                                          }(),
                                                          'Pendiente',
                                                        ),
                                                        maxLines: 1,
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
                                                    ]
                                                        .map((c) => DataCell(c))
                                                        .toList(),
                                                  ),
                                                  emptyBuilder: () => Center(
                                                    child: Container(
                                                      height: 250.0,
                                                      child:
                                                          EmptyStudentsWidget(),
                                                    ),
                                                  ),
                                                  paginated: true,
                                                  selectable: false,
                                                  hidePaginator: false,
                                                  showFirstLastButtons: false,
                                                  minWidth: 800.0,
                                                  headingRowHeight: 56.0,
                                                  dataRowHeight: 48.0,
                                                  columnSpacing: 20.0,
                                                  headingRowColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  addHorizontalDivider: true,
                                                  addTopAndBottomDivider: false,
                                                  hideDefaultHorizontalDivider:
                                                      true,
                                                  horizontalDividerColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  horizontalDividerThickness:
                                                      1.0,
                                                  addVerticalDivider: false,
                                                );
                                              },
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 5.0)),
                                      ),
                                    );
                                  },
                                ),
                              ].divide(SizedBox(height: 10.0)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                  text: 'Cerrar Ventana',
                                  options: FFButtonOptions(
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        50.0, 0.0, 50.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                              ].divide(SizedBox(width: 20.0)),
                            ),
                          ].divide(SizedBox(height: 20.0)),
                        ),
                      ),
                    ),
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
