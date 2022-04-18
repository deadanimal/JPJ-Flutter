import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/mainpage_controller.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/paymentMethod/payment_method.dart';

class PaymentMethodController extends StatefulWidget {
  const PaymentMethodController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PaymentMethodController();
}

class _PaymentMethodController extends State<PaymentMethodController> {
  late TextEditingController _cardNamecontroller;
  late TextEditingController _cardNumbercontroller;
  late TextEditingController _cardExpirycontroller;
  late TextEditingController _cardCvccontroller;

  @override
  void initState() {
    super.initState();
    _cardNamecontroller = TextEditingController();
    _cardNumbercontroller = TextEditingController();
    _cardExpirycontroller = TextEditingController();
    _cardCvccontroller = TextEditingController();
  }

  @override
  void dispose() {
    _cardNamecontroller.dispose();
    _cardNumbercontroller.dispose();
    _cardExpirycontroller.dispose();
    _cardCvccontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          decor: customGradient,
        ),
        body: PaymentMethod(
          cardNamecontroller: _cardNamecontroller,
          cardNumbercontroller: _cardNumbercontroller,
          cardExpirycontroller: _cardExpirycontroller,
          cardCvccontroller: _cardCvccontroller,
          backCallback: _backCallback,
          submitCallback: _submitCallback,
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  void _submitCallback(BuildContext context) {}
  void _backCallback(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const MainpageController();
        },
      ),
    );
  }
}
