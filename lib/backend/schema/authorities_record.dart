import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AuthoritiesRecord extends FirestoreRecord {
  AuthoritiesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "openingHours" field.
  List<OpeningStruct>? _openingHours;
  List<OpeningStruct> get openingHours => _openingHours ?? const [];
  bool hasOpeningHours() => _openingHours != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _address = snapshotData['address'] as String?;
    _phone = snapshotData['phone'] as String?;
    _openingHours = getStructList(
      snapshotData['openingHours'],
      OpeningStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('authorities');

  static Stream<AuthoritiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AuthoritiesRecord.fromSnapshot(s));

  static Future<AuthoritiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AuthoritiesRecord.fromSnapshot(s));

  static AuthoritiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AuthoritiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AuthoritiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AuthoritiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AuthoritiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AuthoritiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAuthoritiesRecordData({
  String? name,
  String? address,
  String? phone,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'address': address,
      'phone': phone,
    }.withoutNulls,
  );

  return firestoreData;
}

class AuthoritiesRecordDocumentEquality implements Equality<AuthoritiesRecord> {
  const AuthoritiesRecordDocumentEquality();

  @override
  bool equals(AuthoritiesRecord? e1, AuthoritiesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.address == e2?.address &&
        e1?.phone == e2?.phone &&
        listEquality.equals(e1?.openingHours, e2?.openingHours);
  }

  @override
  int hash(AuthoritiesRecord? e) => const ListEquality()
      .hash([e?.name, e?.address, e?.phone, e?.openingHours]);

  @override
  bool isValidKey(Object? o) => o is AuthoritiesRecord;
}
