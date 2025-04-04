import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CertificatesRecord extends FirestoreRecord {
  CertificatesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "ReferralDate" field.
  DateTime? _referralDate;
  DateTime? get referralDate => _referralDate;
  bool hasReferralDate() => _referralDate != null;

  // "uid_Course" field.
  String? _uidCourse;
  String get uidCourse => _uidCourse ?? '';
  bool hasUidCourse() => _uidCourse != null;

  // "UrlPdf" field.
  String? _urlPdf;
  String get urlPdf => _urlPdf ?? '';
  bool hasUrlPdf() => _urlPdf != null;

  // "ID" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "uid_User" field.
  String? _uidUser;
  String get uidUser => _uidUser ?? '';
  bool hasUidUser() => _uidUser != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _referralDate = snapshotData['ReferralDate'] as DateTime?;
    _uidCourse = snapshotData['uid_Course'] as String?;
    _urlPdf = snapshotData['UrlPdf'] as String?;
    _id = snapshotData['ID'] as String?;
    _uidUser = snapshotData['uid_User'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Certificates');

  static Stream<CertificatesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CertificatesRecord.fromSnapshot(s));

  static Future<CertificatesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CertificatesRecord.fromSnapshot(s));

  static CertificatesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CertificatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CertificatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CertificatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CertificatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CertificatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCertificatesRecordData({
  String? uid,
  DateTime? referralDate,
  String? uidCourse,
  String? urlPdf,
  String? id,
  String? uidUser,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'ReferralDate': referralDate,
      'uid_Course': uidCourse,
      'UrlPdf': urlPdf,
      'ID': id,
      'uid_User': uidUser,
    }.withoutNulls,
  );

  return firestoreData;
}

class CertificatesRecordDocumentEquality
    implements Equality<CertificatesRecord> {
  const CertificatesRecordDocumentEquality();

  @override
  bool equals(CertificatesRecord? e1, CertificatesRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.referralDate == e2?.referralDate &&
        e1?.uidCourse == e2?.uidCourse &&
        e1?.urlPdf == e2?.urlPdf &&
        e1?.id == e2?.id &&
        e1?.uidUser == e2?.uidUser;
  }

  @override
  int hash(CertificatesRecord? e) => const ListEquality().hash(
      [e?.uid, e?.referralDate, e?.uidCourse, e?.urlPdf, e?.id, e?.uidUser]);

  @override
  bool isValidKey(Object? o) => o is CertificatesRecord;
}
