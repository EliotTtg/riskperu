import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DetallesResultadosRecord extends FirestoreRecord {
  DetallesResultadosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "uidResultado" field.
  String? _uidResultado;
  String get uidResultado => _uidResultado ?? '';
  bool hasUidResultado() => _uidResultado != null;

  // "respuestasCorrectas" field.
  int? _respuestasCorrectas;
  int get respuestasCorrectas => _respuestasCorrectas ?? 0;
  bool hasRespuestasCorrectas() => _respuestasCorrectas != null;

  // "respuestasIncorrectas" field.
  int? _respuestasIncorrectas;
  int get respuestasIncorrectas => _respuestasIncorrectas ?? 0;
  bool hasRespuestasIncorrectas() => _respuestasIncorrectas != null;

  // "nota" field.
  double? _nota;
  double get nota => _nota ?? 0.0;
  bool hasNota() => _nota != null;

  // "type" field.
  int? _type;
  int get type => _type ?? 0;
  bool hasType() => _type != null;

  // "porcentaje" field.
  int? _porcentaje;
  int get porcentaje => _porcentaje ?? 0;
  bool hasPorcentaje() => _porcentaje != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _uidResultado = snapshotData['uidResultado'] as String?;
    _respuestasCorrectas = castToType<int>(snapshotData['respuestasCorrectas']);
    _respuestasIncorrectas =
        castToType<int>(snapshotData['respuestasIncorrectas']);
    _nota = castToType<double>(snapshotData['nota']);
    _type = castToType<int>(snapshotData['type']);
    _porcentaje = castToType<int>(snapshotData['porcentaje']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('detalles_resultados');

  static Stream<DetallesResultadosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DetallesResultadosRecord.fromSnapshot(s));

  static Future<DetallesResultadosRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => DetallesResultadosRecord.fromSnapshot(s));

  static DetallesResultadosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DetallesResultadosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DetallesResultadosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DetallesResultadosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DetallesResultadosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DetallesResultadosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDetallesResultadosRecordData({
  String? uid,
  String? uidResultado,
  int? respuestasCorrectas,
  int? respuestasIncorrectas,
  double? nota,
  int? type,
  int? porcentaje,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'uidResultado': uidResultado,
      'respuestasCorrectas': respuestasCorrectas,
      'respuestasIncorrectas': respuestasIncorrectas,
      'nota': nota,
      'type': type,
      'porcentaje': porcentaje,
    }.withoutNulls,
  );

  return firestoreData;
}

class DetallesResultadosRecordDocumentEquality
    implements Equality<DetallesResultadosRecord> {
  const DetallesResultadosRecordDocumentEquality();

  @override
  bool equals(DetallesResultadosRecord? e1, DetallesResultadosRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.uidResultado == e2?.uidResultado &&
        e1?.respuestasCorrectas == e2?.respuestasCorrectas &&
        e1?.respuestasIncorrectas == e2?.respuestasIncorrectas &&
        e1?.nota == e2?.nota &&
        e1?.type == e2?.type &&
        e1?.porcentaje == e2?.porcentaje;
  }

  @override
  int hash(DetallesResultadosRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.uidResultado,
        e?.respuestasCorrectas,
        e?.respuestasIncorrectas,
        e?.nota,
        e?.type,
        e?.porcentaje
      ]);

  @override
  bool isValidKey(Object? o) => o is DetallesResultadosRecord;
}
