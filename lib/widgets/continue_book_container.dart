import 'package:book_stack/constants/custom_colors.dart';
import 'package:book_stack/models/old_book_model.dart';
import 'package:book_stack/screens/dashboard/book_details_screen.dart';
import 'package:book_stack/utils/colors.dart';
import 'package:book_stack/utils/spacers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ContinueBookContainer extends StatelessWidget {
  const ContinueBookContainer({
    super.key,
    required this.book,
  });

  final OldBookModel book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BookDetailsScreen(
              book: book,
              continueReading: true,
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: HexColor(book.color).withOpacity(0.28),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: book.imageUrl,
                    placeholder: (context, url) => Skeletonizer(
                      enabled: true,
                      child: Card(
                        color: HexColor(book.color),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 5,
                                color: Colors.grey.withOpacity(0.3),
                              ),
                              verticalSpacer(5),
                              Container(
                                height: 8,
                                color: Colors.grey.withOpacity(0.1),
                              ),
                              verticalSpacer(5),
                              Container(
                                height: 5,
                                color: Colors.grey.withOpacity(0.3),
                              ),
                              verticalSpacer(5),
                              Container(
                                height: 8,
                                color: Colors.grey.withOpacity(0.1),
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
                  //   book.imageUrl,
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
              horizontalSpacer(20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          book.title,
                          // textAlign: Tex,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                          ),
                        ),
                        verticalSpacer(2),
                      ],
                    ),
                    verticalSpacer(3),
                    Text(
                      "Page ${book.pagesRead} of ${book.pages}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        // fontWeight: FontWeight.w800,
                        fontSize: 10,
                      ),
                    ),
                    verticalSpacer(13),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: CustomColors.whiteColor),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 5,
                                // width: 1.sw - 150,
                                child: LinearProgressIndicator(
                                  value: double.parse(
                                      (book.pagesRead / book.pages)
                                          .toStringAsFixed(2)), // 70% progress
                                  backgroundColor: Colors.grey.withOpacity(0.4),
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    HexColor(book.color),
                                  ),
                                  borderRadius: BorderRadius.circular(5),

                                  minHeight: 7.0, // Minimum height of the line
                                ),
                              ),
                            ),
                            horizontalSpacer(10),
                            Text(
                              "${((book.pagesRead / book.pages * 100).ceil())}%",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                // fontWeight: FontWeight.w800,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
