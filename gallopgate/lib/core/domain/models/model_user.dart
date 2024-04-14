import 'package:gallopgate/core/domain/models/i_model.dart';

class User extends IModel {

  const User({required this.uid, required this.email});

  final String uid, email;
}