import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class CustomDropDownSearch extends StatefulWidget {
  final String title;
  final TextEditingController selectedlistname;
  final TextEditingController selectedlistid;
  final List<SelectedListItem> listdata;
  const CustomDropDownSearch({super.key, required this.title, required this.selectedlistname, required this.selectedlistid, required this.listdata});

  @override
  State<CustomDropDownSearch> createState() => _CustomDropDownSearchState();
}

class _CustomDropDownSearchState extends State<CustomDropDownSearch> {
  void showDropDownSearch() {
    DropDownState(
      DropDown(
        isDismissible: true,
        bottomSheetTitle: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.listdata,
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          widget.selectedlistname.text = selectedListItem.name;
          widget.selectedlistid.text = selectedListItem.value!;
        },
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: widget.selectedlistname,
      cursorColor: Colors.black,
      onTap: () {
        FocusScope.of(context).unfocus();
        showDropDownSearch();
      },
      decoration: InputDecoration(
          suffixIcon: InkWell(
            child: Icon(Icons.arrow_drop_down),
            onTap: () {
              FocusScope.of(context).unfocus();
              showDropDownSearch();
            },
          ),
          hintText: widget.selectedlistname.text == "" ? widget.title : widget.selectedlistname.text,
          hintStyle: const TextStyle(fontSize: 15),
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "Category Name",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 22),
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          border: OutlineInputBorder(borderSide: const BorderSide(), borderRadius: BorderRadius.circular(30))),
    );
  }
}
