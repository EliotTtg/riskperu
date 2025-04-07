import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeaturesRecord extends FirestoreRecord {
  FeaturesRecord._(
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

  // "Created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "uid_CreatedBy" field.
  String? _uidCreatedBy;
  String get uidCreatedBy => _uidCreatedBy ?? '';
  bool hasUidCreatedBy() => _uidCreatedBy != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _name = snapshotData['Name'] as String?;
    _createdDate = snapshotData['Created_date'] as DateTime?;
    _uidCreatedBy = snapshotData['uid_CreatedBy'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Features');

  static Stream<FeaturesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeaturesRecord.fromSnapshot(s));

  static Future<FeaturesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FeaturesRecord.fromSnapshot(s));

  static FeaturesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeaturesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeaturesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeaturesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeaturesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeaturesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeaturesRecordData({
  String? uid,
  String? name,
  DateTime? createdDate,
  String? uidCreatedBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'Name': name,
      'Created_date': createdDate,
      'uid_CreatedBy': uidCreatedBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class FeaturesRecordDocumentEquality implements Equality<FeaturesRecord> {
  const FeaturesRecordDocumentEquality();

  @override
  bool equals(FeaturesRecord? e1, FeaturesRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.name == e2?.name &&
        e1?.createdDate == e2?.createdDate &&
        e1?.uidCreatedBy == e2?.uidCreatedBy;
  }

  @override
  int hash(FeaturesRecord? e) => const ListEquality()
      .hash([e?.uid, e?.name, e?.createdDate, e?.uidCreatedBy]);

  @override
  bool isValidKey(Object? o) => o is FeaturesRecord;
}
