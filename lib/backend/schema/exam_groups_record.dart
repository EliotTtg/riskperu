import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExamGroupsRecord extends FirestoreRecord {
  ExamGroupsRecord._(
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

  // "uid_Course" field.
  String? _uidCourse;
  String get uidCourse => _uidCourse ?? '';
  bool hasUidCourse() => _uidCourse != null;

  // "Created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "Updated_date" field.
  DateTime? _updatedDate;
  DateTime? get updatedDate => _updatedDate;
  bool hasUpdatedDate() => _updatedDate != null;

  // "Created_by" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  // "state" field.
  bool? _state;
  bool get state => _state ?? false;
  bool hasState() => _state != null;

  // "is_demo" field.
  bool? _isDemo;
  bool get isDemo => _isDemo ?? false;
  bool hasIsDemo() => _isDemo != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _name = snapshotData['Name'] as String?;
    _uidCourse = snapshotData['uid_Course'] as String?;
    _createdDate = snapshotData['Created_date'] as DateTime?;
    _updatedDate = snapshotData['Updated_date'] as DateTime?;
    _createdBy = snapshotData['Created_by'] as String?;
    _state = snapshotData['state'] as bool?;
    _isDemo = snapshotData['is_demo'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ExamGroups');

  static Stream<ExamGroupsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExamGroupsRecord.fromSnapshot(s));

  static Future<ExamGroupsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExamGroupsRecord.fromSnapshot(s));

  static ExamGroupsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExamGroupsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExamGroupsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExamGroupsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExamGroupsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExamGroupsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExamGroupsRecordData({
  String? uid,
  String? name,
  String? uidCourse,
  DateTime? createdDate,
  DateTime? updatedDate,
  String? createdBy,
  bool? state,
  bool? isDemo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'Name': name,
      'uid_Course': uidCourse,
      'Created_date': createdDate,
      'Updated_date': updatedDate,
      'Created_by': createdBy,
      'state': state,
      'is_demo': isDemo,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExamGroupsRecordDocumentEquality implements Equality<ExamGroupsRecord> {
  const ExamGroupsRecordDocumentEquality();

  @override
  bool equals(ExamGroupsRecord? e1, ExamGroupsRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.name == e2?.name &&
        e1?.uidCourse == e2?.uidCourse &&
        e1?.createdDate == e2?.createdDate &&
        e1?.updatedDate == e2?.updatedDate &&
        e1?.createdBy == e2?.createdBy &&
        e1?.state == e2?.state &&
        e1?.isDemo == e2?.isDemo;
  }

  @override
  int hash(ExamGroupsRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.name,
        e?.uidCourse,
        e?.createdDate,
        e?.updatedDate,
        e?.createdBy,
        e?.state,
        e?.isDemo
      ]);

  @override
  bool isValidKey(Object? o) => o is ExamGroupsRecord;
}
