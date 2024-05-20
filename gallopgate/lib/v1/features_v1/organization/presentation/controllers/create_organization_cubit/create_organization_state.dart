part of 'create_organization_cubit.dart';

enum CreateOrganizationStatus {
  initial,
  loading,
  success,
  error,
}

class CreateOrganizationState extends Equatable {
  const CreateOrganizationState._(
    this.status,
    this.organization,
    this.nameError,
    this.descriptionError,
    this.countryError,
    this.cityError,
    this.streetError,
    this.generalError,
  );

  final CreateOrganizationStatus status;
  final Organization organization;

  final String generalError,
      nameError,
      descriptionError,
      countryError,
      cityError,
      streetError;

  factory CreateOrganizationState.initial() => const CreateOrganizationState._(
        CreateOrganizationStatus.initial,
        Organization.empty,
        '',
        '',
        '',
        '',
        '',
        '',
      );

  CreateOrganizationState copyWith({
    CreateOrganizationStatus? status,
    Organization? organization,
    String? nameError,
    String? descriptionError,
    String? countryError,
    String? cityError,
    String? streetError,
    String? generalError,
  }) {
    return CreateOrganizationState._(
      status ?? this.status,
      organization ?? this.organization,
      nameError ?? this.nameError,
      descriptionError ?? this.descriptionError,
      countryError ?? this.countryError,
      cityError ?? this.cityError,
      streetError ?? this.streetError,
      generalError ?? this.generalError,
    );
  }

  @override
  List<Object> get props => [
        status,
        organization,
        nameError,
        descriptionError,
        countryError,
        cityError,
        streetError,
        generalError,
      ];
}
