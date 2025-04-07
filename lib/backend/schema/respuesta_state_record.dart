import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RespuestaStateRecord extends FirestoreRecord {
  RespuestaStateRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "uid_question" field.
  String? _uidQuestion;
  String get uidQuestion => _uidQuestion ?? '';
  bool hasUidQuestion() => _uidQuestion != null;

  // "uis_user" field.
  String? _uisUser;
  String get uisUser => _uisUser ?? '';
  bool hasUisUser() => _uisUser != null;

  // "uid_examen" field.
  String? _uidExamen;
  String get uidExamen => _uidExamen ?? '';
  bool hasUidExamen() => _uidExamen != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _uidQuestion = snapshotData['uid_question'] as String?;
    _uisUser = snapshotData['uis_user'] as String?;
    _uidExamen = snapshotData['uid_examen'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('respuestaState');

  static Stream<RespuestaStateRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RespuestaStateRecord.fromSnapshot(s));

  static Future<RespuestaStateRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RespuestaStateRecord.fromSnapshot(s));

  static RespuestaStateRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RespuestaStateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RespuestaStateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RespuestaStateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RespuestaStateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RespuestaStateRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRespuestaStateRecordData({
  String? uid,
  String? uidQuestion,
  String? uisUser,
  String? uidExamen,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'uid_question': uidQuestion,
      'uis_user': uisUser,
      'uid_examen': uidExamen,
    }.withoutNulls,
  );

  return firestoreData;
}

class RespuestaStateRecordDocumentEquality
    implements Equality<RespuestaStateRecord> {
  const RespuestaStateRecordDocumentEquality();

  @override
  bool equals(RespuestaStateRecord? e1, RespuestaStateRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.uidQuestion == e2?.uidQuestion &&
        e1?.uisUser == e2?.uisUser &&
        e1?.uidExamen == e2?.uidExamen;
  }

  @override
  int hash(RespuestaStateRecord? e) => const ListEquality()
      .hash([e?.uid, e?.uidQuestion, e?.uisUser, e?.uidExamen]);

  @override
  bool isValidKey(Object? o) => o is RespuestaStateRecord;
}
