// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersNumberStruct extends FFFirebaseStruct {
  UsersNumberStruct({
    String? category,
    int? number,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _category = category,
        _number = number,
        super(firestoreUtilData);

  // "Category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "Number" field.
  int? _number;
  int get number => _number ?? 0;
  set number(int? val) => _number = val;

  void incrementNumber(int amount) => number = number + amount;

  bool hasNumber() => _number != null;

  static UsersNumberStruct fromMap(Map<String, dynamic> data) =>
      UsersNumberStruct(
        category: data['Category'] as String?,
        number: castToType<int>(data['Number']),
      );

  static UsersNumberStruct? maybeFromMap(dynamic data) => data is Map
      ? UsersNumberStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Category': _category,
        'Number': _number,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Category': serializeParam(
          _category,
          ParamType.String,
        ),
        'Number': serializeParam(
          _number,
          ParamType.int,
        ),
      }.withoutNulls;

  static UsersNumberStruct fromSerializableMap(Map<String, dynamic> data) =>
      UsersNumberStruct(
        category: deserializeParam(
          data['Category'],
          ParamType.String,
          false,
        ),
        number: deserializeParam(
          data['Number'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'UsersNumberStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UsersNumberStruct &&
        category == other.category &&
        number == other.number;
  }

  @override
  int get hashCode => const ListEquality().hash([category, number]);
}

UsersNumberStruct createUsersNumberStruct({
  String? category,
  int? number,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UsersNumberStruct(
      category: category,
      number: number,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UsersNumberStruct? updateUsersNumberStruct(
  UsersNumberStruct? usersNumber, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    usersNumber
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUsersNumberStructData(
  Map<String, dynamic> firestoreData,
  UsersNumberStruct? usersNumber,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (usersNumber == null) {
    return;
  }
  if (usersNumber.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && usersNumber.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final usersNumberData =
      getUsersNumberFirestoreData(usersNumber, forFieldValue);
  final nestedData =
      usersNumberData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = usersNumber.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUsersNumberFirestoreData(
  UsersNumberStruct? usersNumber, [
  bool forFieldValue = false,
]) {
  if (usersNumber == null) {
    return {};
  }
  final firestoreData = mapToFirestore(usersNumber.toMap());

  // Add any Firestore field values
  usersNumber.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUsersNumberListFirestoreData(
  List<UsersNumberStruct>? usersNumbers,
) =>
    usersNumbers?.map((e) => getUsersNumberFirestoreData(e, true)).toList() ??
    [];
