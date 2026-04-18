import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RepliesRecord extends FirestoreRecord {
  RepliesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "authorUID" field.
  String? _authorUID;
  String get authorUID => _authorUID ?? '';
  bool hasAuthorUID() => _authorUID != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _authorUID = snapshotData['authorUID'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _text = snapshotData['text'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('replies')
          : FirebaseFirestore.instance.collectionGroup('replies');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('replies').doc(id);

  static Stream<RepliesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RepliesRecord.fromSnapshot(s));

  static Future<RepliesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RepliesRecord.fromSnapshot(s));

  static RepliesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RepliesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RepliesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RepliesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RepliesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RepliesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRepliesRecordData({
  String? authorUID,
  DateTime? createdAt,
  String? text,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'authorUID': authorUID,
      'createdAt': createdAt,
      'text': text,
    }.withoutNulls,
  );

  return firestoreData;
}

class RepliesRecordDocumentEquality implements Equality<RepliesRecord> {
  const RepliesRecordDocumentEquality();

  @override
  bool equals(RepliesRecord? e1, RepliesRecord? e2) {
    return e1?.authorUID == e2?.authorUID &&
        e1?.createdAt == e2?.createdAt &&
        e1?.text == e2?.text;
  }

  @override
  int hash(RepliesRecord? e) =>
      const ListEquality().hash([e?.authorUID, e?.createdAt, e?.text]);

  @override
  bool isValidKey(Object? o) => o is RepliesRecord;
}
