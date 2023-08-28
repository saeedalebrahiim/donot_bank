import 'package:flutter/material.dart';

class TransAction extends StatefulWidget {
  const TransAction({super.key});

  @override
  State<TransAction> createState() => _TransActionState();
}

class _TransActionState extends State<TransAction> {
  TextEditingController numctr = TextEditingController();
  int? dropvalue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: Text(
          "Submit Money",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 450,
              height: 100,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 25),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(),
                  ),
                ],
                scrollDirection: Axis.horizontal,
              ),
            ),
            Text(
              "lorem ipsdfsdf",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 171,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(35)),
              child: DropdownButton(
                  hint: Text("Please Choose Card"),
                  items: [
                    DropdownMenuItem(child: Text("data"), value: 1),
                    DropdownMenuItem(
                      child: Text("sfsf"),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text("fasf"),
                      value: 3,
                    ),
                    DropdownMenuItem(
                      child: Text("gdfgd"),
                      value: 4,
                    ),
                  ],
                  value: dropvalue,
                  onChanged: (a) {
                    dropvalue = a!;
                    setState(() {});
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 150,
              child: TextField(
                controller: numctr,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 450,
              height: 400,
              decoration: BoxDecoration(color: Colors.black),
              child: GridView.builder(
                itemCount: 12,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 1.5),
                itemBuilder: (context, index) {
                  return RawMaterialButton(
                    onPressed: () {
                      if (index == 11) {
                        String vv =
                            numctr.text.substring(0, numctr.text.length - 1);
                        numctr.text = vv;
                      } else {
                        numctr.text = numctr.text +
                            (index == 9
                                ? "."
                                : index == 10
                                    ? "0"
                                    : (index + 1).toString());
                      }
                    },
                    child: index == 11
                        ? Icon(
                            Icons.backspace,
                            color: Colors.white,
                          )
                        : Text(
                            index == 9
                                ? "."
                                : index == 10
                                    ? "0"
                                    : ((index) + 1).toString(),
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
