import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersModuleclassRecord extends FirestoreRecord {
  UsersModuleclassRecord._(
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

  // "uid_moduleclass" field.
  String? _uidModuleclass;
  String get uidModuleclass => _uidModuleclass ?? '';
  bool hasUidModuleclass() => _uidModuleclass != null;

  // "stateView" field.
  bool? _stateView;
  bool get stateView => _stateView ?? false;
  bool hasStateView() => _stateView != null;

  // "uid_module" field.
  String? _uidModule;
  String get uidModule => _uidModule ?? '';
  bool hasUidModule() => _uidModule != null;

  // "uid_curse" field.
  String? _uidCurse;
  String get uidCurse => _uidCurse ?? '';
  bool hasUidCurse() => _uidCurse != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _uidUser = snapshotData['uid_user'] as String?;
    _uidModuleclass = snapshotData['uid_moduleclass'] as String?;
    _stateView = snapshotData['stateView'] as bool?;
    _uidModule = snapshotData['uid_module'] as String?;
    _uidCurse = snapshotData['uid_curse'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users_moduleclass');

  static Stream<UsersModuleclassRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersModuleclassRecord.fromSnapshot(s));

  static Future<UsersModuleclassRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UsersModuleclassRecord.fromSnapshot(s));

  static UsersModuleclassRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsersModuleclassRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersModuleclassRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersModuleclassRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersModuleclassRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersModuleclassRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersModuleclassRecordData({
  String? uid,
  String? uidUser,
  String? uidModuleclass,
  bool? stateView,
  String? uidModule,
  String? uidCurse,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'uid_user': uidUser,
      'uid_moduleclass': uidModuleclass,
      'stateView': stateView,
      'uid_module': uidModule,
      'uid_curse': uidCurse,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersModuleclassRecordDocumentEquality
    implements Equality<UsersModuleclassRecord> {
  const UsersModuleclassRecordDocumentEquality();

  @override
  bool equals(UsersModuleclassRecord? e1, UsersModuleclassRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.uidUser == e2?.uidUser &&
        e1?.uidModuleclass == e2?.uidModuleclass &&
        e1?.stateView == e2?.stateView &&
        e1?.uidModule == e2?.uidModule &&
        e1?.uidCurse == e2?.uidCurse;
  }

  @override
  int hash(UsersModuleclassRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.uidUser,
        e?.uidModuleclass,
        e?.stateView,
        e?.uidModule,
        e?.uidCurse
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersModuleclassRecord;
}
