import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtypet/models/doctor.dart';
import 'package:healtypet/models/service.dart';

List<String>services = Service.all();
var selectedService = 0;

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            _greetings(),
            const SizedBox(height: 16),
            _card(),
            const SizedBox(height: 20),
            _search(),
            const SizedBox(height: 20),
            _sevices(),
            const SizedBox(height: 26),
            _doctors(),
          ],
        ),
      )
    );
  }

  ListView _doctors() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => _doctor(doctors[index]),
      separatorBuilder: (context, index) => const SizedBox(height: 11), 
      itemCount: doctors.length   
    );
  }

  Container _doctor(Doctor doctor) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF35385A).withOpacity(.12),
            blurRadius: 30,
            offset: const Offset(0, 2)
          )
        ]
      ),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8)
            ),
            child: Image.asset("assets/images/doctor/${doctor.image}", width: 88, height: 103),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(doctor.name, style: GoogleFonts.manrope(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF3F3E3F)
              )),
              const SizedBox(height: 7),
              RichText(
                text: TextSpan(
                  text: "Service: ${doctor.service.join(', ')}",
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    color: Colors.black,
                  )
                )
              ),
              const SizedBox(height: 7),
            ],
          ),
        ],
      ),
    );
  }

  SizedBox _sevices() {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        padding: const  EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: selectedService == index ? const Color(0xFF818AF9) : const Color(0xFFF6F6F6),
            borderRadius: BorderRadius.circular(10),
            border: selectedService == index ? Border.all(color: const Color(0XFFF1E5E5).withOpacity(.22), width: 2) : null
          ),
          child: Center(
            child: Text(
              services[index],
              style: GoogleFonts.manrope(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: selectedService == index ? Colors.white : const Color(0xFF3F3E3F).withOpacity(.3)
              ),
            ),
          )
        ), 
        separatorBuilder: (context, index) => const SizedBox(width: 10), 
        itemCount: services.length
      ),
    );
  }

  Widget _search() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(
            FeatherIcons.search,
            color: Color(0xFFADACAD)
          ),
          hintText: "Find best vaccinate, treatment...",
          hintStyle: GoogleFonts.manrope(
            fontSize: 12, 
            fontWeight: FontWeight.bold,
            color: const Color(0xFFCACACA),
            height: 150 / 100,
          )
        ),
      ),
    );
  }

  AspectRatio _card() {
    return AspectRatio(
      aspectRatio: 336 / 184,
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(16),
          color: const Color(0xFF818AF9),
        ),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/background-card.png',
              fit: BoxFit.cover,
              width: double.maxFinite,
              height: double.maxFinite,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(text: "Your ",
                      style: GoogleFonts.manrope(
                        fontSize: 14,
                        height: 150 / 100,
                        color: const Color(0xFFDEE1FE),
                      ),
                      children: const [
                        TextSpan(
                          text: "Catrine ",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800
                          )
                        ),
                        TextSpan(text: "will get\nvaccination "),
                        TextSpan(text: "tomorrow\nat 07.00 am!",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800
                          )
                        ),
                      ]  
                    )
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.4),
                      border: Border.all(color: Colors.white.withOpacity(.12), width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("See details",
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _greetings() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Hello, Human!',
            style: GoogleFonts.manrope(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF3F3E3F)
            ),
          ),
          Stack(
            children: [
              IconButton(onPressed: () {}, 
                icon: const Icon(
                  FeatherIcons.shoppingBag, 
                  color: Color(0xFF818AF9),
                ) 
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEF6497),
                    borderRadius: BorderRadius.circular(15 / 2)
                  ),
                  child: Center(
                    child: Text('2',
                      style: GoogleFonts.mPlus1p(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w800
                      ),
                    ),
                  ),
                )
              )
            ],
          )
        ],
      )
    );
  }
}