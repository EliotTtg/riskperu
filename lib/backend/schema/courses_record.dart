import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoursesRecord extends FirestoreRecord {
  CoursesRecord._(
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

  // "uid_CategoryCourses" field.
  String? _uidCategoryCourses;
  String get uidCategoryCourses => _uidCategoryCourses ?? '';
  bool hasUidCategoryCourses() => _uidCategoryCourses != null;

  // "Updated_Date" field.
  DateTime? _updatedDate;
  DateTime? get updatedDate => _updatedDate;
  bool hasUpdatedDate() => _updatedDate != null;

  // "introduction" field.
  String? _introduction;
  String get introduction => _introduction ?? '';
  bool hasIntroduction() => _introduction != null;

  // "Language" field.
  String? _language;
  String get language => _language ?? '';
  bool hasLanguage() => _language != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "Hours" field.
  String? _hours;
  String get hours => _hours ?? '';
  bool hasHours() => _hours != null;

  // "Certificate" field.
  String? _certificate;
  String get certificate => _certificate ?? '';
  bool hasCertificate() => _certificate != null;

  // "course_type" field.
  int? _courseType;
  int get courseType => _courseType ?? 0;
  bool hasCourseType() => _courseType != null;

  // "set" field.
  bool? _set;
  bool get set => _set ?? false;
  bool hasSet() => _set != null;

  // "uid_Techear" field.
  String? _uidTechear;
  String get uidTechear => _uidTechear ?? '';
  bool hasUidTechear() => _uidTechear != null;

  // "Price" field.
  String? _price;
  String get price => _price ?? '';
  bool hasPrice() => _price != null;

  // "Video_Preview" field.
  String? _videoPreview;
  String get videoPreview => _videoPreview ?? '';
  bool hasVideoPreview() => _videoPreview != null;

  // "Image_Course" field.
  String? _imageCourse;
  String get imageCourse => _imageCourse ?? '';
  bool hasImageCourse() => _imageCourse != null;

  // "Goals" field.
  String? _goals;
  String get goals => _goals ?? '';
  bool hasGoals() => _goals != null;

  // "Pre_Requisites" field.
  List<String>? _preRequisites;
  List<String> get preRequisites => _preRequisites ?? const [];
  bool hasPreRequisites() => _preRequisites != null;

  // "State" field.
  bool? _state;
  bool get state => _state ?? false;
  bool hasState() => _state != null;

  // "Benefits" field.
  List<String>? _benefits;
  List<String> get benefits => _benefits ?? const [];
  bool hasBenefits() => _benefits != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _name = snapshotData['Name'] as String?;
    _createdBy = snapshotData['Created_By'] as String?;
    _createdDate = snapshotData['Created_Date'] as DateTime?;
    _uidCategoryCourses = snapshotData['uid_CategoryCourses'] as String?;
    _updatedDate = snapshotData['Updated_Date'] as DateTime?;
    _introduction = snapshotData['introduction'] as String?;
    _language = snapshotData['Language'] as String?;
    _description = snapshotData['Description'] as String?;
    _hours = snapshotData['Hours'] as String?;
    _certificate = snapshotData['Certificate'] as String?;
    _courseType = castToType<int>(snapshotData['course_type']);
    _set = snapshotData['set'] as bool?;
    _uidTechear = snapshotData['uid_Techear'] as String?;
    _price = snapshotData['Price'] as String?;
    _videoPreview = snapshotData['Video_Preview'] as String?;
    _imageCourse = snapshotData['Image_Course'] as String?;
    _goals = snapshotData['Goals'] as String?;
    _preRequisites = getDataList(snapshotData['Pre_Requisites']);
    _state = snapshotData['State'] as bool?;
    _benefits = getDataList(snapshotData['Benefits']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Courses');

  static Stream<CoursesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoursesRecord.fromSnapshot(s));

  static Future<CoursesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CoursesRecord.fromSnapshot(s));

  static CoursesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CoursesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoursesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoursesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CoursesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoursesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCoursesRecordData({
  String? uid,
  String? name,
  String? createdBy,
  DateTime? createdDate,
  String? uidCategoryCourses,
  DateTime? updatedDate,
  String? introduction,
  String? language,
  String? description,
  String? hours,
  String? certificate,
  int? courseType,
  bool? set,
  String? uidTechear,
  String? price,
  String? videoPreview,
  String? imageCourse,
  String? goals,
  bool? state,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'Name': name,
      'Created_By': createdBy,
      'Created_Date': createdDate,
      'uid_CategoryCourses': uidCategoryCourses,
      'Updated_Date': updatedDate,
      'introduction': introduction,
      'Language': language,
      'Description': description,
      'Hours': hours,
      'Certificate': certificate,
      'course_type': courseType,
      'set': set,
      'uid_Techear': uidTechear,
      'Price': price,
      'Video_Preview': videoPreview,
      'Image_Course': imageCourse,
      'Goals': goals,
      'State': state,
    }.withoutNulls,
  );

  return firestoreData;
}

class CoursesRecordDocumentEquality implements Equality<CoursesRecord> {
  const CoursesRecordDocumentEquality();

  @override
  bool equals(CoursesRecord? e1, CoursesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        e1?.name == e2?.name &&
        e1?.createdBy == e2?.createdBy &&
        e1?.createdDate == e2?.createdDate &&
        e1?.uidCategoryCourses == e2?.uidCategoryCourses &&
        e1?.updatedDate == e2?.updatedDate &&
        e1?.introduction == e2?.introduction &&
        e1?.language == e2?.language &&
        e1?.description == e2?.description &&
        e1?.hours == e2?.hours &&
        e1?.certificate == e2?.certificate &&
        e1?.courseType == e2?.courseType &&
        e1?.set == e2?.set &&
        e1?.uidTechear == e2?.uidTechear &&
        e1?.price == e2?.price &&
        e1?.videoPreview == e2?.videoPreview &&
        e1?.imageCourse == e2?.imageCourse &&
        e1?.goals == e2?.goals &&
        listEquality.equals(e1?.preRequisites, e2?.preRequisites) &&
        e1?.state == e2?.state &&
        listEquality.equals(e1?.benefits, e2?.benefits);
  }

  @override
  int hash(CoursesRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.name,
        e?.createdBy,
        e?.createdDate,
        e?.uidCategoryCourses,
        e?.updatedDate,
        e?.introduction,
        e?.language,
        e?.description,
        e?.hours,
        e?.certificate,
        e?.courseType,
        e?.set,
        e?.uidTechear,
        e?.price,
        e?.videoPreview,
        e?.imageCourse,
        e?.goals,
        e?.preRequisites,
        e?.state,
        e?.benefits
      ]);

  @override
  bool isValidKey(Object? o) => o is CoursesRecord;
}
