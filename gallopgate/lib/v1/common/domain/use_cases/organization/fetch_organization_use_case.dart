import 'package:gallopgate/v1/common/domain/models/organization.dart';
import 'package:gallopgate/v1/common/domain/repositories/organization/organization_repository.dart';
import 'package:gallopgate/v1/common/domain/use_cases/use_case.dart';
import 'package:gallopgate/v1/resources/response/response.dart';

class FetchOrganizationUseCase
    extends UseCase<Organization, FetchOrganizationUseCaseParams> {
  const FetchOrganizationUseCase(OrganizationRepository repository)
      : _repository = repository;

  final OrganizationRepository _repository;

  @override
  Future<Response<Organization>> call(
      FetchOrganizationUseCaseParams params) async {
    Organization? organization;

    try {
      organization = await _repository.fetch(params.id);

      if (organization == null) throw Exception('Organization not found');
    } catch (e) {
      return ErrorResponse(e.toString());
    }

    return SuccessResponse(organization);
  }
}

class FetchOrganizationUseCaseParams extends UseCaseParams {
  const FetchOrganizationUseCaseParams({required this.id});

  final String id;
}
