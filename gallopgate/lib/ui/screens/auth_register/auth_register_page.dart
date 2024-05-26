import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/ui/screens/auth_register/bloc/register_bloc.dart';

class AuthRegisterPage extends StatelessWidget {
  const AuthRegisterPage({super.key});

  static const page = MaterialPage(child: AuthRegisterPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(locator.get()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
        ),
        body: const _AuthRegisterPage(),
      ),
    );
  }
}

class _AuthRegisterPage extends StatelessWidget {
  const _AuthRegisterPage();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _EmailField(),
              SizedBox(height: 16.0),
              _PasswordField(),
              SizedBox(height: 16.0),
              _RepeatPasswordField(),
              SizedBox(height: 16.0),
              _AcceptTermsField(),
              SizedBox(height: 16.0),
              _RegisterButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    void onChanged(String value) {
      context.read<RegisterBloc>().add(RegisterEmailChanged(value));
    }

    return TextFormField(
      initialValue: context.watch<RegisterBloc>().state.email,
      onChanged: onChanged,
      decoration: const InputDecoration(
        labelText: 'Email',
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    void onChanged(String value) {
      context.read<RegisterBloc>().add(RegisterPasswordChanged(value));
    }

    void onShowPassword() {
      final newValue = !context.read<RegisterBloc>().state.showPassword;

      context.read<RegisterBloc>().add(RegisterShowPasswordChanged(newValue));
    }

    return TextFormField(
      initialValue: context.watch<RegisterBloc>().state.password,
      obscureText: !context.watch<RegisterBloc>().state.showPassword,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: IconButton(
          onPressed: onShowPassword,
          icon: const Icon(Icons.visibility),
        ),
      ),
    );
  }
}

class _RepeatPasswordField extends StatelessWidget {
  const _RepeatPasswordField();

  @override
  Widget build(BuildContext context) {
    void onChanged(String value) {
      context.read<RegisterBloc>().add(RegisterRepeatPasswordChanged(value));
    }

    void onShowPassword() {
      final newValue = !context.read<RegisterBloc>().state.showPassword;

      context.read<RegisterBloc>().add(RegisterShowPasswordChanged(newValue));
    }

    return TextFormField(
      initialValue: context.watch<RegisterBloc>().state.repeatPassword,
      obscureText: !context.watch<RegisterBloc>().state.showPassword,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: 'Repeat Password',
        suffixIcon: IconButton(
          onPressed: onShowPassword,
          icon: const Icon(Icons.visibility),
        ),
      ),
    );
  }
}

class _AcceptTermsField extends StatelessWidget {
  const _AcceptTermsField();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox.adaptive(
          value: context.watch<RegisterBloc>().state.acceptTerms,
          onChanged: (value) {
            context
                .read<RegisterBloc>()
                .add(RegisterAcceptTermsChanged(value ?? false));
          },
        ),
        const Text(
          "Accept termas and conditions",
        ),
      ],
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            context.read<RegisterBloc>().add(const RegisterSubmitted());
          },
          child: const Text('Register'),
        );
      },
    );
  }
}
