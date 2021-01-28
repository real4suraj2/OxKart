import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:oxkart/services/auth.dart';

class Store {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<dynamic>> get cart async {
    User user = await Auth().user.first;
    // print(user.phoneNumber);
    List data = [];
    await _firestore
        .collection('carts')
        .doc(user.phoneNumber)
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.data() != null)
        documentSnapshot.data().forEach((k, v) {
          data.add({'item': k, 'quantity': v});
        });
    });
    return data;
  }

  Future<List<dynamic>> get categories async {
    List<dynamic> data = [];
    await _firestore
        .collection('categories')
        .get()
        .then((QuerySnapshot querySnapshot) => {
              if (querySnapshot.docs != null)
                querySnapshot.docs.forEach((doc) {
                  data.add({
                    'name': doc['name'].toString(),
                    'url': doc['url'].toString(),
                    'collection': doc['collection'].toString(),
                  });
                })
            });
    return data;
  }

  Future<List<String>> collections() async {
    List<String> data = [];
    await _firestore
        .collection('categories')
        .get()
        .then((QuerySnapshot querySnapshot) => {
              if (querySnapshot.docs != null)
                querySnapshot.docs.forEach((doc) {
                  data.add(doc['collection'].toString());
                })
            });
    return data;
  }

  Future<Map<String, List<dynamic>>> get products async {
    List<String> available = await collections();
    Map<String, List<dynamic>> content = {};
    for (String item in available) {
      List<dynamic> data = [];
      await _firestore
          .collection(item)
          .get()
          .then((QuerySnapshot querySnapshot) {
        if (querySnapshot.docs != null)
          querySnapshot.docs.forEach((doc) {
            data.add({
              'title': doc['title'].toString(),
              'url': doc['url'].toString(),
              'price': doc['price'].toString()
            });
          });
      });
      // print(data);
      content[item.toString()] = data;
    }
    // print(content);
    return content;
  }

  Future<List<dynamic>> get banners async {
    List<dynamic> data = [];
    await _firestore
        .collection('banners')
        .get()
        .then((QuerySnapshot querySnapshot) => {
              if (querySnapshot.docs != null)
                querySnapshot.docs.forEach((doc) => {
                      data.add({'slogan': doc['slogan'], 'url': doc['url']})
                    })
            });
    return data;
  }

  Future<void> updateCart(Map<String, String> data) async {
    User user = await Auth().user.first;
    // print(data);
    await _firestore
        .collection('carts')
        .doc(user.phoneNumber)
        .update(data)
        .then((value) => print("Cart Updated"))
        .catchError((error) => print("Failed to update cart: $error"));
  }

  Future<void> deleteProduct(String item) async {
    User user = await Auth().user.first;
    await _firestore
        .collection('carts')
        .doc(user.phoneNumber)
        .update({item: FieldValue.delete()})
        .then((value) => print("Product Deleted"))
        .catchError((error) => print("Failed to delete product: $error"));
  }

  Future<void> addProduct(String item) async {
    User user = await Auth().user.first;
    List<dynamic> data = await cart;
    Map<String, dynamic> newData = {};
    int value = 1;
    for (dynamic t in data) {
      newData.addAll({t['item']: t['quantity']});
      if (t['item'] == item) value = int.parse(t['quantity']) + 1;
    }
    newData.addAll({item: value.toString()});
    // print(newData);
    await _firestore
        .collection('carts')
        .doc(user.phoneNumber)
        .set(newData)
        .then((value) => print("Product Added"))
        .catchError((error) => print("Failed to add product: $error"));
  }

  Future<void> placeOrder() async {
    User user = await Auth().user.first;
    List<dynamic> data = await cart;
    Map<String, dynamic> newData = {};
    for (dynamic t in data) {
      newData.addAll({t['item']: t['quantity']});
    }
    newData['phone-number'] = user.phoneNumber;
    await _firestore
        .collection('orders')
        .add(newData)
        .then((value) => print("Order Placed"))
        .catchError((error) => print("Failed to place order: $error"));

    await _firestore
        .collection('carts')
        .doc(user.phoneNumber)
        .set({})
        .then((value) => print("Cart Cleared"))
        .catchError((error) => print("Failed to clear cart: $error"));
  }
}
