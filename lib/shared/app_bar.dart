import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:l2_transition/services/auth.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
        child: IconButton(
          color: const Color.fromARGB(255, 205, 205, 205),
          icon: const Icon(FontAwesomeIcons.bars),
          iconSize: 30,
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      backgroundColor: const Color(0xFF003865),
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
        child: Image.asset(
          'assets/image/uofg-logo.jpg',
          scale: 8,
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
          child: IconButton(
            onPressed: () => {
              if (AuthService().user != null)
                {Navigator.pushNamed(context, '/profile')}
              else
                {Navigator.pushNamed(context, '/login')}
            },
            icon: const Icon(FontAwesomeIcons.user),
          ),
        ),
      ],
    );
  }
}
