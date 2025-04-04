import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ComentariosRecord extends FirestoreRecord {
  ComentariosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "uid_Courses" field.
  String? _uidCourses;
  String get uidCourses => _uidCourses ?? '';
  bool hasUidCourses() => _uidCourses != null;

  // "uid_User" field.
  String? _uidUser;
  String get uidUser => _uidUser ?? '';
  bool hasUidUser() => _uidUser != null;

  // "contenido" field.
  String? _contenido;
  String get contenido => _contenido ?? '';
  bool hasContenido() => _contenido != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "pared_id" field.
  String? _paredId;
  String get paredId => _paredId ?? '';
  bool hasParedId() => _paredId != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _uidCourses = snapshotData['uid_Courses'] as String?;
    _uidUser = snapshotData['uid_User'] as String?;
    _contenido = snapshotData['contenido'] as String?;
    _createdDate = snapshotData['created_date'] as DateTime?;
    _paredId = snapshotData['pared_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comentarios');

  static Stream<ComentariosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ComentariosRecord.fromSnapshot(s));

  static Future<ComentariosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ComentariosRecord.fromSnapshot(s));

  static ComentariosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ComentariosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ComentariosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ComentariosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ComentariosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ComentariosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createComentariosRecordData({
  String? uid,
  String? uidCourses,
  String? uidUser,
  String? contenido,
  DateTime? createdDate,
  String? paredId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'uid_Courses': uidCourses,
      'uid_User': uidUser,
      'contenido': contenido,
      'created_date': createdDate,
      'pared_id': paredId,
    }.withoutNulls,
  );

  return firestoreData;
}

class ComentariosRecordDocumentEquality implements Equality<ComentariosRecord> {
  const ComentariosRecordDocumentEquality();

  @override
  bool equals(ComentariosRecord? e1, ComentariosRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.uidCourses == e2?.uidCourses &&
        e1?.uidUser == e2?.uidUser &&
        e1?.contenido == e2?.contenido &&
        e1?.createdDate == e2?.createdDate &&
        e1?.paredId == e2?.paredId;
  }

  @override
  int hash(ComentariosRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.uidCourses,
        e?.uidUser,
        e?.contenido,
        e?.createdDate,
        e?.paredId
      ]);

  @override
  bool isValidKey(Object? o) => o is ComentariosRecord;
}
