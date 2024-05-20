import 'package:equatable/equatable.dart';

class Organization extends Equatable {
  const Organization({
    required this.id,
    required this.name,
    required this.description,
    required this.logoUrl,
    required this.country,
    required this.city,
    required this.street,
    required this.creator,
    required this.users,
  });

  final String id;
  final String name;
  final String description;
  final String logoUrl;
  final String country;
  final String city;
  final String street;
  final String creator;
  final List<String> users;

  static const empty = Organization(
    id: '',
    name: '',
    description: '',
    logoUrl: '',
    country: '',
    city: '',
    street: '',
    creator: '',
    users: [],
  );

  bool get isEmpty => this == Organization.empty;

  Organization copyWith({
    String? id,
    String? name,
    String? description,
    String? logoUrl,
    String? country,
    String? city,
    String? street,
    String? creator,
    List<String>? users,
  }) {
    return Organization(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      logoUrl: logoUrl ?? this.logoUrl,
      country: country ?? this.country,
      city: city ?? this.city,
      street: street ?? this.street,
      creator: creator ?? this.creator,
      users: users ?? this.users,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        logoUrl,
        country,
        city,
        street,
        creator,
        users,
      ];
}
