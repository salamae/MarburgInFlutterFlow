import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BuchenRecord extends FirestoreRecord {
  BuchenRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Beschreibung" field.
  String? _beschreibung;
  String get beschreibung => _beschreibung ?? '';
  bool hasBeschreibung() => _beschreibung != null;

  // "PLZ" field.
  String? _plz;
  String get plz => _plz ?? '';
  bool hasPlz() => _plz != null;

  // "Page_URL" field.
  String? _pageURL;
  String get pageURL => _pageURL ?? '';
  bool hasPageURL() => _pageURL != null;

  // "_id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "Laendercode" field.
  String? _laendercode;
  String get laendercode => _laendercode ?? '';
  bool hasLaendercode() => _laendercode != null;

  // "Ausstattung" field.
  String? _ausstattung;
  String get ausstattung => _ausstattung ?? '';
  bool hasAusstattung() => _ausstattung != null;

  // "Preis" field.
  String? _preis;
  String get preis => _preis ?? '';
  bool hasPreis() => _preis != null;

  // "Strasse" field.
  String? _strasse;
  String get strasse => _strasse ?? '';
  bool hasStrasse() => _strasse != null;

  // "Land" field.
  String? _land;
  String get land => _land ?? '';
  bool hasLand() => _land != null;

  // "Zimmer_Anzahl" field.
  String? _zimmerAnzahl;
  String get zimmerAnzahl => _zimmerAnzahl ?? '';
  bool hasZimmerAnzahl() => _zimmerAnzahl != null;

  // "Art" field.
  String? _art;
  String get art => _art ?? '';
  bool hasArt() => _art != null;

  // "Stadt" field.
  String? _stadt;
  String get stadt => _stadt ?? '';
  bool hasStadt() => _stadt != null;

  // "Bild_URL" field.
  String? _bildURL;
  String get bildURL => _bildURL ?? '';
  bool hasBildURL() => _bildURL != null;

  // "Sterne" field.
  int? _sterne;
  int get sterne => _sterne ?? 0;
  bool hasSterne() => _sterne != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _beschreibung = snapshotData['Beschreibung'] as String?;
    _plz = snapshotData['PLZ'] as String?;
    _pageURL = snapshotData['Page_URL'] as String?;
    _id = snapshotData['_id'] as String?;
    _laendercode = snapshotData['Laendercode'] as String?;
    _ausstattung = snapshotData['Ausstattung'] as String?;
    _preis = snapshotData['Preis'] as String?;
    _strasse = snapshotData['Strasse'] as String?;
    _land = snapshotData['Land'] as String?;
    _zimmerAnzahl = snapshotData['Zimmer_Anzahl'] as String?;
    _art = snapshotData['Art'] as String?;
    _stadt = snapshotData['Stadt'] as String?;
    _bildURL = snapshotData['Bild_URL'] as String?;
    _sterne = castToType<int>(snapshotData['Sterne']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('buchen');

  static Stream<BuchenRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BuchenRecord.fromSnapshot(s));

  static Future<BuchenRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BuchenRecord.fromSnapshot(s));

  static BuchenRecord fromSnapshot(DocumentSnapshot snapshot) => BuchenRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BuchenRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BuchenRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BuchenRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BuchenRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBuchenRecordData({
  String? name,
  String? beschreibung,
  String? plz,
  String? pageURL,
  String? id,
  String? laendercode,
  String? ausstattung,
  String? preis,
  String? strasse,
  String? land,
  String? zimmerAnzahl,
  String? art,
  String? stadt,
  String? bildURL,
  int? sterne,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'Beschreibung': beschreibung,
      'PLZ': plz,
      'Page_URL': pageURL,
      '_id': id,
      'Laendercode': laendercode,
      'Ausstattung': ausstattung,
      'Preis': preis,
      'Strasse': strasse,
      'Land': land,
      'Zimmer_Anzahl': zimmerAnzahl,
      'Art': art,
      'Stadt': stadt,
      'Bild_URL': bildURL,
      'Sterne': sterne,
    }.withoutNulls,
  );

  return firestoreData;
}

class BuchenRecordDocumentEquality implements Equality<BuchenRecord> {
  const BuchenRecordDocumentEquality();

  @override
  bool equals(BuchenRecord? e1, BuchenRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.beschreibung == e2?.beschreibung &&
        e1?.plz == e2?.plz &&
        e1?.pageURL == e2?.pageURL &&
        e1?.id == e2?.id &&
        e1?.laendercode == e2?.laendercode &&
        e1?.ausstattung == e2?.ausstattung &&
        e1?.preis == e2?.preis &&
        e1?.strasse == e2?.strasse &&
        e1?.land == e2?.land &&
        e1?.zimmerAnzahl == e2?.zimmerAnzahl &&
        e1?.art == e2?.art &&
        e1?.stadt == e2?.stadt &&
        e1?.bildURL == e2?.bildURL &&
        e1?.sterne == e2?.sterne;
  }

  @override
  int hash(BuchenRecord? e) => const ListEquality().hash([
        e?.name,
        e?.beschreibung,
        e?.plz,
        e?.pageURL,
        e?.id,
        e?.laendercode,
        e?.ausstattung,
        e?.preis,
        e?.strasse,
        e?.land,
        e?.zimmerAnzahl,
        e?.art,
        e?.stadt,
        e?.bildURL,
        e?.sterne
      ]);

  @override
  bool isValidKey(Object? o) => o is BuchenRecord;
}
