import 'package:flutter/material.dart';
import 'package:tugas_besar_1/ui/produk/Prod_Add.dart';
import 'package:tugas_besar_1/ui/produk/Prod_Detail.dart';

import '../../dataclass/ProdukClass.dart';

class ProdIndex extends StatefulWidget {
  const ProdIndex({Key? key}) : super(key: key);

  @override
  State<ProdIndex> createState() => _ProdIndex();
}

class _ProdIndex extends State<ProdIndex> {
  List<ProductClass> lsProduct = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Product"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () async {
                var result = await Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return ProdAdd(lsProduct: lsProduct);
                    })
                );

                setState(() {
                  var id = 1;
                  lsProduct = [];
                  if (result is List<ProductClass>) {
                    for (var res in result) {
                      lsProduct.add(ProductClass(id: id,
                          name: res.name,
                          description: res.description,
                          price: res.price));
                      id += 1;
                    }
                  }
                });
              },
              icon: const Icon(Icons.add, color: Colors.white,)
          )
        ],
      ),
      body: lsProduct.isEmpty
          ? Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
              child: const Row(
                children: [
                  SizedBox(
                    width: 50,
                    child: Icon(Icons.shopping_cart),
                  ),
                  SizedBox(
                    child: Text("No Products Available"),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemCount: lsProduct.length,
              itemBuilder: (context, index) {
                var product = lsProduct[index];

                return InkWell(
                  splashColor: Colors.lightBlue,
                  onTap: () async {
                    var result = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProdDetail(
                            id: product.id,
                            lsProduct: lsProduct)));

                    setState(() {
                      var id = 1;
                      lsProduct = [];
                      if (result is List<ProductClass>) {
                        for (var res in result) {
                          lsProduct.add(ProductClass(id: id,
                              name: res.name,
                              description: res.description,
                              price: res.price));
                          id += 1;
                        }
                      }
                    });
                  },
                  child: Card(
                    color: Colors.lightBlue,
                    child: ListTile(
                      splashColor: Colors.lightBlue,
                      leading: const Icon(Icons.shopping_cart, size: 56.0, color: Colors.white),
                      title: Text(product.name, style: const TextStyle(color: Colors.white)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Price: Rp. ${product.price.toStringAsFixed(0)}", style: const TextStyle(color: Colors.white)),
                          Text("Description: ${product.description}", style: const TextStyle(color: Colors.white)),
                        ],
                      ),
                      isThreeLine: true, // Ensures space for description and price
                    ),
                  ),
                );
              },
            )
    );
  }
}