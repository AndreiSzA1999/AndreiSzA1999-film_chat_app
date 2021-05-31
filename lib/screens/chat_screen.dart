import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatefulWidget {
  final String nombre;
  final String imagen;
  ChatPage({
    @required this.nombre,
    @required this.imagen,
  });

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool online;

  @override
  void initState() {
    online = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back)),
                Icon(Icons.search)
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(widget.imagen),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.nombre,
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20)),
                  SizedBox(
                    height: 5,
                  ),
                  online
                      ? Text("En linea",
                          style: GoogleFonts.roboto(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w400,
                              fontSize: 15))
                      : Text("Desconectado",
                          style: GoogleFonts.roboto(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w400,
                              fontSize: 15))
                ],
              ),
              Expanded(child: SizedBox()),
              Container(
                height: 30,
                width: 30,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                child: Icon(
                  Icons.call,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 30,
                width: 30,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                child: Icon(
                  Icons.video_call,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            height: 0,
          ),
          Expanded(
              child: Container(
            color: Color(0xffF3F3F3),
            child: ListView(
              children: [
                OtherMessage(
                  image: widget.imagen,
                  message: "Este es el mensaje",
                  hour: "23:34",
                ),
                OwnMessage(
                  readed: true,
                  message: "Este es el mensaje",
                  hour: "23:34",
                ),
                OtherMessage(
                  image: widget.imagen,
                  message: "Este es el mensaje",
                  hour: "23:34",
                ),
                OtherMessage(
                  image: widget.imagen,
                  message: "Este es el mensaje",
                  hour: "23:34",
                ),
                OwnMessage(
                  readed: false,
                  message: "Este es el mensaje",
                  hour: "23:34",
                ),
              ],
            ),
          )),
          Container(
            color: Colors.white,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.attach_file,
                  size: 30,
                  color: Colors.grey.shade700,
                ),
                Text("Escribe un mensaje",
                    style: GoogleFonts.montserrat(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w400,
                        fontSize: 17)),
                Icon(
                  Icons.keyboard_voice_outlined,
                  color: Colors.grey.shade700,
                  size: 30,
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}

class OtherMessage extends StatefulWidget {
  const OtherMessage(
      {@required this.image, @required this.message, @required this.hour});

  final String image;
  final String message;
  final String hour;

  @override
  _OtherMessageState createState() => _OtherMessageState();
}

class _OtherMessageState extends State<OtherMessage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(widget.image),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            width: width * 0.7,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Text(widget.message,
                            style: GoogleFonts.montserrat(
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w400,
                                fontSize: 15)),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(widget.hour,
                          style: GoogleFonts.montserrat(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w400,
                              fontSize: 13)),
                      SizedBox(
                        width: 2,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OwnMessage extends StatefulWidget {
  const OwnMessage({
    @required this.readed,
    @required this.message,
    @required this.hour,
  });

  final String message;
  final String hour;
  final bool readed;

  @override
  _OwnMessageState createState() => _OwnMessageState();
}

class _OwnMessageState extends State<OwnMessage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(
            width: 15,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            right: 20,
          ),
          child: Container(
            width: width * 0.7,
            decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(0.3),
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Text(widget.message,
                            style: GoogleFonts.montserrat(
                                color: Colors.blueAccent.shade700,
                                fontWeight: FontWeight.w400,
                                fontSize: 15)),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(widget.hour,
                          style: GoogleFonts.montserrat(
                              color: Colors.blueAccent.shade700,
                              fontWeight: FontWeight.w400,
                              fontSize: 13)),
                      SizedBox(
                        width: 2,
                      ),
                      widget.readed
                          ? Icon(
                              Icons.done_all,
                              size: 18,
                              color: Colors.blueAccent.shade700,
                            )
                          : Icon(
                              Icons.done_all,
                              size: 18,
                              color: Colors.grey,
                            )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
