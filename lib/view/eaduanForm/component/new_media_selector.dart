import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/spacing.dart';

class NewMediaSelector {
  Future<String?> promptUser(
    BuildContext context,
    Function(String) callback,
  ) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          AppLocalizations.of(context)!.choose,
          textAlign: TextAlign.center,
        ),
        alignment: Alignment.center,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                callback('image');
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      padding: const EdgeInsets.all(0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.image,
                        color: Color(themeNavy),
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: horizontalPadding),
                    Text(
                      AppLocalizations.of(context)!.image,
                      style: const TextStyle(
                        color: Color(themeNavy),
                        fontSize: 15,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: verticalPadding,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                callback('video');
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      padding: const EdgeInsets.all(0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.video_camera_back,
                        color: Color(themeNavy),
                        // size: 32,
                      ),
                    ),
                    const SizedBox(width: horizontalPadding),
                    Text(
                      AppLocalizations.of(context)!.video,
                      style: const TextStyle(
                        color: Color(themeNavy),
                        fontSize: 15,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
