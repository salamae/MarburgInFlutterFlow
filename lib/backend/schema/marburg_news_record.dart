import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MarburgNewsRecord extends FirestoreRecord {
  MarburgNewsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "headline" field.
  String? _headline;
  String get headline => _headline ?? '';
  bool hasHeadline() => _headline != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "overline" field.
  String? _overline;
  String get overline => _overline ?? '';
  bool hasOverline() => _overline != null;

  // "href" field.
  String? _href;
  String get href => _href ?? '';
  bool hasHref() => _href != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "news_type" field.
  String? _newsType;
  String get newsType => _newsType ?? '';
  bool hasNewsType() => _newsType != null;

  // "isPaid" field.
  bool? _isPaid;
  bool get isPaid => _isPaid ?? false;
  bool hasIsPaid() => _isPaid != null;

  // "isSponsored" field.
  bool? _isSponsored;
  bool get isSponsored => _isSponsored ?? false;
  bool hasIsSponsored() => _isSponsored != null;

  // "authors" field.
  String? _authors;
  String get authors => _authors ?? '';
  bool hasAuthors() => _authors != null;

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  bool hasAuthor() => _author != null;

  // "displayedDate" field.
  String? _displayedDate;
  String get displayedDate => _displayedDate ?? '';
  bool hasDisplayedDate() => _displayedDate != null;

  // "firstPublishDate" field.
  String? _firstPublishDate;
  String get firstPublishDate => _firstPublishDate ?? '';
  bool hasFirstPublishDate() => _firstPublishDate != null;

  void _initializeFields() {
    _headline = snapshotData['headline'] as String?;
    _text = snapshotData['text'] as String?;
    _overline = snapshotData['overline'] as String?;
    _href = snapshotData['href'] as String?;
    _image = snapshotData['image'] as String?;
    _newsType = snapshotData['news_type'] as String?;
    _isPaid = snapshotData['isPaid'] as bool?;
    _isSponsored = snapshotData['isSponsored'] as bool?;
    _authors = snapshotData['authors'] as String?;
    _author = snapshotData['author'] as String?;
    _displayedDate = snapshotData['displayedDate'] as String?;
    _firstPublishDate = snapshotData['firstPublishDate'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('marburg_news');

  static Stream<MarburgNewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MarburgNewsRecord.fromSnapshot(s));

  static Future<MarburgNewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MarburgNewsRecord.fromSnapshot(s));

  static MarburgNewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MarburgNewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MarburgNewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MarburgNewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MarburgNewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MarburgNewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMarburgNewsRecordData({
  String? headline,
  String? text,
  String? overline,
  String? href,
  String? image,
  String? newsType,
  bool? isPaid,
  bool? isSponsored,
  String? authors,
  String? author,
  String? displayedDate,
  String? firstPublishDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'headline': headline,
      'text': text,
      'overline': overline,
      'href': href,
      'image': image,
      'news_type': newsType,
      'isPaid': isPaid,
      'isSponsored': isSponsored,
      'authors': authors,
      'author': author,
      'displayedDate': displayedDate,
      'firstPublishDate': firstPublishDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class MarburgNewsRecordDocumentEquality implements Equality<MarburgNewsRecord> {
  const MarburgNewsRecordDocumentEquality();

  @override
  bool equals(MarburgNewsRecord? e1, MarburgNewsRecord? e2) {
    return e1?.headline == e2?.headline &&
        e1?.text == e2?.text &&
        e1?.overline == e2?.overline &&
        e1?.href == e2?.href &&
        e1?.image == e2?.image &&
        e1?.newsType == e2?.newsType &&
        e1?.isPaid == e2?.isPaid &&
        e1?.isSponsored == e2?.isSponsored &&
        e1?.authors == e2?.authors &&
        e1?.author == e2?.author &&
        e1?.displayedDate == e2?.displayedDate &&
        e1?.firstPublishDate == e2?.firstPublishDate;
  }

  @override
  int hash(MarburgNewsRecord? e) => const ListEquality().hash([
        e?.headline,
        e?.text,
        e?.overline,
        e?.href,
        e?.image,
        e?.newsType,
        e?.isPaid,
        e?.isSponsored,
        e?.authors,
        e?.author,
        e?.displayedDate,
        e?.firstPublishDate
      ]);

  @override
  bool isValidKey(Object? o) => o is MarburgNewsRecord;
}
