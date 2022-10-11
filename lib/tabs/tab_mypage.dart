import 'package:carrotmarket_app/theme.dart';
import 'package:flutter/material.dart';
import "package:flutter/cupertino.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:carrotmarket_app/constants/mypage_menu.dart";

//* 대부분의 앱에서 거의 필수적인 요소
class MypageTab extends StatelessWidget {
  const MypageTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("니의 당근"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(0.5),
            child: Divider(
              thickness: 0.5,
              height: 0.5,
              color: Colors.grey,
            )),
      ),
      body: ListView(
        children: [
          MypageHeader(),
          const SizedBox(height: 8.0),
          IconMenuCard(
            iconMenus: iconMenu1,
          ),
          const SizedBox(height: 8.0),
          IconMenuCard(
            iconMenus: iconMenu2,
          ),
          const SizedBox(height: 8.0),
          IconMenuCard(
            iconMenus: iconMenu3,
          ),
        ],
      ),
    );
  }
}

class MypageHeader extends StatelessWidget {
  const MypageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildProfileRow(),
              const SizedBox(height: 16.0),
              _buildProfileButton(),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildRoundTextButton(
                      buttonName: '판매내역', icon: FontAwesomeIcons.receipt),
                  _buildRoundTextButton(
                      buttonName: '구매내역', icon: FontAwesomeIcons.shoppingBag),
                  _buildRoundTextButton(
                      buttonName: '관심목록', icon: FontAwesomeIcons.heart),
                ],
              )
            ],
          )),
    );
  }
}

class _buildProfileRow extends StatelessWidget {
  const _buildProfileRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            SizedBox(
              width: 65,
              height: 65,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32.5),
                child: Image.network(
                  'https://placeimg.com/200/100/people',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[100],
                  ),
                  child: Icon(Icons.camera_alt_outlined, size: 15),
                )),
          ],
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "developer",
              style: textTheme().headline2,
            ),
            SizedBox(height: 10),
            Text(
              "당산동 #01492",
            )
          ],
        )
      ],
    );
  }
}

class _buildProfileButton extends StatelessWidget {
  const _buildProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFD4D5DD),
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        height: 45,
        child: Center(
            child: Text(
          "프로필 보기",
          style: textTheme().subtitle1,
        )),
      ),
    );
  }
}

class _buildRoundTextButton extends StatelessWidget {
  final String buttonName;
  final IconData icon;

  const _buildRoundTextButton({
    super.key,
    required this.buttonName,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 226, 208, 1),
          border: Border.all(color: Color(0xFFD4D5DD), width: 0.5),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
            child: Icon(
          icon,
          color: Colors.orange,
        )),
      ),
      SizedBox(
        height: 4.0,
      ),
      Text(buttonName),
    ]);
  }
}

class IconMenuCard extends StatelessWidget {
  final List<IconMenu> iconMenus;
  const IconMenuCard({
    super.key,
    required this.iconMenus,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0.5,
        child: Column(
          children: List.generate(
              iconMenus.length,
              (index) => _buildRowIconMenu(
                  title: iconMenus[index].title,
                  iconData: iconMenus[index].iconData)),
        ));
  }
}

class _buildRowIconMenu extends StatelessWidget {
  final String title;
  final IconData iconData;

  const _buildRowIconMenu({
    super.key,
    required this.title,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 50,
      child: Row(
        children: [
          Icon(iconData, size: 17),
          const SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: textTheme().subtitle1,
          )
        ],
      ),
    );
  }
}
