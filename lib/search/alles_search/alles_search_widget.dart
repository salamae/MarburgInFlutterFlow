import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/search/search_list/search_list_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'alles_search_model.dart';
export 'alles_search_model.dart';

class AllesSearchWidget extends StatefulWidget {
  const AllesSearchWidget({super.key});

  static String routeName = 'allesSearch';
  static String routePath = '/allesSearch';

  @override
  State<AllesSearchWidget> createState() => _AllesSearchWidgetState();
}

class _AllesSearchWidgetState extends State<AllesSearchWidget> {
  late AllesSearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllesSearchModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.gastrosAll = await queryGastroRecordOnce();
      _model.shopsAll = await queryShoppingRecordOnce();
      _model.parksAll = await queryParkRecordOnce();
      _model.buchenAll = await queryBuchenRecordOnce();
      _model.freizeitAll = await queryFreizeitRecordOnce();
      _model.allGastro = _model.gastrosAll!.toList().cast<GastroRecord>();
      safeSetState(() {});
      _model.allShops = _model.shopsAll!.toList().cast<ShoppingRecord>();
      safeSetState(() {});
      _model.allBuchen = _model.buchenAll!.toList().cast<BuchenRecord>();
      safeSetState(() {});
      _model.allParks = _model.parksAll!.toList().cast<ParkRecord>();
      safeSetState(() {});
      _model.allFreizeit = _model.freizeitAll!.toList().cast<FreizeitRecord>();
      safeSetState(() {});
      _model.shuffledGastro = await actions.shuffleGastros(
        _model.allGastro.toList(),
      );
      _model.shuffledShops = await actions.shuffleShops(
        _model.allShops.toList(),
      );
      _model.shuffledParks = await actions.shuffleParks(
        _model.allParks.toList(),
      );
      _model.shuffledBuchen = await actions.shuffleBuchen(
        _model.allBuchen.toList(),
      );
      _model.shuffledFreizeit = await actions.shuffleFreizeit(
        _model.allFreizeit.toList(),
      );
      _model.buchenShuffeld =
          _model.shuffledBuchen!.toList().cast<BuchenRecord>();
      safeSetState(() {});
      _model.parksShuffeld = _model.shuffledParks!.toList().cast<ParkRecord>();
      safeSetState(() {});
      _model.shopsShuffeld =
          _model.shuffledShops!.toList().cast<ShoppingRecord>();
      safeSetState(() {});
      _model.gastroShuffeld =
          _model.shuffledGastro!.toList().cast<GastroRecord>();
      safeSetState(() {});
      _model.freizeitShuffeld =
          _model.shuffledFreizeit!.toList().cast<FreizeitRecord>();
      safeSetState(() {});
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.gastroSearchTextController ??= TextEditingController();
    _model.gastroSearchFocusNode ??= FocusNode();

    _model.shoppenSearchTextController ??= TextEditingController();
    _model.shoppenSearchFocusNode ??= FocusNode();

    _model.parksSearchTextController ??= TextEditingController();
    _model.parksSearchFocusNode ??= FocusNode();

    _model.buchenSearchTextController ??= TextEditingController();
    _model.buchenSearchFocusNode ??= FocusNode();

    _model.freizeitSearchTextController ??= TextEditingController();
    _model.freizeitSearchFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFFAFAFA),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(57.0),
          child: AppBar(
            backgroundColor: Color(0xFFFAFAFA),
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 65.0, 0.0),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFFDFDFD),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x12000000),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(24.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 2.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.safePop();
                                  FFAppState().searchText = '';
                                  FFAppState().update(() {});
                                },
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 25.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 2.0, 0.0, 0.0),
                          child: Text(
                            FFAppState().alles,
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                                  fontSize: 17.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 0.0,
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFAFAFA),
                ),
                child: Stack(
                  children: [
                    if ((FFAppState().alles == 'Gastro in Marburg') &&
                        !(_model.simpleSearchResults1.isNotEmpty))
                      Builder(
                        builder: (context) {
                          final gastroSchuffled =
                              _model.gastroShuffeld.toList();

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: gastroSchuffled.length,
                            itemBuilder: (context, gastroSchuffledIndex) {
                              final gastroSchuffledItem =
                                  gastroSchuffled[gastroSchuffledIndex];
                              return SearchListWidget(
                                key: Key(
                                    'Keyz9m_${gastroSchuffledIndex}_of_${gastroSchuffled.length}'),
                                image: gastroSchuffledItem.imageUrl,
                                name: gastroSchuffledItem.name,
                                description:
                                    gastroSchuffledItem.shortDescription,
                                kategorien: gastroSchuffledItem.kategorien,
                                adresse: gastroSchuffledItem.address1,
                                idGastro: gastroSchuffledItem,
                                fillHeart: Icon(
                                  FFIcons.kheartfill,
                                  color: Color(0xFFFF0101),
                                  size: 20.0,
                                ),
                                heart: Icon(
                                  FFIcons.kheart,
                                  color: Color(0xFF8E8E93),
                                  size: 20.0,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    if ((FFAppState().alles == 'Gastro in Marburg') &&
                        (_model.simpleSearchResults1.isNotEmpty))
                      Builder(
                        builder: (context) {
                          final gastroSearch =
                              _model.simpleSearchResults1.toList();

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: gastroSearch.length,
                            itemBuilder: (context, gastroSearchIndex) {
                              final gastroSearchItem =
                                  gastroSearch[gastroSearchIndex];
                              return SearchListWidget(
                                key: Key(
                                    'Key127_${gastroSearchIndex}_of_${gastroSearch.length}'),
                                image: gastroSearchItem.imageUrl,
                                name: gastroSearchItem.name,
                                description: gastroSearchItem.shortDescription,
                                kategorien: gastroSearchItem.kategorien,
                                adresse: gastroSearchItem.address1,
                                idGastro: gastroSearchItem,
                                fillHeart: Icon(
                                  FFIcons.kheartfill,
                                  color: Color(0xFFFF0101),
                                  size: 20.0,
                                ),
                                heart: Icon(
                                  FFIcons.kheart,
                                  color: Color(0xFF8E8E93),
                                  size: 20.0,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    if ((FFAppState().alles == 'Shoppen in Marburg') &&
                        !(_model.simpleSearchResults2.isNotEmpty))
                      Builder(
                        builder: (context) {
                          final shoppenSchuffled =
                              _model.shopsShuffeld.toList();

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: shoppenSchuffled.length,
                            itemBuilder: (context, shoppenSchuffledIndex) {
                              final shoppenSchuffledItem =
                                  shoppenSchuffled[shoppenSchuffledIndex];
                              return SearchListWidget(
                                key: Key(
                                    'Keygyt_${shoppenSchuffledIndex}_of_${shoppenSchuffled.length}'),
                                image: shoppenSchuffledItem.imageUrl,
                                name: shoppenSchuffledItem.name,
                                description:
                                    shoppenSchuffledItem.shortDescription,
                                kategorien: shoppenSchuffledItem.kategorien,
                                adresse: shoppenSchuffledItem.address1,
                                idShoppen: shoppenSchuffledItem,
                                fillHeart: Icon(
                                  FFIcons.kheartfill,
                                  color: Color(0xFFFF0101),
                                  size: 20.0,
                                ),
                                heart: Icon(
                                  FFIcons.kheart,
                                  color: Color(0xFF8E8E93),
                                  size: 20.0,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    if ((FFAppState().alles == 'Shoppen in Marburg') &&
                        (_model.simpleSearchResults2.isNotEmpty))
                      Builder(
                        builder: (context) {
                          final shoppenSearch =
                              _model.simpleSearchResults2.toList();

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: shoppenSearch.length,
                            itemBuilder: (context, shoppenSearchIndex) {
                              final shoppenSearchItem =
                                  shoppenSearch[shoppenSearchIndex];
                              return SearchListWidget(
                                key: Key(
                                    'Keylwb_${shoppenSearchIndex}_of_${shoppenSearch.length}'),
                                image: shoppenSearchItem.imageUrl,
                                name: shoppenSearchItem.name,
                                description: shoppenSearchItem.shortDescription,
                                kategorien: shoppenSearchItem.kategorien,
                                adresse: shoppenSearchItem.address1,
                                idShoppen: shoppenSearchItem,
                                fillHeart: Icon(
                                  FFIcons.kheartfill,
                                  color: Color(0xFFFF0101),
                                  size: 20.0,
                                ),
                                heart: Icon(
                                  FFIcons.kheart,
                                  color: Color(0xFF8E8E93),
                                  size: 20.0,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    if ((FFAppState().alles == 'Parks in Marburg') &&
                        !(_model.simpleSearchResults3.isNotEmpty))
                      Builder(
                        builder: (context) {
                          final parksShuffled = _model.parksShuffeld.toList();

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: parksShuffled.length,
                            itemBuilder: (context, parksShuffledIndex) {
                              final parksShuffledItem =
                                  parksShuffled[parksShuffledIndex];
                              return SearchListWidget(
                                key: Key(
                                    'Key16y_${parksShuffledIndex}_of_${parksShuffled.length}'),
                                image: parksShuffledItem.imageUrl,
                                name: parksShuffledItem.name,
                                description: parksShuffledItem.shortDescription,
                                kategorien: parksShuffledItem.kategorien,
                                adresse: parksShuffledItem.address1,
                                idPark: parksShuffledItem,
                                fillHeart: Icon(
                                  FFIcons.kheartfill,
                                  color: Color(0xFFFF0101),
                                  size: 20.0,
                                ),
                                heart: Icon(
                                  FFIcons.kheart,
                                  color: Color(0xFF8E8E93),
                                  size: 20.0,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    if ((FFAppState().alles == 'Parks in Marburg') &&
                        (_model.simpleSearchResults3.isNotEmpty))
                      Builder(
                        builder: (context) {
                          final parksSearch =
                              _model.simpleSearchResults3.toList();

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: parksSearch.length,
                            itemBuilder: (context, parksSearchIndex) {
                              final parksSearchItem =
                                  parksSearch[parksSearchIndex];
                              return SearchListWidget(
                                key: Key(
                                    'Keyler_${parksSearchIndex}_of_${parksSearch.length}'),
                                image: parksSearchItem.imageUrl,
                                name: parksSearchItem.name,
                                description: parksSearchItem.shortDescription,
                                kategorien: parksSearchItem.kategorien,
                                adresse: parksSearchItem.address1,
                                idPark: parksSearchItem,
                                fillHeart: Icon(
                                  FFIcons.kheartfill,
                                  color: Color(0xFFFF0101),
                                  size: 20.0,
                                ),
                                heart: Icon(
                                  FFIcons.kheart,
                                  color: Color(0xFF8E8E93),
                                  size: 20.0,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    if ((FFAppState().alles == 'Unterkünfte in Marburg') &&
                        !(_model.simpleSearchResults4.isNotEmpty))
                      Builder(
                        builder: (context) {
                          final buchenShuffled = _model.buchenShuffeld.toList();

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: buchenShuffled.length,
                            itemBuilder: (context, buchenShuffledIndex) {
                              final buchenShuffledItem =
                                  buchenShuffled[buchenShuffledIndex];
                              return SearchListWidget(
                                key: Key(
                                    'Keywvs_${buchenShuffledIndex}_of_${buchenShuffled.length}'),
                                image: buchenShuffledItem.bildURL,
                                name: buchenShuffledItem.name,
                                description: buchenShuffledItem.beschreibung,
                                kategorien: '',
                                adresse: buchenShuffledItem.strasse,
                                idBuchen: buchenShuffledItem,
                                fillHeart: Icon(
                                  FFIcons.kheartfill,
                                  color: Color(0xFFFF0101),
                                  size: 20.0,
                                ),
                                heart: Icon(
                                  FFIcons.kheart,
                                  color: Color(0xFF8E8E93),
                                  size: 20.0,
                                ),
                                preis: buchenShuffledItem.preis != ''
                                    ? 'ab ${buchenShuffledItem.preis}'
                                    : '',
                              );
                            },
                          );
                        },
                      ),
                    if ((FFAppState().alles == 'Unterkünfte in Marburg') &&
                        (_model.simpleSearchResults4.isNotEmpty))
                      Builder(
                        builder: (context) {
                          final buchenSearch =
                              _model.simpleSearchResults4.toList();

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: buchenSearch.length,
                            itemBuilder: (context, buchenSearchIndex) {
                              final buchenSearchItem =
                                  buchenSearch[buchenSearchIndex];
                              return SearchListWidget(
                                key: Key(
                                    'Keyjx7_${buchenSearchIndex}_of_${buchenSearch.length}'),
                                image: buchenSearchItem.bildURL,
                                name: buchenSearchItem.name,
                                description: buchenSearchItem.beschreibung,
                                kategorien: '',
                                adresse: buchenSearchItem.strasse,
                                idBuchen: buchenSearchItem,
                                fillHeart: Icon(
                                  FFIcons.kheartfill,
                                  color: Color(0xFFFF0101),
                                  size: 20.0,
                                ),
                                heart: Icon(
                                  FFIcons.kheart,
                                  color: Color(0xFF8E8E93),
                                  size: 20.0,
                                ),
                                preis: buchenSearchItem.preis != ''
                                    ? 'ab ${buchenSearchItem.preis}'
                                    : '',
                              );
                            },
                          );
                        },
                      ),
                    if ((FFAppState().alles == 'Aktivitäten') &&
                        !(_model.simpleSearchResults5.isNotEmpty))
                      Builder(
                        builder: (context) {
                          final freizeitShuffled =
                              _model.freizeitShuffeld.toList();

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: freizeitShuffled.length,
                            itemBuilder: (context, freizeitShuffledIndex) {
                              final freizeitShuffledItem =
                                  freizeitShuffled[freizeitShuffledIndex];
                              return SearchListWidget(
                                key: Key(
                                    'Keymxm_${freizeitShuffledIndex}_of_${freizeitShuffled.length}'),
                                image: freizeitShuffledItem.imageUrl,
                                name: freizeitShuffledItem.name,
                                description:
                                    freizeitShuffledItem.shortDescription,
                                kategorien: freizeitShuffledItem.kategorien,
                                adresse: freizeitShuffledItem.address1,
                                idAktivity: freizeitShuffledItem,
                                fillHeart: Icon(
                                  FFIcons.kheartfill,
                                  color: Color(0xFFFF0101),
                                  size: 20.0,
                                ),
                                heart: Icon(
                                  FFIcons.kheart,
                                  color: Color(0xFF8E8E93),
                                  size: 20.0,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    if ((FFAppState().alles == 'Aktivitäten') &&
                        (_model.simpleSearchResults5.isNotEmpty))
                      Builder(
                        builder: (context) {
                          final freizeitSearch =
                              _model.simpleSearchResults5.toList();

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: freizeitSearch.length,
                            itemBuilder: (context, freizeitSearchIndex) {
                              final freizeitSearchItem =
                                  freizeitSearch[freizeitSearchIndex];
                              return SearchListWidget(
                                key: Key(
                                    'Key8t7_${freizeitSearchIndex}_of_${freizeitSearch.length}'),
                                image: freizeitSearchItem.imageUrl,
                                name: freizeitSearchItem.name,
                                description:
                                    freizeitSearchItem.shortDescription,
                                kategorien: freizeitSearchItem.kategorien,
                                adresse: freizeitSearchItem.address1,
                                idAktivity: freizeitSearchItem,
                                fillHeart: Icon(
                                  FFIcons.kheartfill,
                                  color: Color(0xFFFF0101),
                                  size: 20.0,
                                ),
                                heart: Icon(
                                  FFIcons.kheart,
                                  color: Color(0xFF8E8E93),
                                  size: 20.0,
                                ),
                              );
                            },
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),
            Container(
              height: (isWeb
                      ? MediaQuery.viewInsetsOf(context).bottom > 0
                      : _isKeyboardVisible)
                  ? 70.0
                  : 103.0,
              decoration: BoxDecoration(
                color: Color(0xFFFAFAFA),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    16.0,
                    15.0,
                    16.0,
                    valueOrDefault<double>(
                      (isWeb
                              ? MediaQuery.viewInsetsOf(context).bottom > 0
                              : _isKeyboardVisible)
                          ? 15.0
                          : 48.0,
                      0.0,
                    )),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F2F7),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Stack(
                    children: [
                      if (FFAppState().alles == 'Gastro in Marburg')
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Icon(
                                Icons.search_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: TextFormField(
                                  controller: _model.gastroSearchTextController,
                                  focusNode: _model.gastroSearchFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.gastroSearchTextController',
                                    Duration(milliseconds: 2000),
                                    () async {
                                      safeSetState(() {
                                        _model.simpleSearchResults1 =
                                            TextSearch(
                                          _model.gastroShuffeld
                                              .map(
                                                (record) =>
                                                    TextSearchItem.fromTerms(
                                                        record, [
                                                  record.name,
                                                  record.kategorien
                                                ]),
                                              )
                                              .toList(),
                                        )
                                                .search(_model
                                                    .gastroSearchTextController
                                                    .text)
                                                .map((r) => r.object)
                                                .toList();
                                        ;
                                      });
                                    },
                                  ),
                                  autofocus: false,
                                  enabled: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: 'Suchen...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFFC0C0C5),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFF2F2F7),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  cursorColor: Color(0xFFFF5963),
                                  enableInteractiveSelection: true,
                                  validator: _model
                                      .gastroSearchTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      if (FFAppState().alles == 'Shoppen in Marburg')
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Icon(
                                Icons.search_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: TextFormField(
                                  controller:
                                      _model.shoppenSearchTextController,
                                  focusNode: _model.shoppenSearchFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.shoppenSearchTextController',
                                    Duration(milliseconds: 2000),
                                    () async {
                                      safeSetState(() {
                                        _model.simpleSearchResults2 =
                                            TextSearch(
                                          _model.shopsShuffeld
                                              .map(
                                                (record) =>
                                                    TextSearchItem.fromTerms(
                                                        record, [
                                                  record.name,
                                                  record.kategorien
                                                ]),
                                              )
                                              .toList(),
                                        )
                                                .search(_model
                                                    .shoppenSearchTextController
                                                    .text)
                                                .map((r) => r.object)
                                                .toList();
                                        ;
                                      });
                                    },
                                  ),
                                  autofocus: false,
                                  enabled: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: 'Suchen...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFFC0C0C5),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFF2F2F7),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  cursorColor: Color(0xFFFF5963),
                                  enableInteractiveSelection: true,
                                  validator: _model
                                      .shoppenSearchTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      if (FFAppState().alles == 'Parks in Marburg')
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Icon(
                                Icons.search_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: TextFormField(
                                  controller: _model.parksSearchTextController,
                                  focusNode: _model.parksSearchFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.parksSearchTextController',
                                    Duration(milliseconds: 2000),
                                    () async {
                                      safeSetState(() {
                                        _model.simpleSearchResults3 =
                                            TextSearch(
                                          _model.parksShuffeld
                                              .map(
                                                (record) =>
                                                    TextSearchItem.fromTerms(
                                                        record, [
                                                  record.name,
                                                  record.kategorien
                                                ]),
                                              )
                                              .toList(),
                                        )
                                                .search(_model
                                                    .parksSearchTextController
                                                    .text)
                                                .map((r) => r.object)
                                                .toList();
                                        ;
                                      });
                                    },
                                  ),
                                  autofocus: false,
                                  enabled: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: 'Suchen...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFFC0C0C5),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFF2F2F7),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  cursorColor: Color(0xFFFF5963),
                                  enableInteractiveSelection: true,
                                  validator: _model
                                      .parksSearchTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      if (FFAppState().alles == 'Unterkünfte in Marburg')
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Icon(
                                Icons.search_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: TextFormField(
                                  controller: _model.buchenSearchTextController,
                                  focusNode: _model.buchenSearchFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.buchenSearchTextController',
                                    Duration(milliseconds: 2000),
                                    () async {
                                      safeSetState(() {
                                        _model.simpleSearchResults4 =
                                            TextSearch(
                                          _model.buchenShuffeld
                                              .map(
                                                (record) =>
                                                    TextSearchItem.fromTerms(
                                                        record, [record.name]),
                                              )
                                              .toList(),
                                        )
                                                .search(_model
                                                    .buchenSearchTextController
                                                    .text)
                                                .map((r) => r.object)
                                                .toList();
                                        ;
                                      });
                                    },
                                  ),
                                  autofocus: false,
                                  enabled: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: 'Suchen...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFFC0C0C5),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFF2F2F7),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  cursorColor: Color(0xFFFF5963),
                                  enableInteractiveSelection: true,
                                  validator: _model
                                      .buchenSearchTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      if (FFAppState().alles == 'Aktivitäten')
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Icon(
                                Icons.search_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: TextFormField(
                                  controller:
                                      _model.freizeitSearchTextController,
                                  focusNode: _model.freizeitSearchFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.freizeitSearchTextController',
                                    Duration(milliseconds: 2000),
                                    () async {
                                      safeSetState(() {
                                        _model
                                            .simpleSearchResults5 = TextSearch(
                                          _model.freizeitShuffeld
                                              .map(
                                                (record) =>
                                                    TextSearchItem.fromTerms(
                                                        record, [record.name]),
                                              )
                                              .toList(),
                                        )
                                            .search(_model
                                                .freizeitSearchTextController
                                                .text)
                                            .map((r) => r.object)
                                            .toList();
                                        ;
                                      });
                                    },
                                  ),
                                  autofocus: false,
                                  enabled: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: 'Suchen...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFFC0C0C5),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFF2F2F7),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  cursorColor: Color(0xFFFF5963),
                                  enableInteractiveSelection: true,
                                  validator: _model
                                      .freizeitSearchTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
