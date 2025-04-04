import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnnouncementsCoursesRecord extends FirestoreRecord {
  AnnouncementsCoursesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "Created_By" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  // "Created_Date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "Text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "uid_Course" field.
  String? _uidCourse;
  String get uidCourse => _uidCourse ?? '';
  bool hasUidCourse() => _uidCourse != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _createdBy = snapshotData['Created_By'] as String?;
    _createdDate = snapshotData['Created_Date'] as DateTime?;
    _title = snapshotData['Title'] as String?;
    _text = snapshotData['Text'] as String?;
    _uidCourse = snapshotData['uid_Course'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Announcements_Courses');

  static Stream<AnnouncementsCoursesRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => AnnouncementsCoursesRecord.fromSnapshot(s));

  static Future<AnnouncementsCoursesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AnnouncementsCoursesRecord.fromSnapshot(s));

  static AnnouncementsCoursesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnnouncementsCoursesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnnouncementsCoursesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnnouncementsCoursesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnnouncementsCoursesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnnouncementsCoursesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnnouncementsCoursesRecordData({
  String? uid,
  String? createdBy,
  DateTime? createdDate,
  String? title,
  String? text,
  String? uidCourse,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'Created_By': createdBy,
      'Created_Date': createdDate,
      'Title': title,
      'Text': text,
      'uid_Course': uidCourse,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnnouncementsCoursesRecordDocumentEquality
    implements Equality<AnnouncementsCoursesRecord> {
  const AnnouncementsCoursesRecordDocumentEquality();

  @override
  bool equals(AnnouncementsCoursesRecord? e1, AnnouncementsCoursesRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.createdBy == e2?.createdBy &&
        e1?.createdDate == e2?.createdDate &&
        e1?.title == e2?.title &&
        e1?.text == e2?.text &&
        e1?.uidCourse == e2?.uidCourse;
  }

  @override
  int hash(AnnouncementsCoursesRecord? e) => const ListEquality().hash(
      [e?.uid, e?.createdBy, e?.createdDate, e?.title, e?.text, e?.uidCourse]);

  @override
  bool isValidKey(Object? o) => o is AnnouncementsCoursesRecord;
}
