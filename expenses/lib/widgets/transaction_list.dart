import 'package:expenses/models/transaction.dart';
import 'package:expenses/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> txs;
  final Function removeTx;

  TransactionList(this.txs, this.removeTx);

  @override
  Widget build(BuildContext context) {
    return txs.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constrain) {
              return Column(
                children: <Widget>[
                  Text(
                    'No Transactions added yet',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constrain.maxHeight * 0.5,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView(
            children: txs
                .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      tx: tx,
                      removeTx: removeTx,
                    ))
                .toList(),
          );
  }
}

// return Card(
//   child: Row(
//     children: <Widget>[
//       Container(
//         margin: EdgeInsets.symmetric(
//           vertical: 10,
//           horizontal: 15,
//         ),
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: Theme.of(context).primaryColor,
//             width: 2,
//           ),
//         ),
//         padding: EdgeInsets.all(10),
//         child: Text(
//           '\$${tx.amount.toStringAsFixed(2)}',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//             color: Theme.of(context).primaryColor,
//           ),
//         ),
//       ),
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             tx.title,
//             style: Theme.of(context).textTheme.title,
//           ),
//           Text(
//             DateFormat('yyyy-MM-dd').format(tx.date),
//             style: TextStyle(color: Colors.grey),
//           ),
//         ],
//       ),
//     ],
//   ),
// );
