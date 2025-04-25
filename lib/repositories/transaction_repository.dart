import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_quiz/models/transaction.dart';

class TransactionRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Transactions>> fetchAllTransactions() async {
    try {
      QuerySnapshot snapshot =
          await _firestore.collection('transactions').get();
      return snapshot.docs
          .map((doc) => Transactions.fromJson(doc as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to load transactions: $e');
    }
  }
}
