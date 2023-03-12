import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/utils/app_utils.dart';
import 'package:projectify/views/common/widgets/dropdown.dart';
import 'package:projectify/views/common/widgets/text_field.dart';
import 'package:projectify/views/groups/controllers/create_project_controller.dart';
import 'package:projectify/views/home/widgets/custom_app_bar.dart';
import 'package:projectify/views/home/widgets/home_screen_drawer.dart';

// ignore: must_be_immutable
class CreateProject extends StatelessWidget {
  CreateProject({super.key});

  final CreateProjectController _controller =
      Get.put(CreateProjectController());

  final arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: CustomAppBar(
            title: '',
            isMenubarToShow: true,
          ),
          drawer: HomeScreenDrawer(),
          backgroundColor: Pallets.appBgColor,
          body: SafeArea(
            bottom: false,
            child: RefreshIndicator(
              color: Pallets.primaryColor,
              onRefresh: () async {
                _controller.images.clear();
                _controller.titleController.clear();
                _controller.descriptionController.clear();
                _controller.selectedBackendTechnology = "".obs;
                _controller.selectedFrontendTechnology = "".obs;
                _controller.selectedDatabaseTechnology = "".obs;
                _controller.selectedCategory = "".obs;
                await _controller.fetchTechnologies();

                return;
              },
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _controller.projectFormKey,
                    child: Obx(() => Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _controller.images.isEmpty
                                ? Container(
                                    color: Pallets.uploadBgColor,
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          _selectImages();
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 14, horizontal: 20),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                            border: Border.all(
                                                color: Pallets.primaryColor,
                                                width: 0.5),
                                          ),
                                          height: 60,
                                          child: Stack(
                                            alignment: AlignmentDirectional
                                                .centerStart,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Text(
                                                    "Upload Images",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Positioned(
                                                child: Icon(
                                                  Icons.upload,
                                                  size: 30,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Material(
                                    color: Pallets.appBarColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          CarouselSlider(
                                            items:
                                                _controller.images.map((image) {
                                              return Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 10,
                                                  ),
                                                  child: Image.file(image));
                                            }).toList(),
                                            options: CarouselOptions(
                                              aspectRatio: 16 / 12,
                                              autoPlay: true,
                                              enableInfiniteScroll: false,
                                              autoPlayCurve:
                                                  Curves.fastOutSlowIn,
                                              autoPlayAnimationDuration:
                                                  const Duration(
                                                      milliseconds: 800),
                                              viewportFraction: 1,
                                              autoPlayInterval:
                                                  const Duration(seconds: 7),
                                              enlargeCenterPage: true,
                                              onPageChanged: (index, reason) {
                                                _controller.currentSlide =
                                                    index;
                                              },
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Material(
                                                color: Pallets.appBgColor,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(5),
                                                  ),
                                                ),
                                                child: IconButton(
                                                  icon: const Icon(
                                                    Icons.delete,
                                                    color: Pallets.primaryColor,
                                                  ),
                                                  padding:
                                                      const EdgeInsets.all(2),
                                                  onPressed: () {
                                                    _controller.removeImage();
                                                  },
                                                  color: Pallets.primaryColor,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              _controller.images.length < 4
                                                  ? Material(
                                                      color: Pallets.appBgColor,
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(5),
                                                        ),
                                                      ),
                                                      child: IconButton(
                                                        icon: const Icon(
                                                          Icons.add,
                                                          color: Pallets
                                                              .primaryColor,
                                                        ),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2),
                                                        onPressed: () {
                                                          _selectImages();
                                                        },
                                                        color: Pallets
                                                            .primaryColor,
                                                      ),
                                                    )
                                                  : const SizedBox.shrink(),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                            const SizedBox(
                              height: 20,
                            ),
                            CommonTextField(
                              title: "Title",
                              hintText: "Ex: Projectify",
                              maxLines: null,
                              controller: _controller.titleController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Title is required";
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CommonTextField(
                              title: "Description",
                              hintText:
                                  "Ex: Projectify is a project about managing projects and task distribution system.",
                              maxLines: 4,
                              controller: _controller.descriptionController,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 10) {
                                  return "Description is required and should be at least 10 characters long";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Obx(() => CommonDropDown(
                                  label: const Text(
                                    "Frontend",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Pallets.primaryColor,
                                    ),
                                  ),
                                  onChanged: _controller
                                          .frontendTechnologies.isNotEmpty
                                      ? (value) {
                                          _controller.selectedFrontendTechnology
                                              .value = value ?? "";
                                        }
                                      : null,
                                  items: _controller.frontendTechnologies
                                      .map((e) => DropdownMenuItem(
                                          value: e.id.toString(),
                                          child: Text(
                                            e.name,
                                          )))
                                      .toList(),
                                  value: _controller.selectedFrontendTechnology
                                          .value.isNotEmpty
                                      ? _controller
                                          .selectedFrontendTechnology.value
                                      : null,
                                  hintText: "Frontend Technology",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please select frontend technology";
                                    }
                                    return null;
                                  },
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            Obx(() => CommonDropDown(
                                  label: const Text(
                                    "Backend",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Pallets.primaryColor,
                                    ),
                                  ),
                                  onChanged:
                                      _controller.backendTechnologies.isNotEmpty
                                          ? (value) {
                                              _controller
                                                  .selectedBackendTechnology
                                                  .value = value ?? "";
                                            }
                                          : null,
                                  value: _controller.selectedBackendTechnology
                                          .value.isNotEmpty
                                      ? _controller
                                          .selectedBackendTechnology.value
                                      : null,
                                  items: _controller.backendTechnologies
                                      .map((e) => DropdownMenuItem(
                                          value: e.id.toString(),
                                          child: Text(
                                            e.name,
                                          )))
                                      .toList(),
                                  hintText: "Backend Technology",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please select backend technology";
                                    }
                                    return null;
                                  },
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            Obx(() => CommonDropDown(
                                  label: const Text(
                                    "Database",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Pallets.primaryColor,
                                    ),
                                  ),
                                  onChanged: _controller
                                          .databaseTechnologies.isNotEmpty
                                      ? (value) {
                                          _controller.selectedDatabaseTechnology
                                              .value = value ?? "";
                                        }
                                      : null,
                                  value: _controller.selectedDatabaseTechnology
                                          .value.isNotEmpty
                                      ? _controller
                                          .selectedDatabaseTechnology.value
                                      : null,
                                  items: _controller.databaseTechnologies
                                      .map((e) => DropdownMenuItem(
                                          value: e.id.toString(),
                                          child: Text(
                                            e.name,
                                          )))
                                      .toList(),
                                  hintText: "Database Technology",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please select database technology";
                                    }
                                    return null;
                                  },
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            Obx(() => CommonDropDown(
                                  label: const Text(
                                    "Category",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Pallets.primaryColor,
                                    ),
                                  ),
                                  onChanged: _controller.categories.isNotEmpty
                                      ? (value) {
                                          _controller.selectedCategory.value =
                                              value ?? "";
                                        }
                                      : null,
                                  value: _controller
                                          .selectedCategory.value.isNotEmpty
                                      ? _controller.selectedCategory.value
                                      : null,
                                  items: _controller.categories
                                      .map((e) => DropdownMenuItem(
                                          value: e.id.toString(),
                                          child: Text(
                                            e.name,
                                          )))
                                      .toList(),
                                  hintText: "Category",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please select category";
                                    }
                                    return null;
                                  },
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            MaterialButton(
                              onPressed: () async {
                                if (_controller.projectFormKey.currentState!
                                    .validate()) {
                                  if (_controller.images.isNotEmpty) {
                                    var data = await _controller.create(
                                      academicId: arguments["academicsId"],
                                      groupId: arguments["groupId"],
                                    );
                                    if (data != null) {
                                      arguments["onCreate"](
                                          data, arguments["groupId"]);
                                      Get.back();
                                    }
                                  } else {
                                    Get.snackbar(
                                      "Error",
                                      "Please select at least one image",
                                      backgroundColor: Pallets.errorColor,
                                      snackPosition: SnackPosition.BOTTOM,
                                    );
                                  }
                                }
                              },
                              color: Pallets.primaryColor,
                              height: 52,
                              minWidth: double.maxFinite,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Pallets.scaffoldBgColor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            ),
          ),
        ),
        Obx(() => _controller.isLoading.value
            ? AppUtils.getFullScreenLoader()
            : const SizedBox.shrink()),
      ],
    );
  }

  void _selectImages() async {
    final images = await ImagePicker().pickMultiImage();

    if (images.isNotEmpty) {
      int total = images.length + _controller.images.length;
      if (total > 4) {
        Get.snackbar(
          "Error",
          "You can only select 4 images",
          backgroundColor: Pallets.errorColor,
          snackPosition: SnackPosition.BOTTOM,
        );
        images.removeRange(total - 4 - 1, images.length);
      }
      for (var element in images) {
        bool isAlreadyExists = false;
        final Uint8List bytes = await element.readAsBytes();
        final String base64Image = base64Encode(bytes);
        final int imageIndex = base64Image.length;
        for (var image in _controller.images.value) {
          final Uint8List bytes = await image.readAsBytes();
          final String base64Image = base64Encode(bytes);
          final int index = base64Image.length;

          if (imageIndex == index) {
            isAlreadyExists = true;
            Get.snackbar(
              "Error",
              "Image already exists",
              backgroundColor: Pallets.errorColor,
              snackPosition: SnackPosition.BOTTOM,
            );
            break;
          }
        }

        if (!isAlreadyExists) {
          _controller.addImage(File(element.path));
        }
      }
    }
  }
}
