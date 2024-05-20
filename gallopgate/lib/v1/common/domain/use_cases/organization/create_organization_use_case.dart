import 'package:gallopgate/v1/common/domain/models/organization.dart';
import 'package:gallopgate/v1/common/domain/models/user.dart';
import 'package:gallopgate/v1/common/domain/repositories/organization/organization_repository.dart';
import 'package:gallopgate/v1/common/domain/repositories/user/user_repository.dart';
import 'package:gallopgate/v1/common/domain/use_cases/use_case.dart';
import 'package:gallopgate/v1/resources/enums/role.dart';
import 'package:gallopgate/v1/resources/response/response.dart';

class CreateOrganizationUseCase
    extends UseCase<Organization, CreateOrganizationParams> {
  const CreateOrganizationUseCase(
    OrganizationRepository repository,
    UserRepository userRepository,
  )   : _repository = repository,
        _userRepository = userRepository;

  final OrganizationRepository _repository;
  final UserRepository _userRepository;

  @override
  Future<Response<Organization>> call(CreateOrganizationParams params) async {
    Organization? organization;

    try {
      organization = await _repository.create(params.organization.copyWith(
        creator: params.user.id,
        users: [params.user.id],
      ));

      if (organization == null) throw Exception('Organization not created');

      User? user = params.user.copyWith(organizationId: organization.id);
      user.roles.add(Role.admin);
      user = await _userRepository.updateUser(user);

      if (user == null) throw Exception('User not updated');
    } catch (e) {
      return ErrorResponse(e.toString());
    }

    return SuccessResponse(organization);
  }
}

class CreateOrganizationParams extends UseCaseParams {
  const CreateOrganizationParams(this.user, this.organization);

  final User user;
  final Organization organization;
}
