import 'package:gallopgate/v1/common/domain/models/organization.dart';
import 'package:gallopgate/v1/common/domain/repositories/organization/organization_repository.dart';
import 'package:gallopgate/v1/common/domain/use_cases/use_case.dart';
import 'package:gallopgate/v1/resources/response/response.dart';

class FetchOrgaizationsUsecase
    extends UseCase<List<Organization>, FetchManyParams> {
  const FetchOrgaizationsUsecase(this.repository);

  final OrganizationRepository repository;

  @override
  Future<Response<List<Organization>>> call(FetchManyParams params) async {
    List<Organization> response = [];

    try {
      response = await repository.fetchAll();
    } catch (e) {
      return ErrorResponse(e.toString());
    }

    return SuccessResponse(response);
  }
}

class FetchManyParams extends UseCaseParams {}
