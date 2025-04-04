import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RespuestasRecord extends FirestoreRecord {
  RespuestasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "uid_pregunta" field.
  String? _uidPregunta;
  String get uidPregunta => _uidPregunta ?? '';
  bool hasUidPregunta() => _uidPregunta != null;

  // "texto_respuesta" field.
  String? _textoRespuesta;
  String get textoRespuesta => _textoRespuesta ?? '';
  bool hasTextoRespuesta() => _textoRespuesta != null;

  // "es_correcta" field.
  bool? _esCorrecta;
  bool get esCorrecta => _esCorrecta ?? false;
  bool hasEsCorrecta() => _esCorrecta != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _uidPregunta = snapshotData['uid_pregunta'] as String?;
    _textoRespuesta = snapshotData['texto_respuesta'] as String?;
    _esCorrecta = snapshotData['es_correcta'] as bool?;
    _createdDate = snapshotData['created_date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('respuestas');

  static Stream<RespuestasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RespuestasRecord.fromSnapshot(s));

  static Future<RespuestasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RespuestasRecord.fromSnapshot(s));

  static RespuestasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RespuestasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RespuestasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RespuestasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RespuestasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RespuestasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRespuestasRecordData({
  String? uid,
  String? uidPregunta,
  String? textoRespuesta,
  bool? esCorrecta,
  DateTime? createdDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'uid_pregunta': uidPregunta,
      'texto_respuesta': textoRespuesta,
      'es_correcta': esCorrecta,
      'created_date': createdDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class RespuestasRecordDocumentEquality implements Equality<RespuestasRecord> {
  const RespuestasRecordDocumentEquality();

  @override
  bool equals(RespuestasRecord? e1, RespuestasRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.uidPregunta == e2?.uidPregunta &&
        e1?.textoRespuesta == e2?.textoRespuesta &&
        e1?.esCorrecta == e2?.esCorrecta &&
        e1?.createdDate == e2?.createdDate;
  }

  @override
  int hash(RespuestasRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.uidPregunta,
        e?.textoRespuesta,
        e?.esCorrecta,
        e?.createdDate
      ]);

  @override
  bool isValidKey(Object? o) => o is RespuestasRecord;
}
