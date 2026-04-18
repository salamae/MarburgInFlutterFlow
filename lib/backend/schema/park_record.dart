import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParkRecord extends FirestoreRecord {
  ParkRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "WebsiteUrl" field.
  String? _websiteUrl;
  String get websiteUrl => _websiteUrl ?? '';
  bool hasWebsiteUrl() => _websiteUrl != null;

  // "Cancellation_information" field.
  String? _cancellationInformation;
  String get cancellationInformation => _cancellationInformation ?? '';
  bool hasCancellationInformation() => _cancellationInformation != null;

  // "Address2" field.
  String? _address2;
  String get address2 => _address2 ?? '';
  bool hasAddress2() => _address2 != null;

  // "Treffpunkt" field.
  String? _treffpunkt;
  String get treffpunkt => _treffpunkt ?? '';
  bool hasTreffpunkt() => _treffpunkt != null;

  // "City" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "_id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "Fax" field.
  String? _fax;
  String get fax => _fax ?? '';
  bool hasFax() => _fax != null;

  // "ShortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "Mobile" field.
  String? _mobile;
  String get mobile => _mobile ?? '';
  bool hasMobile() => _mobile != null;

  // "LongDescription" field.
  String? _longDescription;
  String get longDescription => _longDescription ?? '';
  bool hasLongDescription() => _longDescription != null;

  // "ZipCode" field.
  String? _zipCode;
  String get zipCode => _zipCode ?? '';
  bool hasZipCode() => _zipCode != null;

  // "onlineBookable" field.
  bool? _onlineBookable;
  bool get onlineBookable => _onlineBookable ?? false;
  bool hasOnlineBookable() => _onlineBookable != null;

  // "Phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "Country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "Kategorien" field.
  String? _kategorien;
  String get kategorien => _kategorien ?? '';
  bool hasKategorien() => _kategorien != null;

  // "Address1" field.
  String? _address1;
  String get address1 => _address1 ?? '';
  bool hasAddress1() => _address1 != null;

  // "EventUrl" field.
  String? _eventUrl;
  String get eventUrl => _eventUrl ?? '';
  bool hasEventUrl() => _eventUrl != null;

  // "PreisInformation" field.
  String? _preisInformation;
  String get preisInformation => _preisInformation ?? '';
  bool hasPreisInformation() => _preisInformation != null;

  // "Email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "Company" field.
  String? _company;
  String get company => _company ?? '';
  bool hasCompany() => _company != null;

  // "api_url" field.
  String? _apiUrl;
  String get apiUrl => _apiUrl ?? '';
  bool hasApiUrl() => _apiUrl != null;

  // "ImageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "Oeffnungszeiten" field.
  List<OeffnungszeitenStruct>? _oeffnungszeiten;
  List<OeffnungszeitenStruct> get oeffnungszeiten =>
      _oeffnungszeiten ?? const [];
  bool hasOeffnungszeiten() => _oeffnungszeiten != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _websiteUrl = snapshotData['WebsiteUrl'] as String?;
    _cancellationInformation =
        snapshotData['Cancellation_information'] as String?;
    _address2 = snapshotData['Address2'] as String?;
    _treffpunkt = snapshotData['Treffpunkt'] as String?;
    _city = snapshotData['City'] as String?;
    _id = snapshotData['_id'] as String?;
    _fax = snapshotData['Fax'] as String?;
    _shortDescription = snapshotData['ShortDescription'] as String?;
    _mobile = snapshotData['Mobile'] as String?;
    _longDescription = snapshotData['LongDescription'] as String?;
    _zipCode = snapshotData['ZipCode'] as String?;
    _onlineBookable = snapshotData['onlineBookable'] as bool?;
    _phone = snapshotData['Phone'] as String?;
    _country = snapshotData['Country'] as String?;
    _kategorien = snapshotData['Kategorien'] as String?;
    _address1 = snapshotData['Address1'] as String?;
    _eventUrl = snapshotData['EventUrl'] as String?;
    _preisInformation = snapshotData['PreisInformation'] as String?;
    _email = snapshotData['Email'] as String?;
    _company = snapshotData['Company'] as String?;
    _apiUrl = snapshotData['api_url'] as String?;
    _imageUrl = snapshotData['ImageUrl'] as String?;
    _oeffnungszeiten = getStructList(
      snapshotData['Oeffnungszeiten'],
      OeffnungszeitenStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('park');

  static Stream<ParkRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ParkRecord.fromSnapshot(s));

  static Future<ParkRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ParkRecord.fromSnapshot(s));

  static ParkRecord fromSnapshot(DocumentSnapshot snapshot) => ParkRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ParkRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ParkRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ParkRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ParkRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createParkRecordData({
  String? name,
  String? websiteUrl,
  String? cancellationInformation,
  String? address2,
  String? treffpunkt,
  String? city,
  String? id,
  String? fax,
  String? shortDescription,
  String? mobile,
  String? longDescription,
  String? zipCode,
  bool? onlineBookable,
  String? phone,
  String? country,
  String? kategorien,
  String? address1,
  String? eventUrl,
  String? preisInformation,
  String? email,
  String? company,
  String? apiUrl,
  String? imageUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'WebsiteUrl': websiteUrl,
      'Cancellation_information': cancellationInformation,
      'Address2': address2,
      'Treffpunkt': treffpunkt,
      'City': city,
      '_id': id,
      'Fax': fax,
      'ShortDescription': shortDescription,
      'Mobile': mobile,
      'LongDescription': longDescription,
      'ZipCode': zipCode,
      'onlineBookable': onlineBookable,
      'Phone': phone,
      'Country': country,
      'Kategorien': kategorien,
      'Address1': address1,
      'EventUrl': eventUrl,
      'PreisInformation': preisInformation,
      'Email': email,
      'Company': company,
      'api_url': apiUrl,
      'ImageUrl': imageUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class ParkRecordDocumentEquality implements Equality<ParkRecord> {
  const ParkRecordDocumentEquality();

  @override
  bool equals(ParkRecord? e1, ParkRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.websiteUrl == e2?.websiteUrl &&
        e1?.cancellationInformation == e2?.cancellationInformation &&
        e1?.address2 == e2?.address2 &&
        e1?.treffpunkt == e2?.treffpunkt &&
        e1?.city == e2?.city &&
        e1?.id == e2?.id &&
        e1?.fax == e2?.fax &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.mobile == e2?.mobile &&
        e1?.longDescription == e2?.longDescription &&
        e1?.zipCode == e2?.zipCode &&
        e1?.onlineBookable == e2?.onlineBookable &&
        e1?.phone == e2?.phone &&
        e1?.country == e2?.country &&
        e1?.kategorien == e2?.kategorien &&
        e1?.address1 == e2?.address1 &&
        e1?.eventUrl == e2?.eventUrl &&
        e1?.preisInformation == e2?.preisInformation &&
        e1?.email == e2?.email &&
        e1?.company == e2?.company &&
        e1?.apiUrl == e2?.apiUrl &&
        e1?.imageUrl == e2?.imageUrl &&
        listEquality.equals(e1?.oeffnungszeiten, e2?.oeffnungszeiten);
  }

  @override
  int hash(ParkRecord? e) => const ListEquality().hash([
        e?.name,
        e?.websiteUrl,
        e?.cancellationInformation,
        e?.address2,
        e?.treffpunkt,
        e?.city,
        e?.id,
        e?.fax,
        e?.shortDescription,
        e?.mobile,
        e?.longDescription,
        e?.zipCode,
        e?.onlineBookable,
        e?.phone,
        e?.country,
        e?.kategorien,
        e?.address1,
        e?.eventUrl,
        e?.preisInformation,
        e?.email,
        e?.company,
        e?.apiUrl,
        e?.imageUrl,
        e?.oeffnungszeiten
      ]);

  @override
  bool isValidKey(Object? o) => o is ParkRecord;
}
