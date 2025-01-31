import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmezy/models/job.dart';

class JobService {
  final FirebaseFirestore _firebaseFirestore;

  JobService({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Future<List<Job>> getJobs() async {
    final QuerySnapshot snapshot =
        await _firebaseFirestore.collection('jobs').get();
    return snapshot.docs
        .map((doc) => Job.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<Job> getJob(String jobId) async {
    final DocumentSnapshot snapshot =
        await _firebaseFirestore.collection('jobs').doc(jobId).get();
    return Job.fromJson(snapshot.data() as Map<String, dynamic>);
  }

  Future<void> createJob(Job job) async {
    await _firebaseFirestore.collection('jobs').doc(job.id).set(job.toJson());
  }

  Future<void> updateJob(Job job) async {
    await _firebaseFirestore
        .collection('jobs')
        .doc(job.id)
        .update(job.toJson());
  }

  Future<void> deleteJob(String jobId) async {
    await _firebaseFirestore.collection('jobs').doc(jobId).delete();
  }
}
