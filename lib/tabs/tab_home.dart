import 'package:carrotmarket_app/theme.dart';
import 'package:flutter/material.dart';
import "package:flutter/cupertino.dart";
import 'package:intl/intl.dart';
import "package:provider/provider.dart";
import 'package:carrotmarket_app/models/model_product.dart';
import "package:carrotmarket_app/providers/provider_product.dart";

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return FutureBuilder(
        future: productProvider.fetchProducts(),
        builder: (context, snapshot) {
          return Scaffold(
              appBar: AppBar(
                title: Row(
                  children: [
                    Text("당산동"),
                    SizedBox(
                      width: 4.0,
                    ),
                    Icon(CupertinoIcons.chevron_down, size: 15.0),
                  ],
                ),
                actions: [
                  IconButton(
                      icon: const Icon(CupertinoIcons.search),
                      onPressed: () {}),
                  IconButton(
                      icon: const Icon(CupertinoIcons.list_dash),
                      onPressed: () {}),
                  IconButton(
                      icon: const Icon(CupertinoIcons.bell), onPressed: () {})
                ],
                //* 여기서도 tabBar를 만들 수는 있는데, 이미 bottom이 있으니까 구분선 정도로만 만들자
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(0.5),
                  child: Divider(
                    thickness: 0.5,
                    height: 0.5,
                    color: Colors.grey,
                  ),
                ),
              ),
              body: productProvider.products.length != 0
                  ? ListView.separated(
                      itemBuilder: (context, index) => const Divider(
                            height: 0,
                            indent: 16,
                            endIndent: 16,
                          ),
                      separatorBuilder: (context, index) =>
                          ProductCard(product: productProvider.products[index]),
                      itemCount: productProvider.products.length)
                  : Center(
                      child: CircularProgressIndicator(),
                    ));
        });
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              product.urlToImage,
              width: 115,
              height: 115,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          //* ProductDetail
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.title, style: textTheme().bodyText1),
              const SizedBox(height: 4.0),
              Text("${product.title} • ${product.publishedAt}"),
              const SizedBox(height: 4.0),
              Text('${NumberFormat("#,###").format(int.parse(product.price))}원',
                  style: textTheme().headline2),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Visibility(
                      visible: product.commentsCount > 0,
                      child: _buildIcons(
                        iconData: CupertinoIcons.chat_bubble_2,
                        count: product.commentsCount,
                      )),
                  SizedBox(width: 8),
                  Visibility(
                      visible: product.heartCount > 0,
                      child: _buildIcons(
                        iconData: CupertinoIcons.heart,
                        count: product.heartCount,
                      )),
                ],
              )
            ],
          )),
        ],
      ),
    );
  }
}

class _buildIcons extends StatelessWidget {
  final IconData iconData;
  final int count;
  const _buildIcons({
    super.key,
    required this.iconData,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData, size: 14.0),
        const SizedBox(width: 4.0),
        Text("$count")
      ],
    );
  }
}
