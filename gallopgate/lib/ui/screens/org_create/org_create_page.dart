import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/ui/screens/org_create/bloc/org_create_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class OrgCreatePage extends StatelessWidget {
  const OrgCreatePage({super.key});

  static const page = MaterialPage(child: OrgCreatePage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrgCreateBloc(
        locator.get(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Organization'),
        ),
        body: const _OrgCreatePage(),
      ),
    );
  }
}

class _OrgCreatePage extends StatelessWidget {
  const _OrgCreatePage();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return BlocListener<OrgCreateBloc, OrgCreateState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        if (state.status == OrgCreateStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green[600],
              content: Text(
                'Organization created successfully',
                style: TextStyle(color: colorScheme.onSurface),
              ),
            ),
          );
          context.go('/home');
        }

        if (state.status == OrgCreateStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: colorScheme.error,
              content: Text(
                'Error: ${state.error}',
                style: TextStyle(color: colorScheme.onError),
              ),
            ),
          );
        }
      },
      child: const Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _OrgNameField(),
                SizedBox(height: 16.0),
                _OrgDescriptionField(),
                SizedBox(height: 16.0),
                _OrgCreateButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OrgNameField extends StatelessWidget {
  const _OrgNameField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: context.watch<OrgCreateBloc>().state.name,
      onChanged: (value) {
        context.read<OrgCreateBloc>().add(OrgCreateOnNameChanged(value));
      },
      decoration: const InputDecoration(
        labelText: 'Name',
        prefixIcon: Icon(Iconsax.tag_2),
      ),
    );
  }
}

class _OrgDescriptionField extends StatelessWidget {
  const _OrgDescriptionField();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      initialValue: context.watch<OrgCreateBloc>().state.description,
      onChanged: (value) {
        context.read<OrgCreateBloc>().add(OrgCreateOnDescriptionChanged(value));
      },
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 16.0,
        ),
        labelText: 'Description',
        hintText: 'Enter a description',
      ),
      maxLines: 7,
      maxLength: 250,
      buildCounter: (
        context, {
        required currentLength,
        required isFocused,
        required maxLength,
      }) {
        return Text(
          '$currentLength/$maxLength',
          style: TextStyle(
            color: currentLength < (maxLength! - 10)
                ? colorScheme.onSurface
                : colorScheme.error,
          ),
        );
      },
    );
  }
}

class _OrgCreateButton extends StatelessWidget {
  const _OrgCreateButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<OrgCreateBloc>().add(const OrgCreateSubmit());
      },
      child: const Text("Submit"),
    );
  }
}
