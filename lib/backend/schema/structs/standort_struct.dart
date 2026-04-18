// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StandortStruct extends FFFirebaseStruct {
  StandortStruct({
    double? laenge,
    double? breite,
    AdresseStruct? adresse,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _laenge = laenge,
        _breite = breite,
        _adresse = adresse,
        super(firestoreUtilData);

  // "laenge" field.
  double? _laenge;
  double get laenge => _laenge ?? 0.0;
  set laenge(double? val) => _laenge = val;

  void incrementLaenge(double amount) => laenge = laenge + amount;

  bool hasLaenge() => _laenge != null;

  // "breite" field.
  double? _breite;
  double get breite => _breite ?? 0.0;
  set breite(double? val) => _breite = val;

  void incrementBreite(double amount) => breite = breite + amount;

  bool hasBreite() => _breite != null;

  // "adresse" field.
  AdresseStruct? _adresse;
  AdresseStruct get adresse => _adresse ?? AdresseStruct();
  set adresse(AdresseStruct? val) => _adresse = val;

  void updateAdresse(Function(AdresseStruct) updateFn) {
    updateFn(_adresse ??= AdresseStruct());
  }

  bool hasAdresse() => _adresse != null;

  static StandortStruct fromMap(Map<String, dynamic> data) => StandortStruct(
        laenge: castToType<double>(data['laenge']),
        breite: castToType<double>(data['breite']),
        adresse: data['adresse'] is AdresseStruct
            ? data['adresse']
            : AdresseStruct.maybeFromMap(data['adresse']),
      );

  static StandortStruct? maybeFromMap(dynamic data) =>
      data is Map ? StandortStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'laenge': _laenge,
        'breite': _breite,
        'adresse': _adresse?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'laenge': serializeParam(
          _laenge,
          ParamType.double,
        ),
        'breite': serializeParam(
          _breite,
          ParamType.double,
        ),
        'adresse': serializeParam(
          _adresse,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static StandortStruct fromSerializableMap(Map<String, dynamic> data) =>
      StandortStruct(
        laenge: deserializeParam(
          data['laenge'],
          ParamType.double,
          false,
        ),
        breite: deserializeParam(
          data['breite'],
          ParamType.double,
          false,
        ),
        adresse: deserializeStructParam(
          data['adresse'],
          ParamType.DataStruct,
          false,
          structBuilder: AdresseStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'StandortStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StandortStruct &&
        laenge == other.laenge &&
        breite == other.breite &&
        adresse == other.adresse;
  }

  @override
  int get hashCode => const ListEquality().hash([laenge, breite, adresse]);
}

StandortStruct createStandortStruct({
  double? laenge,
  double? breite,
  AdresseStruct? adresse,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StandortStruct(
      laenge: laenge,
      breite: breite,
      adresse: adresse ?? (clearUnsetFields ? AdresseStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StandortStruct? updateStandortStruct(
  StandortStruct? standort, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    standort
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStandortStructData(
  Map<String, dynamic> firestoreData,
  StandortStruct? standort,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (standort == null) {
    return;
  }
  if (standort.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && standort.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final standortData = getStandortFirestoreData(standort, forFieldValue);
  final nestedData = standortData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = standort.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStandortFirestoreData(
  StandortStruct? standort, [
  bool forFieldValue = false,
]) {
  if (standort == null) {
    return {};
  }
  final firestoreData = mapToFirestore(standort.toMap());

  // Handle nested data for "adresse" field.
  addAdresseStructData(
    firestoreData,
    standort.hasAdresse() ? standort.adresse : null,
    'adresse',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(standort.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStandortListFirestoreData(
  List<StandortStruct>? standorts,
) =>
    standorts?.map((e) => getStandortFirestoreData(e, true)).toList() ?? [];
