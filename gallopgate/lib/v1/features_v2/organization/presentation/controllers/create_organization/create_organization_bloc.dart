import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_organization_event.dart';
part 'create_organization_state.dart';

class CreateOrganizationBloc extends Bloc<CreateOrganizationEvent, CreateOrganizationState> {
  CreateOrganizationBloc() : super(CreateOrganizationInitial()) {
    on<CreateOrganizationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
