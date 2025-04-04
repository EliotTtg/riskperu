import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryCoursesRecord extends FirestoreRecord {
  CategoryCoursesRecord._(
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

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _name = snapshotData['Name'] as String?;
    _createdBy = snapshotData['Created_By'] as String?;
    _createdDate = snapshotData['Created_Date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CategoryCourses');

  static Stream<CategoryCoursesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoryCoursesRecord.fromSnapshot(s));

  static Future<CategoryCoursesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoryCoursesRecord.fromSnapshot(s));

  static CategoryCoursesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoryCoursesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoryCoursesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoryCoursesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoryCoursesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoryCoursesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoryCoursesRecordData({
  String? uid,
  String? name,
  String? createdBy,
  DateTime? createdDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'Name': name,
      'Created_By': createdBy,
      'Created_Date': createdDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoryCoursesRecordDocumentEquality
    implements Equality<CategoryCoursesRecord> {
  const CategoryCoursesRecordDocumentEquality();

  @override
  bool equals(CategoryCoursesRecord? e1, CategoryCoursesRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.name == e2?.name &&
        e1?.createdBy == e2?.createdBy &&
        e1?.createdDate == e2?.createdDate;
  }

  @override
  int hash(CategoryCoursesRecord? e) => const ListEquality()
      .hash([e?.uid, e?.name, e?.createdBy, e?.createdDate]);

  @override
  bool isValidKey(Object? o) => o is CategoryCoursesRecord;
}
