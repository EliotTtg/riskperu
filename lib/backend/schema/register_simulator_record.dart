import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RegisterSimulatorRecord extends FirestoreRecord {
  RegisterSimulatorRecord._(
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

  // "uid_course" field.
  String? _uidCourse;
  String get uidCourse => _uidCourse ?? '';
  bool hasUidCourse() => _uidCourse != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _uidUser = snapshotData['uid_user'] as String?;
    _uidCourse = snapshotData['uid_course'] as String?;
    _createdDate = snapshotData['created_date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('RegisterSimulator');

  static Stream<RegisterSimulatorRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RegisterSimulatorRecord.fromSnapshot(s));

  static Future<RegisterSimulatorRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => RegisterSimulatorRecord.fromSnapshot(s));

  static RegisterSimulatorRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RegisterSimulatorRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RegisterSimulatorRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RegisterSimulatorRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RegisterSimulatorRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RegisterSimulatorRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRegisterSimulatorRecordData({
  String? uid,
  String? uidUser,
  String? uidCourse,
  DateTime? createdDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'uid_user': uidUser,
      'uid_course': uidCourse,
      'created_date': createdDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class RegisterSimulatorRecordDocumentEquality
    implements Equality<RegisterSimulatorRecord> {
  const RegisterSimulatorRecordDocumentEquality();

  @override
  bool equals(RegisterSimulatorRecord? e1, RegisterSimulatorRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.uidUser == e2?.uidUser &&
        e1?.uidCourse == e2?.uidCourse &&
        e1?.createdDate == e2?.createdDate;
  }

  @override
  int hash(RegisterSimulatorRecord? e) => const ListEquality()
      .hash([e?.uid, e?.uidUser, e?.uidCourse, e?.createdDate]);

  @override
  bool isValidKey(Object? o) => o is RegisterSimulatorRecord;
}
