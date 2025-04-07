import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActionsRecord extends FirestoreRecord {
  ActionsRecord._(
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

  // "Descripction" field.
  String? _descripction;
  String get descripction => _descripction ?? '';
  bool hasDescripction() => _descripction != null;

  // "Created_Date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _uidUser = snapshotData['uid_user'] as String?;
    _descripction = snapshotData['Descripction'] as String?;
    _createdDate = snapshotData['Created_Date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Actions');

  static Stream<ActionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActionsRecord.fromSnapshot(s));

  static Future<ActionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ActionsRecord.fromSnapshot(s));

  static ActionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActionsRecordData({
  String? uid,
  String? uidUser,
  String? descripction,
  DateTime? createdDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'uid_user': uidUser,
      'Descripction': descripction,
      'Created_Date': createdDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActionsRecordDocumentEquality implements Equality<ActionsRecord> {
  const ActionsRecordDocumentEquality();

  @override
  bool equals(ActionsRecord? e1, ActionsRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.uidUser == e2?.uidUser &&
        e1?.descripction == e2?.descripction &&
        e1?.createdDate == e2?.createdDate;
  }

  @override
  int hash(ActionsRecord? e) => const ListEquality()
      .hash([e?.uid, e?.uidUser, e?.descripction, e?.createdDate]);

  @override
  bool isValidKey(Object? o) => o is ActionsRecord;
}
