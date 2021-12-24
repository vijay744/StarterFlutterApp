class ModelUser {
  String id;
  String firstName;
  String lastName;

  ModelUser(
      {required this.id, required this.firstName, required this.lastName});

  factory ModelUser.fromJson(Map<String, dynamic> json) => ModelUser(
      firstName: json['firstname'] ?? '',
      lastName: json['lastname'] ?? '',
      id: json['id'] ?? '');

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstname'] = firstName;
    data['lastname'] = lastName;
    data['id'] = id;
    return data;
  }
}
