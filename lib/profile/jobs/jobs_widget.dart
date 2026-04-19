import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';
import 'jobs_model.dart';
export 'jobs_model.dart';

class JobsWidget extends StatefulWidget {
  const JobsWidget({super.key});

  static String routeName = 'jobs';
  static String routePath = '/jobs';

  @override
  State<JobsWidget> createState() => _JobsWidgetState();
}

class _JobsWidgetState extends State<JobsWidget> {
  late JobsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JobsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.alljobs = await queryJobsRecordOnce();
      _model.all = _model.alljobs!.toList().cast<JobsRecord>();
      safeSetState(() {});
      _model.shuffledJob = await actions.shuffleJobs(
        _model.alljobs!.toList(),
      );
      _model.shuffledJobs = _model.shuffledJob!.toList().cast<JobsRecord>();
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

    _model.jobsSearchTextController ??= TextEditingController();
    _model.jobsSearchFocusNode ??= FocusNode();
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFFAFAFA),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.0),
          child: AppBar(
            backgroundColor: Color(0xFFFAFAFA),
            iconTheme: IconThemeData(color: Colors.black),
            automaticallyImplyLeading: false,
            title: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFFDFDFD),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x06000000),
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.safePop();
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 25.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(125.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Jobs',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                              color: Colors.black,
                              fontSize: 17.0,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            actions: [],
            centerTitle: true,
            toolbarHeight: 100.0,
            elevation: 0.0,
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(),
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (_model.jobsSearchTextController.text == '')
                        Builder(
                          builder: (context) {
                            final allJobs = _model.shuffledJobs
                                .where((e) =>
                                    e.hasStellenangebotsTitel() &&
                                    e.hasFirma() &&
                                    e.hasHauptberuf())
                                .toList();

                            return ListView.builder(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                16.0,
                                0,
                                10.0,
                              ),
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: allJobs.length,
                              itemBuilder: (context, allJobsIndex) {
                                final allJobsItem = allJobs[allJobsIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 12.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        JobsDetailsWidget.routeName,
                                        queryParameters: {
                                          'firma': serializeParam(
                                            allJobsItem.firma,
                                            ParamType.String,
                                          ),
                                          'beschreibung': serializeParam(
                                            allJobsItem
                                                .stellenangebotsBeschreibung,
                                            ParamType.String,
                                          ),
                                          'name': serializeParam(
                                            allJobsItem.stellenangebotsTitel,
                                            ParamType.String,
                                          ),
                                          'hauptberuf': serializeParam(
                                            allJobsItem.hauptberuf,
                                            ParamType.String,
                                          ),
                                          'jobID': serializeParam(
                                            allJobsItem,
                                            ParamType.Document,
                                          ),
                                          'veroeffentlichungszeitraum':
                                              serializeParam(
                                            allJobsItem
                                                .veroeffentlichungszeitraum,
                                            ParamType.DataStruct,
                                          ),
                                          'eintrittszeitraum': serializeParam(
                                            allJobsItem.eintrittszeitraum,
                                            ParamType.DataStruct,
                                          ),
                                          'vollzeit': serializeParam(
                                            allJobsItem.arbeitszeitVollzeit,
                                            ParamType.bool,
                                          ),
                                          'teilzeitVormittag': serializeParam(
                                            allJobsItem
                                                .arbeitszeitTeilzeitVormittag,
                                            ParamType.bool,
                                          ),
                                          'teilzeitNachmittag': serializeParam(
                                            allJobsItem
                                                .arbeitszeitTeilzeitNachmittag,
                                            ParamType.bool,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'jobID': allJobsItem,
                                        },
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 6.0, 16.0, 6.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              allJobsItem.stellenangebotsTitel,
                                              maxLines: 2,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmall
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .fontStyle,
                                                      ),
                                            ),
                                            Text(
                                              allJobsItem.firma,
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF8E8E92),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontStyle,
                                                      ),
                                            ),
                                            Text(
                                              allJobsItem.hauptberuf,
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFFE9453A),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                            Text(
                                              allJobsItem.arbeitszeitVollzeit
                                                  ? 'Vollzeit'
                                                  : '',
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFFD63F31),
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 1.0, 8.05, 0.0),
                                                  child: Icon(
                                                    FFIcons.kcalendar,
                                                    color: Color(0xFF8E8E92),
                                                    size: 11.0,
                                                  ),
                                                ),
                                                Text(
                                                  dateTimeFormat(
                                                      "dd.MM.yyyy",
                                                      functions.parseIsoDate(
                                                          allJobsItem
                                                              .eintrittszeitraum
                                                              .von)),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF8E8E92),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ].divide(SizedBox(height: 6.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      if (_model.jobsSearchTextController.text != '')
                        Builder(
                          builder: (context) {
                            final searchedJobs =
                                _model.simpleSearchResults.toList();

                            return ListView.builder(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                16.0,
                                0,
                                10.0,
                              ),
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: searchedJobs.length,
                              itemBuilder: (context, searchedJobsIndex) {
                                final searchedJobsItem =
                                    searchedJobs[searchedJobsIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 12.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        JobsDetailsWidget.routeName,
                                        queryParameters: {
                                          'firma': serializeParam(
                                            searchedJobsItem.firma,
                                            ParamType.String,
                                          ),
                                          'beschreibung': serializeParam(
                                            searchedJobsItem
                                                .stellenangebotsBeschreibung,
                                            ParamType.String,
                                          ),
                                          'name': serializeParam(
                                            searchedJobsItem
                                                .stellenangebotsTitel,
                                            ParamType.String,
                                          ),
                                          'hauptberuf': serializeParam(
                                            searchedJobsItem.hauptberuf,
                                            ParamType.String,
                                          ),
                                          'jobID': serializeParam(
                                            searchedJobsItem,
                                            ParamType.Document,
                                          ),
                                          'veroeffentlichungszeitraum':
                                              serializeParam(
                                            searchedJobsItem
                                                .veroeffentlichungszeitraum,
                                            ParamType.DataStruct,
                                          ),
                                          'eintrittszeitraum': serializeParam(
                                            searchedJobsItem.eintrittszeitraum,
                                            ParamType.DataStruct,
                                          ),
                                          'vollzeit': serializeParam(
                                            searchedJobsItem
                                                .arbeitszeitVollzeit,
                                            ParamType.bool,
                                          ),
                                          'teilzeitVormittag': serializeParam(
                                            searchedJobsItem
                                                .arbeitszeitTeilzeitVormittag,
                                            ParamType.bool,
                                          ),
                                          'teilzeitNachmittag': serializeParam(
                                            searchedJobsItem
                                                .arbeitszeitTeilzeitNachmittag,
                                            ParamType.bool,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'jobID': searchedJobsItem,
                                        },
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 6.0, 16.0, 6.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              searchedJobsItem
                                                  .stellenangebotsTitel,
                                              maxLines: 2,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmall
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .fontStyle,
                                                      ),
                                            ),
                                            Text(
                                              searchedJobsItem.firma,
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF8E8E92),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontStyle,
                                                      ),
                                            ),
                                            Text(
                                              searchedJobsItem.hauptberuf,
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFFE9453A),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                            Text(
                                              searchedJobsItem
                                                      .arbeitszeitVollzeit
                                                  ? 'Vollzeit'
                                                  : '',
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFFD63F31),
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 1.0, 5.0, 0.0),
                                                  child: Icon(
                                                    FFIcons.kcalendar,
                                                    color: Color(0xFF8E8E92),
                                                    size: 11.0,
                                                  ),
                                                ),
                                                Text(
                                                  dateTimeFormat(
                                                      "dd.MM.yyyy",
                                                      functions.parseIsoDate(
                                                          searchedJobsItem
                                                              .eintrittszeitraum
                                                              .von)),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF8E8E92),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ].divide(SizedBox(height: 6.0)),
                                        ),
                                      ),
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
                borderRadius: BorderRadius.only(),
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
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search_sharp,
                        color: Color(0xFF8E8E94),
                        size: 24.0,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.jobsSearchTextController,
                            focusNode: _model.jobsSearchFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.jobsSearchTextController',
                              Duration(milliseconds: 2000),
                              () async {
                                safeSetState(() {
                                  _model.simpleSearchResults = TextSearch(
                                    _model.shuffledJobs
                                        .where((e) =>
                                            e.hasStellenangebotsTitel() &&
                                            e.hasFirma() &&
                                            e.hasHauptberuf())
                                        .toList()
                                        .map(
                                          (record) => TextSearchItem.fromTerms(
                                              record, [
                                            record.stellenangebotsTitel,
                                            record.firma
                                          ]),
                                        )
                                        .toList(),
                                  )
                                      .search(
                                          _model.jobsSearchTextController.text)
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
                              hintText: 'Jobs suchen...',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFFC1C1C6),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
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
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
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
                                    fontStyle: FlutterFlowTheme.of(context)
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
                            cursorColor: Color(0xFFD12919),
                            enableInteractiveSelection: true,
                            validator: _model.jobsSearchTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
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
