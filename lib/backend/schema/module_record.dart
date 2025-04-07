import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ModuleRecord extends FirestoreRecord {
  ModuleRecord._(
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

  // "Created_By" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  // "uid_Session" field.
  String? _uidSession;
  String get uidSession => _uidSession ?? '';
  bool hasUidSession() => _uidSession != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _name = snapshotData['Name'] as String?;
    _createdDate = snapshotData['Created_date'] as DateTime?;
    _createdBy = snapshotData['Created_By'] as String?;
    _uidSession = snapshotData['uid_Session'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Module');

  static Stream<ModuleRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ModuleRecord.fromSnapshot(s));

  static Future<ModuleRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ModuleRecord.fromSnapshot(s));

  static ModuleRecord fromSnapshot(DocumentSnapshot snapshot) => ModuleRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ModuleRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ModuleRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ModuleRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ModuleRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createModuleRecordData({
  String? uid,
  String? name,
  DateTime? createdDate,
  String? createdBy,
  String? uidSession,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'Name': name,
      'Created_date': createdDate,
      'Created_By': createdBy,
      'uid_Session': uidSession,
    }.withoutNulls,
  );

  return firestoreData;
}

class ModuleRecordDocumentEquality implements Equality<ModuleRecord> {
  const ModuleRecordDocumentEquality();

  @override
  bool equals(ModuleRecord? e1, ModuleRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.name == e2?.name &&
        e1?.createdDate == e2?.createdDate &&
        e1?.createdBy == e2?.createdBy &&
        e1?.uidSession == e2?.uidSession;
  }

  @override
  int hash(ModuleRecord? e) => const ListEquality()
      .hash([e?.uid, e?.name, e?.createdDate, e?.createdBy, e?.uidSession]);

  @override
  bool isValidKey(Object? o) => o is ModuleRecord;
}
