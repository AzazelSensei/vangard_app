// ignore_for_file: non_constant_identifier_names, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:vangard_app/models/comment_model.dart';

class CommentCard extends StatefulWidget {
  final MyComment data;
  CommentCard(this.data, {Key? key}) : super(key: key);

  @override
  _CommentCardState createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  bool selected_fav2 = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () => setState(() => selected_fav2 = !selected_fav2),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            widget.data.profileimage ?? "null",
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.grey,
        ),
        title: Text(
          widget.data.longid ?? "null",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
        ),
        subtitle: Text(
          widget.data.commenttext ?? "null",
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.black, fontSize: 15),
        ),
        trailing: IconButton(
          onPressed: () {
            setState(() {
              selected_fav2 = !selected_fav2;
            });
          },
          icon: Icon(
            selected_fav2 ? Icons.favorite_border_rounded : Icons.favorite,
            color: selected_fav2 ? null : Colors.red,
            size: 25,
          ),
        ),
      ),
    );
  }
}
