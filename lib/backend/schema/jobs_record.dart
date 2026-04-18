import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JobsRecord extends FirestoreRecord {
  JobsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "vertragsdauer" field.
  String? _vertragsdauer;
  String get vertragsdauer => _vertragsdauer ?? '';
  bool hasVertragsdauer() => _vertragsdauer != null;

  // "allianzpartnerName" field.
  String? _allianzpartnerName;
  String get allianzpartnerName => _allianzpartnerName ?? '';
  bool hasAllianzpartnerName() => _allianzpartnerName != null;

  // "stellenangebotsTitel" field.
  String? _stellenangebotsTitel;
  String get stellenangebotsTitel => _stellenangebotsTitel ?? '';
  bool hasStellenangebotsTitel() => _stellenangebotsTitel != null;

  // "geforderterBildungsabschluss" field.
  String? _geforderterBildungsabschluss;
  String get geforderterBildungsabschluss =>
      _geforderterBildungsabschluss ?? '';
  bool hasGeforderterBildungsabschluss() =>
      _geforderterBildungsabschluss != null;

  // "_id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "ausbildungsart" field.
  String? _ausbildungsart;
  String get ausbildungsart => _ausbildungsart ?? '';
  bool hasAusbildungsart() => _ausbildungsart != null;

  // "stellenangebotsart" field.
  String? _stellenangebotsart;
  String get stellenangebotsart => _stellenangebotsart ?? '';
  bool hasStellenangebotsart() => _stellenangebotsart != null;

  // "hauptberuf" field.
  String? _hauptberuf;
  String get hauptberuf => _hauptberuf ?? '';
  bool hasHauptberuf() => _hauptberuf != null;

  // "arbeitgeberKundennummerHash" field.
  String? _arbeitgeberKundennummerHash;
  String get arbeitgeberKundennummerHash => _arbeitgeberKundennummerHash ?? '';
  bool hasArbeitgeberKundennummerHash() => _arbeitgeberKundennummerHash != null;

  // "datumErsteVeroeffentlichung" field.
  String? _datumErsteVeroeffentlichung;
  String get datumErsteVeroeffentlichung => _datumErsteVeroeffentlichung ?? '';
  bool hasDatumErsteVeroeffentlichung() => _datumErsteVeroeffentlichung != null;

  // "aenderungsdatum" field.
  String? _aenderungsdatum;
  String get aenderungsdatum => _aenderungsdatum ?? '';
  bool hasAenderungsdatum() => _aenderungsdatum != null;

  // "allianzpartnerUrl" field.
  String? _allianzpartnerUrl;
  String get allianzpartnerUrl => _allianzpartnerUrl ?? '';
  bool hasAllianzpartnerUrl() => _allianzpartnerUrl != null;

  // "stellenangebotsBeschreibung" field.
  String? _stellenangebotsBeschreibung;
  String get stellenangebotsBeschreibung => _stellenangebotsBeschreibung ?? '';
  bool hasStellenangebotsBeschreibung() => _stellenangebotsBeschreibung != null;

  // "firma" field.
  String? _firma;
  String get firma => _firma ?? '';
  bool hasFirma() => _firma != null;

  // "verguetungsangabe" field.
  String? _verguetungsangabe;
  String get verguetungsangabe => _verguetungsangabe ?? '';
  bool hasVerguetungsangabe() => _verguetungsangabe != null;

  // "arbeitszeitTeilzeitVormittag" field.
  bool? _arbeitszeitTeilzeitVormittag;
  bool get arbeitszeitTeilzeitVormittag =>
      _arbeitszeitTeilzeitVormittag ?? false;
  bool hasArbeitszeitTeilzeitVormittag() =>
      _arbeitszeitTeilzeitVormittag != null;

  // "arbeitszeitSchichtNachtWochenende" field.
  bool? _arbeitszeitSchichtNachtWochenende;
  bool get arbeitszeitSchichtNachtWochenende =>
      _arbeitszeitSchichtNachtWochenende ?? false;
  bool hasArbeitszeitSchichtNachtWochenende() =>
      _arbeitszeitSchichtNachtWochenende != null;

  // "arbeitszeitTeilzeitNachmittag" field.
  bool? _arbeitszeitTeilzeitNachmittag;
  bool get arbeitszeitTeilzeitNachmittag =>
      _arbeitszeitTeilzeitNachmittag ?? false;
  bool hasArbeitszeitTeilzeitNachmittag() =>
      _arbeitszeitTeilzeitNachmittag != null;

  // "arbeitszeitTeilzeitAbend" field.
  bool? _arbeitszeitTeilzeitAbend;
  bool get arbeitszeitTeilzeitAbend => _arbeitszeitTeilzeitAbend ?? false;
  bool hasArbeitszeitTeilzeitAbend() => _arbeitszeitTeilzeitAbend != null;

  // "arbeitszeitVollzeit" field.
  bool? _arbeitszeitVollzeit;
  bool get arbeitszeitVollzeit => _arbeitszeitVollzeit ?? false;
  bool hasArbeitszeitVollzeit() => _arbeitszeitVollzeit != null;

  // "istArbeitnehmerUeberlassung" field.
  bool? _istArbeitnehmerUeberlassung;
  bool get istArbeitnehmerUeberlassung => _istArbeitnehmerUeberlassung ?? false;
  bool hasIstArbeitnehmerUeberlassung() => _istArbeitnehmerUeberlassung != null;

  // "arbeitszeitHeimarbeitTelearbeit" field.
  bool? _arbeitszeitHeimarbeitTelearbeit;
  bool get arbeitszeitHeimarbeitTelearbeit =>
      _arbeitszeitHeimarbeitTelearbeit ?? false;
  bool hasArbeitszeitHeimarbeitTelearbeit() =>
      _arbeitszeitHeimarbeitTelearbeit != null;

  // "arbeitszeitTeilzeitFlexibel" field.
  bool? _arbeitszeitTeilzeitFlexibel;
  bool get arbeitszeitTeilzeitFlexibel => _arbeitszeitTeilzeitFlexibel ?? false;
  bool hasArbeitszeitTeilzeitFlexibel() => _arbeitszeitTeilzeitFlexibel != null;

  // "istBetreut" field.
  bool? _istBetreut;
  bool get istBetreut => _istBetreut ?? false;
  bool hasIstBetreut() => _istBetreut != null;

  // "istBehinderungGefordert" field.
  bool? _istBehinderungGefordert;
  bool get istBehinderungGefordert => _istBehinderungGefordert ?? false;
  bool hasIstBehinderungGefordert() => _istBehinderungGefordert != null;

  // "istPrivateArbeitsvermittlung" field.
  bool? _istPrivateArbeitsvermittlung;
  bool get istPrivateArbeitsvermittlung =>
      _istPrivateArbeitsvermittlung ?? false;
  bool hasIstPrivateArbeitsvermittlung() =>
      _istPrivateArbeitsvermittlung != null;

  // "eintrittszeitraum" field.
  DatumVonStruct? _eintrittszeitraum;
  DatumVonStruct get eintrittszeitraum =>
      _eintrittszeitraum ?? DatumVonStruct();
  bool hasEintrittszeitraum() => _eintrittszeitraum != null;

  // "veroeffentlichungszeitraum" field.
  DatumVonStruct? _veroeffentlichungszeitraum;
  DatumVonStruct get veroeffentlichungszeitraum =>
      _veroeffentlichungszeitraum ?? DatumVonStruct();
  bool hasVeroeffentlichungszeitraum() => _veroeffentlichungszeitraum != null;

  // "stellenlokationen" field.
  List<StandortStruct>? _stellenlokationen;
  List<StandortStruct> get stellenlokationen => _stellenlokationen ?? const [];
  bool hasStellenlokationen() => _stellenlokationen != null;

  // "arbeitgeberkundennummerHash" field.
  String? _arbeitgeberkundennummerHash;
  String get arbeitgeberkundennummerHash => _arbeitgeberkundennummerHash ?? '';
  bool hasArbeitgeberkundennummerHash() => _arbeitgeberkundennummerHash != null;

  // "ausbildungsverguetungJahr1" field.
  double? _ausbildungsverguetungJahr1;
  double get ausbildungsverguetungJahr1 => _ausbildungsverguetungJahr1 ?? 0.0;
  bool hasAusbildungsverguetungJahr1() => _ausbildungsverguetungJahr1 != null;

  // "ausbildungsverguetungJahr2" field.
  double? _ausbildungsverguetungJahr2;
  double get ausbildungsverguetungJahr2 => _ausbildungsverguetungJahr2 ?? 0.0;
  bool hasAusbildungsverguetungJahr2() => _ausbildungsverguetungJahr2 != null;

  // "ausbildungsverguetungJahr3" field.
  double? _ausbildungsverguetungJahr3;
  double get ausbildungsverguetungJahr3 => _ausbildungsverguetungJahr3 ?? 0.0;
  bool hasAusbildungsverguetungJahr3() => _ausbildungsverguetungJahr3 != null;

  // "ausbildungsverguetungJahr4" field.
  double? _ausbildungsverguetungJahr4;
  double get ausbildungsverguetungJahr4 => _ausbildungsverguetungJahr4 ?? 0.0;
  bool hasAusbildungsverguetungJahr4() => _ausbildungsverguetungJahr4 != null;

  // "chiffrenummer" field.
  String? _chiffrenummer;
  String get chiffrenummer => _chiffrenummer ?? '';
  bool hasChiffrenummer() => _chiffrenummer != null;

  // "istGeringfuegigeBeschaeftigung" field.
  bool? _istGeringfuegigeBeschaeftigung;
  bool get istGeringfuegigeBeschaeftigung =>
      _istGeringfuegigeBeschaeftigung ?? false;
  bool hasIstGeringfuegigeBeschaeftigung() =>
      _istGeringfuegigeBeschaeftigung != null;

  // "quereinstiegGeeignet" field.
  bool? _quereinstiegGeeignet;
  bool get quereinstiegGeeignet => _quereinstiegGeeignet ?? false;
  bool hasQuereinstiegGeeignet() => _quereinstiegGeeignet != null;

  // "studienform" field.
  String? _studienform;
  String get studienform => _studienform ?? '';
  bool hasStudienform() => _studienform != null;

  // "studiengang" field.
  String? _studiengang;
  String get studiengang => _studiengang ?? '';
  bool hasStudiengang() => _studiengang != null;

  void _initializeFields() {
    _vertragsdauer = snapshotData['vertragsdauer'] as String?;
    _allianzpartnerName = snapshotData['allianzpartnerName'] as String?;
    _stellenangebotsTitel = snapshotData['stellenangebotsTitel'] as String?;
    _geforderterBildungsabschluss =
        snapshotData['geforderterBildungsabschluss'] as String?;
    _id = snapshotData['_id'] as String?;
    _ausbildungsart = snapshotData['ausbildungsart'] as String?;
    _stellenangebotsart = snapshotData['stellenangebotsart'] as String?;
    _hauptberuf = snapshotData['hauptberuf'] as String?;
    _arbeitgeberKundennummerHash =
        snapshotData['arbeitgeberKundennummerHash'] as String?;
    _datumErsteVeroeffentlichung =
        snapshotData['datumErsteVeroeffentlichung'] as String?;
    _aenderungsdatum = snapshotData['aenderungsdatum'] as String?;
    _allianzpartnerUrl = snapshotData['allianzpartnerUrl'] as String?;
    _stellenangebotsBeschreibung =
        snapshotData['stellenangebotsBeschreibung'] as String?;
    _firma = snapshotData['firma'] as String?;
    _verguetungsangabe = snapshotData['verguetungsangabe'] as String?;
    _arbeitszeitTeilzeitVormittag =
        snapshotData['arbeitszeitTeilzeitVormittag'] as bool?;
    _arbeitszeitSchichtNachtWochenende =
        snapshotData['arbeitszeitSchichtNachtWochenende'] as bool?;
    _arbeitszeitTeilzeitNachmittag =
        snapshotData['arbeitszeitTeilzeitNachmittag'] as bool?;
    _arbeitszeitTeilzeitAbend =
        snapshotData['arbeitszeitTeilzeitAbend'] as bool?;
    _arbeitszeitVollzeit = snapshotData['arbeitszeitVollzeit'] as bool?;
    _istArbeitnehmerUeberlassung =
        snapshotData['istArbeitnehmerUeberlassung'] as bool?;
    _arbeitszeitHeimarbeitTelearbeit =
        snapshotData['arbeitszeitHeimarbeitTelearbeit'] as bool?;
    _arbeitszeitTeilzeitFlexibel =
        snapshotData['arbeitszeitTeilzeitFlexibel'] as bool?;
    _istBetreut = snapshotData['istBetreut'] as bool?;
    _istBehinderungGefordert = snapshotData['istBehinderungGefordert'] as bool?;
    _istPrivateArbeitsvermittlung =
        snapshotData['istPrivateArbeitsvermittlung'] as bool?;
    _eintrittszeitraum = snapshotData['eintrittszeitraum'] is DatumVonStruct
        ? snapshotData['eintrittszeitraum']
        : DatumVonStruct.maybeFromMap(snapshotData['eintrittszeitraum']);
    _veroeffentlichungszeitraum =
        snapshotData['veroeffentlichungszeitraum'] is DatumVonStruct
            ? snapshotData['veroeffentlichungszeitraum']
            : DatumVonStruct.maybeFromMap(
                snapshotData['veroeffentlichungszeitraum']);
    _stellenlokationen = getStructList(
      snapshotData['stellenlokationen'],
      StandortStruct.fromMap,
    );
    _arbeitgeberkundennummerHash =
        snapshotData['arbeitgeberkundennummerHash'] as String?;
    _ausbildungsverguetungJahr1 =
        castToType<double>(snapshotData['ausbildungsverguetungJahr1']);
    _ausbildungsverguetungJahr2 =
        castToType<double>(snapshotData['ausbildungsverguetungJahr2']);
    _ausbildungsverguetungJahr3 =
        castToType<double>(snapshotData['ausbildungsverguetungJahr3']);
    _ausbildungsverguetungJahr4 =
        castToType<double>(snapshotData['ausbildungsverguetungJahr4']);
    _chiffrenummer = snapshotData['chiffrenummer'] as String?;
    _istGeringfuegigeBeschaeftigung =
        snapshotData['istGeringfuegigeBeschaeftigung'] as bool?;
    _quereinstiegGeeignet = snapshotData['quereinstiegGeeignet'] as bool?;
    _studienform = snapshotData['studienform'] as String?;
    _studiengang = snapshotData['studiengang'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('jobs');

  static Stream<JobsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JobsRecord.fromSnapshot(s));

  static Future<JobsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JobsRecord.fromSnapshot(s));

  static JobsRecord fromSnapshot(DocumentSnapshot snapshot) => JobsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JobsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JobsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JobsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JobsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJobsRecordData({
  String? vertragsdauer,
  String? allianzpartnerName,
  String? stellenangebotsTitel,
  String? geforderterBildungsabschluss,
  String? id,
  String? ausbildungsart,
  String? stellenangebotsart,
  String? hauptberuf,
  String? arbeitgeberKundennummerHash,
  String? datumErsteVeroeffentlichung,
  String? aenderungsdatum,
  String? allianzpartnerUrl,
  String? stellenangebotsBeschreibung,
  String? firma,
  String? verguetungsangabe,
  bool? arbeitszeitTeilzeitVormittag,
  bool? arbeitszeitSchichtNachtWochenende,
  bool? arbeitszeitTeilzeitNachmittag,
  bool? arbeitszeitTeilzeitAbend,
  bool? arbeitszeitVollzeit,
  bool? istArbeitnehmerUeberlassung,
  bool? arbeitszeitHeimarbeitTelearbeit,
  bool? arbeitszeitTeilzeitFlexibel,
  bool? istBetreut,
  bool? istBehinderungGefordert,
  bool? istPrivateArbeitsvermittlung,
  DatumVonStruct? eintrittszeitraum,
  DatumVonStruct? veroeffentlichungszeitraum,
  String? arbeitgeberkundennummerHash,
  double? ausbildungsverguetungJahr1,
  double? ausbildungsverguetungJahr2,
  double? ausbildungsverguetungJahr3,
  double? ausbildungsverguetungJahr4,
  String? chiffrenummer,
  bool? istGeringfuegigeBeschaeftigung,
  bool? quereinstiegGeeignet,
  String? studienform,
  String? studiengang,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'vertragsdauer': vertragsdauer,
      'allianzpartnerName': allianzpartnerName,
      'stellenangebotsTitel': stellenangebotsTitel,
      'geforderterBildungsabschluss': geforderterBildungsabschluss,
      '_id': id,
      'ausbildungsart': ausbildungsart,
      'stellenangebotsart': stellenangebotsart,
      'hauptberuf': hauptberuf,
      'arbeitgeberKundennummerHash': arbeitgeberKundennummerHash,
      'datumErsteVeroeffentlichung': datumErsteVeroeffentlichung,
      'aenderungsdatum': aenderungsdatum,
      'allianzpartnerUrl': allianzpartnerUrl,
      'stellenangebotsBeschreibung': stellenangebotsBeschreibung,
      'firma': firma,
      'verguetungsangabe': verguetungsangabe,
      'arbeitszeitTeilzeitVormittag': arbeitszeitTeilzeitVormittag,
      'arbeitszeitSchichtNachtWochenende': arbeitszeitSchichtNachtWochenende,
      'arbeitszeitTeilzeitNachmittag': arbeitszeitTeilzeitNachmittag,
      'arbeitszeitTeilzeitAbend': arbeitszeitTeilzeitAbend,
      'arbeitszeitVollzeit': arbeitszeitVollzeit,
      'istArbeitnehmerUeberlassung': istArbeitnehmerUeberlassung,
      'arbeitszeitHeimarbeitTelearbeit': arbeitszeitHeimarbeitTelearbeit,
      'arbeitszeitTeilzeitFlexibel': arbeitszeitTeilzeitFlexibel,
      'istBetreut': istBetreut,
      'istBehinderungGefordert': istBehinderungGefordert,
      'istPrivateArbeitsvermittlung': istPrivateArbeitsvermittlung,
      'eintrittszeitraum': DatumVonStruct().toMap(),
      'veroeffentlichungszeitraum': DatumVonStruct().toMap(),
      'arbeitgeberkundennummerHash': arbeitgeberkundennummerHash,
      'ausbildungsverguetungJahr1': ausbildungsverguetungJahr1,
      'ausbildungsverguetungJahr2': ausbildungsverguetungJahr2,
      'ausbildungsverguetungJahr3': ausbildungsverguetungJahr3,
      'ausbildungsverguetungJahr4': ausbildungsverguetungJahr4,
      'chiffrenummer': chiffrenummer,
      'istGeringfuegigeBeschaeftigung': istGeringfuegigeBeschaeftigung,
      'quereinstiegGeeignet': quereinstiegGeeignet,
      'studienform': studienform,
      'studiengang': studiengang,
    }.withoutNulls,
  );

  // Handle nested data for "eintrittszeitraum" field.
  addDatumVonStructData(firestoreData, eintrittszeitraum, 'eintrittszeitraum');

  // Handle nested data for "veroeffentlichungszeitraum" field.
  addDatumVonStructData(
      firestoreData, veroeffentlichungszeitraum, 'veroeffentlichungszeitraum');

  return firestoreData;
}

class JobsRecordDocumentEquality implements Equality<JobsRecord> {
  const JobsRecordDocumentEquality();

  @override
  bool equals(JobsRecord? e1, JobsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.vertragsdauer == e2?.vertragsdauer &&
        e1?.allianzpartnerName == e2?.allianzpartnerName &&
        e1?.stellenangebotsTitel == e2?.stellenangebotsTitel &&
        e1?.geforderterBildungsabschluss == e2?.geforderterBildungsabschluss &&
        e1?.id == e2?.id &&
        e1?.ausbildungsart == e2?.ausbildungsart &&
        e1?.stellenangebotsart == e2?.stellenangebotsart &&
        e1?.hauptberuf == e2?.hauptberuf &&
        e1?.arbeitgeberKundennummerHash == e2?.arbeitgeberKundennummerHash &&
        e1?.datumErsteVeroeffentlichung == e2?.datumErsteVeroeffentlichung &&
        e1?.aenderungsdatum == e2?.aenderungsdatum &&
        e1?.allianzpartnerUrl == e2?.allianzpartnerUrl &&
        e1?.stellenangebotsBeschreibung == e2?.stellenangebotsBeschreibung &&
        e1?.firma == e2?.firma &&
        e1?.verguetungsangabe == e2?.verguetungsangabe &&
        e1?.arbeitszeitTeilzeitVormittag == e2?.arbeitszeitTeilzeitVormittag &&
        e1?.arbeitszeitSchichtNachtWochenende ==
            e2?.arbeitszeitSchichtNachtWochenende &&
        e1?.arbeitszeitTeilzeitNachmittag ==
            e2?.arbeitszeitTeilzeitNachmittag &&
        e1?.arbeitszeitTeilzeitAbend == e2?.arbeitszeitTeilzeitAbend &&
        e1?.arbeitszeitVollzeit == e2?.arbeitszeitVollzeit &&
        e1?.istArbeitnehmerUeberlassung == e2?.istArbeitnehmerUeberlassung &&
        e1?.arbeitszeitHeimarbeitTelearbeit ==
            e2?.arbeitszeitHeimarbeitTelearbeit &&
        e1?.arbeitszeitTeilzeitFlexibel == e2?.arbeitszeitTeilzeitFlexibel &&
        e1?.istBetreut == e2?.istBetreut &&
        e1?.istBehinderungGefordert == e2?.istBehinderungGefordert &&
        e1?.istPrivateArbeitsvermittlung == e2?.istPrivateArbeitsvermittlung &&
        e1?.eintrittszeitraum == e2?.eintrittszeitraum &&
        e1?.veroeffentlichungszeitraum == e2?.veroeffentlichungszeitraum &&
        listEquality.equals(e1?.stellenlokationen, e2?.stellenlokationen) &&
        e1?.arbeitgeberkundennummerHash == e2?.arbeitgeberkundennummerHash &&
        e1?.ausbildungsverguetungJahr1 == e2?.ausbildungsverguetungJahr1 &&
        e1?.ausbildungsverguetungJahr2 == e2?.ausbildungsverguetungJahr2 &&
        e1?.ausbildungsverguetungJahr3 == e2?.ausbildungsverguetungJahr3 &&
        e1?.ausbildungsverguetungJahr4 == e2?.ausbildungsverguetungJahr4 &&
        e1?.chiffrenummer == e2?.chiffrenummer &&
        e1?.istGeringfuegigeBeschaeftigung ==
            e2?.istGeringfuegigeBeschaeftigung &&
        e1?.quereinstiegGeeignet == e2?.quereinstiegGeeignet &&
        e1?.studienform == e2?.studienform &&
        e1?.studiengang == e2?.studiengang;
  }

  @override
  int hash(JobsRecord? e) => const ListEquality().hash([
        e?.vertragsdauer,
        e?.allianzpartnerName,
        e?.stellenangebotsTitel,
        e?.geforderterBildungsabschluss,
        e?.id,
        e?.ausbildungsart,
        e?.stellenangebotsart,
        e?.hauptberuf,
        e?.arbeitgeberKundennummerHash,
        e?.datumErsteVeroeffentlichung,
        e?.aenderungsdatum,
        e?.allianzpartnerUrl,
        e?.stellenangebotsBeschreibung,
        e?.firma,
        e?.verguetungsangabe,
        e?.arbeitszeitTeilzeitVormittag,
        e?.arbeitszeitSchichtNachtWochenende,
        e?.arbeitszeitTeilzeitNachmittag,
        e?.arbeitszeitTeilzeitAbend,
        e?.arbeitszeitVollzeit,
        e?.istArbeitnehmerUeberlassung,
        e?.arbeitszeitHeimarbeitTelearbeit,
        e?.arbeitszeitTeilzeitFlexibel,
        e?.istBetreut,
        e?.istBehinderungGefordert,
        e?.istPrivateArbeitsvermittlung,
        e?.eintrittszeitraum,
        e?.veroeffentlichungszeitraum,
        e?.stellenlokationen,
        e?.arbeitgeberkundennummerHash,
        e?.ausbildungsverguetungJahr1,
        e?.ausbildungsverguetungJahr2,
        e?.ausbildungsverguetungJahr3,
        e?.ausbildungsverguetungJahr4,
        e?.chiffrenummer,
        e?.istGeringfuegigeBeschaeftigung,
        e?.quereinstiegGeeignet,
        e?.studienform,
        e?.studiengang
      ]);

  @override
  bool isValidKey(Object? o) => o is JobsRecord;
}
