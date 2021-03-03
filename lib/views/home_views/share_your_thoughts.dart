import 'package:flutter/material.dart';

class ShareYourThoughts extends StatelessWidget {
  const ShareYourThoughts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            CircleAvatar(
              child: Text('A'),
            ),
            SizedBox(width: 5.0),
            _buildShareYourToughtsBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildShareYourToughtsBody() {
    return Expanded(
      child: Container(
        height: 35.0,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 242, 243, 247),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              print('clicked');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 300.0, child: Text('Share your thoughts...')),
                _buildButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Row(
      children: [
        IconButton(
          splashColor: Colors.transparent,
          splashRadius: 0.1,
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: Icon(Icons.camera_enhance_rounded),
          color: Colors.indigo,
          constraints: BoxConstraints(
            maxWidth: 24.0,
          ),
        ),
        IconButton(
          splashColor: Colors.transparent,
          splashRadius: 0.1,
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: Icon(Icons.emoji_emotions_rounded),
          color: Colors.indigo,
          constraints: BoxConstraints(
            maxWidth: 24.0,
          ),
        ),
      ],
    );
  }
}
