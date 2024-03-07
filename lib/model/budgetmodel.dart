class BudgetModel {
  int? id;
  String? name;
  String? type;
  String? date;
  int? amount; // Changed from String? to int?
  String? note;
  String? category;

  BudgetModel({
    this.id,
    this.name,
    this.type,
    this.date,
    this.amount,
    this.note,
    this.category,
  });

  factory BudgetModel.fromJson(Map<String, dynamic> json) => BudgetModel(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    date: json["date"],
    amount: json["amount"],
    note: json["note"],
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "date": date,
    "amount": amount,
    "note": note,
    "category": category,
  };
}
