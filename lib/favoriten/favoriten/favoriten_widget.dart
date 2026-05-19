import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/favoriten/event_list_fav/event_list_fav_widget.dart';
import '/favoriten/fav_list/fav_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'favoriten_model.dart';
export 'favoriten_model.dart';

class FavoritenWidget extends StatefulWidget {
  const FavoritenWidget({
    super.key,
    required this.eventsList,
  });

  final List<EventsRecord>? eventsList;

  @override
  State<FavoritenWidget> createState() => _FavoritenWidgetState();
}

class _FavoritenWidgetState extends State<FavoritenWidget> {
  late FavoritenModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoritenModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 165.0,
          decoration: BoxDecoration(
            color: Color(0xFFFAFAFA),
          ),
          alignment: AlignmentDirectional(-1.0, 1.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 10.0),
            child: Text(
              'Favoriten',
              style: FlutterFlowTheme.of(context).displayLarge.override(
                    font: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).displayLarge.fontStyle,
                    ),
                    color: Colors.black,
                    fontSize: 33.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).displayLarge.fontStyle,
                  ),
            ),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              if ((FFAppState().favoriteEventIdsGuest.isNotEmpty) ||
                  ((currentUserDocument?.favorites.toList() ?? [])
                      .isNotEmpty) ||
                  ((currentUserDocument?.favoriteGastro.toList() ?? [])
                      .isNotEmpty) ||
                  ((currentUserDocument?.favoriteParks.toList() ?? [])
                      .isNotEmpty) ||
                  ((currentUserDocument?.favoriteShopping.toList() ?? [])
                      .isNotEmpty))
                AuthUserStreamWidget(
                  builder: (context) => Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFAFAFA),
                      shape: BoxShape.rectangle,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (((currentUserDocument?.favorites.toList() ?? [])
                                  .isNotEmpty) &&
                              loggedIn)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 16.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(1.0, -1.0),
                                    child: Builder(
                                      builder: (context) {
                                        final test1 = functions
                                            .getUniqueEventDates(widget
                                                .eventsList!
                                                .where((e) =>
                                                    (currentUserDocument
                                                                ?.favorites
                                                                .toList() ??
                                                            [])
                                                        .contains(
                                                            e.reference.id))
                                                .toList())
                                            .toList();

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: test1.length,
                                          itemBuilder: (context, test1Index) {
                                            final test1Item = test1[test1Index];
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 20.0, 0.0, 20.0),
                                                  child: Text(
                                                    functions.favDate(
                                                        test1Item.toString())!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Builder(
                                                  builder: (context) {
                                                    final events = widget
                                                        .eventsList!
                                                        .where((e) =>
                                                            (currentUserDocument
                                                                        ?.favorites
                                                                        .toList() ??
                                                                    [])
                                                                .contains(e
                                                                    .reference
                                                                    .id) &&
                                                            (functions.favDate(
                                                                    e.date) ==
                                                                functions.favDate(
                                                                    test1Item
                                                                        .toString())))
                                                        .toList()
                                                        .map((e) => e)
                                                        .toList();

                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: events.length,
                                                      itemBuilder: (context,
                                                          eventsIndex) {
                                                        final eventsItem =
                                                            events[eventsIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      35.0),
                                                          child:
                                                              EventListFavWidget(
                                                            key: Key(
                                                                'Keymhi_${eventsIndex}_of_${events.length}'),
                                                            name:
                                                                eventsItem.name,
                                                            description: eventsItem
                                                                .shortDescription,
                                                            image: eventsItem
                                                                .imageUrl,
                                                            id: eventsItem,
                                                            date:
                                                                eventsItem.date,
                                                            time:
                                                                eventsItem.time,
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if ((FFAppState().favoriteEventIdsGuest.isNotEmpty) &&
                              !loggedIn)
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFFAFAFA),
                                shape: BoxShape.rectangle,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(1.0, -1.0),
                                child: Builder(
                                  builder: (context) {
                                    final test = functions
                                        .getUniqueEventDates(widget.eventsList!
                                            .where((e) => FFAppState()
                                                .favoriteEventIdsGuest
                                                .contains(e.reference.id))
                                            .toList())
                                        .toList();

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: test.length,
                                      itemBuilder: (context, testIndex) {
                                        final testItem = test[testIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 16.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 20.0, 0.0, 20.0),
                                                child: Text(
                                                  functions.favDate(
                                                      testItem.toString())!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                              Builder(
                                                builder: (context) {
                                                  final test2 = widget
                                                      .eventsList!
                                                      .where((e) =>
                                                          FFAppState()
                                                              .favoriteEventIdsGuest
                                                              .contains(e
                                                                  .reference
                                                                  .id) &&
                                                          (functions.favDate(
                                                                  e.date) ==
                                                              functions.favDate(
                                                                  testItem
                                                                      .toString())))
                                                      .toList()
                                                      .map((e) => e)
                                                      .toList();

                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: test2.length,
                                                    itemBuilder:
                                                        (context, test2Index) {
                                                      final test2Item =
                                                          test2[test2Index];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    35.0),
                                                        child:
                                                            EventListFavWidget(
                                                          key: Key(
                                                              'Keynry_${test2Index}_of_${test2.length}'),
                                                          name: test2Item.name,
                                                          description: test2Item
                                                              .shortDescription,
                                                          image: test2Item
                                                              .imageUrl,
                                                          id: test2Item,
                                                          date: test2Item.date,
                                                          time: test2Item.time,
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          if ((currentUserDocument?.favoriteGastro.toList() ??
                                  [])
                              .isNotEmpty)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 16.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 20.0, 0.0, 20.0),
                                    child: Text(
                                      'Restaurants',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontStyle,
                                            ),
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  StreamBuilder<List<GastroRecord>>(
                                    stream: queryGastroRecord(
                                      queryBuilder: (gastroRecord) =>
                                          gastroRecord.orderBy('name'),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<GastroRecord>
                                          listViewGastroRecordList =
                                          snapshot.data!;

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewGastroRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewGastroRecord =
                                              listViewGastroRecordList[
                                                  listViewIndex];
                                          return Visibility(
                                            visible: (loggedIn &&
                                                        (currentUserDocument
                                                                    ?.favoriteGastro
                                                                    .toList() ??
                                                                [])
                                                            .contains(
                                                                listViewGastroRecord
                                                                    .reference
                                                                    .id)) ||
                                                    (!loggedIn &&
                                                        FFAppState()
                                                            .favoriteEventIdsGuest
                                                            .contains(
                                                                listViewGastroRecord
                                                                    .reference
                                                                    .id))
                                                ? true
                                                : false,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 35.0),
                                              child: FavListWidget(
                                                key: Key(
                                                    'Keyz0y_${listViewIndex}_of_${listViewGastroRecordList.length}'),
                                                name: listViewGastroRecord.name,
                                                description:
                                                    listViewGastroRecord
                                                        .shortDescription,
                                                image: listViewGastroRecord
                                                    .imageUrl,
                                                kategorie: listViewGastroRecord
                                                    .kategorien,
                                                adresse: listViewGastroRecord
                                                    .address1,
                                                openTime: functions
                                                    .openStatusTextMulti(
                                                        listViewGastroRecord
                                                            .oeffnungszeiten
                                                            .map((e) =>
                                                                e.timeFrom)
                                                            .toList(),
                                                        listViewGastroRecord
                                                            .oeffnungszeiten
                                                            .map(
                                                                (e) => e.timeTo)
                                                            .toList()),
                                                open: functions.isOpenNowMulti(
                                                        listViewGastroRecord
                                                            .oeffnungszeiten
                                                            .map((e) =>
                                                                e.timeFrom)
                                                            .toList(),
                                                        listViewGastroRecord
                                                            .oeffnungszeiten
                                                            .map(
                                                                (e) => e.timeTo)
                                                            .toList())
                                                    ? Color(0xFF28A745)
                                                    : Color(0xFFDC3645),
                                                idGastro: listViewGastroRecord,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          if ((currentUserDocument?.favoriteParks.toList() ??
                                  [])
                              .isNotEmpty)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 16.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 20.0, 0.0, 20.0),
                                    child: Text(
                                      'Parks',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontStyle,
                                            ),
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  StreamBuilder<List<ParkRecord>>(
                                    stream: queryParkRecord(
                                      queryBuilder: (parkRecord) =>
                                          parkRecord.orderBy('name'),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<ParkRecord> listViewParkRecordList =
                                          snapshot.data!;

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewParkRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewParkRecord =
                                              listViewParkRecordList[
                                                  listViewIndex];
                                          return Visibility(
                                            visible: (loggedIn &&
                                                        (currentUserDocument
                                                                    ?.favoriteParks
                                                                    .toList() ??
                                                                [])
                                                            .contains(
                                                                listViewParkRecord
                                                                    .reference
                                                                    .id)) ||
                                                    (!loggedIn &&
                                                        FFAppState()
                                                            .favoriteEventIdsGuest
                                                            .contains(
                                                                listViewParkRecord
                                                                    .reference
                                                                    .id))
                                                ? true
                                                : false,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 35.0),
                                              child: FavListWidget(
                                                key: Key(
                                                    'Keyhx5_${listViewIndex}_of_${listViewParkRecordList.length}'),
                                                name: listViewParkRecord.name,
                                                description: listViewParkRecord
                                                    .shortDescription,
                                                image:
                                                    listViewParkRecord.imageUrl,
                                                kategorie: listViewParkRecord
                                                    .kategorien,
                                                adresse:
                                                    listViewParkRecord.address1,
                                                openTime: functions
                                                    .openStatusTextMulti(
                                                        listViewParkRecord
                                                            .oeffnungszeiten
                                                            .map((e) =>
                                                                e.timeFrom)
                                                            .toList(),
                                                        listViewParkRecord
                                                            .oeffnungszeiten
                                                            .map(
                                                                (e) => e.timeTo)
                                                            .toList()),
                                                open: functions.isOpenNowMulti(
                                                        listViewParkRecord
                                                            .oeffnungszeiten
                                                            .map((e) =>
                                                                e.timeFrom)
                                                            .toList(),
                                                        listViewParkRecord
                                                            .oeffnungszeiten
                                                            .map(
                                                                (e) => e.timeTo)
                                                            .toList())
                                                    ? Color(0xFF28A745)
                                                    : Color(0xFFDC3645),
                                                idPark: listViewParkRecord,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          if ((currentUserDocument?.favoriteShopping
                                      .toList() ??
                                  [])
                              .isNotEmpty)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 16.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 20.0, 0.0, 20.0),
                                    child: Text(
                                      'Shoppen',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontStyle,
                                            ),
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  StreamBuilder<List<ShoppingRecord>>(
                                    stream: queryShoppingRecord(
                                      queryBuilder: (shoppingRecord) =>
                                          shoppingRecord.orderBy('name'),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<ShoppingRecord>
                                          listViewShoppingRecordList =
                                          snapshot.data!;

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewShoppingRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewShoppingRecord =
                                              listViewShoppingRecordList[
                                                  listViewIndex];
                                          return Visibility(
                                            visible: (loggedIn &&
                                                        (currentUserDocument
                                                                    ?.favoriteShopping
                                                                    .toList() ??
                                                                [])
                                                            .contains(
                                                                listViewShoppingRecord
                                                                    .reference
                                                                    .id)) ||
                                                    (!loggedIn &&
                                                        FFAppState()
                                                            .favoriteEventIdsGuest
                                                            .contains(
                                                                listViewShoppingRecord
                                                                    .reference
                                                                    .id))
                                                ? true
                                                : false,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 35.0),
                                              child: FavListWidget(
                                                key: Key(
                                                    'Keyf59_${listViewIndex}_of_${listViewShoppingRecordList.length}'),
                                                name:
                                                    listViewShoppingRecord.name,
                                                description:
                                                    listViewShoppingRecord
                                                        .shortDescription,
                                                image: listViewShoppingRecord
                                                    .imageUrl,
                                                kategorie:
                                                    listViewShoppingRecord
                                                        .kategorien,
                                                adresse: listViewShoppingRecord
                                                    .address1,
                                                openTime: functions
                                                    .openStatusTextMulti(
                                                        listViewShoppingRecord
                                                            .oeffnungszeiten
                                                            .map((e) =>
                                                                e.timeFrom)
                                                            .toList(),
                                                        listViewShoppingRecord
                                                            .oeffnungszeiten
                                                            .map(
                                                                (e) => e.timeTo)
                                                            .toList()),
                                                open: functions.isOpenNowMulti(
                                                        listViewShoppingRecord
                                                            .oeffnungszeiten
                                                            .map((e) =>
                                                                e.timeFrom)
                                                            .toList(),
                                                        listViewShoppingRecord
                                                            .oeffnungszeiten
                                                            .map(
                                                                (e) => e.timeTo)
                                                            .toList())
                                                    ? Color(0xFF28A745)
                                                    : Color(0xFFDC3645),
                                                idShop: listViewShoppingRecord,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                        ].addToEnd(SizedBox(height: 70.0)),
                      ),
                    ),
                  ),
                ),
              if ((loggedIn &&
                      !((currentUserDocument?.favorites.toList() ?? [])
                          .isNotEmpty) &&
                      !((currentUserDocument?.favoriteGastro.toList() ?? [])
                          .isNotEmpty) &&
                      !((currentUserDocument?.favoriteParks.toList() ?? [])
                          .isNotEmpty) &&
                      !((currentUserDocument?.favoriteShopping.toList() ?? [])
                          .isNotEmpty)) ||
                  (!loggedIn &&
                      !(FFAppState().favoriteEventIdsGuest.isNotEmpty)))
                AuthUserStreamWidget(
                  builder: (context) => Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F2F7),
                      borderRadius: BorderRadius.circular(0.0),
                      shape: BoxShape.rectangle,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 25.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: SvgPicture.asset(
                                    'assets/images/heart.svg',
                                    width: 55.0,
                                    height: 55.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 3.0),
                                child: Text(
                                  'Keine Favoriten',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 22.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    18.0, 0.0, 18.0, 0.0),
                                child: Text(
                                  'Tippe auf das Herz bei einer Veranstaltung, einem Restaurant oder einem Park, um es hier zu speichern.',
                                  textAlign: TextAlign.center,
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
                                        color: Color(0xFF85858B),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                        lineHeight: 1.5,
                                      ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(height: 3.0)),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
