import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'jobs_details_widget.dart' show JobsDetailsWidget;
import 'package:flutter/material.dart';

class JobsDetailsModel extends FlutterFlowModel<JobsDetailsWidget> {
  ///  Local state fields for this page.

  List<JobsRecord> allJobs = [];
  void addToAllJobs(JobsRecord item) => allJobs.add(item);
  void removeFromAllJobs(JobsRecord item) => allJobs.remove(item);
  void removeAtIndexFromAllJobs(int index) => allJobs.removeAt(index);
  void insertAtIndexInAllJobs(int index, JobsRecord item) =>
      allJobs.insert(index, item);
  void updateAllJobsAtIndex(int index, Function(JobsRecord) updateFn) =>
      allJobs[index] = updateFn(allJobs[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in jobsDetails widget.
  List<JobsRecord>? all;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
