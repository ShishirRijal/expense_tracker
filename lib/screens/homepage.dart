import 'package:expense_tracker/constant.dart';
import 'package:expense_tracker/screens/new_transaction.dart';

import '../models/transactions.dart';
import '../models/categories.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../widgets/round_container.dart';
import '../widgets/app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.username}) : super(key: key);
  final String username;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //get the icon
  IconData? getIcon(String category) {
    if (category == "Entertainment") return Icons.movie_filter;
    if (category == "Food") return Icons.fastfood;
    if (category == "Travel") return Icons.directions_bike;
    if (category == "Shopping") return Icons.shopping_cart;
    if (category == "Income") return Icons.attach_money_rounded;
  }

// categories
  List<Categories> categories = [
    Categories("Entertainment", 0.00, "assets/images/party.jpg"),
    Categories("Food", 0.00, "assets/images/food.jpeg"),
    Categories("Travel", 0.00, "assets/images/travel.jpg"),
    Categories("Shopping", 0.00, "assets/images/shopping.jpg"),
  ];

//user transactions
  List<Transaction> userTransactions = [];

//get the total expenses
  double get getTotalExpense {
    //first I want to set all categories expense to 0, as it was adding to previous in my code
    for (var myCategory in categories) {
      myCategory.amount = 0.00;
    }

    double totalExpense = 0.00;
    for (int i = 0; i < userTransactions.length; i++) {
      if (userTransactions[i].category != 'Income') {
        totalExpense += userTransactions[i].amount;
      }
      //let's calculate the expenses for each categories

      for (var myCategory in categories) {
        if (userTransactions[i].category == myCategory.category) {
          myCategory.amount += userTransactions[i].amount;
          continue;
        }
      }
    }
    return totalExpense;
  }

//get the total income
  double get getTotalIncome {
    double totalIncome = 0.00;
    for (int i = 0; i < userTransactions.length; i++) {
      if (userTransactions[i].category == 'Income') {
        totalIncome += userTransactions[i].amount;
      }
    }
    return totalIncome;
  }

  void _addNewTransaction(
    String category,
    double amount,
    String note,
    DateTime date,
  ) {
    final newTransaction = Transaction(category, amount, date, note);
    setState(() {
      userTransactions.add(newTransaction);
    });
  }

  bool showAllTransactions = false;
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, color: Colors.white, size: 25.0),
        onPressed: () => setState(() {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return NewTransaction(
                addNewTransaction: _addNewTransaction,
              );
            },
          );
        }),
      ),
      backgroundColor: const Color(0xfff5f5f5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyAppBar(name: widget.username),
              RoundContainer(
                  totalExpense: getTotalExpense, totalIncome: getTotalIncome),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showAllTransactions = false;
                      });
                    },
                    child: Text(
                      "Categories",
                      style: showAllTransactions
                          ? kInactiveTextStyle
                          : kActiveTextStyle,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showAllTransactions = true;
                      });
                    },
                    child: Text(
                      "Show All",
                      style: showAllTransactions
                          ? kActiveTextStyle
                          : kInactiveTextStyle,
                    ),
                  ),
                ],
              ),

              // Categories transactions
              if (!showAllTransactions)
                // ignore: sized_box_for_whitespace
                Container(
                  height: deviceHeight * 0.5,
                  child: ListView.builder(
                      shrinkWrap: true,
                      // scrollDirection: Axis.vertical,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 1.0,
                          margin: const EdgeInsets.only(
                            top: 10.0,
                            left: 20.0,
                            right: 20.0,
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 20.0,
                                backgroundImage:
                                    AssetImage(categories[index].link),
                              ),
                              title: Text(
                                categories[index].category,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              trailing: Text(
                                "\$" +
                                    categories[index].amount.toStringAsFixed(2),
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),

              // all the transactions
              if (showAllTransactions)
                Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewPadding.bottom + 20),
                  height: deviceHeight * 0.55,
                  child: ListView.builder(
                    // shrinkWrap: true,
                    itemCount: userTransactions.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 1.0,
                        margin: const EdgeInsets.only(
                          top: 10.0,
                          left: 20.0,
                          right: 20.0,
                        ),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor:
                                  userTransactions[index].category == 'Income'
                                      ? Colors.green
                                      : Colors.deepOrangeAccent,
                              radius: 20.0,
                              child: Icon(
                                  getIcon(userTransactions[index].category),
                                  color: Colors.white),
                            ),
                            title: Text(
                              userTransactions[index].note,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "\$${userTransactions[index].amount}",
                                  style: TextStyle(
                                    color: userTransactions[index].category ==
                                            'Income'
                                        ? Colors.green
                                        : Colors.red,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Text(
                                  DateFormat.yMMMEd()
                                      .format(userTransactions[index].date),
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

//  for (var myCategory in categories) {
//         if (userTransactions[i].category == myCategory.category) {
//           myCategory.amount += userTransactions[i].amount;
//           continue;
//         }
//       }
