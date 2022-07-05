class UserModel {
  UserModel({
    required this.id,
    required this.skills,
    required this.birthDate,
    required this.phone,
    required this.countryCode,
    required this.tag,
    required this.username,
    required this.wallet,
  });

  final String id;
  final List<dynamic> skills;
  final DateTime birthDate;
  final String phone;
  final String countryCode;
  final String tag;
  final String username;
  final Wallet wallet;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        skills: List<dynamic>.from(json["skills"].map((x) => x)),
        birthDate: DateTime.parse(json["birthDate"]),
        phone: json["phone"],
        countryCode: json["countryCode"],
        tag: json["tag"],
        username: json["username"],
        wallet: Wallet.fromJson(json["wallet"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "skills": List<dynamic>.from(skills.map((x) => x)),
        "birthDate": birthDate.toIso8601String(),
        "phone": phone,
        "countryCode": countryCode,
        "tag": tag,
        "username": username,
        "wallet": wallet.toMap(),
      };
}

class Wallet {
  Wallet({
    required this.balance,
    required this.user,
    required this.balanceLog,
    required this.address,
    required this.createdAt,
  });

  final int balance;
  final String user;
  final List<BalanceLog> balanceLog;
  final String address;
  final DateTime createdAt;

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        balance: json["balance"],
        user: json["user"],
        balanceLog: List<BalanceLog>.from(
            json["balanceLog"].map((x) => BalanceLog.fromJson(x))),
        address: json["address"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toMap() => {
        "balance": balance,
        "user": user,
        "balanceLog": List<dynamic>.from(balanceLog.map((x) => x.toMap())),
        "address": address,
        "createdAt": createdAt.toIso8601String(),
      };
}

class BalanceLog {
  BalanceLog({
    required this.prevBalance,
    this.newBalance,
    required this.date,
    required this.id,
  });
  final int prevBalance;
  final int? newBalance;
  final int date;
  final String id;

  factory BalanceLog.fromJson(Map<String, dynamic> json) => BalanceLog(
        prevBalance: json["prevBalance"],
        newBalance: json["newBalance"],
        date: json["date"],
        id: json["_id"],
      );

  Map<String, dynamic> toMap() => {
        "prevBalance": prevBalance,
        "newBalance": newBalance,
        "date": date,
        "_id": id,
      };
}
