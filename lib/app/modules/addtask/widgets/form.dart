// import 'package:bluevoice/app/data/priority.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flui/flui.dart';
import '../controller.dart';

class AddTaskForm extends GetView<AddTaskController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            _buildTitleField(
              context,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'More:',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 20,
            ),
            _buildDescriptionField(context),
            SizedBox(
              height: 20,
            ),
            // _buildDateTimeField(context),
            // SizedBox(
            //   height: 20,
            // ),
            // _buildPriorityField(context),
            _buildSubmit(context),
          ],
        ),
      ),
    );
  }

  /// title输入框
  Widget _buildTitleField(BuildContext context) {
    // TextEditingController titleController = TextEditingController();
    // var title = titleController.text;
    return TextFormField(
          // controller: titleController,
          style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 18),
          validator: (value) =>
              value!.trim().isEmpty ? '任务不得为空' : null,
          onSaved: (value) {
            controller.saveTitle(value!);
          },
          // onSaved: controller.saveTitle,
          decoration: InputDecoration(
              labelText: '任务',
              labelStyle: TextStyle(fontSize: 18),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        );
  }

  /// Description输入框
  Widget _buildDescriptionField(BuildContext context) {
    // TextEditingController contentController = TextEditingController();
    return TextFormField(
      style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 18),
      onSaved: (value) {
        controller.saveContent(value!);
      },
      maxLines: 6,
      decoration: InputDecoration(
          labelText: '输入任务说明',
          hintText: '输入任务说明',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15)))),
    );
  }


  Widget _buildSubmit(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(30)),
      child: FLRaisedButton(
        color: Colors.blue,
        focusColor: Colors.blue[400],
        hoverColor: Colors.blue[200],

        onPressed: controller.submit,
        child: Text('add task',
            style: Theme.of(context)
                .textTheme
                .button!
                .copyWith(color: Colors.white)),
      ),
    );
  }
}
