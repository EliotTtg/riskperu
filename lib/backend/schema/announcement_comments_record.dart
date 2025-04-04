import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnnouncementCommentsRecord extends FirestoreRecord {
  AnnouncementCommentsRecord._(
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

  // "Text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "uid_Announcements_course" field.
  String? _uidAnnouncementsCourse;
  String get uidAnnouncementsCourse => _uidAnnouncementsCourse ?? '';
  bool hasUidAnnouncementsCourse() => _uidAnnouncementsCourse != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _createdBy = snapshotData['Created_By'] as String?;
    _createdDate = snapshotData['Created_Date'] as DateTime?;
    _text = snapshotData['Text'] as String?;
    _uidAnnouncementsCourse =
        snapshotData['uid_Announcements_course'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Announcement_Comments');

  static Stream<AnnouncementCommentsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => AnnouncementCommentsRecord.fromSnapshot(s));

  static Future<AnnouncementCommentsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AnnouncementCommentsRecord.fromSnapshot(s));

  static AnnouncementCommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnnouncementCommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnnouncementCommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnnouncementCommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnnouncementCommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnnouncementCommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnnouncementCommentsRecordData({
  String? uid,
  String? createdBy,
  DateTime? createdDate,
  String? text,
  String? uidAnnouncementsCourse,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'Created_By': createdBy,
      'Created_Date': createdDate,
      'Text': text,
      'uid_Announcements_course': uidAnnouncementsCourse,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnnouncementCommentsRecordDocumentEquality
    implements Equality<AnnouncementCommentsRecord> {
  const AnnouncementCommentsRecordDocumentEquality();

  @override
  bool equals(AnnouncementCommentsRecord? e1, AnnouncementCommentsRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.createdBy == e2?.createdBy &&
        e1?.createdDate == e2?.createdDate &&
        e1?.text == e2?.text &&
        e1?.uidAnnouncementsCourse == e2?.uidAnnouncementsCourse;
  }

  @override
  int hash(AnnouncementCommentsRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.createdBy,
        e?.createdDate,
        e?.text,
        e?.uidAnnouncementsCourse
      ]);

  @override
  bool isValidKey(Object? o) => o is AnnouncementCommentsRecord;
}
