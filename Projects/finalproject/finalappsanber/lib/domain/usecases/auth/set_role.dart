import 'package:finalappsanber/domain/repositories/auth_repository.dart';

class SetRole {
  final AuthRepository repository;

  SetRole(this.repository);

  Future<void> execute(String role) {
    return repository.setRole(role);
  }
}
