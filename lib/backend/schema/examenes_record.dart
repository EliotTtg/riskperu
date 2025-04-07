import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExamenesRecord extends FirestoreRecord {
  ExamenesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "fecha_creacion" field.
  DateTime? _fechaCreacion;
  DateTime? get fechaCreacion => _fechaCreacion;
  bool hasFechaCreacion() => _fechaCreacion != null;

  // "tiempo_limite" field.
  int? _tiempoLimite;
  int get tiempoLimite => _tiempoLimite ?? 0;
  bool hasTiempoLimite() => _tiempoLimite != null;

  // "uid_Teacher" field.
  String? _uidTeacher;
  String get uidTeacher => _uidTeacher ?? '';
  bool hasUidTeacher() => _uidTeacher != null;

  // "uid_Course" field.
  String? _uidCourse;
  String get uidCourse => _uidCourse ?? '';
  bool hasUidCourse() => _uidCourse != null;

  // "state" field.
  bool? _state;
  bool get state => _state ?? false;
  bool hasState() => _state != null;

  // "uid_Group" field.
  String? _uidGroup;
  String get uidGroup => _uidGroup ?? '';
  bool hasUidGroup() => _uidGroup != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _nombre = snapshotData['nombre'] as String?;
    _descripcion = snapshotData['descripcion'] as String?;
    _fechaCreacion = snapshotData['fecha_creacion'] as DateTime?;
    _tiempoLimite = castToType<int>(snapshotData['tiempo_limite']);
    _uidTeacher = snapshotData['uid_Teacher'] as String?;
    _uidCourse = snapshotData['uid_Course'] as String?;
    _state = snapshotData['state'] as bool?;
    _uidGroup = snapshotData['uid_Group'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('examenes');

  static Stream<ExamenesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExamenesRecord.fromSnapshot(s));

  static Future<ExamenesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExamenesRecord.fromSnapshot(s));

  static ExamenesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExamenesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExamenesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExamenesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExamenesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExamenesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExamenesRecordData({
  String? uid,
  String? nombre,
  String? descripcion,
  DateTime? fechaCreacion,
  int? tiempoLimite,
  String? uidTeacher,
  String? uidCourse,
  bool? state,
  String? uidGroup,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'nombre': nombre,
      'descripcion': descripcion,
      'fecha_creacion': fechaCreacion,
      'tiempo_limite': tiempoLimite,
      'uid_Teacher': uidTeacher,
      'uid_Course': uidCourse,
      'state': state,
      'uid_Group': uidGroup,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExamenesRecordDocumentEquality implements Equality<ExamenesRecord> {
  const ExamenesRecordDocumentEquality();

  @override
  bool equals(ExamenesRecord? e1, ExamenesRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.nombre == e2?.nombre &&
        e1?.descripcion == e2?.descripcion &&
        e1?.fechaCreacion == e2?.fechaCreacion &&
        e1?.tiempoLimite == e2?.tiempoLimite &&
        e1?.uidTeacher == e2?.uidTeacher &&
        e1?.uidCourse == e2?.uidCourse &&
        e1?.state == e2?.state &&
        e1?.uidGroup == e2?.uidGroup;
  }

  @override
  int hash(ExamenesRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.nombre,
        e?.descripcion,
        e?.fechaCreacion,
        e?.tiempoLimite,
        e?.uidTeacher,
        e?.uidCourse,
        e?.state,
        e?.uidGroup
      ]);

  @override
  bool isValidKey(Object? o) => o is ExamenesRecord;
}
