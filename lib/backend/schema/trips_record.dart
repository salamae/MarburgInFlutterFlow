import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TripsRecord extends FirestoreRecord {
  TripsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "authorUID" field.
  String? _authorUID;
  String get authorUID => _authorUID ?? '';
  bool hasAuthorUID() => _authorUID != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "startDate" field.
  String? _startDate;
  String get startDate => _startDate ?? '';
  bool hasStartDate() => _startDate != null;

  // "endDate" field.
  String? _endDate;
  String get endDate => _endDate ?? '';
  bool hasEndDate() => _endDate != null;

  // "createdAt" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _authorUID = snapshotData['authorUID'] as String?;
    _title = snapshotData['title'] as String?;
    _startDate = snapshotData['startDate'] as String?;
    _endDate = snapshotData['endDate'] as String?;
    _createdAt = snapshotData['createdAt'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('trips');

  static Stream<TripsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TripsRecord.fromSnapshot(s));

  static Future<TripsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TripsRecord.fromSnapshot(s));

  static TripsRecord fromSnapshot(DocumentSnapshot snapshot) => TripsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TripsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TripsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TripsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TripsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTripsRecordData({
  String? authorUID,
  String? title,
  String? startDate,
  String? endDate,
  String? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'authorUID': authorUID,
      'title': title,
      'startDate': startDate,
      'endDate': endDate,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class TripsRecordDocumentEquality implements Equality<TripsRecord> {
  const TripsRecordDocumentEquality();

  @override
  bool equals(TripsRecord? e1, TripsRecord? e2) {
    return e1?.authorUID == e2?.authorUID &&
        e1?.title == e2?.title &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(TripsRecord? e) => const ListEquality()
      .hash([e?.authorUID, e?.title, e?.startDate, e?.endDate, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is TripsRecord;
}
