import 'package:flutter/material.dart';
import 'package:path_o_wheels/lab_tests/test_description.dart';

// ignore: use_key_in_widget_constructors
class TestList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var contentPadding = const EdgeInsets.all(5);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.deepOrange.shade400,
        title: const Text(
          'Popular Tests',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Card(
            color: Colors.white,
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 3, 12),
              child: ListTile(
                contentPadding: contentPadding,
                title: const Text(
                  'Blood Glucose',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                subtitle: const Text(
                  "Diagnosis of blood sugar levels(glucose) to reduce the risk of diabetes and heart disease.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TestDescription(testName: 'blood glucose'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Card(
            color: Colors.white,
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 3, 12),
              child: ListTile(
                contentPadding: contentPadding,
                title: const Text(
                  'Blood Group',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                subtitle: const Text(
                  "Classification of blood based on inherited differences in antigens on the surfaces of the red blood cells.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TestDescription(testName: 'blood group'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Card(
            color: Colors.white,
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 3, 12),
              child: ListTile(
                contentPadding: contentPadding,
                title: const Text(
                  'CBC',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                subtitle: const Text(
                  "Evaluation of  several components and features of blood including RBCs.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TestDescription(testName: 'cbc'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Card(
            color: Colors.white,
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 3, 12),
              child: ListTile(
                contentPadding: contentPadding,
                title: const Text(
                  'Cholestrol',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                subtitle: const Text(
                  "Diagnosis of cholesterol level in the blood, and determining the risk of heart disease.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TestDescription(testName: 'cholestrol'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            height: 15,
          ),
          Card(
            color: Colors.white,
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 3, 12),
              child: ListTile(
                contentPadding: contentPadding,
                title: const Text(
                  'Covid Antigen',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                subtitle: const Text(
                  "Diagnosis of SARS-CoV-2(corona virus) proteins in the sample, allowing early detection of the infection.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TestDescription(testName: 'covid antigen'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Card(
            color: Colors.white,
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 3, 12),
              child: ListTile(
                contentPadding: contentPadding,
                title: const Text(
                  'Dengue Antigen',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                subtitle: const Text(
                  "Diagnosis of  non-structural protein NS1 of dengue virus secreted into the blood during dengue infection.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TestDescription(testName: 'dengue antigen'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Card(
            color: Colors.white,
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 3, 12),
              child: ListTile(
                contentPadding: contentPadding,
                title: const Text(
                  'Haemoglobin',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                subtitle: const Text(
                  "Diagnosis of red protein responsible for transporting oxygen in the blood of vertebrates.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TestDescription(testName: 'haemoglobin'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Card(
            color: Colors.white,
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 3, 12),
              child: ListTile(
                contentPadding: contentPadding,
                title: const Text(
                  'Insulin',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                subtitle: const Text(
                  "Diagnosis of hormone that regulates the level of sugar(glucose) in the blood produced by the islets of Langerhans in the pancreas.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TestDescription(testName: 'insulin'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Card(
            color: Colors.white,
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 3, 12),
              child: ListTile(
                contentPadding: contentPadding,
                title: const Text(
                  'Malaria Antigen',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                subtitle: const Text(
                  "Rapid antigen test type that allows quick diagnosis of malaria.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TestDescription(testName: 'malaria antigen'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Card(
            color: Colors.white,
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 3, 12),
              child: ListTile(
                contentPadding: contentPadding,
                title: const Text(
                  'Pregnancy Test',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                subtitle: const Text(
                  "A pregnancy test is used to determine whether a woman is pregnant or not.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TestDescription(testName: 'pregnancy test'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Card(
            color: Colors.white,
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 3, 12),
              child: ListTile(
                contentPadding: contentPadding,
                title: const Text(
                  'Rabies Antigen',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                subtitle: const Text(
                  "Diagnosis of blood to evaluate the level of Rabies Antibodies in the blood.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TestDescription(testName: 'rabbies antigen'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Card(
            color: Colors.white,
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 3, 12),
              child: ListTile(
                contentPadding: contentPadding,
                title: const Text(
                  'Vitamin B12',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                subtitle: const Text(
                  "Checks the amount of Vitamin B12, to gauge the body's overall Vitamain B-12 stores.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TestDescription(testName: 'vitamin B12'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Card(
            color: Colors.white,
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 3, 12),
              child: ListTile(
                contentPadding: contentPadding,
                title: const Text(
                  'Vitamin B1&B6',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                subtitle: const Text(
                  "Checks the amount of Vitamin B1/B6 responsible transporting oxygen through blood streams.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TestDescription(testName: 'vitamin B1&B6'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Card(
            color: Colors.white,
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 3, 12),
              child: ListTile(
                contentPadding: contentPadding,
                title: const Text(
                  'Vitamin C',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                subtitle: const Text(
                  "Checks the amount of ascorbic acid and L-ascorbic acid (Vitamin C).",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TestDescription(testName: 'vitamin C'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Card(
            color: Colors.white,
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 3, 12),
              child: ListTile(
                contentPadding: contentPadding,
                title: const Text(
                  'Vitamin D',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                subtitle: const Text(
                  "Checks the amount of Vitamin D present in the blood.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TestDescription(testName: 'vitamin D'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Card(
            color: Colors.white,
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 5, 12),
              child: ListTile(
                contentPadding: contentPadding,
                title: const Text(
                  'HIV l(quantitative)',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                subtitle: const Text(
                  "Diagonis of HIV or H-RNA(viral load measurements) quantitatively.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TestDescription(testName: 'hiv I'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Card(
            color: Colors.white,
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 3, 12),
              child: ListTile(
                contentPadding: contentPadding,
                title: const Text(
                  'HIV ll(qualitative)',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                subtitle: const Text(
                  "Diagonis of HIV or H-RNA(viral load measurements) qualitatively,(nucleic acid testing or NAT).",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TestDescription(testName: 'hiv II'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
