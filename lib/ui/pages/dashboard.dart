import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:symfonia/core/bloc/get_coins/get_coin_bloc.dart';
import 'package:symfonia/models/coin_response.dart';
import 'package:symfonia/ui/pages/components/build_error.dart';
import 'package:symfonia/utils/colors_consts.dart';

import 'components/build_loading.dart';
import 'components/custom_header.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    coinBloc..getCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10,
          ),
          child: Column(
            children: [
              customAppBar(),
              SizedBox(
                height: 25,
              ),
              Expanded(
                child: StreamBuilder<CoinResponse>(
                    stream: coinBloc.subject.stream,
                    builder: (context, AsyncSnapshot<CoinResponse> snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.hasError) {
                          return buildError(snapshot.data!.error);
                        }
                        return buildCoinsTest(snapshot.requireData, context);
                      } else if (snapshot.hasError) {
                        return buildError(snapshot.data!.error);
                      } else {
                        return buildLoading();
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildCoinsTest(CoinResponse response, context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child: ListView.builder(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        itemCount: response.coins.length,
        itemBuilder: (BuildContext context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                  padding: EdgeInsets.all(20.0),
                  height: 90,
                  width: 60,
                  decoration: BoxDecoration(
                    color: ColorPath.WHITE,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Image(
                    fit: BoxFit.contain,
                    image: NetworkImage(response.coins[index].image),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 200,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          response.coins[index].marketCapChangePercentage24H > 0
                              ? "Received"
                              : "Sent",
                          style: GoogleFonts.poppins(
                            color: ColorPath.GREY,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "\$${response.coins[index].currentPrice.roundToDouble()} ${response.coins[index].name}",
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            color: ColorPath.BLACK,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${DateFormat.ms().add_yMMMd().format(response.coins[index].lastUpdated)}",
                          style: GoogleFonts.poppins(
                            color: ColorPath.GREY,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ]),
                ),
              ]),
              Text(
                response.coins[index].marketCapChangePercentage24H > 0
                    ? "+${response.coins[index].marketCapChangePercentage24H.toStringAsFixed(2)} %"
                    : "${response.coins[index].marketCapChangePercentage24H.toStringAsFixed(2)} %",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: response.coins[index].marketCapChangePercentage24H > 0
                      ? ColorPath.GREEN
                      : ColorPath.RED,
                  fontSize: 16,
                ),
              )
            ],
          );
        }),
  );
}