import 'package:flutter/material.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({
    Key? key,
    required this.title,
    this.trailing,
    this.onPressed,
  }) : super(key: key);
  final String title;
  final String? trailing;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        const Spacer(),
        trailing == null
            ? const SizedBox.shrink()
            : TextButton(
                onPressed: onPressed,
                child: Text(
                  trailing ?? "See All",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(4.0),
                ),
              ),
      ],
    );
  }
}
