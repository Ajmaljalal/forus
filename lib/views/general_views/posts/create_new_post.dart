import 'package:flutter/material.dart';
import 'package:forus/data_models/models.dart';
import 'package:forus/widgets/circled_button.dart';
import 'package:forus/widgets/profile_avatar.dart';
import 'package:forus/widgets/responsive.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))
          : null,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Speak out loud with proud!',
                        prefixIcon: Icon(Icons.speaker),
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          height: 1.4,
                        )),
                  ),
                ),
                Container(
                  height: 40.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleButton(
                        icon: Icons.photo_library_outlined,
                        iconSize: 18.0,
                        color: Colors.indigo,
                        onPressed: () {},
                      ),
                      CircleButton(
                        icon: Icons.play_circle_outline,
                        iconSize: 18.0,
                        onPressed: () {},
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
