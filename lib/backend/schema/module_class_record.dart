import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ModuleClassRecord extends FirestoreRecord {
  ModuleClassRecord._(
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

  // "LinkVideo" field.
  String? _linkVideo;
  String get linkVideo => _linkVideo ?? '';
  bool hasLinkVideo() => _linkVideo != null;

  // "Created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "uid_Module" field.
  String? _uidModule;
  String get uidModule => _uidModule ?? '';
  bool hasUidModule() => _uidModule != null;

  // "Minutes" field.
  int? _minutes;
  int get minutes => _minutes ?? 0;
  bool hasMinutes() => _minutes != null;

  // "archives" field.
  List<String>? _archives;
  List<String> get archives => _archives ?? const [];
  bool hasArchives() => _archives != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _name = snapshotData['Name'] as String?;
    _linkVideo = snapshotData['LinkVideo'] as String?;
    _createdDate = snapshotData['Created_date'] as DateTime?;
    _uidModule = snapshotData['uid_Module'] as String?;
    _minutes = castToType<int>(snapshotData['Minutes']);
    _archives = getDataList(snapshotData['archives']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ModuleClass');

  static Stream<ModuleClassRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ModuleClassRecord.fromSnapshot(s));

  static Future<ModuleClassRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ModuleClassRecord.fromSnapshot(s));

  static ModuleClassRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ModuleClassRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ModuleClassRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ModuleClassRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ModuleClassRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ModuleClassRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createModuleClassRecordData({
  String? uid,
  String? name,
  String? linkVideo,
  DateTime? createdDate,
  String? uidModule,
  int? minutes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'Name': name,
      'LinkVideo': linkVideo,
      'Created_date': createdDate,
      'uid_Module': uidModule,
      'Minutes': minutes,
    }.withoutNulls,
  );

  return firestoreData;
}

class ModuleClassRecordDocumentEquality implements Equality<ModuleClassRecord> {
  const ModuleClassRecordDocumentEquality();

  @override
  bool equals(ModuleClassRecord? e1, ModuleClassRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        e1?.name == e2?.name &&
        e1?.linkVideo == e2?.linkVideo &&
        e1?.createdDate == e2?.createdDate &&
        e1?.uidModule == e2?.uidModule &&
        e1?.minutes == e2?.minutes &&
        listEquality.equals(e1?.archives, e2?.archives);
  }

  @override
  int hash(ModuleClassRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.name,
        e?.linkVideo,
        e?.createdDate,
        e?.uidModule,
        e?.minutes,
        e?.archives
      ]);

  @override
  bool isValidKey(Object? o) => o is ModuleClassRecord;
}
