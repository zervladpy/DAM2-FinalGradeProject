import 'package:flutter/material.dart';
import 'package:gallopgate/common/utils/date_utils.dart';
import 'package:gallopgate/config/extensions/context.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';
import 'package:iconsax/iconsax.dart';

class DateField extends StatelessWidget {
  const DateField({
    super.key,
    this.initialValue,
    this.editable = false,
    this.label,
    this.onChanged,
  });

  final String? label;
  final DateTime? initialValue;
  final bool editable;
  final void Function(DateTime)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          GestureDetector(
            onTap: editable ? () => _selectDate(context) : null,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: editable
                      ? GColor.primaryLight.withOpacity(0.5)
                      : Colors.grey,
                ),
              ),
              child: Row(
                children: [
                  const Icon(Iconsax.calendar_1),
                  const Spacer(),
                  Text(
                    initialValue == null
                        ? editable
                            ? 'Select Date'
                            : ''
                        : GDateUtils.formatDateToString(initialValue!),
                    style: context.textTheme.bodyLarge,
                  )
                ],
              ),
            ),
          ),
          if (label != null)
            Positioned(
              top: -7,
              left: 5,
              child: ColoredBox(
                color: GColor.surfaceLight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 3.0, right: 4.0),
                  child: Text(
                    label!,
                    style: context.textTheme.labelMedium,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      currentDate: now,
      initialDate: initialValue ?? now,
      firstDate: DateTime(now.year - 100),
      lastDate: DateTime(now.year + 100),
    );
    if (picked != null && picked != initialValue) {
      onChanged?.call(picked);
    }
  }
}
