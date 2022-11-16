import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_developer_study_case/controller/home_page_controller.dart';
import 'package:flutter_developer_study_case/model/exercises_model.dart';
import 'package:get/get.dart';
import 'package:search_page/search_page.dart';

class HomePage extends GetView<HomePageController> {
  HomePage({Key? key}) : super(key: key);
  ExercisesModel model = ExercisesModel();
  TextEditingController textEditingController = TextEditingController();

  var modelList3 = <ExercisesModel>[];

  Future<void> _openFilterDialog(context) async {
    //Ekranda Filtreli ifadelerin gelmesi
    await FilterListDialog.display<ExercisesModel>(
      context,
      hideSelectedTextCount: true,
      themeData: FilterListThemeData(context),
      headlineText: 'Select Users',
      height: 500,
      listData: controller.modelList,
      selectedListData: controller.modelList(),
      choiceChipLabel: (item) => item!.type,
      validateSelectedItem: (list, val) => list!.contains(val),
      controlButtons: [ControlButtonType.All, ControlButtonType.Reset],
      onItemSearch: (user, query) {
        return user.name!.toLowerCase().contains(query.toLowerCase());
      },
      onApplyButtonClick: (list) {
        controller.foundList(List<ExercisesModel>.from(list!));
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      //backgroundColor: Colors.transparent,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: /* Obx(
                      () =>*/
                        TextField(
                      controller: textEditingController,
                      onChanged: (value) {
                        controller.filterModel(value);
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Search",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)))),
                    ),
                    //   ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      child: IconButton(
                          onPressed: () {
                            _openFilterDialog(context);
                          },
                          icon: Icon(Icons.format_list_bulleted_sharp)))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () => Text(
                  "${controller.foundList.value.length.toString()} results found.",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () => controller.isDataLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: controller.foundList.value.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Card(
                                    child: SizedBox(
                                      // height: Get.height / 6,
                                      width: Get.width / 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller
                                                  .foundList.value[index].name
                                                  .toString(),
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 25),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                                width: 100,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  shape: BoxShape.rectangle,
                                                  border: Border.all(
                                                      color: Colors.black),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    controller.foundList
                                                        .value[index].type
                                                        .toString(),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                )),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              controller
                                                  .foundList.value[index].muscle
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: Get.height / 6,
        width: Get.width / 1,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Exercise Name",
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.black),
                  ),
                  child: Text(
                    "Exercise Type",
                    textAlign: TextAlign.center,
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                "abdominals, abductors, adductors",
                style: TextStyle(color: Colors.black, fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: Get.height / 6,
        width: Get.width / 1,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.black),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Exercise Name",
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.black),
                  ),
                  child: Text(
                    "Exercise Type",
                    textAlign: TextAlign.center,
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                "abdominals, abductors, adductors",
                style: TextStyle(color: Colors.black, fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
