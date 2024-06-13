import 'package:flutter/material.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/ui/screens/org_create/library.dart';
import 'package:gallopgate/ui/widgets/containers/image_picker_container.dart';
import 'package:gallopgate/ui/widgets/snackbars/snackbar.dart';
import 'package:go_router/go_router.dart';

class OrgCreatePage extends StatelessWidget {
  const OrgCreatePage({super.key});

  static const page = MaterialPage(child: OrgCreatePage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => OrgCreateBloc(
          locator.get(),
        ),
        child: const _Content(),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrgCreateBloc, OrgCreateState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        if (state.status == Status.error) {
          GSnackbar.error(context: context, message: state.error);
        }

        if (state.status == Status.success) {
          GSnackbar.success(
            context: context,
            message: 'Organizatoin ${state.name} created!',
          );

          context.go('/');
        }
      },
      child: const Stack(
        children: [
          CustomScrollView(
            slivers: [
              OrgCreateAppbar(),
              SliverPadding(
                padding: EdgeInsets.all(16.0),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ImagePickerContainer(
                            editable: true,
                          ),
                          SizedBox(width: 16.0),
                          Expanded(
                            child: _TitleField(),
                          )
                        ],
                      ),
                      SizedBox(height: 16.0),
                      _DescriptionField(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
            child: _CreateButton(),
          )
        ],
      ),
    );
  }
}

class _TitleField extends StatelessWidget {
  const _TitleField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OrgCreateBloc>();

    return TitleField(
      initialValue: bloc.state.name,
      onChanged: (v) => bloc.add(OrgCreateOnNameChanged(v)),
    );
  }
}

class _DescriptionField extends StatelessWidget {
  const _DescriptionField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OrgCreateBloc>();
    return DescriptionTextField(
      initialValue: bloc.state.description,
      onChanged: (v) => bloc.add(OrgCreateOnDescriptionChanged(v)),
    );
  }
}

class _CreateButton extends StatelessWidget {
  const _CreateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OrgCreateBloc>();

    return BlocBuilder<OrgCreateBloc, OrgCreateState>(
      buildWhen: (prev, curr) => prev.status != curr.status,
      builder: (context, state) {
        return CreateButton(
          enabled: state.status != Status.loading,
          loading: state.status == Status.loading,
          onPressed: () => bloc.add(const OrgCreateSubmit()),
        );
      },
    );
  }
}
