import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/template/template_header.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          Hero(
            tag: "headerAnim",
            child: TemplateHeader(
              header: Container(),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: const AssetImage("images/myjpj_logo_large.png"),
                      height: mediaHeight / 3,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(
                          backgroundColor: Colors.white),
                    ),
                  ],
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "JABATAN PENGANGKUTAN JALAN MALAYSIA",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.42,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
