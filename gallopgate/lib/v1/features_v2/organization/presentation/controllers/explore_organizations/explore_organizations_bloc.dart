import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'explore_organizations_event.dart';
part 'explore_organizations_state.dart';

class ExploreOrganizationsBloc extends Bloc<ExploreOrganizationsEvent, ExploreOrganizationsState> {
  ExploreOrganizationsBloc() : super(ExploreOrganizationsInitial()) {
    on<ExploreOrganizationsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
