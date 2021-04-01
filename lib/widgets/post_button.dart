import 'package:flutter/material.dart';

class PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function() onTap;

  const PostButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      hoverColor: Colors.white,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        // height: 25.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 3.0),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
