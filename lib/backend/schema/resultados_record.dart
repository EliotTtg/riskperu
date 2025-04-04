import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResultadosRecord extends FirestoreRecord {
  ResultadosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "estudiante_ref" field.
  String? _estudianteRef;
  String get estudianteRef => _estudianteRef ?? '';
  bool hasEstudianteRef() => _estudianteRef != null;

  // "examen_ref" field.
  String? _examenRef;
  String get examenRef => _examenRef ?? '';
  bool hasExamenRef() => _examenRef != null;

  // "calificacion" field.
  double? _calificacion;
  double get calificacion => _calificacion ?? 0.0;
  bool hasCalificacion() => _calificacion != null;

  // "fecha_inicio_examen" field.
  DateTime? _fechaInicioExamen;
  DateTime? get fechaInicioExamen => _fechaInicioExamen;
  bool hasFechaInicioExamen() => _fechaInicioExamen != null;

  // "fecha_fin_examen" field.
  DateTime? _fechaFinExamen;
  DateTime? get fechaFinExamen => _fechaFinExamen;
  bool hasFechaFinExamen() => _fechaFinExamen != null;

  // "estado" field.
  bool? _estado;
  bool get estado => _estado ?? false;
  bool hasEstado() => _estado != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "tiempo_restante" field.
  String? _tiempoRestante;
  String get tiempoRestante => _tiempoRestante ?? '';
  bool hasTiempoRestante() => _tiempoRestante != null;

  // "CantidadCorrectas" field.
  int? _cantidadCorrectas;
  int get cantidadCorrectas => _cantidadCorrectas ?? 0;
  bool hasCantidadCorrectas() => _cantidadCorrectas != null;

  // "tiempo_transcurrido" field.
  int? _tiempoTranscurrido;
  int get tiempoTranscurrido => _tiempoTranscurrido ?? 0;
  bool hasTiempoTranscurrido() => _tiempoTranscurrido != null;

  // "type" field.
  int? _type;
  int get type => _type ?? 0;
  bool hasType() => _type != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _estudianteRef = snapshotData['estudiante_ref'] as String?;
    _examenRef = snapshotData['examen_ref'] as String?;
    _calificacion = castToType<double>(snapshotData['calificacion']);
    _fechaInicioExamen = snapshotData['fecha_inicio_examen'] as DateTime?;
    _fechaFinExamen = snapshotData['fecha_fin_examen'] as DateTime?;
    _estado = snapshotData['estado'] as bool?;
    _createdDate = snapshotData['created_date'] as DateTime?;
    _tiempoRestante = snapshotData['tiempo_restante'] as String?;
    _cantidadCorrectas = castToType<int>(snapshotData['CantidadCorrectas']);
    _tiempoTranscurrido = castToType<int>(snapshotData['tiempo_transcurrido']);
    _type = castToType<int>(snapshotData['type']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('resultados');

  static Stream<ResultadosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResultadosRecord.fromSnapshot(s));

  static Future<ResultadosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ResultadosRecord.fromSnapshot(s));

  static ResultadosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResultadosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResultadosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResultadosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResultadosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResultadosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResultadosRecordData({
  String? uid,
  String? estudianteRef,
  String? examenRef,
  double? calificacion,
  DateTime? fechaInicioExamen,
  DateTime? fechaFinExamen,
  bool? estado,
  DateTime? createdDate,
  String? tiempoRestante,
  int? cantidadCorrectas,
  int? tiempoTranscurrido,
  int? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'estudiante_ref': estudianteRef,
      'examen_ref': examenRef,
      'calificacion': calificacion,
      'fecha_inicio_examen': fechaInicioExamen,
      'fecha_fin_examen': fechaFinExamen,
      'estado': estado,
      'created_date': createdDate,
      'tiempo_restante': tiempoRestante,
      'CantidadCorrectas': cantidadCorrectas,
      'tiempo_transcurrido': tiempoTranscurrido,
      'type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResultadosRecordDocumentEquality implements Equality<ResultadosRecord> {
  const ResultadosRecordDocumentEquality();

  @override
  bool equals(ResultadosRecord? e1, ResultadosRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.estudianteRef == e2?.estudianteRef &&
        e1?.examenRef == e2?.examenRef &&
        e1?.calificacion == e2?.calificacion &&
        e1?.fechaInicioExamen == e2?.fechaInicioExamen &&
        e1?.fechaFinExamen == e2?.fechaFinExamen &&
        e1?.estado == e2?.estado &&
        e1?.createdDate == e2?.createdDate &&
        e1?.tiempoRestante == e2?.tiempoRestante &&
        e1?.cantidadCorrectas == e2?.cantidadCorrectas &&
        e1?.tiempoTranscurrido == e2?.tiempoTranscurrido &&
        e1?.type == e2?.type;
  }

  @override
  int hash(ResultadosRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.estudianteRef,
        e?.examenRef,
        e?.calificacion,
        e?.fechaInicioExamen,
        e?.fechaFinExamen,
        e?.estado,
        e?.createdDate,
        e?.tiempoRestante,
        e?.cantidadCorrectas,
        e?.tiempoTranscurrido,
        e?.type
      ]);

  @override
  bool isValidKey(Object? o) => o is ResultadosRecord;
}
