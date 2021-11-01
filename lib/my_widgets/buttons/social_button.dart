import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vangard_app/extensions/ui_extension.dart';

class SocialButton extends StatelessWidget {
  final Function()? onTap;
  final Color? color;
  final String? title;
  final Widget? icon;
  final String? image;
  const SocialButton(
      {Key? key,
      required this.onTap,
      this.color,
      this.title,
      this.icon,
      this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Colors.blue,
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.grey,
        borderRadius: BorderRadius.circular(30),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: context.lowPadding * 0.08,
              child: image != null
                  ? Image.asset(
                      "assets/image/$image",
                      height: context.lowHeight,
                      fit: BoxFit.cover,
                    )
                  : icon,
            ),
            Center(
              child: Padding(
                padding: context.lowHorPadding / 1,
                child: Text(
                  title ?? "Button",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
