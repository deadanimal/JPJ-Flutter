import 'package:flutter/material.dart';
import 'package:jpj_info/controller/login_controller.dart';
import 'package:jpj_info/controller/tac_controller.dart';
import 'package:jpj_info/view/appBarHeader/custom_appbar.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/bottomBar/bottom_bar.dart';
import 'package:jpj_info/view/navbar/menu.dart';
import 'package:jpj_info/view/newRegistration/new_registration.dart';
import 'package:jpj_info/view/form/tooltip_info.dart';

class NewRegistrationController extends StatefulWidget {
  const NewRegistrationController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewRegistrationController();
}

class _NewRegistrationController extends State<NewRegistrationController> {
  late TextEditingController _email;
  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          endDrawer: const NavBar(),
          appBar: const CustomAppBar(
            decor: customGradient,
          ),
          body: NewRegistration(
            readTnc: _moreTnc,
            emailController: _email,
            submitCB: submitCallback,
            tncCheckedCB: _onCheckboxChanged,
          ),
          bottomNavigationBar: const BottomBar(),
        ),
      ),
    );
  }

  void submitCallback(BuildContext context) {
    TooltipInfo().showInfo(
      context,
      "Kata laluan sementara telah dihantar",
      "sila semak e-mel anda",
      (c) => _onCloseSubmitInfo(c),
    );
  }

  void _onCloseSubmitInfo(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const LoginController();
        },
      ),
    );
  }

  void _onCheckboxChanged(bool? checked) {
    print(checked);
  }

  void _moreTnc() {
    TooltipInfo().showInfo(
      context,
      "",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur accumsan justo ante. Donec tincidunt vel urna at placerat. Vivamus fringilla eros ipsum, vitae sollicitudin mi rutrum condimentum. Aliquam sit amet porttitor lectus. Etiam tempor, turpis vitae sodales tempor, felis tortor vestibulum felis, luctus semper justo velit quis nisi. Duis vitae tortor ultricies, venenatis eros et, vestibulum odio. Mauris et neque ipsum. In hac habitasse platea dictumst. Sed in nibh ut erat ultrices tempor. Phasellus pretium sem et fringilla pharetra. Ut euismod, sem eget pretium tincidunt, ante mauris venenatis sem, at pharetra orci odio et lectus. Vivamus ornare enim elementum, finibus tellus quis, consectetur tortor. Donec ex mauris, ullamcorper sed ligula vel, laoreet sollicitudin turpis. Nulla ligula lorem, mollis in felis ac, tincidunt molestie tellus. Nunc rhoncus urna tellus, et elementum sem molestie aliquet. Integer ac est a libero vulputate facilisis. Quisque eleifend lorem ut imperdiet feugiat. Fusce pharetra, est quis euismod luctus, magna lectus tristique purus, ac aliquam mauris est condimentum metus. Duis sit amet nibh volutpat, fermentum enim ac, faucibus turpis. Nunc porta ornare purus quis dignissim. Integer nec enim finibus, convallis sapien eget, volutpat velit. Vivamus eu venenatis turpis. Sed nunc nisl, vulputate in bibendum eu, fermentum sed risus. Donec et nunc sit amet quam lacinia vulputate ac non nisi. Donec dictum justo nisl, ac porta ipsum fermentum in. Pellentesque rhoncus, risus sed blandit rutrum, metus mauris porta ligula, eget fermentum purus dolor eleifend eros. Fusce porttitor posuere turpis, ac convallis justo porttitor at. Aliquam erat volutpat. Vivamus ut metus ac nisi tempus vehicula in ut massa. Praesent suscipit placerat massa, id tempor sapien aliquet eu. Quisque dictum viverra eleifend. Donec vitae enim eu tellus efficitur interdum. Sed tristique ultrices erat at vestibulum. Morbi accumsan porttitor dolor quis posuere. Nullam at orci condimentum, luctus purus nec, suscipit arcu. Aenean at posuere risus. Proin laoreet ligula non ipsum iaculis tincidunt. Proin dui enim, volutpat et consequat non, dapibus tristique sem. Maecenas non quam suscipit, lacinia magna lacinia, tempus nisi. Nunc quis fermentum urna. Vestibulum commodo dignissim elit eu bibendum. Nulla sit amet urna massa. Proin vitae orci velit. Nulla accumsan sem vitae dui pellentesque fringilla. Proin ullamcorper, nunc at pretium mollis, erat est pretium tellus, quis bibendum quam nisi eu eros. Nullam tempus enim vitae diam lacinia convallis. Proin bibendum luctus purus ut facilisis. Vestibulum mollis finibus neque eget pellentesque. Curabitur in diam euismod, pretium diam eu, maximus arcu. Donec id tempor ante, cursus mollis lorem. Donec a neque est. In varius dignissim tellus ac interdum. Aenean vulputate, lorem non tincidunt feugiat, quam erat rutrum lacus, id aliquet nulla nunc sed odio. Integer lacinia condimentum orci ac tincidunt. Phasellus sit amet vehicula diam. Donec lacinia ante non ante pretium, ac varius lectus interdum. Sed placerat, nulla ut hendrerit aliquam, purus elit laoreet metus, ut euismod elit ex et nibh.",
      (c) => {},
    );
  }
}
