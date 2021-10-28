import 'package:flutter/material.dart';
import 'package:vangard_app/pages/view/open_post_view/open_post.dart';

class ImageContentScrollBar extends StatelessWidget {
  const ImageContentScrollBar({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final OpenPost widget;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      radius: const Radius.circular(20),
      isAlwaysShown: true,
      child: postListView(context),
    );
  }

  ListView postListView(BuildContext context) {
    return ListView(
      shrinkWrap: false,
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Text(widget.data.imagecontent ?? "",
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400)),
        ),
      ],
    );
  }
}