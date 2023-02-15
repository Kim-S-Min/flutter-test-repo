import 'package:flutter/material.dart';

class ImageComponent extends StatelessWidget {
  const ImageComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
            Center(
                child: Column(
                  children: <Widget>[
                    // BoxFit 설정값들에 대한 설명
                    // fill width, hight를 가득 채운다
                    // contain 이미지가 잘리지 않고 비율이 변하지 않는 범위에서 가능한 크게 그린다
                    // cover 비율을 유지한채 지정한 범위를 모두 덮도록 그린다(이미지가 잘린다)
                    // filWidth width를 꽉 채워서 그린다(이미지가 잘린다)
                    // filHeight height를 꽉 채워서 그린다(이미지가 잘린다)
                    // none 원본 이미지를 표시한다.(이미지가 잘린다)(영역을 무시하고 무조건 원본 이미지)
                    // scaleDown 전체 이미지가 나올 수 있게 이미지 크기를 조절해서 표시한다.
                    Image.asset('images/unm.png', width: 400, height: 800, fit: BoxFit.fill,),
                  ],
                )
            );
  }
}
