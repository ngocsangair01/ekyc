import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:ekyc/const/const.dart';

class ListCheckBox extends StatefulWidget {
  final List<dynamic> listData;
  final Function(bool val, int index) onItemChanged;

  ListCheckBox(this.listData, this.onItemChanged);

  @override
  State<StatefulWidget> createState() {
    return _ListCheckBoxState();
  }
}

class _ListCheckBoxState extends State<ListCheckBox> {
  void itemChange(bool val, int index) {
    setState(() {
      widget.onItemChanged(val, index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            left: AppDimens.padding10, right: AppDimens.padding10),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: widget.listData.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  itemChange(!widget.listData[index].isChecked, index);
                },
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: widget.listData[index].isChecked,
                      activeColor: AppColors.accentColor(),
                      checkColor: AppColors.bg(),
                      onChanged: (value) {
                        itemChange(!widget.listData[index].isChecked, index);
                      },
                    ),
                    Text(
                      widget.listData[index].name != null
                          ? '${widget.listData[index].name.toString().tr}'
                          : widget.listData[index].toString(),
                      style: const TextStyle(fontSize: AppDimens.fontMedium),
                    ),
                  ],
                ));
          },
          separatorBuilder: (context, index) {
            return const SizedBox();
            // return const Divider(
            //   color: Colors.transparent,
            // );
          },
        ));
  }
}
