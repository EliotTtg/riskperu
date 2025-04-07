import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersAnswersRecord extends FirestoreRecord {
  UsersAnswersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "uid_user" field.
  String? _uidUser;
  String get uidUser => _uidUser ?? '';
  bool hasUidUser() => _uidUser != null;

  // "uid_pregunta" field.
  String? _uidPregunta;
  String get uidPregunta => _uidPregunta ?? '';
  bool hasUidPregunta() => _uidPregunta != null;

  // "respuesta_uid" field.
  String? _respuestaUid;
  String get respuestaUid => _respuestaUid ?? '';
  bool hasRespuestaUid() => _respuestaUid != null;

  // "uid_examen" field.
  String? _uidExamen;
  String get uidExamen => _uidExamen ?? '';
  bool hasUidExamen() => _uidExamen != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _uidUser = snapshotData['uid_user'] as String?;
    _uidPregunta = snapshotData['uid_pregunta'] as String?;
    _respuestaUid = snapshotData['respuesta_uid'] as String?;
    _uidExamen = snapshotData['uid_examen'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users_Answers');

  static Stream<UsersAnswersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersAnswersRecord.fromSnapshot(s));

  static Future<UsersAnswersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersAnswersRecord.fromSnapshot(s));

  static UsersAnswersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsersAnswersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersAnswersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersAnswersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersAnswersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersAnswersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersAnswersRecordData({
  String? uid,
  String? uidUser,
  String? uidPregunta,
  String? respuestaUid,
  String? uidExamen,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'uid_user': uidUser,
      'uid_pregunta': uidPregunta,
      'respuesta_uid': respuestaUid,
      'uid_examen': uidExamen,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersAnswersRecordDocumentEquality
    implements Equality<UsersAnswersRecord> {
  const UsersAnswersRecordDocumentEquality();

  @override
  bool equals(UsersAnswersRecord? e1, UsersAnswersRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.uidUser == e2?.uidUser &&
        e1?.uidPregunta == e2?.uidPregunta &&
        e1?.respuestaUid == e2?.respuestaUid &&
        e1?.uidExamen == e2?.uidExamen;
  }

  @override
  int hash(UsersAnswersRecord? e) => const ListEquality().hash(
      [e?.uid, e?.uidUser, e?.uidPregunta, e?.respuestaUid, e?.uidExamen]);

  @override
  bool isValidKey(Object? o) => o is UsersAnswersRecord;
}
