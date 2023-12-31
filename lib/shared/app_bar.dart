import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:uofg_prepare/services/auth.dart';
import 'package:uofg_prepare/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.transparent,
      backgroundColor: themeBlue,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
        child: Platform.isIOS
            ? Image.asset(
                'assets/image/uofg-logo.jpg',
                scale: 8,
              )
            : SafeArea(
                child: Image.asset('assets/image/uofg-logo.jpg', scale: 11)),
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
