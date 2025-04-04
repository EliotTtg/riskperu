import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PreguntasRecord extends FirestoreRecord {
  PreguntasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "texto" field.
  String? _texto;
  String get texto => _texto ?? '';
  bool hasTexto() => _texto != null;

  // "examen_ref" field.
  String? _examenRef;
  String get examenRef => _examenRef ?? '';
  bool hasExamenRef() => _examenRef != null;

  // "enunciado" field.
  String? _enunciado;
  String get enunciado => _enunciado ?? '';
  bool hasEnunciado() => _enunciado != null;

  // "explicacion" field.
  String? _explicacion;
  String get explicacion => _explicacion ?? '';
  bool hasExplicacion() => _explicacion != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "type" field.
  int? _type;
  int get type => _type ?? 0;
  bool hasType() => _type != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _texto = snapshotData['texto'] as String?;
    _examenRef = snapshotData['examen_ref'] as String?;
    _enunciado = snapshotData['enunciado'] as String?;
    _explicacion = snapshotData['explicacion'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _video = snapshotData['video'] as String?;
    _type = castToType<int>(snapshotData['type']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('preguntas');

  static Stream<PreguntasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PreguntasRecord.fromSnapshot(s));

  static Future<PreguntasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PreguntasRecord.fromSnapshot(s));

  static PreguntasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PreguntasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PreguntasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PreguntasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PreguntasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PreguntasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPreguntasRecordData({
  String? uid,
  String? texto,
  String? examenRef,
  String? enunciado,
  String? explicacion,
  DateTime? createdTime,
  String? video,
  int? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'texto': texto,
      'examen_ref': examenRef,
      'enunciado': enunciado,
      'explicacion': explicacion,
      'created_time': createdTime,
      'video': video,
      'type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class PreguntasRecordDocumentEquality implements Equality<PreguntasRecord> {
  const PreguntasRecordDocumentEquality();

  @override
  bool equals(PreguntasRecord? e1, PreguntasRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.texto == e2?.texto &&
        e1?.examenRef == e2?.examenRef &&
        e1?.enunciado == e2?.enunciado &&
        e1?.explicacion == e2?.explicacion &&
        e1?.createdTime == e2?.createdTime &&
        e1?.video == e2?.video &&
        e1?.type == e2?.type;
  }

  @override
  int hash(PreguntasRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.texto,
        e?.examenRef,
        e?.enunciado,
        e?.explicacion,
        e?.createdTime,
        e?.video,
        e?.type
      ]);

  @override
  bool isValidKey(Object? o) => o is PreguntasRecord;
}
