import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/main_bg_half.png"),
          fit: BoxFit.fitHeight,
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image(
            image: const AssetImage("images/myjpj_logo_large.png"),
            height: mediaHeight / 3,
          ),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(backgroundColor: Colors.white),
              ),
              Text(
                AppLocalizations.of(context)!.welcome,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Column(
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage("images/jpj_official_icon.png"),
                  height: 34,
                ),
              ),
              Text(
                "JABATAN PENGANGKUTAN JALAN MALAYSIA",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.42,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
