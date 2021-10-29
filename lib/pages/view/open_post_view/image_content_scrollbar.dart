import 'package:flutter/material.dart';
import 'package:vangard_app/pages/view/open_post_view/open_post.dart';

class ImageContentScrollBar extends StatelessWidget {
  ImageContentScrollBar({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final OpenPost widget;
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      radius: const Radius.circular(20),
      isAlwaysShown: true,
      controller: scrollController,
      child: postListView(context),
    );
  }

  ListView postListView(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      controller: scrollController,
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
