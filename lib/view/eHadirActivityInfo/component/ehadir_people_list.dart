import 'package:flutter/material.dart';
import 'package:jpj_info/helper/string_helper.dart';
import 'package:jpj_info/model/ehadir_basic_user_info.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/summonsVerification/component/bordered_container.dart';

class PeopleList extends StatelessWidget {
  const PeopleList({
    Key? key,
    required this.comitteeList,
    required this.eraseItem,
    this.canDelete = true,
  }) : super(key: key);
  final List<BasicUserInfo> comitteeList;
  final Function(int) eraseItem;
  final bool canDelete;

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

  Widget _comitteeInfo(BuildContext context, BasicUserInfo info) {
    return CustomBorderedContainer(
      topPadding: verticalPadding,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Text(
                  info.name.trim() != ''
                      ? capitalize(info.name.trim())
                      : 'No Name',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xff171f44),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Text(
                info.department != null
                    ? capitalize(info.department!)
                    : "No Department Info",
                style: const TextStyle(
                  color: Color(0xff171f44),
                  fontSize: 15,
                ),
              ),
            ],
          ),
          canDelete ? _eraseIcon(context, info.id) : Container(),
        ],
      ),
    );
  }

  Widget _eraseIcon(
    BuildContext context,
    int id,
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
        onPressed: () {
          eraseItem(id);
        },
        child: const FittedBox(
          child: Center(
            child: Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
