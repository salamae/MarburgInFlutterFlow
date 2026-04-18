// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class OeffnungszeitenStruct extends FFFirebaseStruct {
  OeffnungszeitenStruct({
    String? dateFrom,
    String? dateTo,
    int? weekdays,
    String? timeFrom,
    String? timeTo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _dateFrom = dateFrom,
        _dateTo = dateTo,
        _weekdays = weekdays,
        _timeFrom = timeFrom,
        _timeTo = timeTo,
        super(firestoreUtilData);

  // "dateFrom" field.
  String? _dateFrom;
  String get dateFrom => _dateFrom ?? '';
  set dateFrom(String? val) => _dateFrom = val;

  bool hasDateFrom() => _dateFrom != null;

  // "dateTo" field.
  String? _dateTo;
  String get dateTo => _dateTo ?? '';
  set dateTo(String? val) => _dateTo = val;

  bool hasDateTo() => _dateTo != null;

  // "weekdays" field.
  int? _weekdays;
  int get weekdays => _weekdays ?? 0;
  set weekdays(int? val) => _weekdays = val;

  void incrementWeekdays(int amount) => weekdays = weekdays + amount;

  bool hasWeekdays() => _weekdays != null;

  // "timeFrom" field.
  String? _timeFrom;
  String get timeFrom => _timeFrom ?? '';
  set timeFrom(String? val) => _timeFrom = val;

  bool hasTimeFrom() => _timeFrom != null;

  // "timeTo" field.
  String? _timeTo;
  String get timeTo => _timeTo ?? '';
  set timeTo(String? val) => _timeTo = val;

  bool hasTimeTo() => _timeTo != null;

  static OeffnungszeitenStruct fromMap(Map<String, dynamic> data) =>
      OeffnungszeitenStruct(
        dateFrom: data['dateFrom'] as String?,
        dateTo: data['dateTo'] as String?,
        weekdays: castToType<int>(data['weekdays']),
        timeFrom: data['timeFrom'] as String?,
        timeTo: data['timeTo'] as String?,
      );

  static OeffnungszeitenStruct? maybeFromMap(dynamic data) => data is Map
      ? OeffnungszeitenStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'dateFrom': _dateFrom,
        'dateTo': _dateTo,
        'weekdays': _weekdays,
        'timeFrom': _timeFrom,
        'timeTo': _timeTo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'dateFrom': serializeParam(
          _dateFrom,
          ParamType.String,
        ),
        'dateTo': serializeParam(
          _dateTo,
          ParamType.String,
        ),
        'weekdays': serializeParam(
          _weekdays,
          ParamType.int,
        ),
        'timeFrom': serializeParam(
          _timeFrom,
          ParamType.String,
        ),
        'timeTo': serializeParam(
          _timeTo,
          ParamType.String,
        ),
      }.withoutNulls;

  static OeffnungszeitenStruct fromSerializableMap(Map<String, dynamic> data) =>
      OeffnungszeitenStruct(
        dateFrom: deserializeParam(
          data['dateFrom'],
          ParamType.String,
          false,
        ),
        dateTo: deserializeParam(
          data['dateTo'],
          ParamType.String,
          false,
        ),
        weekdays: deserializeParam(
          data['weekdays'],
          ParamType.int,
          false,
        ),
        timeFrom: deserializeParam(
          data['timeFrom'],
          ParamType.String,
          false,
        ),
        timeTo: deserializeParam(
          data['timeTo'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OeffnungszeitenStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OeffnungszeitenStruct &&
        dateFrom == other.dateFrom &&
        dateTo == other.dateTo &&
        weekdays == other.weekdays &&
        timeFrom == other.timeFrom &&
        timeTo == other.timeTo;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([dateFrom, dateTo, weekdays, timeFrom, timeTo]);
}

OeffnungszeitenStruct createOeffnungszeitenStruct({
  String? dateFrom,
  String? dateTo,
  int? weekdays,
  String? timeFrom,
  String? timeTo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OeffnungszeitenStruct(
      dateFrom: dateFrom,
      dateTo: dateTo,
      weekdays: weekdays,
      timeFrom: timeFrom,
      timeTo: timeTo,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OeffnungszeitenStruct? updateOeffnungszeitenStruct(
  OeffnungszeitenStruct? oeffnungszeiten, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    oeffnungszeiten
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOeffnungszeitenStructData(
  Map<String, dynamic> firestoreData,
  OeffnungszeitenStruct? oeffnungszeiten,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (oeffnungszeiten == null) {
    return;
  }
  if (oeffnungszeiten.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && oeffnungszeiten.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final oeffnungszeitenData =
      getOeffnungszeitenFirestoreData(oeffnungszeiten, forFieldValue);
  final nestedData =
      oeffnungszeitenData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = oeffnungszeiten.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOeffnungszeitenFirestoreData(
  OeffnungszeitenStruct? oeffnungszeiten, [
  bool forFieldValue = false,
]) {
  if (oeffnungszeiten == null) {
    return {};
  }
  final firestoreData = mapToFirestore(oeffnungszeiten.toMap());

  // Add any Firestore field values
  mapToFirestore(oeffnungszeiten.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOeffnungszeitenListFirestoreData(
  List<OeffnungszeitenStruct>? oeffnungszeitens,
) =>
    oeffnungszeitens
        ?.map((e) => getOeffnungszeitenFirestoreData(e, true))
        .toList() ??
    [];
