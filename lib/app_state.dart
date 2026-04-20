import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _TestPagesIndex = prefs.getInt('ff_TestPagesIndex') ?? _TestPagesIndex;
    });
    _safeInit(() {
      _selectedDate = prefs.containsKey('ff_selectedDate')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_selectedDate')!)
          : _selectedDate;
    });
    _safeInit(() {
      _fieldNames = prefs.getStringList('ff_fieldNames') ?? _fieldNames;
    });
    _safeInit(() {
      _tabbar = prefs.getInt('ff_tabbar') ?? _tabbar;
    });
    _safeInit(() {
      _TopBar = prefs.getInt('ff_TopBar') ?? _TopBar;
    });
    _safeInit(() {
      _favoriteEventIdsGuest =
          prefs.getStringList('ff_favoriteEventIdsGuest') ??
              _favoriteEventIdsGuest;
    });
    _safeInit(() {
      _button = prefs.getBool('ff_button') ?? _button;
    });
    _safeInit(() {
      _anzeigen = prefs.getStringList('ff_anzeigen') ?? _anzeigen;
    });
    _safeInit(() {
      _searchText = prefs.getString('ff_searchText') ?? _searchText;
    });
    _safeInit(() {
      _alles = prefs.getString('ff_alles') ?? _alles;
    });
    _safeInit(() {
      _userIntersse = prefs.getStringList('ff_userIntersse') ?? _userIntersse;
    });
    _safeInit(() {
      _userOccupation = prefs.getString('ff_userOccupation') ?? _userOccupation;
    });
    _safeInit(() {
      _bearbeiten = prefs.getBool('ff_bearbeiten') ?? _bearbeiten;
    });
    _safeInit(() {
      _bearbeitenDone = prefs.getBool('ff_bearbeitenDone') ?? _bearbeitenDone;
    });
    _safeInit(() {
      _parkingLots = prefs.getStringList('ff_parkingLots') ?? _parkingLots;
    });
    _safeInit(() {
      _eventLocation = prefs.getString('ff_eventLocation') ?? _eventLocation;
    });
    _safeInit(() {
      _notificationSwitch =
          prefs.getBool('ff_notificationSwitch') ?? _notificationSwitch;
    });
    _safeInit(() {
      _min30 = prefs.getBool('ff_min30') ?? _min30;
    });
    _safeInit(() {
      _min60 = prefs.getBool('ff_min60') ?? _min60;
    });
    _safeInit(() {
      _notificationSwitch2 =
          prefs.getBool('ff_notificationSwitch2') ?? _notificationSwitch2;
    });
    _safeInit(() {
      _trackingEnabled =
          prefs.getBool('ff_trackingEnabled') ?? _trackingEnabled;
    });
    _safeInit(() {
      _notificationSwitch3 =
          prefs.getBool('ff_notificationSwitch3') ?? _notificationSwitch3;
    });
    _safeInit(() {
      _notificationSwitch4 =
          prefs.getBool('ff_notificationSwitch4') ?? _notificationSwitch4;
    });
    _safeInit(() {
      _platz10 = prefs.getBool('ff_platz10') ?? _platz10;
    });
    _safeInit(() {
      _platz5 = prefs.getBool('ff_platz5') ?? _platz5;
    });
    _safeInit(() {
      _selectedEventId =
          prefs.getString('ff_selectedEventId') ?? _selectedEventId;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _TestPagesIndex = 0;
  int get TestPagesIndex => _TestPagesIndex;
  set TestPagesIndex(int value) {
    _TestPagesIndex = value;
    prefs.setInt('ff_TestPagesIndex', value);
  }

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? value) {
    _selectedDate = value;
    value != null
        ? prefs.setInt('ff_selectedDate', value.millisecondsSinceEpoch)
        : prefs.remove('ff_selectedDate');
  }

  List<String> _fieldNames = [];
  List<String> get fieldNames => _fieldNames;
  set fieldNames(List<String> value) {
    _fieldNames = value;
    prefs.setStringList('ff_fieldNames', value);
  }

  void addToFieldNames(String value) {
    fieldNames.add(value);
    prefs.setStringList('ff_fieldNames', _fieldNames);
  }

  void removeFromFieldNames(String value) {
    fieldNames.remove(value);
    prefs.setStringList('ff_fieldNames', _fieldNames);
  }

  void removeAtIndexFromFieldNames(int index) {
    fieldNames.removeAt(index);
    prefs.setStringList('ff_fieldNames', _fieldNames);
  }

  void updateFieldNamesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    fieldNames[index] = updateFn(_fieldNames[index]);
    prefs.setStringList('ff_fieldNames', _fieldNames);
  }

  void insertAtIndexInFieldNames(int index, String value) {
    fieldNames.insert(index, value);
    prefs.setStringList('ff_fieldNames', _fieldNames);
  }

  int _tabbar = 0;
  int get tabbar => _tabbar;
  set tabbar(int value) {
    _tabbar = value;
    prefs.setInt('ff_tabbar', value);
  }

  int _TopBar = 0;
  int get TopBar => _TopBar;
  set TopBar(int value) {
    _TopBar = value;
    prefs.setInt('ff_TopBar', value);
  }

  List<String> _favoriteEventIdsGuest = [];
  List<String> get favoriteEventIdsGuest => _favoriteEventIdsGuest;
  set favoriteEventIdsGuest(List<String> value) {
    _favoriteEventIdsGuest = value;
    prefs.setStringList('ff_favoriteEventIdsGuest', value);
  }

  void addToFavoriteEventIdsGuest(String value) {
    favoriteEventIdsGuest.add(value);
    prefs.setStringList('ff_favoriteEventIdsGuest', _favoriteEventIdsGuest);
  }

  void removeFromFavoriteEventIdsGuest(String value) {
    favoriteEventIdsGuest.remove(value);
    prefs.setStringList('ff_favoriteEventIdsGuest', _favoriteEventIdsGuest);
  }

  void removeAtIndexFromFavoriteEventIdsGuest(int index) {
    favoriteEventIdsGuest.removeAt(index);
    prefs.setStringList('ff_favoriteEventIdsGuest', _favoriteEventIdsGuest);
  }

  void updateFavoriteEventIdsGuestAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    favoriteEventIdsGuest[index] = updateFn(_favoriteEventIdsGuest[index]);
    prefs.setStringList('ff_favoriteEventIdsGuest', _favoriteEventIdsGuest);
  }

  void insertAtIndexInFavoriteEventIdsGuest(int index, String value) {
    favoriteEventIdsGuest.insert(index, value);
    prefs.setStringList('ff_favoriteEventIdsGuest', _favoriteEventIdsGuest);
  }

  bool _button = false;
  bool get button => _button;
  set button(bool value) {
    _button = value;
    prefs.setBool('ff_button', value);
  }

  List<String> _anzeigen = [];
  List<String> get anzeigen => _anzeigen;
  set anzeigen(List<String> value) {
    _anzeigen = value;
    prefs.setStringList('ff_anzeigen', value);
  }

  void addToAnzeigen(String value) {
    anzeigen.add(value);
    prefs.setStringList('ff_anzeigen', _anzeigen);
  }

  void removeFromAnzeigen(String value) {
    anzeigen.remove(value);
    prefs.setStringList('ff_anzeigen', _anzeigen);
  }

  void removeAtIndexFromAnzeigen(int index) {
    anzeigen.removeAt(index);
    prefs.setStringList('ff_anzeigen', _anzeigen);
  }

  void updateAnzeigenAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    anzeigen[index] = updateFn(_anzeigen[index]);
    prefs.setStringList('ff_anzeigen', _anzeigen);
  }

  void insertAtIndexInAnzeigen(int index, String value) {
    anzeigen.insert(index, value);
    prefs.setStringList('ff_anzeigen', _anzeigen);
  }

  String _searchText = '';
  String get searchText => _searchText;
  set searchText(String value) {
    _searchText = value;
    prefs.setString('ff_searchText', value);
  }

  String _alles = '';
  String get alles => _alles;
  set alles(String value) {
    _alles = value;
    prefs.setString('ff_alles', value);
  }

  List<String> _userIntersse = [];
  List<String> get userIntersse => _userIntersse;
  set userIntersse(List<String> value) {
    _userIntersse = value;
    prefs.setStringList('ff_userIntersse', value);
  }

  void addToUserIntersse(String value) {
    userIntersse.add(value);
    prefs.setStringList('ff_userIntersse', _userIntersse);
  }

  void removeFromUserIntersse(String value) {
    userIntersse.remove(value);
    prefs.setStringList('ff_userIntersse', _userIntersse);
  }

  void removeAtIndexFromUserIntersse(int index) {
    userIntersse.removeAt(index);
    prefs.setStringList('ff_userIntersse', _userIntersse);
  }

  void updateUserIntersseAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    userIntersse[index] = updateFn(_userIntersse[index]);
    prefs.setStringList('ff_userIntersse', _userIntersse);
  }

  void insertAtIndexInUserIntersse(int index, String value) {
    userIntersse.insert(index, value);
    prefs.setStringList('ff_userIntersse', _userIntersse);
  }

  String _userOccupation = '';
  String get userOccupation => _userOccupation;
  set userOccupation(String value) {
    _userOccupation = value;
    prefs.setString('ff_userOccupation', value);
  }

  bool _bearbeiten = false;
  bool get bearbeiten => _bearbeiten;
  set bearbeiten(bool value) {
    _bearbeiten = value;
    prefs.setBool('ff_bearbeiten', value);
  }

  bool _bearbeitenDone = false;
  bool get bearbeitenDone => _bearbeitenDone;
  set bearbeitenDone(bool value) {
    _bearbeitenDone = value;
    prefs.setBool('ff_bearbeitenDone', value);
  }

  List<String> _parkingLots = [];
  List<String> get parkingLots => _parkingLots;
  set parkingLots(List<String> value) {
    _parkingLots = value;
    prefs.setStringList('ff_parkingLots', value);
  }

  void addToParkingLots(String value) {
    parkingLots.add(value);
    prefs.setStringList('ff_parkingLots', _parkingLots);
  }

  void removeFromParkingLots(String value) {
    parkingLots.remove(value);
    prefs.setStringList('ff_parkingLots', _parkingLots);
  }

  void removeAtIndexFromParkingLots(int index) {
    parkingLots.removeAt(index);
    prefs.setStringList('ff_parkingLots', _parkingLots);
  }

  void updateParkingLotsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    parkingLots[index] = updateFn(_parkingLots[index]);
    prefs.setStringList('ff_parkingLots', _parkingLots);
  }

  void insertAtIndexInParkingLots(int index, String value) {
    parkingLots.insert(index, value);
    prefs.setStringList('ff_parkingLots', _parkingLots);
  }

  String _eventLocation = '';
  String get eventLocation => _eventLocation;
  set eventLocation(String value) {
    _eventLocation = value;
    prefs.setString('ff_eventLocation', value);
  }

  bool _notificationSwitch = false;
  bool get notificationSwitch => _notificationSwitch;
  set notificationSwitch(bool value) {
    _notificationSwitch = value;
    prefs.setBool('ff_notificationSwitch', value);
  }

  bool _min30 = true;
  bool get min30 => _min30;
  set min30(bool value) {
    _min30 = value;
    prefs.setBool('ff_min30', value);
  }

  bool _min60 = false;
  bool get min60 => _min60;
  set min60(bool value) {
    _min60 = value;
    prefs.setBool('ff_min60', value);
  }

  bool _notificationSwitch2 = false;
  bool get notificationSwitch2 => _notificationSwitch2;
  set notificationSwitch2(bool value) {
    _notificationSwitch2 = value;
    prefs.setBool('ff_notificationSwitch2', value);
  }

  bool _trackingEnabled = false;
  bool get trackingEnabled => _trackingEnabled;
  set trackingEnabled(bool value) {
    _trackingEnabled = value;
    prefs.setBool('ff_trackingEnabled', value);
  }

  bool _notificationSwitch3 = false;
  bool get notificationSwitch3 => _notificationSwitch3;
  set notificationSwitch3(bool value) {
    _notificationSwitch3 = value;
    prefs.setBool('ff_notificationSwitch3', value);
  }

  bool _notificationSwitch4 = false;
  bool get notificationSwitch4 => _notificationSwitch4;
  set notificationSwitch4(bool value) {
    _notificationSwitch4 = value;
    prefs.setBool('ff_notificationSwitch4', value);
  }

  bool _platz10 = true;
  bool get platz10 => _platz10;
  set platz10(bool value) {
    _platz10 = value;
    prefs.setBool('ff_platz10', value);
  }

  bool _platz5 = false;
  bool get platz5 => _platz5;
  set platz5(bool value) {
    _platz5 = value;
    prefs.setBool('ff_platz5', value);
  }

  String _selectedEventId = '';
  String get selectedEventId => _selectedEventId;
  set selectedEventId(String value) {
    _selectedEventId = value;
    prefs.setString('ff_selectedEventId', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
