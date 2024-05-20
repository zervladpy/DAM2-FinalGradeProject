import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'organization_details_event.dart';
part 'organization_details_state.dart';

class OrganizationDetailsBloc extends Bloc<OrganizationDetailsEvent, OrganizationDetailsState> {
  OrganizationDetailsBloc() : super(OrganizationDetailsInitial()) {
    on<OrganizationDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
