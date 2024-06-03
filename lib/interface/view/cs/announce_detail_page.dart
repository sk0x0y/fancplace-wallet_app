import 'package:flutter/material.dart';
import 'package:wallet_app/components/buildWidgetFromHtml.dart';
import 'package:wallet_app/constant/theme/theme_resources.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

class AnnounceDetailPage extends StatefulWidget {
  const AnnounceDetailPage({super.key});

  @override
  State<AnnounceDetailPage> createState() => _AnnounceDetailPageState();
}

class _AnnounceDetailPageState extends State<AnnounceDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  static const String title = "댐댐 계정 연동하고 fancPoint 받자!";
  static const String date = "2022-11-11";
  static const String category = "카테고리";
  static const String htmlContent = """
<img src="https://fanc-wallet.s3.ap-northeast-2.amazonaws.com/images/2023/09/notice_version2_ko.png"><div style="display:flex; gap:12px; justify-content: center">
  <div><a href="market://details?id=com.tmoney.nfc_pay"><img src="https://fanc-wallet.s3.ap-northeast-2.amazonaws.com/images/2023/09/android_download_button.png" alt=""></a></div>
  <div><a href="https://apps.apple.com/kr/app/id1479640774"><img src="https://fanc-wallet.s3.ap-northeast-2.amazonaws.com/images/2023/09/ios_download_button.png" alt=""></a></div>
</div><br><br><p style="display:none;">
<br />
<p><strong>아이디 연동</strong><br />
댐댐과 팬시 월렛의 계정이 연동된 사용자에게 제공되는 서비스입니다.<br />
전환 서비스 및 리워드 혜택을 받기 위해서는 최초 1회 계정 연동 후 연결 상태를 유지해야 합니다.<br />
댐댐과 팬시 월렛 계정 연동 시 개인정보 제3자 제공에 동의하는 것으로 간주합니다.<br />
제공 업체 : (주)티모넷<br />
제공 정보 , 비식별 처리된 댐댐ID. 거래일자, 거래번호, 거래금액회원은 정보 제공에 대한 동의를 거부할 수 있으나 동의 거부 시 포인트 적립을 위한 정보가 제공되지 않아 해당 서비스 사용이 불가능하며, 서비스 이용에 대한 혜택 또한 받을 수 없습니다.<br />
계정 연동 해지 시 포인트 적립이 즉시 중단되며, 적립 예정 포인트는 적립되지 않고 소멸됩니다. (추후 재 적립 불가)<br />
<br />
<br />
<br />
<strong>혜택, 지급 조건 및 한도</strong><br />
&bull; 팬시 월렛 서비스 이용 시 제공되는 서비스별 혜택 및 지급 조건은 다음과 같습니다.<br />
<br />
① 팬시 월렛 포인트 전환 서비스 이용에 대한 캐시백 조건<br />
팬시 포인트를 교통페이 포인트로 전환 시 전환가액의 5%를 팬시 포인트 캐시백</p>

<p><span style="color:#0000ff">&gt; 팬시 포인트 - 교통페이 전환은 월 최대 200만 포인트로 제한됩니다.</span><br />
<br />
② 댐댐 서비스 이용에 대한 팬시 포인트 적립 조건<br />
댐댐에서 교통카드 1,000원 이상 충전 완료 시 팬시 포인트 100P 적립(리워드)<br />
댐댐에서 교통페이 1,000원 이상 충전 완료 시 팬시 포인트 100P 적립(리워드)<br />
댐댐에서 교통페이 가져오기(전환) 1,000원 이상 전환 완료 시 팬시 포인트 100P 적립(리워드)</p>

<p><span style="color:#0000ff">&gt; 팬시 포인트 적립(리워드)은 월 20건으로 제한됩니다.</span></p>

<p><span style="color:#0000ff">&gt; 교통카드 충전 후 이용내역에 충전대기 또는 미완료로 표시되는 경우 팬시 포인트는 적립되지 않습니다.</span></p>

<p><span style="color:#0000ff">&gt; 교통페이 포인트로 충전한 교통카드 거래는 포인트 적립(리워드) 혜택이 제외됩니다.</span><br />
<br />
<br />
<br />
<strong>기타 유의 사항</strong><br />
적립되는 팬시 포인트는 fanC Wallet 에서 확인 가능하며, 적립까지 최대 2일 소요될 수 있습니다.<br />
본 이벤트 혜택으로 적립되는 팬시포인트는 팬시플레이스의 정책을 따릅니다.<br />
본 이벤트는 댐댐 및 팬시플레이스 사정으로 사전 안내 없이 변경 또는 종료될 수 있습니다.<br />
<br />
<br />
<br />
<strong>고객센터 안내</strong><br />
아이디 연결 및 해지, 팬시 포인트 적립 및 사용 문의 - fanC Wallet 고객센터 <span style="color:#0000ff">support@fanc.io</span><br />
댐댐 회원코드 문의 - 댐댐 고객센터: <span style="color:#0000ff">1899-2823 또는 1:1문의</span></p>
""";

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      customTitleWidget: Text(
        '소식 및 공지사항',
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 18.0,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        date,
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(width: 16),
                      Text(
                        category,
                        style: TextStyle(color: AppColors.textPrimary),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: BuildWidgetFromHtml(htmlContent: htmlContent),
            )
          ],
        ),
      ),
    );
  }
}
