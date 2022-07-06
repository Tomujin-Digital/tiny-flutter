class TransactionModel {
  TransactionModel({
    required this.success,
    required this.transactions,
  });

  final bool success;
  final List<Transaction> transactions;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        success: json["success"],
        transactions: List<Transaction>.from(
            json["transactions"].map((x) => Transaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "transactions": List<dynamic>.from(transactions.map((x) => x.toJson())),
      };
}

class Transaction {
  Transaction({
    required this.id,
    required this.date,
    required this.description,
    required this.newBalance,
    required this.prevBalance,
    required this.transactionType,
    required this.amount,
    required this.type,
    required this.debitAddress,
    required this.creditAddress,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String id;
  final int date;
  final String description;
  final int newBalance;
  final int prevBalance;
  final String transactionType;
  final int amount;
  final String type;
  final String debitAddress;
  final String creditAddress;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["_id"],
        date: json["date"],
        description: json["description"],
        newBalance: json["newBalance"],
        prevBalance: json["prevBalance"],
        transactionType: json["transactionType"],
        amount: json["amount"],
        type: json["type"],
        debitAddress: json["debitAddress"],
        creditAddress: json["creditAddress"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "date": date,
        "description": description,
        "newBalance": newBalance,
        "prevBalance": prevBalance,
        "transactionType": transactionType,
        "amount": amount,
        "type": type,
        "debitAddress": debitAddress,
        "creditAddress": creditAddress,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
