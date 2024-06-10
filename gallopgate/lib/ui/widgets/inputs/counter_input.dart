import 'package:flutter/material.dart';
import 'package:gallopgate/ui/widgets/buttons/g_icon_button.dart';
import 'package:iconsax/iconsax.dart';

class CounterInputField extends StatelessWidget {
  const CounterInputField({
    super.key,
    this.value = '0',
    this.onChange,
    this.onIncrement,
    this.onDecrement,
    this.width = 130,
    this.height = 40,
  });

  final String value;
  final Function(String)? onChange;
  final Function()? onIncrement;
  final Function()? onDecrement;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GIconButton.filled(icon: Iconsax.minus, onPressed: onDecrement),
          const SizedBox(width: 16),
          Expanded(child: Center(child: Text(value))),
          const SizedBox(width: 16),
          GIconButton.filled(icon: Iconsax.add, onPressed: onIncrement)
        ],
      ),
    );
  }
}
