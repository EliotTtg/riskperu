import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersCoursesRecord extends FirestoreRecord {
  UsersCoursesRecord._(
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

  // "uid_courses" field.
  String? _uidCourses;
  String get uidCourses => _uidCourses ?? '';
  bool hasUidCourses() => _uidCourses != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _uidUser = snapshotData['uid_user'] as String?;
    _uidCourses = snapshotData['uid_courses'] as String?;
    _createdDate = snapshotData['created_date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users_Courses');

  static Stream<UsersCoursesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersCoursesRecord.fromSnapshot(s));

  static Future<UsersCoursesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersCoursesRecord.fromSnapshot(s));

  static UsersCoursesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsersCoursesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersCoursesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersCoursesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersCoursesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersCoursesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersCoursesRecordData({
  String? uid,
  String? uidUser,
  String? uidCourses,
  DateTime? createdDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'uid_user': uidUser,
      'uid_courses': uidCourses,
      'created_date': createdDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersCoursesRecordDocumentEquality
    implements Equality<UsersCoursesRecord> {
  const UsersCoursesRecordDocumentEquality();

  @override
  bool equals(UsersCoursesRecord? e1, UsersCoursesRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.uidUser == e2?.uidUser &&
        e1?.uidCourses == e2?.uidCourses &&
        e1?.createdDate == e2?.createdDate;
  }

  @override
  int hash(UsersCoursesRecord? e) => const ListEquality()
      .hash([e?.uid, e?.uidUser, e?.uidCourses, e?.createdDate]);

  @override
  bool isValidKey(Object? o) => o is UsersCoursesRecord;
}
