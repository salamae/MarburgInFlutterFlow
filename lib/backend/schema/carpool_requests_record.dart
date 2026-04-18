import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarpoolRequestsRecord extends FirestoreRecord {
  CarpoolRequestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "requestedAt" field.
  DateTime? _requestedAt;
  DateTime? get requestedAt => _requestedAt;
  bool hasRequestedAt() => _requestedAt != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "carpoolId" field.
  String? _carpoolId;
  String get carpoolId => _carpoolId ?? '';
  bool hasCarpoolId() => _carpoolId != null;

  void _initializeFields() {
    _userName = snapshotData['userName'] as String?;
    _requestedAt = snapshotData['requestedAt'] as DateTime?;
    _userId = snapshotData['userId'] as String?;
    _carpoolId = snapshotData['carpoolId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('carpool_requests');

  static Stream<CarpoolRequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarpoolRequestsRecord.fromSnapshot(s));

  static Future<CarpoolRequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarpoolRequestsRecord.fromSnapshot(s));

  static CarpoolRequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CarpoolRequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarpoolRequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarpoolRequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarpoolRequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarpoolRequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarpoolRequestsRecordData({
  String? userName,
  DateTime? requestedAt,
  String? userId,
  String? carpoolId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userName': userName,
      'requestedAt': requestedAt,
      'userId': userId,
      'carpoolId': carpoolId,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarpoolRequestsRecordDocumentEquality
    implements Equality<CarpoolRequestsRecord> {
  const CarpoolRequestsRecordDocumentEquality();

  @override
  bool equals(CarpoolRequestsRecord? e1, CarpoolRequestsRecord? e2) {
    return e1?.userName == e2?.userName &&
        e1?.requestedAt == e2?.requestedAt &&
        e1?.userId == e2?.userId &&
        e1?.carpoolId == e2?.carpoolId;
  }

  @override
  int hash(CarpoolRequestsRecord? e) => const ListEquality()
      .hash([e?.userName, e?.requestedAt, e?.userId, e?.carpoolId]);

  @override
  bool isValidKey(Object? o) => o is CarpoolRequestsRecord;
}
