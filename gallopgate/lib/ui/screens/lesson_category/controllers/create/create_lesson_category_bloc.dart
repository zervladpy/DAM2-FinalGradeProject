import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/models/lesson_category/lesson_category.dart';
import 'package:gallopgate/models/organization/organization.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:gallopgate/repositories/lesson_category_repository.dart';

part 'create_lesson_category_event.dart';
part 'create_lesson_category_state.dart';

class CreateLessonCategoryBloc
    extends Bloc<CreateLessonCategoryEvent, CreateLessonCategoryState> {
  final LessonCategoryRepository _repository;

  CreateLessonCategoryBloc({
    required LessonCategoryRepository repository,
  })  : _repository = repository,
        super(CreateLessonCategoryState.initial()) {
    on<Initialize>(_initialize);
    on<TitleChaged>(_titleChaged);
    on<DescriptionChanged>(_descriptionChanged);
    on<Submit>(_submit);
  }

  void _initialize(Initialize event, Emitter<CreateLessonCategoryState> emit) {
    emit(state.copyWith(
      category: state.category.copyWith(
        creatorId: event.creator.id,
        organizationId: event.organization.id,
      ),
    ));
  }

  void _titleChaged(
      TitleChaged event, Emitter<CreateLessonCategoryState> emit) {
    emit(state.copyWith(
      category: state.category.copyWith(title: event.title),
    ));
  }

  void _descriptionChanged(
      DescriptionChanged event, Emitter<CreateLessonCategoryState> emit) {
    emit(state.copyWith(
      category: state.category.copyWith(description: event.description),
    ));
  }

  void _submit(
    Submit event,
    Emitter<CreateLessonCategoryState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final category = await _repository.create(state.category);

      emit(state.copyWith(
        category: category,
        status: Status.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: Status.error,
        error: e.toString(),
      ));
    }

    emit(state.copyWith(status: Status.initial, error: ''));
  }
}
