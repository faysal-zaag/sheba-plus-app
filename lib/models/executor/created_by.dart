/**
 * Created by mahabubshozib on 12/9/24.
 * Author: Md Mahabub Hossain Shozib
 */

class Executor {
  final String firstName;
  final String lastName;
  final String email;

  Executor({
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory Executor.fromJson(Map<String, dynamic> json) {
    return Executor(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    };
  }
}