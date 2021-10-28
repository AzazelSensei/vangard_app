// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:readmore/readmore.dart';
import 'package:vangard_app/models/comment_model.dart';
import 'package:vangard_app/models/post_model.dart';
import 'package:vangard_app/pages/view/open_post_view/comment_card.dart';
import 'package:vangard_app/pages/view/open_post_view/image_content_scrollbar.dart';

class OpenPost extends StatefulWidget {
  final Post data;
  // ignore: use_key_in_widget_constructors
  OpenPost(this.data);
  @override
  _OpenPostState createState() => _OpenPostState();
}

class _OpenPostState extends State<OpenPost> {
  bool selected_fav = true;
  bool selected_book = true;
  bool selected_fav2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: aGappBar(context),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                //üst bar //icon-name kısmı
                const Divider(
                  height: 0,
                  color: Colors.black45,
                  thickness: 1,
                ), //divider-üst
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: Column(
                              children: [
                                imageZone,
                                clickableStoreText,
                                underImageHereIcon,
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: ImageContentScrollBar(widget: widget),
                        ),
                      ],
                    ),
                  ),
                ), //resim
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Divider(
                    height: 0,
                    color: Colors.black45,
                    thickness: 1,
                  ),
                ), //divider-alt
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      aGLikeButton,
                      aGPostText(context), //text
                      aGBookmarkIcon,
                    ],
                  ), //gönderi alt bar
                ),
                const Divider(
                  color: Colors.black54,
                  thickness: 1,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      return CommentCard(comments[index]);
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded get imageZone => Expanded(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
            image: AssetImage(widget.data.image ??
                'assets/image/googleicon.png'), //'assets/image/canta.jpg'
            fit: BoxFit.fitHeight,
          ),
        ),
      );
  TextButton get clickableStoreText => TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.black12),
          shape: MaterialStateProperty.all(const StadiumBorder()),
        ),
        onPressed: () {},
        child: RichText(
          text: const TextSpan(
              text: 'Store : Helium',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
        ),
      );
  Center get underImageHereIcon => Center(
        child: Column(
          children: [
            const Icon(Icons.location_on_outlined),
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.black12),
                shape: MaterialStateProperty.all(const StadiumBorder()),
              ),
              onPressed: () {},
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Click for Detail',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  Expanded get aGLikeButton => Expanded(
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
  Expanded aGPostText(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        child: ReadMoreText(
          widget.data.posttext ?? "Null",
          trimLines: 2,
          colorClickableText: HexColor("9962DB"),
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Read More',
          trimExpandedText: ' Collapse ',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      flex: 8,
    );
  }

  Expanded get aGBookmarkIcon => Expanded(
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
  AppBar aGappBar(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: HexColor("F3EDF2"), //const Color(0xff9962DB),
        leading: const CloseButton(color: Colors.black),
        title: Row(
          children: [
            Expanded(
              child: CircleAvatar(
                  child: Text(widget.data.profileimage ?? "A"),
                  backgroundColor: Colors.black45),
              flex: 1,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.data.longid ?? "null",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    Text(widget.data.id ?? "null",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              flex: 7,
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.visibility,
              color: Colors.black54,
              size: 28,
            ),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('153')));
            },
          ),
        ]);
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

  List<MyComment> comments = [
    MyComment(
      profileimage: "A",
      longid: "Azazel",
      commenttext: "Hello, it's my first comment.",
    ),
    MyComment(
      profileimage: "O",
      longid: "Ophelia Vonner",
      commenttext:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi imperdiet lacus id congue faucibus. Aliquam porttitor laoreet augue et varius.",
    ),
    MyComment(
      profileimage: "L",
      longid: "Lucia Frost",
      commenttext:
          "Aenean luctus est vitae nulla laoreet mollis vel non sapien.",
    ),
    MyComment(
      profileimage: "N",
      longid: "Nina Natas",
      commenttext:
          "Integer id leo quis augue varius congue sit amet quis turpis. ",
    ),
    MyComment(
      profileimage: "H",
      longid: "Hermia Wyrm",
      commenttext:
          "Quisque eleifend venenatis lacus in suscipit. Vivamus suscipit vehicula dui vel interdum.",
    ),
    MyComment(
      profileimage: "N",
      longid: "Natalie",
      commenttext:
          "Etiam congue, neque eget fringilla ullamcorper, massa ligula porta libero, sit amet luctus dolor leo vel augue. ",
    ),
    MyComment(
      profileimage: "N",
      longid: "Norman",
      commenttext:
          "Donec mi dolor, imperdiet sollicitudin turpis in, laoreet ultrices ipsum. Nullam quis pellentesque nisl.",
    ),
  ];
}
