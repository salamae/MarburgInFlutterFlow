// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AdresseStruct extends FFFirebaseStruct {
  AdresseStruct({
    String? land,
    String? plz,
    String? ort,
    String? region,
    String? strasse,
    String? hausnummer,
    String? ortsteil,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _land = land,
        _plz = plz,
        _ort = ort,
        _region = region,
        _strasse = strasse,
        _hausnummer = hausnummer,
        _ortsteil = ortsteil,
        super(firestoreUtilData);

  // "land" field.
  String? _land;
  String get land => _land ?? '';
  set land(String? val) => _land = val;

  bool hasLand() => _land != null;

  // "plz" field.
  String? _plz;
  String get plz => _plz ?? '';
  set plz(String? val) => _plz = val;

  bool hasPlz() => _plz != null;

  // "ort" field.
  String? _ort;
  String get ort => _ort ?? '';
  set ort(String? val) => _ort = val;

  bool hasOrt() => _ort != null;

  // "region" field.
  String? _region;
  String get region => _region ?? '';
  set region(String? val) => _region = val;

  bool hasRegion() => _region != null;

  // "strasse" field.
  String? _strasse;
  String get strasse => _strasse ?? '';
  set strasse(String? val) => _strasse = val;

  bool hasStrasse() => _strasse != null;

  // "hausnummer" field.
  String? _hausnummer;
  String get hausnummer => _hausnummer ?? '';
  set hausnummer(String? val) => _hausnummer = val;

  bool hasHausnummer() => _hausnummer != null;

  // "ortsteil" field.
  String? _ortsteil;
  String get ortsteil => _ortsteil ?? '';
  set ortsteil(String? val) => _ortsteil = val;

  bool hasOrtsteil() => _ortsteil != null;

  static AdresseStruct fromMap(Map<String, dynamic> data) => AdresseStruct(
        land: data['land'] as String?,
        plz: data['plz'] as String?,
        ort: data['ort'] as String?,
        region: data['region'] as String?,
        strasse: data['strasse'] as String?,
        hausnummer: data['hausnummer'] as String?,
        ortsteil: data['ortsteil'] as String?,
      );

  static AdresseStruct? maybeFromMap(dynamic data) =>
      data is Map ? AdresseStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'land': _land,
        'plz': _plz,
        'ort': _ort,
        'region': _region,
        'strasse': _strasse,
        'hausnummer': _hausnummer,
        'ortsteil': _ortsteil,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'land': serializeParam(
          _land,
          ParamType.String,
        ),
        'plz': serializeParam(
          _plz,
          ParamType.String,
        ),
        'ort': serializeParam(
          _ort,
          ParamType.String,
        ),
        'region': serializeParam(
          _region,
          ParamType.String,
        ),
        'strasse': serializeParam(
          _strasse,
          ParamType.String,
        ),
        'hausnummer': serializeParam(
          _hausnummer,
          ParamType.String,
        ),
        'ortsteil': serializeParam(
          _ortsteil,
          ParamType.String,
        ),
      }.withoutNulls;

  static AdresseStruct fromSerializableMap(Map<String, dynamic> data) =>
      AdresseStruct(
        land: deserializeParam(
          data['land'],
          ParamType.String,
          false,
        ),
        plz: deserializeParam(
          data['plz'],
          ParamType.String,
          false,
        ),
        ort: deserializeParam(
          data['ort'],
          ParamType.String,
          false,
        ),
        region: deserializeParam(
          data['region'],
          ParamType.String,
          false,
        ),
        strasse: deserializeParam(
          data['strasse'],
          ParamType.String,
          false,
        ),
        hausnummer: deserializeParam(
          data['hausnummer'],
          ParamType.String,
          false,
        ),
        ortsteil: deserializeParam(
          data['ortsteil'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AdresseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AdresseStruct &&
        land == other.land &&
        plz == other.plz &&
        ort == other.ort &&
        region == other.region &&
        strasse == other.strasse &&
        hausnummer == other.hausnummer &&
        ortsteil == other.ortsteil;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([land, plz, ort, region, strasse, hausnummer, ortsteil]);
}

AdresseStruct createAdresseStruct({
  String? land,
  String? plz,
  String? ort,
  String? region,
  String? strasse,
  String? hausnummer,
  String? ortsteil,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AdresseStruct(
      land: land,
      plz: plz,
      ort: ort,
      region: region,
      strasse: strasse,
      hausnummer: hausnummer,
      ortsteil: ortsteil,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AdresseStruct? updateAdresseStruct(
  AdresseStruct? adresse, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    adresse
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAdresseStructData(
  Map<String, dynamic> firestoreData,
  AdresseStruct? adresse,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (adresse == null) {
    return;
  }
  if (adresse.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && adresse.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final adresseData = getAdresseFirestoreData(adresse, forFieldValue);
  final nestedData = adresseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = adresse.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAdresseFirestoreData(
  AdresseStruct? adresse, [
  bool forFieldValue = false,
]) {
  if (adresse == null) {
    return {};
  }
  final firestoreData = mapToFirestore(adresse.toMap());

  // Add any Firestore field values
  mapToFirestore(adresse.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAdresseListFirestoreData(
  List<AdresseStruct>? adresses,
) =>
    adresses?.map((e) => getAdresseFirestoreData(e, true)).toList() ?? [];
