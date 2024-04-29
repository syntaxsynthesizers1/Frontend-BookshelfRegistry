import 'package:book_stack/constants/custom_colors.dart';
import 'package:book_stack/models/old_book_model.dart';
import 'package:book_stack/utils/colors.dart';
import 'package:book_stack/utils/enum.dart';
import 'package:book_stack/utils/spacers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesContainer extends StatelessWidget {
  const CategoriesContainer({
    super.key,
    required this.book,
  });

  final OldBookModel book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: HexColor(book.color).withOpacity(0.28),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
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
              const Expanded(flex: 2, child: SizedBox()),
              Text(
                getCategoryName(BookCategory.values[book.category]),
                // BookCategory.values[book.category].toString().split('.').last,
                // textAlign: Tex,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 22,
                ),
              ),
              const Expanded(flex: 1, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}

class ReverseCategoriesContainer extends StatelessWidget {
  const ReverseCategoriesContainer({
    super.key,
    required this.book,
  });

  final OldBookModel book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: HexColor(book.color).withOpacity(0.28),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Expanded(flex: 1, child: SizedBox()),
              Text(
                getCategoryName(BookCategory.values[book.category]),
                // textAlign: Tex,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 22,
                ),
              ),
              const Expanded(flex: 2, child: SizedBox()),
              Container(
                height: 100,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    book.imageUrl,
                    fit: BoxFit.cover,
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
