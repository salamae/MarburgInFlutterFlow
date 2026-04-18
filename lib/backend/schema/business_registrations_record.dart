import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BusinessRegistrationsRecord extends FirestoreRecord {
  BusinessRegistrationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "businessName" field.
  String? _businessName;
  String get businessName => _businessName ?? '';
  bool hasBusinessName() => _businessName != null;

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "phoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "emailAddress" field.
  String? _emailAddress;
  String get emailAddress => _emailAddress ?? '';
  bool hasEmailAddress() => _emailAddress != null;

  // "streetAddress" field.
  String? _streetAddress;
  String get streetAddress => _streetAddress ?? '';
  bool hasStreetAddress() => _streetAddress != null;

  // "houseNumber" field.
  String? _houseNumber;
  String get houseNumber => _houseNumber ?? '';
  bool hasHouseNumber() => _houseNumber != null;

  // "postalCode" field.
  String? _postalCode;
  String get postalCode => _postalCode ?? '';
  bool hasPostalCode() => _postalCode != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "userUID" field.
  String? _userUID;
  String get userUID => _userUID ?? '';
  bool hasUserUID() => _userUID != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  void _initializeFields() {
    _businessName = snapshotData['businessName'] as String?;
    _firstName = snapshotData['firstName'] as String?;
    _lastName = snapshotData['lastName'] as String?;
    _phoneNumber = snapshotData['phoneNumber'] as String?;
    _emailAddress = snapshotData['emailAddress'] as String?;
    _streetAddress = snapshotData['streetAddress'] as String?;
    _houseNumber = snapshotData['houseNumber'] as String?;
    _postalCode = snapshotData['postalCode'] as String?;
    _city = snapshotData['city'] as String?;
    _userUID = snapshotData['userUID'] as String?;
    _status = snapshotData['status'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('business_registrations');

  static Stream<BusinessRegistrationsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => BusinessRegistrationsRecord.fromSnapshot(s));

  static Future<BusinessRegistrationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => BusinessRegistrationsRecord.fromSnapshot(s));

  static BusinessRegistrationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BusinessRegistrationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BusinessRegistrationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BusinessRegistrationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BusinessRegistrationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BusinessRegistrationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBusinessRegistrationsRecordData({
  String? businessName,
  String? firstName,
  String? lastName,
  String? phoneNumber,
  String? emailAddress,
  String? streetAddress,
  String? houseNumber,
  String? postalCode,
  String? city,
  String? userUID,
  String? status,
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'businessName': businessName,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'emailAddress': emailAddress,
      'streetAddress': streetAddress,
      'houseNumber': houseNumber,
      'postalCode': postalCode,
      'city': city,
      'userUID': userUID,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class BusinessRegistrationsRecordDocumentEquality
    implements Equality<BusinessRegistrationsRecord> {
  const BusinessRegistrationsRecordDocumentEquality();

  @override
  bool equals(
      BusinessRegistrationsRecord? e1, BusinessRegistrationsRecord? e2) {
    return e1?.businessName == e2?.businessName &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.emailAddress == e2?.emailAddress &&
        e1?.streetAddress == e2?.streetAddress &&
        e1?.houseNumber == e2?.houseNumber &&
        e1?.postalCode == e2?.postalCode &&
        e1?.city == e2?.city &&
        e1?.userUID == e2?.userUID &&
        e1?.status == e2?.status &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt;
  }

  @override
  int hash(BusinessRegistrationsRecord? e) => const ListEquality().hash([
        e?.businessName,
        e?.firstName,
        e?.lastName,
        e?.phoneNumber,
        e?.emailAddress,
        e?.streetAddress,
        e?.houseNumber,
        e?.postalCode,
        e?.city,
        e?.userUID,
        e?.status,
        e?.createdAt,
        e?.updatedAt
      ]);

  @override
  bool isValidKey(Object? o) => o is BusinessRegistrationsRecord;
}
