import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BlackboardPostsRecord extends FirestoreRecord {
  BlackboardPostsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "price" field.
  String? _price;
  String get price => _price ?? '';
  bool hasPrice() => _price != null;

  // "authorUID" field.
  String? _authorUID;
  String get authorUID => _authorUID ?? '';
  bool hasAuthorUID() => _authorUID != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "isOffering" field.
  bool? _isOffering;
  bool get isOffering => _isOffering ?? false;
  bool hasIsOffering() => _isOffering != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _price = snapshotData['price'] as String?;
    _authorUID = snapshotData['authorUID'] as String?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _isOffering = snapshotData['isOffering'] as bool?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('blackboard_posts');

  static Stream<BlackboardPostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BlackboardPostsRecord.fromSnapshot(s));

  static Future<BlackboardPostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BlackboardPostsRecord.fromSnapshot(s));

  static BlackboardPostsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BlackboardPostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BlackboardPostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BlackboardPostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BlackboardPostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BlackboardPostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBlackboardPostsRecordData({
  String? price,
  String? authorUID,
  String? title,
  String? description,
  bool? isOffering,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'price': price,
      'authorUID': authorUID,
      'title': title,
      'description': description,
      'isOffering': isOffering,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class BlackboardPostsRecordDocumentEquality
    implements Equality<BlackboardPostsRecord> {
  const BlackboardPostsRecordDocumentEquality();

  @override
  bool equals(BlackboardPostsRecord? e1, BlackboardPostsRecord? e2) {
    return e1?.price == e2?.price &&
        e1?.authorUID == e2?.authorUID &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.isOffering == e2?.isOffering &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(BlackboardPostsRecord? e) => const ListEquality().hash([
        e?.price,
        e?.authorUID,
        e?.title,
        e?.description,
        e?.isOffering,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is BlackboardPostsRecord;
}
