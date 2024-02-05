import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/features/feature2/presentation/pages/search_page.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 10.80,
      width: MediaQuery.sizeOf(context).width / 1,
      color: Colors.grey,
      child: BottomNavigationBar(
          iconSize: 22,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    context.go("/");
                  },
                  icon: Icon(
                    Icons.home_outlined,
                    color: Colors.black,
                  )),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    context.push(SearchPage.routePath);
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  )),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    context.push("/favouritePage");
                  },
                  icon: Icon(
                    Icons.favorite_outline,
                    color: Colors.black,
                  )),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person_outlined,
                    color: Colors.black,
                  )),
              label: '',
            ),
          ]),
    );
  }
}
