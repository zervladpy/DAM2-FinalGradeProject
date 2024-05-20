import 'package:gallopgate/v1/common/domain/models/organization.dart';
import 'package:gallopgate/v1/common/domain/repositories/organization/organization_repository.dart';
import 'package:gallopgate/v1/common/domain/use_cases/use_case.dart';
import 'package:gallopgate/v1/resources/response/response.dart';

class UpdateOrganizationUseCase
    extends UseCase<Organization, UpdateOrganizationParams> {
  const UpdateOrganizationUseCase(OrganizationRepository repository)
      : _repository = repository;

  final OrganizationRepository _repository;

  @override
  Future<Response<Organization>> call(UpdateOrganizationParams params) async {
    try {
      await _repository.update(params.organization);
    } catch (e) {
      return ErrorResponse(e.toString());
    }

    return SuccessResponse(params.organization);
  }
}

class UpdateOrganizationParams extends UseCaseParams {
  const UpdateOrganizationParams(this.organization);

  final Organization organization;
}
