import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QualificationRecord extends FirestoreRecord {
  QualificationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "uidCourse" field.
  String? _uidCourse;
  String get uidCourse => _uidCourse ?? '';
  bool hasUidCourse() => _uidCourse != null;

  // "uidUser" field.
  String? _uidUser;
  String get uidUser => _uidUser ?? '';
  bool hasUidUser() => _uidUser != null;

  // "created_Date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _uidCourse = snapshotData['uidCourse'] as String?;
    _uidUser = snapshotData['uidUser'] as String?;
    _createdDate = snapshotData['created_Date'] as DateTime?;
    _amount = castToType<double>(snapshotData['amount']);
    _text = snapshotData['text'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('qualification');

  static Stream<QualificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QualificationRecord.fromSnapshot(s));

  static Future<QualificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QualificationRecord.fromSnapshot(s));

  static QualificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QualificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QualificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QualificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QualificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QualificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQualificationRecordData({
  String? uid,
  String? uidCourse,
  String? uidUser,
  DateTime? createdDate,
  double? amount,
  String? text,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'uidCourse': uidCourse,
      'uidUser': uidUser,
      'created_Date': createdDate,
      'amount': amount,
      'text': text,
    }.withoutNulls,
  );

  return firestoreData;
}

class QualificationRecordDocumentEquality
    implements Equality<QualificationRecord> {
  const QualificationRecordDocumentEquality();

  @override
  bool equals(QualificationRecord? e1, QualificationRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.uidCourse == e2?.uidCourse &&
        e1?.uidUser == e2?.uidUser &&
        e1?.createdDate == e2?.createdDate &&
        e1?.amount == e2?.amount &&
        e1?.text == e2?.text;
  }

  @override
  int hash(QualificationRecord? e) => const ListEquality().hash(
      [e?.uid, e?.uidCourse, e?.uidUser, e?.createdDate, e?.amount, e?.text]);

  @override
  bool isValidKey(Object? o) => o is QualificationRecord;
}
