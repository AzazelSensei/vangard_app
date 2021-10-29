import 'package:vangard_app/extensions/ui_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:readmore/readmore.dart';
import 'package:vangard_app/models/post_model.dart';
import 'package:vangard_app/pages/view/open_post_view/open_post.dart';

class PostCard extends StatefulWidget {
  final Post data;
  const PostCard(this.data, {Key? key}) : super(key: key);

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  // ignore: non_constant_identifier_names
  bool selected_fav = true;
  // ignore: non_constant_identifier_names
  bool selected_book = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.lowPadding * 0.21,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(1, 7))
          ],
          color: HexColor("F3EDF2"),
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            postUpperArea(context),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Divider(
                height: 0,
                color: Colors.black45,
                thickness: 1,
              ),
            ),
            image(context),
            dividers(),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  favIcon(),
                  commentIcon(),
                  readMoreTextStyle(context),
                  bookmarkIcon(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row postUpperArea(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CircleAvatar(
              child: Text(widget.data.profileimage ?? "A"),
              backgroundColor: Colors.black45),
          flex: 1,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.data.longid ?? "null",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
              Text(widget.data.id ?? "null",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          flex: 6,
        ),
      ],
    );
  }

  Row image(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OpenPost(widget.data)),
              );
            },
            onDoubleTap: () {
              setState(() {
                selected_fav = !selected_fav;
              });
            },
            child: Image(
              image: AssetImage(widget.data.image ??
                  'assets/image/googleicon.png'), //'assets/image/canta.jpg'
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Padding dividers() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Divider(
        height: 0,
        color: Colors.black54,
        thickness: 1,
      ),
    );
  }

  Expanded favIcon() {
    return Expanded(
      child: IconButton(
        onPressed: () {
          setState(() {
            selected_fav = !selected_fav;
          });
        },
        icon: Icon(
          selected_fav ? Icons.favorite_border_rounded : Icons.favorite,
          color: selected_fav ? null : Colors.red,
          size: 30,
        ),
      ),
      flex: 1,
    );
  }

  Expanded commentIcon() {
    return Expanded(
      child: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OpenPost(widget.data)),
          );
        },
        // ignore: prefer_const_constructors
        icon: Icon(
          Icons.mode_comment_outlined,
          size: 28,
        ),
      ),
      flex: 1,
    );
  }

  Expanded readMoreTextStyle(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 8, 5, 5),
        child: ReadMoreText(
          widget.data.posttext ?? "Null",
          trimLines: 2,
          colorClickableText: HexColor("9962DB"),
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Read More',
          trimExpandedText: ' Collapse ',
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      flex: 8,
    );
  }

  Expanded bookmarkIcon() {
    return Expanded(
      child: IconButton(
        onPressed: () {
          setState(() {
            selected_book = !selected_book;
          });
        },
        icon: Icon(
          selected_book ? Icons.bookmark_border_rounded : Icons.bookmark,
          size: 30,
        ),
      ),
      flex: 1,
    );
  }
}
