import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:book_stack/constants/custom_colors.dart';
import 'package:book_stack/constants/custom_string.dart';
import 'package:book_stack/models/old_book_model.dart';
import 'package:book_stack/utils/colors.dart';
import 'package:book_stack/utils/spacers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AudioPlayerScreen extends StatefulWidget {
  final OldBookModel book;
  const AudioPlayerScreen({
    super.key,
    required this.book,
  });

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool isLoading = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    if (!isPlaying) {
      setState(() {
        isLoading = true;
      });
      String url =
          "https://firebasestorage.googleapis.com/v0/b/bonecole-2f0f4.appspot.com/o/4-things-i-wish-i-knew-in-my-20s-128-ytshorts.savetube.me.mp3?alt=media&token=a592f319-9ae1-441b-9979-a6bad33812ff";

      //       if (widget.isDownloaded) {
      //   final videoFile = File(widget.videpPath);
      //   _videoPlayerController = VideoPlayerController.file(videoFile);
      // } else {
      //   _videoPlayerController = VideoPlayerController.network(widget.videpPath);
      // }
      // if (widget.isDownloaded) {
      //   final videoFile = File(widget.audioUrl);
      //   audioPlayer.play(DeviceFileSource(widget.audioUrl)).then((value) {
      //     setState(() {
      //       isLoading = false;
      //     });
      //   });
      // } else {
      //   audioPlayer.play(UrlSource(widget.audioUrl)).then((value) {
      //     setState(() {
      //       isLoading = false;
      //     });
      //   });
      // }
      audioPlayer.play(UrlSource(url)).then((value) {
        setState(() {
          isLoading = false;
        });
      });
    }

    // Listen to states: playing, paused, stopped
    audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        // Check if the widget is still mounted
        setState(() {
          isPlaying = state == PlayerState.playing;
        });
      }
    });

    //Listen to audio duration
    audioPlayer.onDurationChanged.listen((newDuration) {
      if (mounted) {
        // Check if the widget is still mounted
        setState(() {
          duration = newDuration;
        });
      }
    });

    //Listen to audio position
    audioPlayer.onPositionChanged.listen((newPosition) {
      if (mounted) {
        // Check if the widget is still mounted
        setState(() {
          position = newPosition;
        });
      }
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(widget.book.color).withOpacity(0.3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: CustomColors.mainBlueColor),
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: CustomColors.whiteColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // title: SvgPicture.asset(
        //   "assets/icons/bonecole_icon.svg",
        //   height: 50,
        // ),
        // actions: [
        //   Builder(builder: (context) {
        //     return GestureDetector(
        //       onTap: () {
        //         Scaffold.of(context).openEndDrawer();
        //       },
        //       child: Padding(
        //         padding: const EdgeInsets.only(right: 20.0),
        //         child: SvgPicture.asset(
        //           "assets/icons/menu_icon.svg",
        //           height: 14,
        //         ),
        //       ),
        //     );
        //   })
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: widget.book.imageUrl,
                    placeholder: (context, url) => Skeletonizer(
                      enabled: true,
                      child: Card(
                        color: HexColor(widget.book.color),
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

                  // Image.asset(
                  //   ConstantString.bookStackLogoTrans,
                  //   // height: 250,
                  // ),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 32,
            // ),

            Column(
              children: [
                verticalSpacer(50),
                Text(
                  widget.book.title,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  widget.book.author,
                  style: TextStyle(
                      fontSize: 20, color: Colors.white.withOpacity(0.6)),
                ),
                Slider(
                    activeColor: HexColor(widget.book.color),
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    value: position.inSeconds.toDouble(),
                    onChanged: (value) async {}),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(formatTime(position)),
                      Text(formatTime(duration - position)),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 35,
                  child: IconButton(
                    icon: isLoading
                        ? const CircularProgressIndicator(
                            color: CustomColors.whiteColor,
                          )
                        : Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    iconSize: 40,
                    onPressed: () async {
                      if (isPlaying) {
                        await audioPlayer.pause();
                      } else {
                        setState(() {
                          isLoading = true;
                        });
                        String url =
                            "https://firebasestorage.googleapis.com/v0/b/bonecole-2f0f4.appspot.com/o/4-things-i-wish-i-knew-in-my-20s-128-ytshorts.savetube.me.mp3?alt=media&token=a592f319-9ae1-441b-9979-a6bad33812ff";
                        await audioPlayer.play(UrlSource(url));
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

String formatTime(Duration position) {
  // Extract the minutes and seconds from the Duration object
  int minutes = position.inMinutes;
  int seconds = (position.inSeconds % 60);

  // Create a formatted string with leading zeros
  String formattedMinutes = minutes.toString().padLeft(2, '0');
  String formattedSeconds = seconds.toString().padLeft(2, '0');

  return '$formattedMinutes:$formattedSeconds';
}
