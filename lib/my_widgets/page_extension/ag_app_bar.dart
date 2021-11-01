import 'package:flutter/material.dart';
import 'package:vangard_app/pages/view/login_page.dart';

class AGAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AGAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage())),
        icon: const Icon(Icons.arrow_back_ios),
      ),
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline5!.copyWith(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
