import 'package:flutter/material.dart';

class SeeMoreWidget extends StatefulWidget {
  final String text;
  const SeeMoreWidget({super.key, required this.text});

  @override
  State<SeeMoreWidget> createState() => _SeeMoreWidgetState();
}

class _SeeMoreWidgetState extends State<SeeMoreWidget> {
  late String firstHalf;
  late String secondHalf;
  bool flag = true;

  @override
  void initState() {
    // super.initState();
    if (widget.text.length > 150) {
      firstHalf = widget.text.substring(0, 150);
      secondHalf = widget.text.substring(150, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        child: secondHalf.isEmpty
            ? Text(
                firstHalf,
              )
            : Column(
                children: <Widget>[
                  Text(
                    flag ? (firstHalf + "...") : (firstHalf + secondHalf),
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white60),
                  ),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          flag ? "see more" : "see less",
                          style: TextStyle(color: Colors.blue),
                        )
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        flag = !flag;
                      });
                    },
                  )
                ],
              ),
      ),
    );
  }
}
