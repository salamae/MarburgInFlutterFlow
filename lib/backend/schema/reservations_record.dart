import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReservationsRecord extends FirestoreRecord {
  ReservationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "userEmail" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  // "restaurantName" field.
  String? _restaurantName;
  String get restaurantName => _restaurantName ?? '';
  bool hasRestaurantName() => _restaurantName != null;

  // "partySize" field.
  int? _partySize;
  int get partySize => _partySize ?? 0;
  bool hasPartySize() => _partySize != null;

  // "reservationDateTime" field.
  DateTime? _reservationDateTime;
  DateTime? get reservationDateTime => _reservationDateTime;
  bool hasReservationDateTime() => _reservationDateTime != null;

  // "specialRequests" field.
  String? _specialRequests;
  String get specialRequests => _specialRequests ?? '';
  bool hasSpecialRequests() => _specialRequests != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "createdBy" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _userName = snapshotData['userName'] as String?;
    _userEmail = snapshotData['userEmail'] as String?;
    _restaurantName = snapshotData['restaurantName'] as String?;
    _partySize = castToType<int>(snapshotData['partySize']);
    _reservationDateTime = snapshotData['reservationDateTime'] as DateTime?;
    _specialRequests = snapshotData['specialRequests'] as String?;
    _status = snapshotData['status'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _createdBy = snapshotData['createdBy'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reservations');

  static Stream<ReservationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReservationsRecord.fromSnapshot(s));

  static Future<ReservationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReservationsRecord.fromSnapshot(s));

  static ReservationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReservationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReservationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReservationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReservationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReservationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReservationsRecordData({
  String? userId,
  String? userName,
  String? userEmail,
  String? restaurantName,
  int? partySize,
  DateTime? reservationDateTime,
  String? specialRequests,
  String? status,
  DateTime? createdAt,
  String? createdBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'userName': userName,
      'userEmail': userEmail,
      'restaurantName': restaurantName,
      'partySize': partySize,
      'reservationDateTime': reservationDateTime,
      'specialRequests': specialRequests,
      'status': status,
      'createdAt': createdAt,
      'createdBy': createdBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReservationsRecordDocumentEquality
    implements Equality<ReservationsRecord> {
  const ReservationsRecordDocumentEquality();

  @override
  bool equals(ReservationsRecord? e1, ReservationsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.userName == e2?.userName &&
        e1?.userEmail == e2?.userEmail &&
        e1?.restaurantName == e2?.restaurantName &&
        e1?.partySize == e2?.partySize &&
        e1?.reservationDateTime == e2?.reservationDateTime &&
        e1?.specialRequests == e2?.specialRequests &&
        e1?.status == e2?.status &&
        e1?.createdAt == e2?.createdAt &&
        e1?.createdBy == e2?.createdBy;
  }

  @override
  int hash(ReservationsRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.userName,
        e?.userEmail,
        e?.restaurantName,
        e?.partySize,
        e?.reservationDateTime,
        e?.specialRequests,
        e?.status,
        e?.createdAt,
        e?.createdBy
      ]);

  @override
  bool isValidKey(Object? o) => o is ReservationsRecord;
}
