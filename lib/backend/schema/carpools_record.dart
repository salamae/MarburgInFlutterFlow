import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarpoolsRecord extends FirestoreRecord {
  CarpoolsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "start" field.
  String? _start;
  String get start => _start ?? '';
  bool hasStart() => _start != null;

  // "ziel" field.
  String? _ziel;
  String get ziel => _ziel ?? '';
  bool hasZiel() => _ziel != null;

  // "personen" field.
  int? _personen;
  int get personen => _personen ?? 0;
  bool hasPersonen() => _personen != null;

  // "wiederholung" field.
  bool? _wiederholung;
  bool get wiederholung => _wiederholung ?? false;
  bool hasWiederholung() => _wiederholung != null;

  // "wochentage" field.
  List<String>? _wochentage;
  List<String> get wochentage => _wochentage ?? const [];
  bool hasWochentage() => _wochentage != null;

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  bool hasTag() => _tag != null;

  // "zeit" field.
  String? _zeit;
  String get zeit => _zeit ?? '';
  bool hasZeit() => _zeit != null;

  // "createdAt" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _start = snapshotData['start'] as String?;
    _ziel = snapshotData['ziel'] as String?;
    _personen = castToType<int>(snapshotData['personen']);
    _wiederholung = snapshotData['wiederholung'] as bool?;
    _wochentage = getDataList(snapshotData['wochentage']);
    _tag = snapshotData['tag'] as String?;
    _zeit = snapshotData['zeit'] as String?;
    _createdAt = snapshotData['createdAt'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('carpools');

  static Stream<CarpoolsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarpoolsRecord.fromSnapshot(s));

  static Future<CarpoolsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarpoolsRecord.fromSnapshot(s));

  static CarpoolsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CarpoolsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarpoolsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarpoolsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarpoolsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarpoolsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarpoolsRecordData({
  String? userId,
  String? start,
  String? ziel,
  int? personen,
  bool? wiederholung,
  String? tag,
  String? zeit,
  String? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'start': start,
      'ziel': ziel,
      'personen': personen,
      'wiederholung': wiederholung,
      'tag': tag,
      'zeit': zeit,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarpoolsRecordDocumentEquality implements Equality<CarpoolsRecord> {
  const CarpoolsRecordDocumentEquality();

  @override
  bool equals(CarpoolsRecord? e1, CarpoolsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userId == e2?.userId &&
        e1?.start == e2?.start &&
        e1?.ziel == e2?.ziel &&
        e1?.personen == e2?.personen &&
        e1?.wiederholung == e2?.wiederholung &&
        listEquality.equals(e1?.wochentage, e2?.wochentage) &&
        e1?.tag == e2?.tag &&
        e1?.zeit == e2?.zeit &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(CarpoolsRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.start,
        e?.ziel,
        e?.personen,
        e?.wiederholung,
        e?.wochentage,
        e?.tag,
        e?.zeit,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is CarpoolsRecord;
}
