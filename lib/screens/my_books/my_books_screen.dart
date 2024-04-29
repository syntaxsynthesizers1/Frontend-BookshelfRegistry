import 'package:book_stack/constants/custom_colors.dart';
import 'package:book_stack/constants/custom_string.dart';
import 'package:book_stack/models/old_book_model.dart';
import 'package:book_stack/screens/app_view_model.dart';
import 'package:book_stack/utils/colors.dart';
import 'package:book_stack/utils/enum.dart';
import 'package:book_stack/utils/spacers.dart';
import 'package:book_stack/widgets/book_container.dart';
import 'package:book_stack/widgets/categories_container.dart';
import 'package:book_stack/widgets/continue_book_container.dart';
import 'package:book_stack/widgets/custom_appbar.dart';
import 'package:book_stack/widgets/custom_textfield.dart';
import 'package:book_stack/widgets/empty_list_widget.dart';
import 'package:book_stack/widgets/my_books_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyBooksScreen extends StatefulHookConsumerWidget {
  const MyBooksScreen({
    super.key,
  });

  @override
  ConsumerState<MyBooksScreen> createState() => _MyBooksScreenState();
}

class _MyBooksScreenState extends ConsumerState<MyBooksScreen>
    with SingleTickerProviderStateMixin {
  List<String> filters = ["All"];
  // List<BookModel> searchList = initializeBookModels();
  //  List<BookModel> searchList = [];
  List<OldBookModel> productData = initializeBookModels();
  List<OldBookModel> searchList = initializeBookModels()
      .where((element) => element.category == BookCategory.fantasy.index)
      .toList();
  late TabController _tabController;
  int selectedIndex = 0;
  bool showAmount = true;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpacer(10),
            const Row(
              children: [
                Text(
                  "My Bookshelf",
                  style: TextStyle(
                    color: CustomColors.mainBlueColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpacer(15),
                  // searchCustomTextField("search",
                  //     hintText: "Search book title or author",
                  //     readOnly: true,
                  //     suffix: Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.only(right: 10.0),
                  //           child: Container(
                  //             decoration: const BoxDecoration(
                  //                 color: CustomColors.deepMainBlueColor,
                  //                 shape: BoxShape.circle
                  //                 // borderRadius: BorderRadius.circular(10),
                  //                 ),
                  //             child: Padding(
                  //               padding: const EdgeInsets.all(10.0),
                  //               child: SvgPicture.asset(
                  //                 ConstantString.searchIcon,
                  //                 color: CustomColors.whiteColor,
                  //                 height: 16,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     )),
                  // verticalSpacer(25),
                  // const Text(
                  //   "Categories",
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.w800,
                  //     fontSize: 22,
                  //   ),
                  // ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 1,
                        itemBuilder: (content, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  // setState(() {
                                  //   selectedIndex = index;
                                  //   if ((filters[index]).toLowerCase() ==
                                  //       "all") {
                                  //     searchList = productData;
                                  //     setState(() {});
                                  //   } else {
                                  //     searchList = productData
                                  //         .where((element) =>
                                  //             element.category ==
                                  //             BookCategory.fantasy.index)
                                  //         .toList();
                                  //     setState(() {});
                                  //   }
                                  // });
                                },
                                child: Container(
                                  constraints:
                                      const BoxConstraints(minWidth: 71),
                                  height: 28,
                                  // width: 71,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: selectedIndex == index
                                        ? CustomColors.mainBlueColor
                                            .withOpacity(0.8)
                                        : CustomColors.whiteColor,
                                    // border: Border.all(
                                    //   color: CustomColors.searchBorderColor,
                                    // )
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        filters[index],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: selectedIndex == index
                                              ? CustomColors.whiteColor
                                              : CustomColors.greyTextColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  verticalSpacer(15),
                  ref
                          .watch(bookModelsProvider)
                          .where((element) => element.isReading == true)
                          .toList()
                          .isEmpty
                      ? const EmptyListWidgetView(
                          subtitle:
                              "You have not started any book at the moment. Explore our massive library of books",
                          bottomPdding: 30,
                        )
                      : Expanded(
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: ref
                                  .watch(bookModelsProvider)
                                  .where((element) => element.isReading == true)
                                  .toList()
                                  .length,
                              itemBuilder: (context, index) {
                                List<OldBookModel> books1 = ref
                                    .watch(bookModelsProvider)
                                    .where(
                                        (element) => element.isReading == true)
                                    .toList();
                                return MyBooksContainer(
                                  book: books1[index],
                                );
                              }),
                        )
                  // CategoriesContainer(
                  //   book: books[7],
                  // ),
                  // GridView.builder(
                  //   padding: const EdgeInsets.only(top: 15),
                  //   shrinkWrap: true,

                  //   // clipBehavior: ,// Set to true to enable scrolling in ListView
                  //   physics:
                  //       const NeverScrollableScrollPhysics(), // Disable scrolling in ListView
                  //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //     crossAxisCount: 2, // Set to 2 to display items in pairs
                  //     childAspectRatio:
                  //         0.80, // Set aspect ratio to 1 to maintain square shape
                  //     crossAxisSpacing: 20,
                  //     // Set spacing between columns
                  //     mainAxisSpacing:
                  //         MediaQuery.of(context).size.width * 0.049,
                  //   ),
                  //   itemCount: 4,
                  //   // itemCount: 1,
                  //   itemBuilder: (context, index) {
                  //     return BookContainer(book: books1[index]);

                  //     // Container(
                  //     //   color: Colors.purple.withOpacity(0.3),
                  //     // );

                  //     // QuickAccess(
                  //     //   title: snapshot.data![index].name,
                  //     //   message: snapshot.data![index].description,
                  //     //   quickIcon: communityIconList[snapshot.data![index].icon],
                  //     //   categories: snapshot.data![index].categories,
                  //     //   quickIconColor: const Color(0xff000000),
                  //     //   quickTitleColor: const Color(0xff000000),
                  //     //   quickBackgroundColor: CustomColors
                  //     //       .communityColorList[snapshot.data![index].color],
                  //     //   quickBorderColor: CustomColors
                  //     //       .communityColorList[snapshot.data![index].color],
                  //     //   quickRoute: CommunitiesDetailsScreen.routeName,
                  //     //   isMember: isMember,
                  //     //   communityId: snapshot.data![index].id,
                  //     // );
                  //   },
                  // ),
                ],
              ),
            ),

            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(vertical: 10.0),
            //     child: TabBarView(
            //       physics: const NeverScrollableScrollPhysics(),
            //       controller: _tabController,
            //       children: [
            //         const ChatListWidget(),
            //         ref.watch(hasPaidProvider)
            //             ? const ChatListWidget(
            //                 showCouncellor: true,
            //               )
            //             : const CounsellorScreen(),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
