import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matematika/app/util/ui.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  var id = "";
  @override
  void onInit() {
    super.onInit();
    id = Get.arguments['idVideo'];
    init();
  }


  @override
  void onClose() {
    super.onClose();
    videoPlayerController.dispose();
    chewieController!.dispose();
  }

  Future<void> init() async {
    videoPlayerController =
        VideoPlayerController.asset('assets/videos/$id.mp4');
    await Future.wait([videoPlayerController.initialize()]);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      looping: false,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.cyanAccent,
        handleColor: Colors.cyan,
        backgroundColor: Colors.black54,
        bufferedColor: Colors.white,
      ),
      showOptions: false,
      placeholder: Container(
        color: UI.backgroud,
      ),
      autoInitialize: true,
    );
    update();
  }
}
