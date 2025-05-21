import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final darkBg = Color(0xFF121212); // Match CRED-style dark background

    return Scaffold(
      backgroundColor: darkBg,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        leading: BackButton(color: Colors.white),
        title: Text('Profile', style: TextStyle(color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade800),
              ),
              child: Row(
                children: [
                  Icon(Icons.message_outlined, color: Colors.white, size: 16),
                  SizedBox(width: 6),
                  Text(
                    "support",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Grey top background
      Container(
        color: Colors.grey.shade900,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserInfo(),
            SizedBox(height: 20),
            _buildCredGarageTile(),
            SizedBox(height: 24),
            _buildCreditStats(),
          ],
        ),
      ),

      // Black bottom background
      Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            _buildRewardsAndBenefits(),
            SizedBox(height: 24),
            _buildTransactionsSection(),
          ],
        ),
      ),
    ],
  ),
),

    );
  }

  Widget _buildUserInfo() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage('assets/profile.jpg'), // Replace with your image
      ),
      SizedBox(width: 16),
      Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "placeholder", // or andaz Kumar
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "member since Jan, 2000",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {}, // Add your edit functionality
              icon: Icon(Icons.edit, color: Colors.white, size: 20),
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
            )
          ],
        ),
      ),
    ],
  );
}

  Widget _buildCredGarageTile() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        // borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1.0, color: const Color.fromARGB(255, 139, 132, 132)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.directions_car, color: Colors.white),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "get to know your vehicles, inside out",
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      "CRED garage",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.arrow_right_alt_sharp, color: Colors.white, size: 30),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildCreditStats() {
    return Column(
      children: [
        _buildStatRow("credit score", "0",showArrow: true,highlight: true,separator: true),
        _buildStatRow("lifetime cashback", "₹0",showArrow: true,separator: true),
        _buildStatRow("bank balance", "check",showArrow: true),
      ],
    );
  }

  Widget _buildStatRow(String title, String value,
      {bool highlight = false, bool showArrow = false, bool separator=false}) {
    return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(Icons.circle, size: 8, color: Colors.white),
            SizedBox(width: 10),
            Expanded(
              child: Text(title,
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 15)),
            ),
            if (highlight)
              Text("REFRESH AVAILABLE",
                  style: TextStyle(color: Colors.green, fontSize: 13)),
            SizedBox(width: 8),
            Text(value, style: TextStyle(color: Colors.white, fontSize: 15)),
            if (showArrow)
              Icon(Icons.arrow_right_alt_sharp,
                  size: 25, color: Colors.grey.shade400),
          ],
        ),
      ),
      if (separator)
        Padding(
          padding: const EdgeInsets.only(left: 18.0), // aligns divider with text
          child: Divider(color: Colors.grey.shade800, thickness: 1),
        ),
    ],
  );
  }



  Widget _buildRewardsAndBenefits() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("YOUR REWARDS & BENEFITS",
            style: TextStyle(color: Colors.grey, fontSize: 12)),
        SizedBox(height: 16),
        _buildRewardsRow("cashback balance", "₹0",separator: true),
        _buildRewardsRow("coins", "100",separator: true),
        _buildRewardsRow("win upto Rs 1000", "refer and earn"),
      ],
    );
  }

 Widget _buildRewardsRow(String title, String value ,{ bool separator=false}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  value,
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
                SizedBox(height: 2),
                Icon(Icons.arrow_right_alt_sharp,
                    color: Colors.grey.shade400, size: 20),
              ],
            ),
          ],
        ),
      ),
      if(separator)
        Padding(
          padding: const EdgeInsets.only(left: 0), // optional indent
          child: Divider(color: Colors.grey.shade800, thickness: 1),
        ),
    ],
  );
}


  Widget _buildTransactionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("TRANSACTIONS & SUPPORT",
            style: TextStyle(color: Colors.grey, fontSize: 12)),
        SizedBox(height: 16),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text("all transactions",
              style: TextStyle(color: Colors.white, fontSize: 15)),
          trailing: Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white),
          onTap: () {},
        ),
      ],
    );
  }
}
