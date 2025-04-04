import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersPlansRecord extends FirestoreRecord {
  UsersPlansRecord._(
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

  // "uid_plan" field.
  String? _uidPlan;
  String get uidPlan => _uidPlan ?? '';
  bool hasUidPlan() => _uidPlan != null;

  // "Update_date" field.
  DateTime? _updateDate;
  DateTime? get updateDate => _updateDate;
  bool hasUpdateDate() => _updateDate != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _uidUser = snapshotData['uid_user'] as String?;
    _uidPlan = snapshotData['uid_plan'] as String?;
    _updateDate = snapshotData['Update_date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users_plans');

  static Stream<UsersPlansRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersPlansRecord.fromSnapshot(s));

  static Future<UsersPlansRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersPlansRecord.fromSnapshot(s));

  static UsersPlansRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsersPlansRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersPlansRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersPlansRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersPlansRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersPlansRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersPlansRecordData({
  String? uid,
  String? uidUser,
  String? uidPlan,
  DateTime? updateDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'uid_user': uidUser,
      'uid_plan': uidPlan,
      'Update_date': updateDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersPlansRecordDocumentEquality implements Equality<UsersPlansRecord> {
  const UsersPlansRecordDocumentEquality();

  @override
  bool equals(UsersPlansRecord? e1, UsersPlansRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.uidUser == e2?.uidUser &&
        e1?.uidPlan == e2?.uidPlan &&
        e1?.updateDate == e2?.updateDate;
  }

  @override
  int hash(UsersPlansRecord? e) => const ListEquality()
      .hash([e?.uid, e?.uidUser, e?.uidPlan, e?.updateDate]);

  @override
  bool isValidKey(Object? o) => o is UsersPlansRecord;
}
