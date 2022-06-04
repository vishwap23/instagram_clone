import 'package:flutter/material.dart';
import 'package:instagram/model/user.dart';
import 'package:instagram/providers/user_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CommentCard extends StatefulWidget {
  final snap;

  const CommentCard({Key? key, required this.snap}) : super(key: key);

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(widget.snap['profilePic']),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: widget.snap['username'],
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: ' ${widget.snap['text']}',
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ])),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 4,
                    ),
                    child: Text(
                      "",
                      // DateFormat.yMMMd(widget.snap['datePublished'].toDate())
                      //     .toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.favorite),
          )
        ],
      ),
    );
  }
}
//    SOFT SKILLS	    TECHNICAL SKILLS
//
// •	Good Listener	    •	C , Java ,Python
// •	Self motivated	   •	PHP
// •	Strong Work Ethic     	                •	HTML , CSS , Java Script
// •	Team Player	•	Android
