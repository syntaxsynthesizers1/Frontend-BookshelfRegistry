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
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchScreen extends StatefulHookConsumerWidget {
  const SearchScreen({
    super.key,
  });

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen>
    with SingleTickerProviderStateMixin {
  List<OldBookModel> books = initializeBookModels();
  List<OldBookModel> books1 = initializeBookModels()
      .where((element) => element.category == BookCategory.fantasy.index)
      .toList();
  late TabController _tabController;
  int selectedIndex = 0;
  bool showAmount = true;
  List<OldBookModel> searchResult = [];
  String title = "";

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
                  "Search",
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
                  searchCustomTextField("search",
                      hintText: "Search book title or author",
                      readOnly: false, onChanged: (value) {
                    if (value != null && value.isEmpty) {
                      setState(() {
                        searchResult = [];
                      });
                    } else {
                      setState(() {
                        searchResult = ref
                            .watch(bookModelsProvider)
                            .where((element) =>
                                    element.title
                                        .toLowerCase()
                                        .contains(value?.toLowerCase() ?? "") ||
                                    element.author
                                        .toLowerCase()
                                        .contains(value?.toLowerCase() ?? "")
                                // BookCategory.fantasy.index
                                )
                            .toList();
                      });
                    }
                  },
                      suffix: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: CustomColors.deepMainBlueColor,
                                  shape: BoxShape.circle
                                  // borderRadius: BorderRadius.circular(10),
                                  ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(
                                  ConstantString.searchIcon,
                                  color: CustomColors.whiteColor,
                                  height: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  verticalSpacer(25),
                  title.isEmpty
                      ? const Text(
                          "Categories",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 22,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              title = "";
                              searchResult = [];
                            });
                          },
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.chevronLeft,
                                size: 20,
                                color:
                                    CustomColors.mainBlueColor.withOpacity(0.6),
                              ),
                              Text(
                                " $title",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                  verticalSpacer(20),

                  searchResult.isNotEmpty
                      ? Expanded(
                          child: GridView.builder(
                            padding: const EdgeInsets.only(top: 15),
                            shrinkWrap: true,

                            // clipBehavior: ,// Set to true to enable scrolling in ListView
                            physics:
                                const NeverScrollableScrollPhysics(), // Disable scrolling in ListView
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  2, // Set to 2 to display items in pairs
                              childAspectRatio:
                                  0.80, // Set aspect ratio to 1 to maintain square shape
                              crossAxisSpacing: 20,
                              // Set spacing between columns
                              mainAxisSpacing:
                                  MediaQuery.of(context).size.width * 0.049,
                            ),
                            itemCount: searchResult.length,
                            // itemCount: 1,
                            itemBuilder: (context, index) {
                              return BookContainer(book: searchResult[index]

                                  // ref
                                  //     .watch(bookModelsProvider)
                                  //     .where((element) =>
                                  //         element.category ==
                                  //         BookCategory.fantasy.index)
                                  // .toList()[index]
                                  );

                              // Container(
                              //   color: Colors.purple.withOpacity(0.3),
                              // );

                              // QuickAccess(
                              //   title: snapshot.data![index].name,
                              //   message: snapshot.data![index].description,
                              //   quickIcon: communityIconList[snapshot.data![index].icon],
                              //   categories: snapshot.data![index].categories,
                              //   quickIconColor: const Color(0xff000000),
                              //   quickTitleColor: const Color(0xff000000),
                              //   quickBackgroundColor: CustomColors
                              //       .communityColorList[snapshot.data![index].color],
                              //   quickBorderColor: CustomColors
                              //       .communityColorList[snapshot.data![index].color],
                              //   quickRoute: CommunitiesDetailsScreen.routeName,
                              //   isMember: isMember,
                              //   communityId: snapshot.data![index].id,
                              // );
                            },
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: BookCategory.values.length,
                              itemBuilder: (context, index) {
                                List<OldBookModel> books1 =
                                    initializeBookModels()
                                        .where((element) =>
                                            element.category ==
                                            BookCategory.fantasy.index)
                                        .toList();
                                return index % 2 == 0
                                    ? GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            title = getCategoryName(
                                                BookCategory.values[index]);
                                            searchResult = ref
                                                .watch(bookModelsProvider)
                                                .where((element) =>
                                                    element.category == index)
                                                .toList();
                                          });
                                        },
                                        child: CategoriesContainer(
                                          book: initializeBookModels()
                                              .where((element) =>
                                                  element.category == index)
                                              .first,
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            title = getCategoryName(
                                                BookCategory.values[index]);
                                            searchResult = ref
                                                .watch(bookModelsProvider)
                                                .where((element) =>
                                                    element.category == index)
                                                .toList();
                                          });
                                        },
                                        child: ReverseCategoriesContainer(
                                          book: initializeBookModels()
                                              .where((element) =>
                                                  element.category == index)
                                              .first,
                                        ),
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
