import 'package:book_stack/data/api_config/local_cache.dart';
import 'package:book_stack/locator.dart';
import 'package:book_stack/models/old_book_model.dart';
import 'package:book_stack/screens/app_view_model.dart';
import 'package:book_stack/screens/authentication/sign_in/signup_view_model.dart';
import 'package:book_stack/screens/dashboard/audio_player_screen.dart';
import 'package:book_stack/screens/dashboard/reading_screen.dart';
import 'package:book_stack/screens/onboarding/first_onboarding_page.dart';
import 'package:book_stack/screens/onboarding/second_onboarding_page.dart';
import 'package:book_stack/utils/colors.dart';
import 'package:book_stack/widgets/custom_border_button.dart';
import 'package:book_stack/widgets/custom_button.dart';
import 'package:book_stack/widgets/new_custom_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/custom_colors.dart';
import '../../utils/spacers.dart';

class BookDetailsScreen extends StatefulHookConsumerWidget {
  static const routeName = '/BookDetailsScreen';
  final OldBookModel book;
  final bool continueReading;
  const BookDetailsScreen(
      {super.key, required this.book, this.continueReading = false});

  @override
  ConsumerState<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends ConsumerState<BookDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final bookDetailsVM = ref.watch(signupProvider);
    return Scaffold(
      backgroundColor: CustomColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: SafeArea(
          top: false,
          child: Stack(
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // verticalSpacer(10),
                  // const GetHelpRow(),
                  SizedBox(
                    height: 1.sh * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Positioned.fill(
                              //   child: Image.network(
                              //     widget.book.imageUrl,
                              //     fit: BoxFit.cover,
                              //   ),
                              // ),
                              Container(
                                decoration: BoxDecoration(
                                    color: HexColor(widget.book.color)
                                        .withOpacity(0.28),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(40),
                                    )
                                    // gradient: LinearGradient(
                                    //   colors: [
                                    //     Colors.transparent,
                                    //     Colors.white,
                                    //   ],
                                    //   begin: Alignment.topCenter,
                                    //   end: Alignment.bottomCenter,
                                    // ),
                                    ),
                              ),

                              Column(
                                children: [
                                  verticalSpacer(
                                      MediaQuery.of(context).padding.top + 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () => Navigator.canPop(context)
                                              ? Navigator.pop(context)
                                              : null,
                                          child: const Icon(
                                            Icons.arrow_back,
                                            // size: 13,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.bookmark_outline_sharp,
                                              size: 22,
                                            ),
                                            horizontalSpacer(15),
                                            const Icon(
                                              Icons.share,
                                              size: 22,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  verticalSpacer(20),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: CachedNetworkImage(
                                          imageUrl: widget.book.imageUrl,
                                          placeholder: (context, url) =>
                                              Skeletonizer(
                                            enabled: true,
                                            child: Card(
                                              color:
                                                  HexColor(widget.book.color),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 5,
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                    ),
                                                    verticalSpacer(5),
                                                    Container(
                                                      height: 8,
                                                      color: Colors.grey
                                                          .withOpacity(0.1),
                                                    ),
                                                    verticalSpacer(5),
                                                    Container(
                                                      height: 5,
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                    ),
                                                    verticalSpacer(5),
                                                    Container(
                                                      height: 8,
                                                      color: Colors.grey
                                                          .withOpacity(0.1),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),

                                        // Image.network(
                                        //   widget.book.imageUrl,
                                        //   // fit: BoxFit.cover,
                                        // ),
                                      ),
                                    ),
                                  ),
                                  verticalSpacer(30),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // verticalSpacer(10),
                      ],
                    ),
                  ),

                  verticalSpacer(25),
                  Text(
                    widget.book.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                    ),
                  ),
                  verticalSpacer(2),
                  Text(
                    "by ${widget.book.author}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      // fontWeight: FontWeight.w800,
                      fontSize: 14,
                    ),
                  ),
                  // verticalSpacer(15),

                  verticalSpacer(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                FontAwesomeIcons.bookOpen,
                                size: 12,
                              ),
                              horizontalSpacer(8),
                              Text(
                                widget.book.pages.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const CustomVerticalDivider(),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                FontAwesomeIcons.star,
                                size: 12,
                              ),
                              horizontalSpacer(8),
                              Text(
                                widget.book.rating.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const CustomVerticalDivider(),
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                FontAwesomeIcons.headphones,
                                size: 12,
                              ),
                              horizontalSpacer(8),
                              Text(
                                widget.book.duration.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const CustomVerticalDivider(),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                FontAwesomeIcons.globe,
                                size: 12,
                              ),
                              horizontalSpacer(8),
                              const Text(
                                "ENG",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpacer(30),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Description",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Text(
                        widget.book.description,
                        style: const TextStyle(
                          // fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 10,
                left: 0, // Optional: Specify left position if needed
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: widget.book.isListening
                      ? Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => AudioPlayerScreen(
                                        book: widget.book,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: CustomColors.whiteColor,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey
                                            .withOpacity(0.5), // Shadow color
                                        spreadRadius: 5, // Spread radius
                                        blurRadius: 7, // Blur radius
                                        offset: const Offset(0,
                                            3), // Offset in x and y directions
                                      ),
                                    ],
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Continue Playing",
                                      style: TextStyle(
                                        color: CustomColors.blackColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : widget.book.isReading || widget.continueReading
                          ? Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ReadingScreen(book: widget.book),
                                        ),
                                      );
                                      // var bookDetails = widget.book;
                                      // if (bookDetails.pagesRead == 0) {
                                      //   bookDetailsVM.updateBookPages(
                                      //       widget.book, 1, ref);
                                      //   bookDetails.pagesRead = 1;
                                      // }
                                      // bookDetailsVM.startReading(widget.book, ref);

                                      // await bookDetailsVM
                                      //     .cacheLastRead(bookDetails);
                                      // ref.read(lastReadProvider.notifier).state =
                                      //     locator<LocalCache>().getLastRead();
                                      // Navigator.of(context).push(
                                      //   MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         const ReadingScreen(),
                                      //   ),
                                      // );
                                    },
                                    child: Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: CustomColors.mainBlueColor,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(
                                                0.5), // Shadow color
                                            spreadRadius: 5, // Spread radius
                                            blurRadius: 7, // Blur radius
                                            offset: const Offset(0,
                                                3), // Offset in x and y directions
                                          ),
                                        ],
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Continue Reading",
                                          style: TextStyle(
                                            color: CustomColors.whiteColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async {
                                      var bookDetails = widget.book;
                                      if (bookDetails.pagesRead == 0) {
                                        bookDetailsVM.updateBookPages(
                                            widget.book, 1, ref);
                                        bookDetails.pagesRead = 1;
                                      }
                                      bookDetailsVM.startReading(
                                          widget.book, ref);

                                      await bookDetailsVM
                                          .cacheLastRead(bookDetails);
                                      ref
                                              .read(lastReadProvider.notifier)
                                              .state =
                                          locator<LocalCache>().getLastRead();
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ReadingScreen(book: widget.book),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: CustomColors.mainBlueColor,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(
                                                0.5), // Shadow color
                                            spreadRadius: 5, // Spread radius
                                            blurRadius: 7, // Blur radius
                                            offset: const Offset(0,
                                                3), // Offset in x and y directions
                                          ),
                                        ],
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Read",
                                          style: TextStyle(
                                            color: CustomColors.whiteColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                horizontalSpacer(20),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async {
                                      var bookDetails = widget.book;
                                      if (bookDetails.pagesRead == 0) {
                                        bookDetailsVM.updateBookPages(
                                            widget.book, 1, ref);
                                        bookDetails.pagesRead = 1;
                                      }
                                      bookDetailsVM.startListening(
                                          widget.book, ref);

                                      await bookDetailsVM
                                          .cacheLastRead(bookDetails);
                                      ref
                                              .read(lastReadProvider.notifier)
                                              .state =
                                          locator<LocalCache>().getLastRead();
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AudioPlayerScreen(
                                            book: widget.book,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: CustomColors.whiteColor,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(
                                                0.5), // Shadow color
                                            spreadRadius: 5, // Spread radius
                                            blurRadius: 7, // Blur radius
                                            offset: const Offset(0,
                                                3), // Offset in x and y directions
                                          ),
                                        ],
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Play",
                                          style: TextStyle(
                                            color: CustomColors.blackColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 20,
      decoration: const BoxDecoration(color: CustomColors.activeIndicatorColor),
    );
  }
}
