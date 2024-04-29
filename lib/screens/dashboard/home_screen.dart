import 'package:book_stack/constants/custom_colors.dart';
import 'package:book_stack/constants/custom_string.dart';
import 'package:book_stack/data/api_config/local_cache.dart';
import 'package:book_stack/locator.dart';
import 'package:book_stack/models/old_book_model.dart';
import 'package:book_stack/screens/app_view_model.dart';
import 'package:book_stack/utils/colors.dart';
import 'package:book_stack/utils/enum.dart';
import 'package:book_stack/utils/spacers.dart';
import 'package:book_stack/widgets/book_container.dart';
import 'package:book_stack/widgets/continue_book_container.dart';
import 'package:book_stack/widgets/custom_appbar.dart';
import 'package:book_stack/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  final void Function()? onSearchTap;
  const HomeScreen({
    super.key,
    required this.onSearchTap,
  });

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  List<OldBookModel> books = initializeBookModels();
  List<OldBookModel> books1 = initializeBookModels()
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
    final userData = locator<LocalCache>().getUserData();
    final lastRead = locator<LocalCache>().getLastRead();
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
            const CustomAppBar(
              title: "Chats",
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpacer(15),
                    GestureDetector(
                      onTap: () => widget.onSearchTap!(),
                      child: searchCustomTextField("search",
                          hintText: "Search your books",
                          readOnly: true,
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
                    ),
                    verticalSpacer(25),
                    ref.watch(lastReadProvider) == null
                        ? const SizedBox.shrink()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Continue Reading",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                ),
                              ),
                              verticalSpacer(10),
                              ContinueBookContainer(
                                book: ref.watch(lastReadProvider)!,
                              ),
                              verticalSpacer(25),
                            ],
                          ),
                    const Text(
                      "For You",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    ),
                    verticalSpacer(10),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: BookContainer(
                                  book: ref.watch(bookModelsProvider)[index]))),
                    ),
                    verticalSpacer(25),
                    const Text(
                      "New Arrivals",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                      ),
                    ),
                    GridView.builder(
                      padding: const EdgeInsets.only(top: 15),
                      shrinkWrap: true,

                      // clipBehavior: ,// Set to true to enable scrolling in ListView
                      physics:
                          const NeverScrollableScrollPhysics(), // Disable scrolling in ListView
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Set to 2 to display items in pairs
                        childAspectRatio:
                            0.80, // Set aspect ratio to 1 to maintain square shape
                        crossAxisSpacing: 20,
                        // Set spacing between columns
                        mainAxisSpacing:
                            MediaQuery.of(context).size.width * 0.049,
                      ),
                      itemCount: 4,
                      // itemCount: 1,
                      itemBuilder: (context, index) {
                        return BookContainer(
                            book: ref
                                .watch(bookModelsProvider)
                                .where((element) =>
                                    element.category ==
                                    BookCategory.fantasy.index)
                                .toList()[index]);

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
                  ],
                ),
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
