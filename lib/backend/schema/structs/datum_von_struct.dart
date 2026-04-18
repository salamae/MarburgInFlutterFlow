// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DatumVonStruct extends FFFirebaseStruct {
  DatumVonStruct({
    String? von,
    String? bis,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _von = von,
        _bis = bis,
        super(firestoreUtilData);

  // "von" field.
  String? _von;
  String get von => _von ?? '';
  set von(String? val) => _von = val;

  bool hasVon() => _von != null;

  // "bis" field.
  String? _bis;
  String get bis => _bis ?? '';
  set bis(String? val) => _bis = val;

  bool hasBis() => _bis != null;

  static DatumVonStruct fromMap(Map<String, dynamic> data) => DatumVonStruct(
        von: data['von'] as String?,
        bis: data['bis'] as String?,
      );

  static DatumVonStruct? maybeFromMap(dynamic data) =>
      data is Map ? DatumVonStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'von': _von,
        'bis': _bis,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'von': serializeParam(
          _von,
          ParamType.String,
        ),
        'bis': serializeParam(
          _bis,
          ParamType.String,
        ),
      }.withoutNulls;

  static DatumVonStruct fromSerializableMap(Map<String, dynamic> data) =>
      DatumVonStruct(
        von: deserializeParam(
          data['von'],
          ParamType.String,
          false,
        ),
        bis: deserializeParam(
          data['bis'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DatumVonStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DatumVonStruct && von == other.von && bis == other.bis;
  }

  @override
  int get hashCode => const ListEquality().hash([von, bis]);
}

DatumVonStruct createDatumVonStruct({
  String? von,
  String? bis,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DatumVonStruct(
      von: von,
      bis: bis,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DatumVonStruct? updateDatumVonStruct(
  DatumVonStruct? datumVon, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    datumVon
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDatumVonStructData(
  Map<String, dynamic> firestoreData,
  DatumVonStruct? datumVon,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (datumVon == null) {
    return;
  }
  if (datumVon.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && datumVon.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final datumVonData = getDatumVonFirestoreData(datumVon, forFieldValue);
  final nestedData = datumVonData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = datumVon.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDatumVonFirestoreData(
  DatumVonStruct? datumVon, [
  bool forFieldValue = false,
]) {
  if (datumVon == null) {
    return {};
  }
  final firestoreData = mapToFirestore(datumVon.toMap());

  // Add any Firestore field values
  mapToFirestore(datumVon.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDatumVonListFirestoreData(
  List<DatumVonStruct>? datumVons,
) =>
    datumVons?.map((e) => getDatumVonFirestoreData(e, true)).toList() ?? [];
