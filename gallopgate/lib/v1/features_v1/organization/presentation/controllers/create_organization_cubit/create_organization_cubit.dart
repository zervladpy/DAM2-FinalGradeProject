import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/v1/common/domain/models/organization.dart';
import 'package:gallopgate/v1/common/domain/models/user.dart';
import 'package:gallopgate/v1/common/domain/use_cases/organization/create_organization_use_case.dart';
import 'package:gallopgate/v1/resources/response/response.dart';

part 'create_organization_state.dart';

class CreateOrganizationCubit extends Cubit<CreateOrganizationState> {
  final CreateOrganizationUseCase createOrganizationUseCase;

  final User user;

  CreateOrganizationCubit(
    this.user,
    this.createOrganizationUseCase,
  ) : super(CreateOrganizationState.initial());

  void nameChanged(String value) {
    emit(state.copyWith(
        nameError: '', organization: state.organization.copyWith(name: value)));
  }

  void descriptionChanged(String value) {
    emit(state.copyWith(
        descriptionError: '',
        organization: state.organization.copyWith(description: value)));
  }

  void countryChanged(String value) {
    emit(state.copyWith(
        countryError: '',
        organization: state.organization.copyWith(country: value)));
  }

  void cityChanged(String value) {
    emit(state.copyWith(
        cityError: '', organization: state.organization.copyWith(city: value)));
  }

  void streetChanged(String value) {
    emit(state.copyWith(
        streetError: '',
        organization: state.organization.copyWith(street: value)));
  }

  Future<void> create() async {
    emit(state.copyWith(status: CreateOrganizationStatus.loading));

    final response = await createOrganizationUseCase(CreateOrganizationParams(
      user,
      state.organization,
    ));

    if (response is ErrorResponse) {
      emit(state.copyWith(
        status: CreateOrganizationStatus.error,
        generalError: (response as ErrorResponse).error,
      ));
      return;
    }

    emit(state.copyWith(status: CreateOrganizationStatus.success));
  }
}
