import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmezy/models/ticket.dart';

class AdvisoryService {
  final FirebaseFirestore _firebaseFirestore;

  AdvisoryService({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Future<List<Ticket>> getTickets() async {
    final QuerySnapshot snapshot =
        await _firebaseFirestore.collection('tickets').get();
    return snapshot.docs
        .map((doc) => Ticket.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<Ticket> getTicket(String ticketId) async {
    final DocumentSnapshot snapshot =
        await _firebaseFirestore.collection('tickets').doc(ticketId).get();
    return Ticket.fromJson(snapshot.data() as Map<String, dynamic>);
  }

  Future<void> createTicket(Ticket ticket) async {
    await _firebaseFirestore
        .collection('tickets')
        .doc(ticket.id)
        .set(ticket.toJson());
  }

  Future<void> updateTicket(Ticket ticket) async {
    await _firebaseFirestore
        .collection('tickets')
        .doc(ticket.id)
        .update(ticket.toJson());
  }

  Future<void> deleteTicket(String ticketId) async {
    await _firebaseFirestore.collection('tickets').doc(ticketId).delete();
  }
}
