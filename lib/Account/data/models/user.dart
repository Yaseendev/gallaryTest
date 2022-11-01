import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends Equatable {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });

  User.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'] ?? '',
        name = parsedJson['name'] ?? '',
        email = parsedJson['email'] ?? '';


  @override
  List<Object?> get props =>
      [id, name, email];
}
