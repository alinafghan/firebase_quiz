class Transactions {
  final String id;
  final String reciever;
  final String sender;
  final DateTime date;
  final double amount;
  final String status;

  Transactions({
    required this.id,
    required this.reciever,
    required this.sender,
    required this.date,
    required this.amount,
    required this.status,
  });

  factory Transactions.fromJson(Map<String, dynamic> json) {
    return Transactions(
        amount: json['amount'] as double,
        date: DateTime.parse(json['date'] as String),
        id: json['id'] as String,
        reciever: json['reciever'] as String,
        sender: json['sender'] as String,
        status: json['status'] as String);
  }

  Map<String, dynamic> toJson(Transactions transaction) {
    return {
      'id': id,
      'reciever': reciever,
      'sender': sender,
      'date': date.toIso8601String(),
      'amount': amount,
      'status': status,
    };
  }
}
