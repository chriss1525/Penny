import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:client/api/api.dart';
import 'package:client/api/auth/auth.dart';

final authProvider = Provider<AuthApi>((ref) {
  return Api().auth;
});
