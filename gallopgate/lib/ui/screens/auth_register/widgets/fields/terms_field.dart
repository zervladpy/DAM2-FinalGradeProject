import 'package:gallopgate/config/theme/utils/colors.dart';
import 'package:gallopgate/ui/router/router.library.dart';

class TermsField extends StatefulWidget {
  const TermsField({super.key});

  @override
  State<TermsField> createState() => _TermsFieldState();
}

class _TermsFieldState extends State<TermsField> {
  bool value = false;

  void onChanged(bool? value) {
    setState(() {
      this.value = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: GColor.primaryLight,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        const SizedBox(width: 8.0),
        const Text('I agree to the '),
        InkWell(
          child: const Text(
            'Terms of Service',
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
          onTap: () {
            context.push('/auth/terms');
          },
        ),
      ],
    );
  }
}
