import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:vangard_app/extensions/ui_extension.dart';
import 'package:vangard_app/models/post_model.dart';
import 'package:vangard_app/my_widgets/page_extension/posts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _completer = Completer<void>();
  Future<void> _getMethod() async =>
      await Future.delayed(const Duration(seconds: 3), () {
        if (!_completer.isCompleted) _completer.complete();
      });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            RefreshIndicator(
              color: HexColor("000000"),
              backgroundColor: HexColor("FFFFFF"),
              displacement: 90,
              edgeOffset: 1.5,
              onRefresh: () async {
                await _getMethod();

                return _completer.future;
              },
              child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: index == 0
                          ? const EdgeInsets.only(top: 70.0)
                          : EdgeInsets.zero,
                      child: PostCard(posts[index]),
                    );
                  }),
            ),
            buildFloatingSearchBar()
          ],
        ),
      ),
    );
  }

  Widget buildFloatingSearchBar() {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
        hint: "Search...",
        height: context.normalHeight / 2.5,
        scrollPadding: const EdgeInsets.only(top: 1, bottom: 56),
        transitionDuration: const Duration(milliseconds: 300),
        transitionCurve: Curves.easeIn,
        physics: const BouncingScrollPhysics(),
        axisAlignment: isPortrait ? 0.0 : -1.0,
        openAxisAlignment: 0.0,
        width: isPortrait ? 600 : 500,
        debounceDelay: const Duration(milliseconds: 500),
        borderRadius: BorderRadius.circular(35),
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        border: const BorderSide(width: 1),
        margins: context.lowSymAllPadding / 1.1,
        onQueryChanged: (query) {
          // Call your model, bloc, controller here.
        },
        transition: CircularFloatingSearchBarTransition(),
        actions: [
          FloatingSearchBarAction(
            showIfOpened: false,
            child: CircularButton(
                icon: const Icon(Icons.search), onPressed: () {}),
          ),
          FloatingSearchBarAction.searchToClear(
            showIfClosed: false,
          ),
        ],
        builder: (context, transition) {
          return Column(
            children: posts.map((data) {
              return PostCard(data);
            }).toList(),
          );
        });
  }
}

List<Post> posts = [
  Post(
    id: "azazell",
    profileimage: "A",
    longid: "Azazel",
    posttext: "Hello, it's my first post.",
    image: 'assets/image/canta.jpg',
    imagecontent:
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
  ),
  Post(
    id: "ophelia",
    profileimage: "O",
    longid: "Ophelia Vonner",
    posttext:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vulputate tincidunt dignissim.",
    image: 'assets/image/saat.jpg',
    imagecontent:
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
  ),
  Post(
    id: "lucia",
    profileimage: "L",
    longid: "Lucia Frost",
    posttext:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vulputate tincidunt dignissim."
        "Duis tincidunt risus velit, eget consequat velit bibendum lobortis.",
    image: 'assets/image/combine01.jpg',
    imagecontent:
        "If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
  ),
  Post(
    id: "Nina",
    profileimage: "N",
    longid: "Nina Natas",
    posttext:
        "Duis tincidunt risus velit, eget consequat velit bibendum lobortis."
        "Etiam eget malesuada leo. Curabitur eget nunc ac leo bibendum fermentum.",
    image: 'assets/image/combine02.jpg',
    imagecontent:
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
  ),
  Post(
    id: "Hermia",
    profileimage: "H",
    longid: "Hermia Wyrm",
    posttext:
        "Etiam eget malesuada leo. Curabitur eget nunc ac leo bibendum fermentum.",
    image: 'assets/image/combine03.jpg',
    imagecontent:
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
  ),
];

//Text("Home Page",;
//style: Theme.of(context).textTheme.headline6!.copyWith(
//    fontWeight: FontWeight.bold, color: Colors.black)),
