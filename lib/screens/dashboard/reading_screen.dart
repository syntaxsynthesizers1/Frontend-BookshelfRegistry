// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:book_stack/constants/custom_colors.dart';
import 'package:book_stack/models/episode_model.dart';
import 'package:book_stack/models/old_book_model.dart';
import 'package:book_stack/screens/app_view_model.dart';
import 'package:book_stack/screens/authentication/sign_in/signup_view_model.dart';
import 'package:book_stack/utils/spacers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReadingScreen extends StatefulHookConsumerWidget {
  final OldBookModel book;
  // final String content;
  const ReadingScreen({
    Key? key,
    required this.book,
    // required this.content,
  }) : super(key: key);

  @override
  ConsumerState<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends ConsumerState<ReadingScreen> {
  final double _rating = 0;
  // int startRating = 0;
  @override
  Widget build(BuildContext context) {
    final bookDetailsVM = ref.watch(signupProvider);
    return Scaffold(
      backgroundColor: CustomColors.whiteBgColor,
      body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacer(25),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: Navigator.canPop(context)
                          ? () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            }
                          : null,
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // color: CustomColors.whiteColor,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 5),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              horizontalSpacer(5),
                              const Icon(
                                Icons.arrow_back,
                                size: 13,
                              ),
                              horizontalSpacer(8),
                              Text(
                                "Back  ...",
                                style: TextStyle(
                                    fontSize: 12,
                                    // fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // color: CustomColors.whiteColor,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            horizontalSpacer(8),
                            Text(
                              "Aa",
                              style: TextStyle(
                                  fontSize: 12,
                                  // fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade500),
                            ),
                            horizontalSpacer(15),
                            const Icon(
                              Icons.headphones,
                              size: 13,
                            ),
                            horizontalSpacer(15),
                            const Icon(
                              FontAwesomeIcons.ellipsisVertical,
                              size: 13,
                            ),
                            horizontalSpacer(8),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpacer(40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  episodes[ref.watch(readingPageProvider)].title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: CustomColors.blackBgColor,
                      fontSize: 22),
                ),
              ),
              verticalSpacer(30),
              Expanded(
                  child: SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      episodes[ref.watch(readingPageProvider)].body,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        height: 1.3,
                        color: CustomColors.greyBgColor.withOpacity(0.9),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              )),
              verticalSpacer(20),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  // color: CustomColors.whiteColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 55.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // const Icon(
                      //   FontAwesomeIcons.bookmark,
                      //   size: 22,
                      //   color: Colors.grey,
                      // ),
                      GestureDetector(
                        onTap: () {
                          ref.read(readingPageProvider.notifier).state--;
                        },
                        child: Icon(
                          FontAwesomeIcons.chevronLeft,
                          size: 20,
                          color: CustomColors.mainBlueColor.withOpacity(0.6),
                        ),
                      ),
                      // Icon(
                      //   FontAwesomeIcons.reply,
                      //   size: 20,
                      //   color: CustomColors.mainBlueColor.withOpacity(0.6),
                      // ),
                      // horizontalSpacer(40),
                      Icon(
                        FontAwesomeIcons.camera,
                        size: 22,
                        color: CustomColors.mainBlueColor.withOpacity(0.6),
                      ),
                      // horizontalSpacer(40),
                      GestureDetector(
                        onTap: () {
                          ref.read(readingPageProvider.notifier).state++;
                        },
                        child: Icon(
                          FontAwesomeIcons.checkDouble,
                          size: 22,
                          color: CustomColors.mainBlueColor.withOpacity(0.6),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          int newPage = ((ref.watch(readingPageProvider) / 15) *
                                  (widget.book.pages))
                              .ceil();
                          bookDetailsVM.updateBookPages(
                              widget.book, newPage, ref);
                          if (ref.watch(readingPageProvider) == 15) {
                            showRatingDialog(context);
                          } else if (ref.watch(readingPageProvider) == 16) {
                          } else {
                            ref.read(readingPageProvider.notifier).state++;
                          }
                        },
                        child: Icon(
                          FontAwesomeIcons.chevronRight,
                          size: 20,
                          color: CustomColors.mainBlueColor.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).padding.bottom,
              )
            ],
          )),
    );
  }

  void showRatingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Rate the Book',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  //       Text(
                  //   'Rate the Book',
                  //   style: const TextStyle(
                  //     fontSize: 24.0,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  const SizedBox(height: 20.0),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    IconButton(
                      icon: Icon(
                        Icons.star,
                        color: ref.watch(startRatingProvider) > 0
                            ? Colors.amber
                            : Colors.grey,
                        size: 30.0,
                      ),
                      onPressed: () {
                        setState(() {
                          ref.read(startRatingProvider.notifier).state = 1;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.star,
                        color: ref.watch(startRatingProvider) > 1
                            ? Colors.amber
                            : Colors.grey,
                        size: 30.0,
                      ),
                      onPressed: () {
                        setState(() {
                          ref.read(startRatingProvider.notifier).state = 2;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.star,
                        color: ref.watch(startRatingProvider) > 2
                            ? Colors.amber
                            : Colors.grey,
                        size: 30.0,
                      ),
                      onPressed: () {
                        setState(() {
                          ref.read(startRatingProvider.notifier).state = 3;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.star,
                        color: ref.watch(startRatingProvider) > 3
                            ? Colors.amber
                            : Colors.grey,
                        size: 30.0,
                      ),
                      onPressed: () {
                        setState(() {
                          ref.read(startRatingProvider.notifier).state = 4;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.star,
                        color: ref.watch(startRatingProvider) > 4
                            ? Colors.amber
                            : Colors.grey,
                        size: 30.0,
                      ),
                      onPressed: () {
                        setState(() {
                          ref.read(startRatingProvider.notifier).state = 5;
                        });
                      },
                    ),
                  ]),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Handle the rating submission
                      print('Book rated: $_rating stars');
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}

String chapterOne = '''
Chapter 1: The Beginning

Once upon a time in a land far away, there lived a young adventurer named Lily. She had always dreamed of exploring the mysterious forests beyond her village, filled with magical creatures and hidden treasures.

One sunny morning, Lily decided that today would be the day she set out on her grand adventure. With her trusty map in hand and a heart full of courage, she bid farewell to her family and friends and ventured into the unknown.

As she journeyed deeper into the forest, the trees whispered ancient secrets, and the air shimmered with magic. Little did Lily know, her adventure was about to take a thrilling turn that would change her life forever.

Join Lily on her quest as she discovers the power of friendship, bravery, and the wonders that await in the enchanted forest.

End of Chapter 1.
''';
