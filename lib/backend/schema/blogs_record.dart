import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BlogsRecord extends FirestoreRecord {
  BlogsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "publication_date" field.
  DateTime? _publicationDate;
  DateTime? get publicationDate => _publicationDate;
  bool hasPublicationDate() => _publicationDate != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  // "visit_url" field.
  String? _visitUrl;
  String get visitUrl => _visitUrl ?? '';
  bool hasVisitUrl() => _visitUrl != null;

  // "introduction" field.
  String? _introduction;
  String get introduction => _introduction ?? '';
  bool hasIntroduction() => _introduction != null;

  // "state" field.
  bool? _state;
  bool get state => _state ?? false;
  bool hasState() => _state != null;

  // "created_by" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _type = snapshotData['type'] as String?;
    _title = snapshotData['title'] as String?;
    _category = snapshotData['category'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _publicationDate = snapshotData['publication_date'] as DateTime?;
    _url = snapshotData['url'] as String?;
    _visitUrl = snapshotData['visit_url'] as String?;
    _introduction = snapshotData['introduction'] as String?;
    _state = snapshotData['state'] as bool?;
    _createdBy = snapshotData['created_by'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('blogs');

  static Stream<BlogsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BlogsRecord.fromSnapshot(s));

  static Future<BlogsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BlogsRecord.fromSnapshot(s));

  static BlogsRecord fromSnapshot(DocumentSnapshot snapshot) => BlogsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BlogsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BlogsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BlogsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BlogsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBlogsRecordData({
  String? uid,
  String? type,
  String? title,
  String? category,
  DateTime? createdTime,
  DateTime? publicationDate,
  String? url,
  String? visitUrl,
  String? introduction,
  bool? state,
  String? createdBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'type': type,
      'title': title,
      'category': category,
      'created_time': createdTime,
      'publication_date': publicationDate,
      'url': url,
      'visit_url': visitUrl,
      'introduction': introduction,
      'state': state,
      'created_by': createdBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class BlogsRecordDocumentEquality implements Equality<BlogsRecord> {
  const BlogsRecordDocumentEquality();

  @override
  bool equals(BlogsRecord? e1, BlogsRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.type == e2?.type &&
        e1?.title == e2?.title &&
        e1?.category == e2?.category &&
        e1?.createdTime == e2?.createdTime &&
        e1?.publicationDate == e2?.publicationDate &&
        e1?.url == e2?.url &&
        e1?.visitUrl == e2?.visitUrl &&
        e1?.introduction == e2?.introduction &&
        e1?.state == e2?.state &&
        e1?.createdBy == e2?.createdBy;
  }

  @override
  int hash(BlogsRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.type,
        e?.title,
        e?.category,
        e?.createdTime,
        e?.publicationDate,
        e?.url,
        e?.visitUrl,
        e?.introduction,
        e?.state,
        e?.createdBy
      ]);

  @override
  bool isValidKey(Object? o) => o is BlogsRecord;
}
