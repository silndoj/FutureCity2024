import 'package:flutter/material.dart';


class Rewards extends StatefulWidget {
  const Rewards({Key? key}) : super(key: key);

  @override
  _RewardsState createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {

  int currentPoints = 758; // Example current points

  void redeemReward(int price) {
    setState(() {
      currentPoints -= price; // Decrease points
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Redeem Your Mobility Points text above the points bar
              Text(
                'Redeem Your Mobility Points',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),

              // Add a row to display available mobility points and center the content
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.bike_scooter,
                      color: Colors.black,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      '$currentPoints Points', // Dynamic points display
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Rewards grid
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: rewardNames.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => _showRewardDetails(
                        context,
                        index,
                        int.parse(rewardPrices[index].split(' ')[0]), // Extract price
                      ),
                      child: RewardCard(
                        imagePath: rewardImages[index],
                        rewardName: rewardNames[index],
                        price: rewardPrices[index],
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

  void _showRewardDetails(BuildContext context, int index, int rewardPrice) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  rewardNames[index],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Text(
                  'Price: ${rewardPrices[index]}',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 12),
                // Display the description of the selected reward
                Text(
                  rewardDescriptions[index], // Display the corresponding description
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (currentPoints >= rewardPrice) {
                  redeemReward(rewardPrice); // Deduct points
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Reward Redeemed! You can find your reward in the MyReward section insite the Profile tab.')),
                  );
                } else {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Not enough points to redeem this reward.')),
                  );
                }
              },
              child: Text(
                'Redeem Reward',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

class RewardCard extends StatelessWidget {
  final String imagePath;
  final String rewardName;
  final String price;

  const RewardCard({
    required this.imagePath,
    required this.rewardName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  rewardName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Reward data
final List<String> rewardImages = [
  'assets/icons/escooter_unlock.jpeg',
  'assets/icons/transport_discount.jpg',
  'assets/icons/free_parking.jpg',
  'assets/icons/travel_credit.jpg',
  'assets/icons/dining_discount.jpg',
  'assets/icons/free_coffee.jpg',
  'assets/icons/escooter_unlock.jpeg',
  'assets/icons/free_lunch.jpg',
];

final List<String> rewardNames = [
  'One Free E-Scooter Unlock',
  '50% Off Communal Transport Monthly Ticket',
  'Free Parking for 2 Hours',
  '1 Free Bus Ride',
  '15€ Pool Credit',
  '20% Off on Selected Stores',
  '5 Minute Free E-Scooter Credit',
  'Free Lunch Voucher',
];

final List<String> rewardPrices = [
  '200 Points',
  '500 Points',
  '350 Points',
  '150 Points',
  '800 Points',
  '200 Points',
  '200 Points',
  '600 Points',
];

final List<String> rewardDescriptions = [
  'Unlock your ride with a free e-scooter unlock, courtesy of our partnership with Dott! Simply open the Dott app, find a nearby scooter, and enjoy a free unlock.',
  'Enjoy 50% off the Deutschland Ticket, valid for all regional trains and public transport. Redeemed in partnership with DB.',
  'Get 2 hours of free parking at the Bildungscampus parking lots. Redeemed in partnership with the local campus parking facilities.',
  'Get a free bus ride, anywhere, anytime! Just redeem this offer, and take a ride on the public bus without paying for the fare.',
  'Get 15€ in pool credits to use for your favorite Soleo location. Whether you’re swimming for leisure or exercise, this offer covers your entrance fee!',
  'Get 20% off on selected clothing stores in the city. Please check the list of participating stores before redeeming this offer.',
  'Enjoy a 5-minute free e-scooter ride with Dott, redeemable at any available scooter in the city.',
  'Redeem a free lunch voucher at the Bildungscampus Mensa. Enjoy a delicious meal on us! Voucher value 5€',
];