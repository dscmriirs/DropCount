import 'package:flutter/material.dart';

class appBar extends StatelessWidget with PreferredSizeWidget {
  const appBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      height: 30,
      child: Row(
        children: [Image.asset('assets/images/drop.png')],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
