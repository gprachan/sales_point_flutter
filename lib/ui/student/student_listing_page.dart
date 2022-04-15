import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:retrofit/retrofit.dart';
import 'package:salespoint_flutter/data/app_api.dart';
import 'package:salespoint_flutter/di/get_it.dart';
import 'package:salespoint_flutter/models/request/create_address_request.dart';
import 'package:salespoint_flutter/models/request/create_address_response.dart';
import 'package:salespoint_flutter/models/response/common_response.dart';
import 'package:salespoint_flutter/models/response/student_address_list_response.dart';
import 'package:salespoint_flutter/models/response/student_listing_response.dart';
import 'package:salespoint_flutter/ui/dashboard/dashboard_controller.dart';
import 'package:salespoint_flutter/ui/school/school_controller.dart';
import 'package:salespoint_flutter/ui/student/item_listing_view.dart';
import 'package:salespoint_flutter/utils/alert_utils.dart';

import '../../models/create_bill_share_data.dart';
import '../../models/response/create_bill_response.dart';
import '../../models/response/items_list_response.dart';
import '../../utils/response_handler.dart';

class StudentListingPage extends StatefulWidget {
  const StudentListingPage({
    Key? key,
    this.data,
  }) : super(key: key);

  final CreateBillShareData? data;
  static const routeName = 'routeNameStudentListingPage';

  @override
  State<StudentListingPage> createState() => _StudentListingPageState();
}

class _StudentListingPageState extends State<StudentListingPage> {
  final _api = getIt<AppApiClient>();
  late SchoolController controller;
  final _pagingController = PagingController<int, StudentData>(
    firstPageKey: 0,
  );

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchData(pageKey);
    });
    super.initState();
  }

  _fetchData(int pageKey) async {
    try {
      final newPage = await controller.getStudents(page: pageKey, data: widget.data);

      final isLastPage = newPage.data?.nextPageUrl == null;
      final newItems = newPage.data?.data;

      if (isLastPage) {
        if (newItems != null) {
          _pagingController.appendLastPage(newItems);
        }
      } else {
        final nextPageKey = pageKey + 1;
        if (newItems != null) {
          _pagingController.appendPage(newItems, nextPageKey);
        }
      }
      if (newPage.errorMessage != null) {
        _pagingController.error = newPage.errorMessage;
      }
    } catch (e) {
      _pagingController.error = '$e';
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller = Provider.of<SchoolController>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Students',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: PagedListView<int, StudentData>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<StudentData>(
          itemBuilder: (context, student, index) {
            return InkWell(
              onTap: () async {
                AlertUtils.showProgressDialog(context);
                var response = await doTryCatch(() async {
                  HttpResponse<StudentAddressListResponse> response = await _api.getStudentAddressList(student.id);
                  return response.handleResponse();
                });

                if (response.errorMessage == null) {
                  if (response.data?.data?.isNotEmpty == true) {
                    Navigator.pop(context);
                    _showBottomSheet(
                        items: response.data?.data ?? [],
                        onClick: (item) {
                          Navigator.pushNamed(context, ItemListingView.routeName, arguments: {
                            'gradeId': widget.data?.gradeId,
                            'schoolId': widget.data?.schoolId,
                            'studentId': student.id,
                            'studentName': '${student.firstName} ${student.lastName}',
                            'addressId': item.id
                          });
                        });
                  } else {
                    CreateAddressRequest request = CreateAddressRequest(
                      fullName: '${student.firstName} ${student.lastName}',
                      email: student.email,
                      phoneNumber: student.phoneNo,
                      address: student.address,
                      addressDetail: 'Address Details',
                      studentId: student.id,
                    );
                    var createAddressResponse = await doTryCatch(() async {
                      HttpResponse<CreateAddressResponse> response = await _api.createStudentAddress(request);
                      return response.handleResponse();
                    });
                    Navigator.pop(context);
                    if (createAddressResponse.errorMessage == null) {
                      Navigator.pushNamed(context, ItemListingView.routeName, arguments: {
                        'gradeId': widget.data?.gradeId,
                        'schoolId': widget.data?.schoolId,
                        'studentId': student.id,
                        'studentName': '${student.firstName} ${student.lastName}',
                        'addressId': createAddressResponse.data?.data?.id
                      });
                    } else {
                      Fluttertoast.showToast(msg: createAddressResponse.errorMessage ?? 'Failed to create address');
                    }
                  }
                } else {
                  Navigator.pop(context);
                  Fluttertoast.showToast(msg: response.errorMessage ?? 'Failed');
                }
              },
              child: Card(
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  title: Text('${student.firstName} ${student.lastName}'),
                  subtitle: Text('${student.address}\n${student.email}/n${student.phoneNo}'),
                ),
              ),
            );
          },
          noItemsFoundIndicatorBuilder: (context) => const Center(
            child: Text('No students found!'),
          ),
        ),
      ),
    );
  }

  void _showBottomSheet({
    required List<AddressData> items,
    required Function(AddressData data) onClick,
  }) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
          height: 270,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Select Address',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView(
                  children: items
                      .map((e) => InkWell(
                            onTap: () {
                              onClick(e);
                            },
                            child: ListTile(
                              title: Text("${e.address}"),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CustomChips extends StatelessWidget {
  const _CustomChips({
    Key? key,
    required this.data,
    required this.isSelected,
    required this.onClick,
  }) : super(key: key);

  final ItemListData data;
  final bool isSelected;
  final Function(ItemListData data) onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick(data);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: isSelected ? Colors.green : Colors.grey,
        ),
        child: Text(
          '${data.name}',
        ),
      ),
    );
  }
}
