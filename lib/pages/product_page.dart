import 'package:flutter/material.dart';
import '../model/product.dart';
import '../services/product.dart';
import 'product_list_page.dart';

class ProductPage extends StatefulWidget{
  @override
  ProductPageState createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage>{

  ProductListModal listData = ProductListModal([]);

  int page = 0;
  //获取产品列表并且回调
  void getProductList() async{
    var data = await getProductResult(page++);
    ProductListModal list = ProductListModal.fromJson(data);

    setState(() {
      listData.data.addAll(list.data);
    });
  }

  @override
  void initState(){
    getProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Page view
    return ProductResultListWidget(listData,getNextPage: () => getProductList(),);

  }
}
