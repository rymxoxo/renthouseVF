import 'package:firebase_core/firebase_core.dart';
import 'package:house_rent/services/auth/auth_provider.dart';
import 'package:house_rent/services/auth/auth_user.dart';
import 'package:house_rent/services/auth/firebase_auth_provider.dart';

import '../../firebase_options.dart';

class AuthService implements AuthProvider {
  final AuthProvider provider;

  AuthService(this.provider);
  factory AuthService.firebase() => AuthService(
        FirebaseAuthProvider(),
      );

  @override
  Future<AuthUser> createUser({
    required String name,
    required String email,
    required String password,
  }) =>
      provider.createUser(
        name: name,
        email: email,
        password: password,
      );

  @override
  // TODO: implement currentUser
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) =>
      provider.logIn(
        email: email,
        password: password,
      );

  @override
  Future<void> logOut() => provider.logOut(); // TODO: implement logOut

  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();

  @override
  Future<void> initialize() => provider.initialize();
  // TODO: implement initialize

}
