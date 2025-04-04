import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlansRecord extends FirestoreRecord {
  PlansRecord._(
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

  // "Created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "Descripcion" field.
  List<String>? _descripcion;
  List<String> get descripcion => _descripcion ?? const [];
  bool hasDescripcion() => _descripcion != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "Color" field.
  Color? _color;
  Color? get color => _color;
  bool hasColor() => _color != null;

  // "PriceD" field.
  double? _priceD;
  double get priceD => _priceD ?? 0.0;
  bool hasPriceD() => _priceD != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _name = snapshotData['Name'] as String?;
    _createdBy = snapshotData['Created_By'] as String?;
    _createdDate = snapshotData['Created_date'] as DateTime?;
    _descripcion = getDataList(snapshotData['Descripcion']);
    _image = snapshotData['Image'] as String?;
    _color = getSchemaColor(snapshotData['Color']);
    _priceD = castToType<double>(snapshotData['PriceD']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Plans');

  static Stream<PlansRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlansRecord.fromSnapshot(s));

  static Future<PlansRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlansRecord.fromSnapshot(s));

  static PlansRecord fromSnapshot(DocumentSnapshot snapshot) => PlansRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlansRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlansRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlansRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlansRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlansRecordData({
  String? uid,
  String? name,
  String? createdBy,
  DateTime? createdDate,
  String? image,
  Color? color,
  double? priceD,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'Name': name,
      'Created_By': createdBy,
      'Created_date': createdDate,
      'Image': image,
      'Color': color,
      'PriceD': priceD,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlansRecordDocumentEquality implements Equality<PlansRecord> {
  const PlansRecordDocumentEquality();

  @override
  bool equals(PlansRecord? e1, PlansRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        e1?.name == e2?.name &&
        e1?.createdBy == e2?.createdBy &&
        e1?.createdDate == e2?.createdDate &&
        listEquality.equals(e1?.descripcion, e2?.descripcion) &&
        e1?.image == e2?.image &&
        e1?.color == e2?.color &&
        e1?.priceD == e2?.priceD;
  }

  @override
  int hash(PlansRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.name,
        e?.createdBy,
        e?.createdDate,
        e?.descripcion,
        e?.image,
        e?.color,
        e?.priceD
      ]);

  @override
  bool isValidKey(Object? o) => o is PlansRecord;
}
