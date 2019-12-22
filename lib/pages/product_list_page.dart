import 'package:flutter/material.dart';
import 'package:flutter_website/style/font.dart';
import '../model/product.dart';
import 'product_detail_page.dart';
import '../style/color.dart';

class ProductResultListWidget extends StatelessWidget {
  //列表数据
  final ProductListModal list;

  //获取下一页
  final VoidCallback getNextPage;

  //Constructor
  ProductResultListWidget(this.list, {this.getNextPage});

  @override
  Widget build(BuildContext context) {
    return list.data.length == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            //列表项数据
            itemCount: list.data.length,
            itemBuilder: (BuildContext context, int i) {
            ProductItemModal item = list.data[i];
            //加载一页
            if ((i + 4) == list.data.length) {
              getNextPage();
            }
            return GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    //传进参数 可查看product_detail_page Constructor的修改
                    MaterialPageRoute(builder: (context) => ProductDetail(item:item))
                );
              },
              child: Container(
                //列表项背景
                color: ProductColors.bgColor,
                padding: EdgeInsets.only(
                  top: 5.0,
                  right: 5.0
                ),
                child: Row(
                  children: <Widget>[
                    //产品图片
                    Image.asset(
                      item.imageUrl,
                      width: 120.0,
                      height: 120.0,
                    ),
                    //防止UI溢出的组件
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: ProductColors.divideLineColor,
                            )
                          )
                        ),
                        //产品信息垂直布局
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              item.desc,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 5,
                                ),
                                //产品类型
                                Text(
                                  item.type,
                                  style:TextStyle(
                                    fontSize: 16.0,
                                    color:ProductColors.typeColor
                                  ) ,
                                ),
                                //产品特点
                                item.point == null ? SizedBox():
                                    Container(
                                      child: Text(
                                        item.point,
                                        style: TextStyle(
                                          color: ProductColors.pointColor
                                        ),
                                      ),
                                      padding:  EdgeInsets.symmetric(horizontal: 3),
                                      margin: EdgeInsets.only(left: 4),
                                      decoration: BoxDecoration(border: Border.all(width: 1,color: ProductColors.pointColor)),
                                    )
                              ],
                            ),
                            Text(
                              item.name,
                              style: ProductFonts.itemNameStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

              ),
            );
          });
  }
}
