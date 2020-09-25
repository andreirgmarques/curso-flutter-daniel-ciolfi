import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gerente_loja/screens/product_screen.dart';
import 'package:gerente_loja/widgets/edit_category_dialog.dart';

class CategoryTile extends StatefulWidget {
  final DocumentSnapshot category;

  CategoryTile(this.category);

  @override
  _CategoryTileState createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final category = widget.category;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Card(
        child: ExpansionTile(
          leading: GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (context) => EditCategoryDialog(
                category: category,
              ),
            ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(category.data['icon']),
              backgroundColor: Colors.transparent,
            ),
          ),
          title: Text(
            category.data['title'],
            style: TextStyle(
              color: Colors.grey[850],
              fontWeight: FontWeight.w500,
            ),
          ),
          children: [
            FutureBuilder(
              future: category.reference.collection('items').getDocuments(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                }

                return Column(
                  children: snapshot.data.documents
                      .map<Widget>(
                        (document) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              document.data['images'][0],
                            ),
                            backgroundColor: Colors.transparent,
                          ),
                          title: Text(document.data['title']),
                          trailing: Text(
                            'R\$${document.data['price'].toStringAsFixed(2)}',
                          ),
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductScreen(
                                categoryId: category.documentID,
                                product: document,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList()
                        ..add(
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: Icon(
                                Icons.add,
                                color: Colors.pinkAccent,
                              ),
                            ),
                            title: Text('Adicionar'),
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ProductScreen(
                                  categoryId: category.documentID,
                                  product: null,
                                ),
                              ),
                            ),
                          ),
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
