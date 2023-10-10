import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inshort/widgets/sized_box.dart';

class TransitionPage extends StatefulWidget {
  String? image;
  String? title;
  String? content;

  TransitionPage({super.key, required this.title,required this.image,required this.content});

  @override
  State<TransitionPage> createState() => _TransitionPageState();
}

class _TransitionPageState extends State<TransitionPage> {

  @override


  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;

    return Scaffold(
      body:  Stack(
              children: [
                Container(
                  height: height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: height / 2.35,
                        width: width,
                        color: Colors.white,
                        child: Image.network(
                          widget.image??"",
                          fit: BoxFit.fill,
                          frameBuilder:
                              (context, child, frame, wasSynchronouslyLoaded) {
                            return child;
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                      addVerticalSpace(20),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          widget.title??"",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.inter(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          widget.content??"",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w300,overflow: TextOverflow.fade),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  height: height / 1.175,
                  width: width / 8,
                  child: TextButton(
                      onPressed: () {},
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Text(
                          "inshorts",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.grey),
                        ),
                      )),
                ),
              ],
            ),
    );
  }
}
