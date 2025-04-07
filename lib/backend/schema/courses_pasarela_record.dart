import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoursesPasarelaRecord extends FirestoreRecord {
  CoursesPasarelaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "uid_Course" field.
  String? _uidCourse;
  String get uidCourse => _uidCourse ?? '';
  bool hasUidCourse() => _uidCourse != null;

  // "uid_Pasarela" field.
  String? _uidPasarela;
  String get uidPasarela => _uidPasarela ?? '';
  bool hasUidPasarela() => _uidPasarela != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _uidCourse = snapshotData['uid_Course'] as String?;
    _uidPasarela = snapshotData['uid_Pasarela'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CoursesPasarela');

  static Stream<CoursesPasarelaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoursesPasarelaRecord.fromSnapshot(s));

  static Future<CoursesPasarelaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CoursesPasarelaRecord.fromSnapshot(s));

  static CoursesPasarelaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CoursesPasarelaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoursesPasarelaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoursesPasarelaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CoursesPasarelaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoursesPasarelaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCoursesPasarelaRecordData({
  String? uid,
  String? uidCourse,
  String? uidPasarela,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'uid_Course': uidCourse,
      'uid_Pasarela': uidPasarela,
    }.withoutNulls,
  );

  return firestoreData;
}

class CoursesPasarelaRecordDocumentEquality
    implements Equality<CoursesPasarelaRecord> {
  const CoursesPasarelaRecordDocumentEquality();

  @override
  bool equals(CoursesPasarelaRecord? e1, CoursesPasarelaRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.uidCourse == e2?.uidCourse &&
        e1?.uidPasarela == e2?.uidPasarela;
  }

  @override
  int hash(CoursesPasarelaRecord? e) =>
      const ListEquality().hash([e?.uid, e?.uidCourse, e?.uidPasarela]);

  @override
  bool isValidKey(Object? o) => o is CoursesPasarelaRecord;
}
