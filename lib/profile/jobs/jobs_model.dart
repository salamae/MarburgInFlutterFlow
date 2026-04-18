import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'jobs_widget.dart' show JobsWidget;
import 'package:flutter/material.dart';

class JobsModel extends FlutterFlowModel<JobsWidget> {
  ///  Local state fields for this page.

  List<JobsRecord> all = [];
  void addToAll(JobsRecord item) => all.add(item);
  void removeFromAll(JobsRecord item) => all.remove(item);
  void removeAtIndexFromAll(int index) => all.removeAt(index);
  void insertAtIndexInAll(int index, JobsRecord item) =>
      all.insert(index, item);
  void updateAllAtIndex(int index, Function(JobsRecord) updateFn) =>
      all[index] = updateFn(all[index]);

  List<JobsRecord> shuffledJobs = [];
  void addToShuffledJobs(JobsRecord item) => shuffledJobs.add(item);
  void removeFromShuffledJobs(JobsRecord item) => shuffledJobs.remove(item);
  void removeAtIndexFromShuffledJobs(int index) => shuffledJobs.removeAt(index);
  void insertAtIndexInShuffledJobs(int index, JobsRecord item) =>
      shuffledJobs.insert(index, item);
  void updateShuffledJobsAtIndex(int index, Function(JobsRecord) updateFn) =>
      shuffledJobs[index] = updateFn(shuffledJobs[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in jobs widget.
  List<JobsRecord>? alljobs;
  // Stores action output result for [Custom Action - shuffleJobs] action in jobs widget.
  List<JobsRecord>? shuffledJob;
  // State field(s) for jobsSearch widget.
  FocusNode? jobsSearchFocusNode;
  TextEditingController? jobsSearchTextController;
  String? Function(BuildContext, String?)? jobsSearchTextControllerValidator;
  List<JobsRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    jobsSearchFocusNode?.dispose();
    jobsSearchTextController?.dispose();
  }
}
