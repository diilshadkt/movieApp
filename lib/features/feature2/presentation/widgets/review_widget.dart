import 'package:flutter/material.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 200,
              color: Colors.grey,
            );
          },
        );
      },
      child: Container(
        height: 60,
        width: MediaQuery.sizeOf(context).width,
        color: Colors.grey,
      ),
    );
  }
}
