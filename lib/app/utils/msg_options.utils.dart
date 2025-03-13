import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class MsgOptions {
  static customWidget(
      BuildContext context, String title, List<Widget> widgets) async {
    final result = await showDialog(
        context: context,
        barrierDismissible: false,
        useSafeArea: true,
        builder: (builder) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                IconButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    icon: Icon(Icons.close))
              ],
            ),
            actions: widgets,
            actionsOverflowButtonSpacing: 15,
            actionsOverflowDirection: VerticalDirection.down,
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            actionsPadding: EdgeInsets.only(left: 1, right: 1),
          );
        });
    return result;
  }

  static customImage(BuildContext context, String url,
      {String tag = ""}) async {
    final result = await Get.dialog(
      Dialog(
        insetPadding:
            EdgeInsets.only(left: 25, right: 25, top: 200, bottom: 200),
        backgroundColor: Colors.white12,
        elevation: 5,
        child: PhotoView(
            minScale: PhotoViewComputedScale.contained * 0.8,
            maxScale: PhotoViewComputedScale.covered * 2,
            imageProvider: NetworkImage(url),
            loadingBuilder: (context, event) =>
                Image.asset("assets/images/loading.gif"),
            heroAttributes: PhotoViewHeroAttributes(tag: "tagItem$tag"),
            initialScale: PhotoViewComputedScale.contained,
            enableRotation: false),
      ),
      barrierDismissible: true,
      barrierColor: Colors.white10,
    );
    return result;
  }

  showMessage(BuildContext context,
      {required GestureTapCallback onPressedGallery,
      required GestureTapCallback onPressedCamera}) {
    Get.defaultDialog(title: "Selecciona una opción", actions: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _optionText(context, "Galeria", onPressedGallery),
          _optionText(context, "Cámara", onPressedCamera),
          Padding(padding: EdgeInsets.all(8)),
        ],
      )
    ]);
  }

  ElevatedButton _optionText(
      BuildContext context, String text, GestureTapCallback onPressed) {
    return ElevatedButton(
        onPressed: () => onPressed,
        child: Text(
          text,
          style: Theme.of(context).primaryTextTheme.bodyMedium,
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black)));
  }
}
