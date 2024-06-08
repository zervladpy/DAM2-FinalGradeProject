import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ImagePickerContainer extends StatelessWidget {
  const ImagePickerContainer({
    super.key,
    this.onSelect,
    this.height = 100.0,
    this.width = 100.0,
    this.imageUrl,
  });

  final String? imageUrl;
  final void Function()? onSelect;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onSelect,
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: imageUrl != null
                  ? DecorationImage(
                      image: NetworkImage(imageUrl!),
                      fit: BoxFit.cover,
                    )
                  : null,
              color: imageUrl == null ? Colors.grey[200] : null,
            ),
          ),
        ),
        const Positioned(
          bottom: 5.0,
          right: 5.0,
          child: Icon(Iconsax.edit_2),
        )
      ],
    );
  }
}
