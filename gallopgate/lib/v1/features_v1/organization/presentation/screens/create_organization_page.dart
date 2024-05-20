import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/v1/common/controllers/cache_bloc/cache_bloc.dart';
import 'package:gallopgate/v1/config/navigation/navigation.dart';
import 'package:gallopgate/v1/features_v1/organization/presentation/controllers/create_organization_cubit/create_organization_cubit.dart';
import 'package:iconsax/iconsax.dart';

class CreateOrganizationPage extends StatelessWidget {
  const CreateOrganizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateOrganizationCubit, CreateOrganizationState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        if (state.status == CreateOrganizationStatus.success) {
          context.read<CacheBloc>().add(const UpdateCacheEvent());
          navigateToHome(context);
        }
      },
      child: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _LogoSelection(),
            SizedBox(height: 16),
            _NameField(),
            SizedBox(height: 16),
            _DescriptionField(),
            SizedBox(height: 16),
            _CountryField(),
            SizedBox(height: 16),
            _CityField(),
            SizedBox(height: 16),
            _StreetField(),
            SizedBox(height: 16),
            _CreateButton(),
          ],
        ),
      ),
    );
  }
}

class _LogoSelection extends StatelessWidget {
  const _LogoSelection();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 48,
          backgroundColor: Colors.transparent,
          child: Icon(Iconsax.house_2),
        ),
        SizedBox(width: 8),
        ElevatedButton(
          onPressed: null,
          child: Text('Select Logo'),
        ),
      ],
    );
  }
}

class _NameField extends StatelessWidget {
  const _NameField();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateOrganizationCubit>();

    return BlocBuilder<CreateOrganizationCubit, CreateOrganizationState>(
      buildWhen: (prev, curr) =>
          prev.organization.name != curr.organization.name ||
          prev.nameError != curr.nameError,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.organization.name,
          onChanged: cubit.nameChanged,
          decoration: InputDecoration(
            prefixIcon: const Icon(Iconsax.house_2),
            labelText: 'Name',
            errorText: state.nameError.isEmpty ? null : state.nameError,
          ),
        );
      },
    );
  }
}

class _DescriptionField extends StatelessWidget {
  const _DescriptionField();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateOrganizationCubit>();

    return BlocBuilder<CreateOrganizationCubit, CreateOrganizationState>(
      buildWhen: (prev, curr) =>
          prev.organization.description != curr.organization.description ||
          prev.descriptionError != curr.descriptionError,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.organization.description,
          onChanged: cubit.descriptionChanged,
          maxLines: 4,
          maxLength: 200,
          buildCounter: (
            context, {
            required currentLength,
            required isFocused,
            required maxLength,
          }) {
            return Text('$currentLength/$maxLength');
          },
          decoration: InputDecoration(
            hintText: 'Description',
            errorText:
                state.descriptionError.isEmpty ? null : state.descriptionError,
          ),
        );
      },
    );
  }
}

class _CountryField extends StatelessWidget {
  const _CountryField();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateOrganizationCubit>();

    return BlocBuilder<CreateOrganizationCubit, CreateOrganizationState>(
      buildWhen: (prev, curr) =>
          prev.organization.country != curr.organization.country ||
          prev.countryError != curr.countryError,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.organization.country,
          onChanged: cubit.countryChanged,
          decoration: InputDecoration(
            prefixIcon: const Icon(Iconsax.global),
            labelText: 'Country',
            errorText: state.countryError.isEmpty ? null : state.countryError,
          ),
        );
      },
    );
  }
}

class _CityField extends StatelessWidget {
  const _CityField();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateOrganizationCubit>();

    return BlocBuilder<CreateOrganizationCubit, CreateOrganizationState>(
      buildWhen: (prev, curr) =>
          prev.organization.city != curr.organization.city ||
          prev.cityError != curr.cityError,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.organization.city,
          onChanged: cubit.cityChanged,
          decoration: InputDecoration(
            prefixIcon: const Icon(Iconsax.map),
            labelText: 'City',
            errorText: state.cityError.isEmpty ? null : state.cityError,
          ),
        );
      },
    );
  }
}

class _StreetField extends StatelessWidget {
  const _StreetField();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateOrganizationCubit>();

    return BlocBuilder<CreateOrganizationCubit, CreateOrganizationState>(
      buildWhen: (prev, curr) =>
          prev.organization.street != curr.organization.street ||
          prev.streetError != curr.streetError,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.organization.street,
          onChanged: cubit.streetChanged,
          decoration: InputDecoration(
            prefixIcon: const Icon(Iconsax.map_1),
            labelText: 'Street',
            errorText: state.streetError.isEmpty ? null : state.streetError,
          ),
        );
      },
    );
  }
}

class _CreateButton extends StatelessWidget {
  const _CreateButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateOrganizationCubit, CreateOrganizationState>(
      buildWhen: (prev, curr) => prev != curr,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _CreationErrorText(),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed:
                  _isValid(state) ? () => _createOrganization(context) : null,
              child: state.status == CreateOrganizationStatus.loading
                  ? const CircularProgressIndicator()
                  : const Text('Create'),
            ),
          ],
        );
      },
    );
  }

  void _createOrganization(BuildContext context) {
    context.read<CreateOrganizationCubit>().create();
  }

  bool _isValid(CreateOrganizationState state) {
    return state.nameError.isEmpty &&
        state.organization.name.isNotEmpty &&
        state.descriptionError.isEmpty &&
        state.organization.description.isNotEmpty &&
        state.countryError.isEmpty &&
        state.organization.country.isNotEmpty &&
        state.cityError.isEmpty &&
        state.organization.city.isNotEmpty &&
        state.streetError.isEmpty;
  }
}

class _CreationErrorText extends StatelessWidget {
  const _CreationErrorText();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<CreateOrganizationCubit, CreateOrganizationState>(
      buildWhen: (prev, curr) => prev.status != curr.status,
      builder: (context, state) {
        return Text(
          state.generalError,
          style: textTheme.labelLarge!.copyWith(
            color: colorScheme.error,
          ),
        );
      },
    );
  }
}
