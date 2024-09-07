import 'package:cartpagedesign/Presentation%5D/Widgets/BoldText.dart';
import 'package:cartpagedesign/Presentation%5D/Widgets/LightText.dart';
import 'package:flutter/material.dart';

import '../../cart_product_Model/productModel.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartpageState();
}

class _CartpageState extends State<CartPage> {
  final List<CartItem> _cartItems = [
    CartItem(name: 'Pullover', color: 'Black', size: 'L', price: 50),
    CartItem(name: 'T-Shirt', color: 'Gray', size: 'L', price: 30),
    CartItem(name: 'Sport Dress', color: 'Black', size: 'M', price: 43),
    CartItem(name: 'Shoes', color: 'White', size: '42', price: 80),
  ];

  // Calculate the total price
  double get _totalPrice {
    return _cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);
  }

  // Increment item quantity
  void _incrementQuantity(int index) {
    setState(() {
      _cartItems[index].quantity++;
    });
  }

  // Decrement item quantity
  void _decrementQuantity(int index) {
    setState(() {
      if (_cartItems[index].quantity > 1) {
        _cartItems[index].quantity--;
      }
    });
  }

  void _deleteItem(int index) {
    setState(() {
      _cartItems.removeAt(index);
    });
  }

  // Handle checkout action
  void _checkout() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Checkout completed!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              //Row for drawer and user logo
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Icon(Icons.menu),
                  ),
                  const Spacer(),
                  Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade200),
                      child: Image.network(
                          'https://as2.ftcdn.net/v2/jpg/01/12/09/17/1000_F_112091769_vWEmDiwVIpO4H1plGuhYgnmduTuiGUh2.jpg')),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              //Row for Text
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoldText(
                        text: 'My Cart',
                        size: 30,
                      ),
                      LightText(
                        text: 'Bag',
                        size: 25,
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      _deleteItem(0);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),
              //container => Listview.builder for product
              Container(
                height: 350,
                width: double.maxFinite,
                child: ListView.builder(
                  itemCount: _cartItems.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final item = _cartItems[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      height: 100,
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          //Stack for image
                          Container(
                            height: 85,
                            width: 85,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.network(
                              'https://media.istockphoto.com/id/483960103/photo/blank-black-t-shirt-front-with-clipping-path.jpg?s=612x612&w=0&k=20&c=d8qlXILMYhugXGw6zX7Jer2SLPrLPORfsDsfRDWc-50=',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          //Colum for Texts
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(size: 20, text: item.name),
                              RichText(
                                text: TextSpan(
                                  text: 'Color :',
                                  style: DefaultTextStyle.of(context).style,
                                  children: [
                                    TextSpan(
                                        text: item.color,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    const TextSpan(text: ' Size:'),
                                    TextSpan(
                                        text: item.size,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              Row(
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(400),
                                          color: Colors.white),
                                      child: TextButton(
                                          onPressed: () {
                                            _incrementQuantity(index);
                                          },
                                          child: Icon(Icons.add))),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Center(
                                      child: Text(item.quantity.toString(),
                                          style: TextStyle(fontSize: 15))),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(400),
                                          color: Colors.white),
                                      child: TextButton(
                                          onPressed: () {
                                            _decrementQuantity(index);
                                          },
                                          child: Icon(Icons.remove))),
                                ],
                              ),
                            ],
                          ),

                          Spacer(),
                          Container(
                            height: 50,
                            width: 50,
                            child: Text(
                                '\$${(item.price * item.quantity).toString()}',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),

                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              SizedBox(
                height: 40,
              ),
              // container for simple line
              Container(
                height: 2,
                width: double.maxFinite,
                color: Colors.grey.shade200,
              ),
              SizedBox(
                height: 40,
              ),

              //Row for total items and price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LightText(size: 15, text: '${_cartItems.length}  items'),
                  BoldText(size: 20, text: ' \$${_totalPrice.toString()}')
                ],
              ),
              SizedBox(
                height: 40,
              ),

              //container for button
              GestureDetector(
                onTap: _checkout,
                child: Container(
                  height: 50,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(child: BoldText(size: 20, text: 'Next')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
