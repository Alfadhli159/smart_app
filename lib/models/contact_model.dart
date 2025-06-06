/// يمثل جهة اتصال في التطبيق
class ContactModel {
  final String id;
  final String name;
  final String phone;

  ContactModel({required this.id, required this.name, required this.phone});

  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      ContactModel(id: json['id'], name: json['name'], phone: json['phone']);

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'phone': phone};
}
