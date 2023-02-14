import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../strings.dart';


class ListTitleWidget extends StatelessWidget {
  ListTitleWidget(
      {Key? key, this.image, this.date, this.titel, this.description, this.urlSite})
      : super(key: key);
  var image;
  var titel;
  var date;
  var description;
  var urlSite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, Web_Screen,arguments: urlSite);
      },
      child: Container(
        height: 150.h,
        decoration: BoxDecoration(
            border: Border(
                bottom:
                    BorderSide(width: 1, color: Colors.black.withOpacity(.2)))),
        child: Row(
          children: [
            Container(
              height: 125.h,
              margin: EdgeInsets.only(left: 12.r),
              width: 125.w,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.2),
                  borderRadius: BorderRadius.circular(20.r)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: CachedNetworkImage(
                  //   placeholder: "assets/images/loading2.gif", image:
                  // "$image",width: 125,height:125,fit: BoxFit.fill,
                  imageUrl: '$image',
                  width: 125.w,
                  memCacheHeight: 500,
                  maxHeightDiskCache: 500,
                  height: 125.h,

                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) => Image.asset(
                    "assets/images/no_internet.gif",
                  ),
                  placeholder: (context, url) => Image.asset(
                    "assets/images/loading2.gif",
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 125.h,
                margin: EdgeInsets.only(left: 15.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("$titel",
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headline1,
                        // style: TextStyle(
                        //     fontSize: 22.sp, fontWeight: FontWeight.bold)
                    ),
                    Text("$description",
                        maxLines: 3,
                        style: Theme.of(context).textTheme.subtitle2,
                        // style: TextStyle(
                        //     fontSize: 14.sp,
                        //     fontWeight: FontWeight.bold,
                        //    // color: Colors.black.withOpacity(.4)
                        // )
                    ),
                    Text("$date",
                        style:TextStyle( fontSize: 15.sp,
                            color: Colors.grey[400]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
