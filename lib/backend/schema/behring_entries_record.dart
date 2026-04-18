import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BehringEntriesRecord extends FirestoreRecord {
  BehringEntriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "createdBy" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _createdBy = snapshotData['createdBy'] as String?;
    _address = snapshotData['address'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('behring_entries');

  static Stream<BehringEntriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BehringEntriesRecord.fromSnapshot(s));

  static Future<BehringEntriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BehringEntriesRecord.fromSnapshot(s));

  static BehringEntriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BehringEntriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BehringEntriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BehringEntriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BehringEntriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BehringEntriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBehringEntriesRecordData({
  String? name,
  String? description,
  String? createdBy,
  String? address,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'createdBy': createdBy,
      'address': address,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class BehringEntriesRecordDocumentEquality
    implements Equality<BehringEntriesRecord> {
  const BehringEntriesRecordDocumentEquality();

  @override
  bool equals(BehringEntriesRecord? e1, BehringEntriesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.createdBy == e2?.createdBy &&
        e1?.address == e2?.address &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(BehringEntriesRecord? e) => const ListEquality()
      .hash([e?.name, e?.description, e?.createdBy, e?.address, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is BehringEntriesRecord;
}
