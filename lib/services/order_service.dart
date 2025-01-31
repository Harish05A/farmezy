import 'package:cloud_firestore/cloud_firestore.dart' hide Order;
import 'package:farmezy/models/order.dart';

class OrderService {
  final FirebaseFirestore _firebaseFirestore;

  OrderService({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Future<List<Order>> getOrders() async {
    final QuerySnapshot snapshot =
        await _firebaseFirestore.collection('orders').get();
    return snapshot.docs
        .map((doc) => Order.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<Order> getOrder(String orderId) async {
    final DocumentSnapshot snapshot =
        await _firebaseFirestore.collection('orders').doc(orderId).get();
    return Order.fromJson(snapshot.data() as Map<String, dynamic>);
  }

  Future<void> createOrder(Order order) async {
    await _firebaseFirestore
        .collection('orders')
        .doc(order.id)
        .set(order.toJson());
  }

  Future<void> updateOrder(Order order) async {
    await _firebaseFirestore
        .collection('orders')
        .doc(order.id)
        .update(order.toJson());
  }

  Future<void> deleteOrder(String orderId) async {
    await _firebaseFirestore.collection('orders').doc(orderId).delete();
  }
}
