class RegisterRequestModel {
  late final String name;
  late final String lastname;
  late final String email;
  late final String password;
  late final String passwordConfirmation;

  RegisterRequestModel({
    required this.name,
    required this.lastname,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lastname = json['lastname'];
    email = json['email'];
    password = json['password'];
    passwordConfirmation = json['passwordConfirmation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['lastname'] = lastname;
    data['email'] = email;
    data['password'] = password;
    data['passwordConfirmation'] = passwordConfirmation;
    return data;
  }
}
