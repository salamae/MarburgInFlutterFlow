import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "profileIconName" field.
  String? _profileIconName;
  String get profileIconName => _profileIconName ?? '';
  bool hasProfileIconName() => _profileIconName != null;

  // "onboardingCompleted" field.
  bool? _onboardingCompleted;
  bool get onboardingCompleted => _onboardingCompleted ?? false;
  bool hasOnboardingCompleted() => _onboardingCompleted != null;

  // "isGuest" field.
  bool? _isGuest;
  bool get isGuest => _isGuest ?? false;
  bool hasIsGuest() => _isGuest != null;

  // "isAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "appUsage" field.
  String? _appUsage;
  String get appUsage => _appUsage ?? '';
  bool hasAppUsage() => _appUsage != null;

  // "occupation" field.
  String? _occupation;
  String get occupation => _occupation ?? '';
  bool hasOccupation() => _occupation != null;

  // "interests" field.
  List<String>? _interests;
  List<String> get interests => _interests ?? const [];
  bool hasInterests() => _interests != null;

  // "favorites" field.
  List<String>? _favorites;
  List<String> get favorites => _favorites ?? const [];
  bool hasFavorites() => _favorites != null;

  // "favoriteParkingLots" field.
  List<String>? _favoriteParkingLots;
  List<String> get favoriteParkingLots => _favoriteParkingLots ?? const [];
  bool hasFavoriteParkingLots() => _favoriteParkingLots != null;

  // "favoriteGastro" field.
  List<String>? _favoriteGastro;
  List<String> get favoriteGastro => _favoriteGastro ?? const [];
  bool hasFavoriteGastro() => _favoriteGastro != null;

  // "favoriteParks" field.
  List<String>? _favoriteParks;
  List<String> get favoriteParks => _favoriteParks ?? const [];
  bool hasFavoriteParks() => _favoriteParks != null;

  // "street" field.
  String? _street;
  String get street => _street ?? '';
  bool hasStreet() => _street != null;

  // "zip" field.
  String? _zip;
  String get zip => _zip ?? '';
  bool hasZip() => _zip != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "favoriteShops" field.
  List<String>? _favoriteShops;
  List<String> get favoriteShops => _favoriteShops ?? const [];
  bool hasFavoriteShops() => _favoriteShops != null;

  // "favoriteShopping" field.
  List<String>? _favoriteShopping;
  List<String> get favoriteShopping => _favoriteShopping ?? const [];
  bool hasFavoriteShopping() => _favoriteShopping != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _name = snapshotData['name'] as String?;
    _profileIconName = snapshotData['profileIconName'] as String?;
    _onboardingCompleted = snapshotData['onboardingCompleted'] as bool?;
    _isGuest = snapshotData['isGuest'] as bool?;
    _isAdmin = snapshotData['isAdmin'] as bool?;
    _appUsage = snapshotData['appUsage'] as String?;
    _occupation = snapshotData['occupation'] as String?;
    _interests = getDataList(snapshotData['interests']);
    _favorites = getDataList(snapshotData['favorites']);
    _favoriteParkingLots = getDataList(snapshotData['favoriteParkingLots']);
    _favoriteGastro = getDataList(snapshotData['favoriteGastro']);
    _favoriteParks = getDataList(snapshotData['favoriteParks']);
    _street = snapshotData['street'] as String?;
    _zip = snapshotData['zip'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _favoriteShops = getDataList(snapshotData['favoriteShops']);
    _favoriteShopping = getDataList(snapshotData['favoriteShopping']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? name,
  String? profileIconName,
  bool? onboardingCompleted,
  bool? isGuest,
  bool? isAdmin,
  String? appUsage,
  String? occupation,
  String? street,
  String? zip,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'name': name,
      'profileIconName': profileIconName,
      'onboardingCompleted': onboardingCompleted,
      'isGuest': isGuest,
      'isAdmin': isAdmin,
      'appUsage': appUsage,
      'occupation': occupation,
      'street': street,
      'zip': zip,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.name == e2?.name &&
        e1?.profileIconName == e2?.profileIconName &&
        e1?.onboardingCompleted == e2?.onboardingCompleted &&
        e1?.isGuest == e2?.isGuest &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.appUsage == e2?.appUsage &&
        e1?.occupation == e2?.occupation &&
        listEquality.equals(e1?.interests, e2?.interests) &&
        listEquality.equals(e1?.favorites, e2?.favorites) &&
        listEquality.equals(e1?.favoriteParkingLots, e2?.favoriteParkingLots) &&
        listEquality.equals(e1?.favoriteGastro, e2?.favoriteGastro) &&
        listEquality.equals(e1?.favoriteParks, e2?.favoriteParks) &&
        e1?.street == e2?.street &&
        e1?.zip == e2?.zip &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        listEquality.equals(e1?.favoriteShops, e2?.favoriteShops) &&
        listEquality.equals(e1?.favoriteShopping, e2?.favoriteShopping);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.name,
        e?.profileIconName,
        e?.onboardingCompleted,
        e?.isGuest,
        e?.isAdmin,
        e?.appUsage,
        e?.occupation,
        e?.interests,
        e?.favorites,
        e?.favoriteParkingLots,
        e?.favoriteGastro,
        e?.favoriteParks,
        e?.street,
        e?.zip,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.favoriteShops,
        e?.favoriteShopping
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
