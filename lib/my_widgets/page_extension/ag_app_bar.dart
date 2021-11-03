import 'package:flutter/material.dart';
import 'package:vangard_app/pages/view/login_page.dart';

class AGAppBar extends AppBar {
  final String titlee;

  AGAppBar({Key? key, required this.titlee})
      : super(
          key: key,
          leading: _BackButton(),
          automaticallyImplyLeading: false,
          title: _Title(titlee),
          centerTitle: true,
        );
}

class _Title extends StatelessWidget {
  final String title;
  const _Title(this.title);
  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: Theme.of(context).textTheme.headline5!.copyWith(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20));
  }
}

class _BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (Route<dynamic> route) => false),
      icon: const Icon(Icons.arrow_back_ios),
    );
  }
}
