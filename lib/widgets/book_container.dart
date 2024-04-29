import 'package:book_stack/constants/custom_string.dart';
import 'package:book_stack/models/old_book_model.dart';
import 'package:book_stack/screens/dashboard/book_details_screen.dart';
import 'package:book_stack/utils/colors.dart';
import 'package:book_stack/utils/spacers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BookContainer extends StatelessWidget {
  const BookContainer({
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
            ),
          ),
        );
      },
      child: Container(
        width: (1.sw * 0.38),
        decoration: BoxDecoration(
          color: HexColor(book.color).withOpacity(0.28),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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

                  //  Image.network(
                  //   book.imageUrl,
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
              verticalSpacer(10),
              Text(
                book.title,
                // textAlign: Tex,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                ),
              ),
              verticalSpacer(2),
              Text(
                "by ${book.author}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  // fontWeight: FontWeight.w800,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
