import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TokensRecord extends FirestoreRecord {
  TokensRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fcmToken" field.
  String? _fcmToken;
  String get fcmToken => _fcmToken ?? '';
  bool hasFcmToken() => _fcmToken != null;

  // "lastUpdated" field.
  DateTime? _lastUpdated;
  DateTime? get lastUpdated => _lastUpdated;
  bool hasLastUpdated() => _lastUpdated != null;

  // "platform" field.
  String? _platform;
  String get platform => _platform ?? '';
  bool hasPlatform() => _platform != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _fcmToken = snapshotData['fcmToken'] as String?;
    _lastUpdated = snapshotData['lastUpdated'] as DateTime?;
    _platform = snapshotData['platform'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tokens')
          : FirebaseFirestore.instance.collectionGroup('tokens');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('tokens').doc(id);

  static Stream<TokensRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TokensRecord.fromSnapshot(s));

  static Future<TokensRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TokensRecord.fromSnapshot(s));

  static TokensRecord fromSnapshot(DocumentSnapshot snapshot) => TokensRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TokensRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TokensRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TokensRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TokensRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTokensRecordData({
  String? fcmToken,
  DateTime? lastUpdated,
  String? platform,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fcmToken': fcmToken,
      'lastUpdated': lastUpdated,
      'platform': platform,
    }.withoutNulls,
  );

  return firestoreData;
}

class TokensRecordDocumentEquality implements Equality<TokensRecord> {
  const TokensRecordDocumentEquality();

  @override
  bool equals(TokensRecord? e1, TokensRecord? e2) {
    return e1?.fcmToken == e2?.fcmToken &&
        e1?.lastUpdated == e2?.lastUpdated &&
        e1?.platform == e2?.platform;
  }

  @override
  int hash(TokensRecord? e) =>
      const ListEquality().hash([e?.fcmToken, e?.lastUpdated, e?.platform]);

  @override
  bool isValidKey(Object? o) => o is TokensRecord;
}
