// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class OpeningStruct extends FFFirebaseStruct {
  OpeningStruct({
    String? string1,
    String? string2,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _string1 = string1,
        _string2 = string2,
        super(firestoreUtilData);

  // "string1" field.
  String? _string1;
  String get string1 => _string1 ?? '';
  set string1(String? val) => _string1 = val;

  bool hasString1() => _string1 != null;

  // "string2" field.
  String? _string2;
  String get string2 => _string2 ?? '';
  set string2(String? val) => _string2 = val;

  bool hasString2() => _string2 != null;

  static OpeningStruct fromMap(Map<String, dynamic> data) => OpeningStruct(
        string1: data['string1'] as String?,
        string2: data['string2'] as String?,
      );

  static OpeningStruct? maybeFromMap(dynamic data) =>
      data is Map ? OpeningStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'string1': _string1,
        'string2': _string2,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'string1': serializeParam(
          _string1,
          ParamType.String,
        ),
        'string2': serializeParam(
          _string2,
          ParamType.String,
        ),
      }.withoutNulls;

  static OpeningStruct fromSerializableMap(Map<String, dynamic> data) =>
      OpeningStruct(
        string1: deserializeParam(
          data['string1'],
          ParamType.String,
          false,
        ),
        string2: deserializeParam(
          data['string2'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OpeningStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OpeningStruct &&
        string1 == other.string1 &&
        string2 == other.string2;
  }

  @override
  int get hashCode => const ListEquality().hash([string1, string2]);
}

OpeningStruct createOpeningStruct({
  String? string1,
  String? string2,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OpeningStruct(
      string1: string1,
      string2: string2,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OpeningStruct? updateOpeningStruct(
  OpeningStruct? opening, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    opening
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOpeningStructData(
  Map<String, dynamic> firestoreData,
  OpeningStruct? opening,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (opening == null) {
    return;
  }
  if (opening.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && opening.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final openingData = getOpeningFirestoreData(opening, forFieldValue);
  final nestedData = openingData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = opening.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOpeningFirestoreData(
  OpeningStruct? opening, [
  bool forFieldValue = false,
]) {
  if (opening == null) {
    return {};
  }
  final firestoreData = mapToFirestore(opening.toMap());

  // Add any Firestore field values
  mapToFirestore(opening.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOpeningListFirestoreData(
  List<OpeningStruct>? openings,
) =>
    openings?.map((e) => getOpeningFirestoreData(e, true)).toList() ?? [];
