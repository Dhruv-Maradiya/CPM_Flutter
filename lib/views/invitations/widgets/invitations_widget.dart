import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/utils/app_utils.dart';
import 'package:projectify/views/home/widgets/custom_app_bar.dart';
import 'package:projectify/views/home/widgets/home_screen_drawer.dart';
import 'package:projectify/views/invitations/controllers/invitations_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart' as pull_to_refresh;

class InvitationsWidget extends StatelessWidget {
  InvitationsWidget({super.key});

  final InvitationsController _controller = Get.put(InvitationsController());

  @override
  Widget build(BuildContext context) {
    pull_to_refresh.RefreshController sentRefreshController =
        pull_to_refresh.RefreshController(
      initialRefresh: false,
    );
    onSentRefresh() async {
      await _controller.fetchSentInvitations();
      sentRefreshController.loadComplete();
    }

    pull_to_refresh.RefreshController receiveRefreshController =
        pull_to_refresh.RefreshController(
      initialRefresh: false,
    );
    onReceiveRefresh() async {
      await _controller.fetchReceivedInvitations();
      sentRefreshController.loadComplete();
    }

    return Stack(
      children: [
        Scaffold(
          appBar: CustomAppBar(
            isMenubarToShow: true,
            title: "",
          ),
          drawer: HomeScreenDrawer(),
          backgroundColor: Pallets.appBgColor,
          body: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Pallets.appBarColor,
                      borderRadius: BorderRadius.circular(
                        7.0,
                      ),
                    ),
                    child: TabBar(
                      controller: _controller.tabController,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          7.0,
                        ),
                        color: Pallets.primaryColor,
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      tabs: const [
                        Tab(
                          child: Text(
                            'Sent',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Received',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _controller.tabController,
                      children: [
                        // second tab bar view widget
                        Obx(
                          () => _controller.isSentInvitationsLoading.value
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Pallets.primaryColor,
                                  ),
                                )
                              : !_controller.isSentInvitationSuccess.value
                                  ? Center(
                                      child: InkWell(
                                          onTap: () {
                                            _controller.fetchSentInvitations();
                                          },
                                          child: const Icon(
                                            Icons.refresh,
                                            color: Pallets.primaryColor,
                                            size: 50,
                                          )))
                                  : pull_to_refresh.SmartRefresher(
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      controller: sentRefreshController,
                                      onRefresh: onSentRefresh,
                                      header:
                                          const pull_to_refresh.ClassicHeader(
                                        completeDuration: Duration(seconds: 1),
                                      ),
                                      enablePullDown: true,
                                      child: _controller
                                              .sentInvitations.isNotEmpty
                                          ? ListView.builder(
                                              itemCount: _controller
                                                  .sentInvitations.length,
                                              itemBuilder: (context, index) {
                                                var invitation = _controller
                                                    .sentInvitations[index];
                                                return Container(
                                                  margin: const EdgeInsets.only(
                                                    top: 10,
                                                  ),
                                                  child: Card(
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(12),
                                                      ),
                                                      side: BorderSide(
                                                        color: Pallets
                                                            .primaryColor,
                                                        width: .75,
                                                      ),
                                                    ),
                                                    color: Pallets.white,
                                                    elevation: 2,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        vertical: 10,
                                                        horizontal: 12,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          const Material(
                                                            shape: CircleBorder(
                                                              side: BorderSide(
                                                                color: Pallets
                                                                    .primaryColor,
                                                                width: 1,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          10.0),
                                                              child: Icon(
                                                                Icons
                                                                    .person_add_alt_1,
                                                                size: 20,
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 20,
                                                          ),
                                                          Expanded(
                                                            flex: 4,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  invitation
                                                                      .member
                                                                      .name,
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Text(
                                                                  invitation
                                                                      .group
                                                                      .name,
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          Expanded(
                                                            flex: 2,
                                                            child: Text(
                                                              invitation.status
                                                                      .capitalize ??
                                                                  "",
                                                              style:
                                                                  const TextStyle(
                                                                color: Pallets
                                                                    .primaryColor,
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            )
                                          : const Center(
                                              child: Text(
                                                "No invitations found",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                    ),
                        ),
                        // second tab bar view widget
                        Obx(
                          () => _controller.isReceivedInvitationsLoading.value
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Pallets.primaryColor,
                                  ),
                                )
                              : !_controller.isReceivedInvitationSuccess.value
                                  ? Center(
                                      child: InkWell(
                                          onTap: () {
                                            _controller
                                                .fetchReceivedInvitations();
                                          },
                                          child: const Icon(
                                            Icons.refresh,
                                            color: Pallets.primaryColor,
                                            size: 50,
                                          )))
                                  : pull_to_refresh.SmartRefresher(
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      controller: receiveRefreshController,
                                      onRefresh: onReceiveRefresh,
                                      header:
                                          const pull_to_refresh.ClassicHeader(
                                        completeDuration: Duration(seconds: 1),
                                      ),
                                      enablePullDown: true,
                                      child:
                                          _controller.receivedInvitations
                                                  .isNotEmpty
                                              ? ListView.builder(
                                                  itemCount: _controller
                                                      .receivedInvitations
                                                      .length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    var invitation = _controller
                                                            .receivedInvitations[
                                                        index];
                                                    return Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                        top: 10,
                                                      ),
                                                      child: Card(
                                                        shape:
                                                            const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(12),
                                                          ),
                                                          side: BorderSide(
                                                            color: Pallets
                                                                .primaryColor,
                                                            width: .75,
                                                          ),
                                                        ),
                                                        color: Pallets.white,
                                                        elevation: 2,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                            vertical: 10,
                                                            horizontal: 12,
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              const Material(
                                                                shape:
                                                                    CircleBorder(
                                                                  side:
                                                                      BorderSide(
                                                                    color: Pallets
                                                                        .primaryColor,
                                                                    width: 1,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              10.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .person_add_alt_1,
                                                                    size: 20,
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 20,
                                                              ),
                                                              Expanded(
                                                                flex: 3,
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      invitation
                                                                          .group
                                                                          .name,
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Text(
                                                                      invitation
                                                                          .groupLeader
                                                                          .name,
                                                                      maxLines:
                                                                          1,
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            10,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                      ),
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              const Spacer(),
                                                              [
                                                                "ACCEPTED",
                                                                "REJECTED"
                                                              ].contains(
                                                                      invitation
                                                                          .status)
                                                                  ? Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Text(
                                                                        invitation.status.capitalize ??
                                                                            "",
                                                                        style:
                                                                            const TextStyle(
                                                                          color:
                                                                              Pallets.primaryColor,
                                                                        ),
                                                                      ),
                                                                    )
                                                                  : Expanded(
                                                                      flex: 3,
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Material(
                                                                            color: const Color.fromARGB(
                                                                                200,
                                                                                189,
                                                                                25,
                                                                                25),
                                                                            shape:
                                                                                const CircleBorder(
                                                                              side: BorderSide(
                                                                                color: Colors.white,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(6.0),
                                                                              child: InkWell(
                                                                                onTap: () {
                                                                                  _controller.updateInvitation(id: invitation.id, status: "REJECTED");
                                                                                },
                                                                                child: const Icon(
                                                                                  Icons.close,
                                                                                  color: Pallets.primaryColor,
                                                                                  size: 30,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                10,
                                                                          ),
                                                                          Material(
                                                                            color: const Color.fromARGB(
                                                                                255,
                                                                                76,
                                                                                175,
                                                                                0),
                                                                            shape:
                                                                                const CircleBorder(
                                                                              side: BorderSide(
                                                                                color: Colors.white,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(6.0),
                                                                              child: InkWell(
                                                                                onTap: () {
                                                                                  _controller.updateInvitation(id: invitation.id, status: "ACCEPTED");
                                                                                },
                                                                                child: const Icon(
                                                                                  Icons.check,
                                                                                  color: Pallets.primaryColor,
                                                                                  size: 30,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                )
                                              : const Center(
                                                  child: Text(
                                                    "No invitations found",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                    ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Obx(
          () => _controller.isUpdateInvitationLoading.value
              ? AppUtils.getFullScreenLoader()
              : const SizedBox.shrink(),
        )
      ],
    );
  }
}
