import 'package:flutter/material.dart';
import 'package:jpj_info/helper/string_helper.dart';
import 'package:jpj_info/model/ehadir_comittee_info.dart';
import 'package:jpj_info/view/summonsVerification/component/bordered_container.dart';

class PeopleList extends StatelessWidget {
  const PeopleList({
    Key? key,
    required this.comitteeList,
  }) : super(key: key);
  final List<ComitteeInfo> comitteeList;

  @override
  Widget build(BuildContext context) {
    return _comitteeList(context);
  }

  Widget _comitteeList(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: comitteeList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return _comitteeInfo(context, comitteeList[index]);
      },
    );
  }

  Widget _comitteeInfo(BuildContext context, ComitteeInfo info) {
    return CustomBorderedContainer(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                capitalize(info.name),
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xff171f44),
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                capitalize(info.department ?? ""),
                style: const TextStyle(
                  color: Color(0xff171f44),
                  fontSize: 15,
                ),
              ),
            ],
          ),
          _eraseIcon(context),
        ],
      ),
    );
  }

  Widget _eraseIcon(
    BuildContext context,
  ) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3f000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
        color: Colors.red,
      ),
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () {},
        child: const FittedBox(
          child: Center(
            child: Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
