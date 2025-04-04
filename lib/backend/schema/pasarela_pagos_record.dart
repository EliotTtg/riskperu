import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PasarelaPagosRecord extends FirestoreRecord {
  PasarelaPagosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "token" field.
  String? _token;
  String get token => _token ?? '';
  bool hasToken() => _token != null;

  // "ordenID" field.
  String? _ordenID;
  String get ordenID => _ordenID ?? '';
  bool hasOrdenID() => _ordenID != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "codigo" field.
  String? _codigo;
  String get codigo => _codigo ?? '';
  bool hasCodigo() => _codigo != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "uid_Plan" field.
  String? _uidPlan;
  String get uidPlan => _uidPlan ?? '';
  bool hasUidPlan() => _uidPlan != null;

  // "uid_user" field.
  String? _uidUser;
  String get uidUser => _uidUser ?? '';
  bool hasUidUser() => _uidUser != null;

  void _initializeFields() {
    _token = snapshotData['token'] as String?;
    _ordenID = snapshotData['ordenID'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _codigo = snapshotData['codigo'] as String?;
    _estado = snapshotData['estado'] as String?;
    _uidPlan = snapshotData['uid_Plan'] as String?;
    _uidUser = snapshotData['uid_user'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pasarelaPagos');

  static Stream<PasarelaPagosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PasarelaPagosRecord.fromSnapshot(s));

  static Future<PasarelaPagosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PasarelaPagosRecord.fromSnapshot(s));

  static PasarelaPagosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PasarelaPagosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PasarelaPagosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PasarelaPagosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PasarelaPagosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PasarelaPagosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPasarelaPagosRecordData({
  String? token,
  String? ordenID,
  DateTime? createdTime,
  String? codigo,
  String? estado,
  String? uidPlan,
  String? uidUser,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'token': token,
      'ordenID': ordenID,
      'created_time': createdTime,
      'codigo': codigo,
      'estado': estado,
      'uid_Plan': uidPlan,
      'uid_user': uidUser,
    }.withoutNulls,
  );

  return firestoreData;
}

class PasarelaPagosRecordDocumentEquality
    implements Equality<PasarelaPagosRecord> {
  const PasarelaPagosRecordDocumentEquality();

  @override
  bool equals(PasarelaPagosRecord? e1, PasarelaPagosRecord? e2) {
    return e1?.token == e2?.token &&
        e1?.ordenID == e2?.ordenID &&
        e1?.createdTime == e2?.createdTime &&
        e1?.codigo == e2?.codigo &&
        e1?.estado == e2?.estado &&
        e1?.uidPlan == e2?.uidPlan &&
        e1?.uidUser == e2?.uidUser;
  }

  @override
  int hash(PasarelaPagosRecord? e) => const ListEquality().hash([
        e?.token,
        e?.ordenID,
        e?.createdTime,
        e?.codigo,
        e?.estado,
        e?.uidPlan,
        e?.uidUser
      ]);

  @override
  bool isValidKey(Object? o) => o is PasarelaPagosRecord;
}
