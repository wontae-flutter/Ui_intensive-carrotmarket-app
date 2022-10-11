import 'package:flutter/material.dart';
import "package:flutter/cupertino.dart";
import "package:carrotmarket_app/tabs/tab_all.dart";

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int _currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* Tabbar / BottomNavigationBar사용 시, 탭을 이동할 때마다 상태 유지가 안 될 때를 방지하고
      //* 상태를 유지하기 위해 사용, indexedStack
      body: IndexedStack(
        index: _currentTabIndex,
        children: [
          HomeTab(),
          NeighborhoodlifeTab(),
          NearmeTab(),
          ChattingTab(),
          MypageTab()
        ],
      ),
      //! IndexScreen에서 bottomNavigationBar이 이미 제공이 되었으니 각 tab에서는 다시 한번 더 제공할 필요는 없습니다
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed, //* 아이템이 3개 이상일 때만
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black54,
          currentIndex: _currentTabIndex,
          onTap: (index) {
            setState(() {
              _currentTabIndex = index;
            });
          },
          items: [
            const BottomNavigationBarItem(
                label: '홈', icon: Icon(CupertinoIcons.home)),
            const BottomNavigationBarItem(
                label: '동네생활', icon: Icon(CupertinoIcons.square_on_square)),
            const BottomNavigationBarItem(
                label: '내 근처', icon: Icon(CupertinoIcons.placemark)),
            const BottomNavigationBarItem(
                label: '채팅', icon: Icon(CupertinoIcons.chat_bubble_2)),
            const BottomNavigationBarItem(
                label: '나의 당근', icon: Icon(CupertinoIcons.person)),
          ]),
    );
  }
}
