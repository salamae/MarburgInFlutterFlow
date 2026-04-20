import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  bool hasTime() => _time != null;

  // "place" field.
  String? _place;
  String get place => _place ?? '';
  bool hasPlace() => _place != null;

  // "Address1" field.
  String? _address1;
  String get address1 => _address1 ?? '';
  bool hasAddress1() => _address1 != null;

  // "api_url" field.
  String? _apiUrl;
  String get apiUrl => _apiUrl ?? '';
  bool hasApiUrl() => _apiUrl != null;

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

  // "WebsiteUrl" field.
  String? _websiteUrl;
  String get websiteUrl => _websiteUrl ?? '';
  bool hasWebsiteUrl() => _websiteUrl != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

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

  // "town" field.
  String? _town;
  String get town => _town ?? '';
  bool hasTown() => _town != null;

  // "Mobile" field.
  String? _mobile;
  String get mobile => _mobile ?? '';
  bool hasMobile() => _mobile != null;

  // "LongDescription" field.
  String? _longDescription;
  String get longDescription => _longDescription ?? '';
  bool hasLongDescription() => _longDescription != null;

  // "urlFriendlyName" field.
  String? _urlFriendlyName;
  String get urlFriendlyName => _urlFriendlyName ?? '';
  bool hasUrlFriendlyName() => _urlFriendlyName != null;

  // "ZipCode" field.
  String? _zipCode;
  String get zipCode => _zipCode ?? '';
  bool hasZipCode() => _zipCode != null;

  // "Email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "Company" field.
  String? _company;
  String get company => _company ?? '';
  bool hasCompany() => _company != null;

  // "Phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "EventUrl" field.
  String? _eventUrl;
  String get eventUrl => _eventUrl ?? '';
  bool hasEventUrl() => _eventUrl != null;

  // "PreisInformation" field.
  String? _preisInformation;
  String get preisInformation => _preisInformation ?? '';
  bool hasPreisInformation() => _preisInformation != null;

  // "Oeffnungszeiten" field.
  String? _oeffnungszeiten;
  String get oeffnungszeiten => _oeffnungszeiten ?? '';
  bool hasOeffnungszeiten() => _oeffnungszeiten != null;

  // "onlineBookable" field.
  bool? _onlineBookable;
  bool get onlineBookable => _onlineBookable ?? false;
  bool hasOnlineBookable() => _onlineBookable != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "Kategorien" field.
  String? _kategorien;
  String get kategorien => _kategorien ?? '';
  bool hasKategorien() => _kategorien != null;

  // "City" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _date = snapshotData['date'] as String?;
    _time = snapshotData['time'] as String?;
    _place = snapshotData['place'] as String?;
    _address1 = snapshotData['Address1'] as String?;
    _apiUrl = snapshotData['api_url'] as String?;
    _cancellationInformation =
        snapshotData['Cancellation_information'] as String?;
    _address2 = snapshotData['Address2'] as String?;
    _treffpunkt = snapshotData['Treffpunkt'] as String?;
    _websiteUrl = snapshotData['WebsiteUrl'] as String?;
    _country = snapshotData['country'] as String?;
    _id = snapshotData['_id'] as String?;
    _fax = snapshotData['Fax'] as String?;
    _shortDescription = snapshotData['ShortDescription'] as String?;
    _town = snapshotData['town'] as String?;
    _mobile = snapshotData['Mobile'] as String?;
    _longDescription = snapshotData['LongDescription'] as String?;
    _urlFriendlyName = snapshotData['urlFriendlyName'] as String?;
    _zipCode = snapshotData['ZipCode'] as String?;
    _email = snapshotData['Email'] as String?;
    _company = snapshotData['Company'] as String?;
    _phone = snapshotData['Phone'] as String?;
    _eventUrl = snapshotData['EventUrl'] as String?;
    _preisInformation = snapshotData['PreisInformation'] as String?;
    _oeffnungszeiten = snapshotData['Oeffnungszeiten'] as String?;
    _onlineBookable = snapshotData['onlineBookable'] as bool?;
    _description = snapshotData['description'] as String?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _kategorien = snapshotData['Kategorien'] as String?;
    _city = snapshotData['City'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsRecordData({
  String? name,
  String? date,
  String? time,
  String? place,
  String? address1,
  String? apiUrl,
  String? cancellationInformation,
  String? address2,
  String? treffpunkt,
  String? websiteUrl,
  String? country,
  String? id,
  String? fax,
  String? shortDescription,
  String? town,
  String? mobile,
  String? longDescription,
  String? urlFriendlyName,
  String? zipCode,
  String? email,
  String? company,
  String? phone,
  String? eventUrl,
  String? preisInformation,
  String? oeffnungszeiten,
  bool? onlineBookable,
  String? description,
  String? imageUrl,
  String? kategorien,
  String? city,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'date': date,
      'time': time,
      'place': place,
      'Address1': address1,
      'api_url': apiUrl,
      'Cancellation_information': cancellationInformation,
      'Address2': address2,
      'Treffpunkt': treffpunkt,
      'WebsiteUrl': websiteUrl,
      'country': country,
      '_id': id,
      'Fax': fax,
      'ShortDescription': shortDescription,
      'town': town,
      'Mobile': mobile,
      'LongDescription': longDescription,
      'urlFriendlyName': urlFriendlyName,
      'ZipCode': zipCode,
      'Email': email,
      'Company': company,
      'Phone': phone,
      'EventUrl': eventUrl,
      'PreisInformation': preisInformation,
      'Oeffnungszeiten': oeffnungszeiten,
      'onlineBookable': onlineBookable,
      'description': description,
      'imageUrl': imageUrl,
      'Kategorien': kategorien,
      'City': city,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventsRecordDocumentEquality implements Equality<EventsRecord> {
  const EventsRecordDocumentEquality();

  @override
  bool equals(EventsRecord? e1, EventsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.date == e2?.date &&
        e1?.time == e2?.time &&
        e1?.place == e2?.place &&
        e1?.address1 == e2?.address1 &&
        e1?.apiUrl == e2?.apiUrl &&
        e1?.cancellationInformation == e2?.cancellationInformation &&
        e1?.address2 == e2?.address2 &&
        e1?.treffpunkt == e2?.treffpunkt &&
        e1?.websiteUrl == e2?.websiteUrl &&
        e1?.country == e2?.country &&
        e1?.id == e2?.id &&
        e1?.fax == e2?.fax &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.town == e2?.town &&
        e1?.mobile == e2?.mobile &&
        e1?.longDescription == e2?.longDescription &&
        e1?.urlFriendlyName == e2?.urlFriendlyName &&
        e1?.zipCode == e2?.zipCode &&
        e1?.email == e2?.email &&
        e1?.company == e2?.company &&
        e1?.phone == e2?.phone &&
        e1?.eventUrl == e2?.eventUrl &&
        e1?.preisInformation == e2?.preisInformation &&
        e1?.oeffnungszeiten == e2?.oeffnungszeiten &&
        e1?.onlineBookable == e2?.onlineBookable &&
        e1?.description == e2?.description &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.kategorien == e2?.kategorien &&
        e1?.city == e2?.city;
  }

  @override
  int hash(EventsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.date,
        e?.time,
        e?.place,
        e?.address1,
        e?.apiUrl,
        e?.cancellationInformation,
        e?.address2,
        e?.treffpunkt,
        e?.websiteUrl,
        e?.country,
        e?.id,
        e?.fax,
        e?.shortDescription,
        e?.town,
        e?.mobile,
        e?.longDescription,
        e?.urlFriendlyName,
        e?.zipCode,
        e?.email,
        e?.company,
        e?.phone,
        e?.eventUrl,
        e?.preisInformation,
        e?.oeffnungszeiten,
        e?.onlineBookable,
        e?.description,
        e?.imageUrl,
        e?.kategorien,
        e?.city
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}
