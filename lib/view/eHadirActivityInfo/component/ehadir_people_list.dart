import 'package:flutter/material.dart';
import 'package:jpj_info/model/ehadir_comittee_info.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          info.name,
          style: const TextStyle(
            fontSize: 15,
            color: Color(0xff171f44),
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          info.department,
          style: const TextStyle(
            color: Color(0xff171f44),
            fontSize: 10,
          ),
        ),
        const Divider(color: Colors.black),
      ],
    );
  }
}
