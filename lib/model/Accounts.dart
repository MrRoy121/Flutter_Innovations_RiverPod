class Accounts {
  int id;
  String name;

  Accounts({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  static Accounts fromMap(Map<String, dynamic> map) {
    return Accounts(
      id: map['id'],
      name: map['name'],
    );
  }
}