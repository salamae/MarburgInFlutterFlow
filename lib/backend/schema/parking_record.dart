import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParkingRecord extends FirestoreRecord {
  ParkingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "_id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "FREI" field.
  String? _frei;
  String get frei => _frei ?? '';
  bool hasFrei() => _frei != null;

  // "PARKHAUS" field.
  String? _parkhaus;
  String get parkhaus => _parkhaus ?? '';
  bool hasParkhaus() => _parkhaus != null;

  // "max_Einfahrtshoehe" field.
  String? _maxEinfahrtshoehe;
  String get maxEinfahrtshoehe => _maxEinfahrtshoehe ?? '';
  bool hasMaxEinfahrtshoehe() => _maxEinfahrtshoehe != null;

  void _initializeFields() {
    _id = snapshotData['_id'] as String?;
    _frei = snapshotData['FREI'] as String?;
    _parkhaus = snapshotData['PARKHAUS'] as String?;
    _maxEinfahrtshoehe = snapshotData['max_Einfahrtshoehe'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('parking');

  static Stream<ParkingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ParkingRecord.fromSnapshot(s));

  static Future<ParkingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ParkingRecord.fromSnapshot(s));

  static ParkingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ParkingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ParkingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ParkingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ParkingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ParkingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createParkingRecordData({
  String? id,
  String? frei,
  String? parkhaus,
  String? maxEinfahrtshoehe,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      '_id': id,
      'FREI': frei,
      'PARKHAUS': parkhaus,
      'max_Einfahrtshoehe': maxEinfahrtshoehe,
    }.withoutNulls,
  );

  return firestoreData;
}

class ParkingRecordDocumentEquality implements Equality<ParkingRecord> {
  const ParkingRecordDocumentEquality();

  @override
  bool equals(ParkingRecord? e1, ParkingRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.frei == e2?.frei &&
        e1?.parkhaus == e2?.parkhaus &&
        e1?.maxEinfahrtshoehe == e2?.maxEinfahrtshoehe;
  }

  @override
  int hash(ParkingRecord? e) => const ListEquality()
      .hash([e?.id, e?.frei, e?.parkhaus, e?.maxEinfahrtshoehe]);

  @override
  bool isValidKey(Object? o) => o is ParkingRecord;
}
