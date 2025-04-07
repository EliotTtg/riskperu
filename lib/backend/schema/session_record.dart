import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SessionRecord extends FirestoreRecord {
  SessionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Created_By" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  // "Created_Date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "uid_Course" field.
  String? _uidCourse;
  String get uidCourse => _uidCourse ?? '';
  bool hasUidCourse() => _uidCourse != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _name = snapshotData['Name'] as String?;
    _createdBy = snapshotData['Created_By'] as String?;
    _createdDate = snapshotData['Created_Date'] as DateTime?;
    _uidCourse = snapshotData['uid_Course'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Session');

  static Stream<SessionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SessionRecord.fromSnapshot(s));

  static Future<SessionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SessionRecord.fromSnapshot(s));

  static SessionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SessionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SessionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SessionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SessionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SessionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSessionRecordData({
  String? uid,
  String? name,
  String? createdBy,
  DateTime? createdDate,
  String? uidCourse,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'Name': name,
      'Created_By': createdBy,
      'Created_Date': createdDate,
      'uid_Course': uidCourse,
    }.withoutNulls,
  );

  return firestoreData;
}

class SessionRecordDocumentEquality implements Equality<SessionRecord> {
  const SessionRecordDocumentEquality();

  @override
  bool equals(SessionRecord? e1, SessionRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.name == e2?.name &&
        e1?.createdBy == e2?.createdBy &&
        e1?.createdDate == e2?.createdDate &&
        e1?.uidCourse == e2?.uidCourse;
  }

  @override
  int hash(SessionRecord? e) => const ListEquality()
      .hash([e?.uid, e?.name, e?.createdBy, e?.createdDate, e?.uidCourse]);

  @override
  bool isValidKey(Object? o) => o is SessionRecord;
}
