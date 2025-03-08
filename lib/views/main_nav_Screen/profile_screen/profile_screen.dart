import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theadsclone/utils/app_assets_path.dart';
import 'package:theadsclone/utils/styles/button_style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(onPressed: () {}, icon: Icon(Icons.language)),
        centerTitle: false,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.sort))],
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 160,
                collapsedHeight: 160,
                automaticallyImplyLeading: false,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    spacing: 12,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            spacing: 8,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Shougot Mollik',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                  width: context.width * 0.65,
                                  child: Text(
                                    'Mobile app developer . tech stack would be flutter and supabase',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ))
                            ],
                          ),
                          CircleAvatar(
                            radius: 45,
                            backgroundImage: AssetImage(AppAssetsPath.avatar),
                          )
                        ],
                      ),
                      Row(
                        spacing: 20.0,
                        children: [
                          Expanded(
                              child: OutlinedButton(
                                  onPressed: () {},
                                  style: customOutlineButtonStyle(),
                                  child: const Text('Edit Profile'))),
                          Expanded(
                              child: OutlinedButton(
                                  onPressed: () {},
                                  style: customOutlineButtonStyle(),
                                  child: const Text('Share Profile'))),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                floating: true,
                pinned: true,
                delegate: SliverAppBarDelegate(
                  TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(text: 'Threads'),
                      Tab(text: 'Replies'),
                    ],
                  ),
                ),
              )
            ];
          },
          body: TabBarView(
            children: [
              Text('i am threads tab'),
              Text('I am Replies tab'),
            ],
          ),
        ),
      ),
    );
  }
}

// ** Sliver persistent Header
class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
