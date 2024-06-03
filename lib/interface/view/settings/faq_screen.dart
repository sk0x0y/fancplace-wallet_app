import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:wallet_app/components/buildInput.dart';
import 'package:wallet_app/components/buildWidgetFromHtml.dart';
import 'package:wallet_app/constant/theme/theme_resources.dart';
import 'package:wallet_app/interface/service/modal_service.dart';
import 'package:wallet_app/interface/service/router_service.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

class Faq {
  final String subject;
  final String content;
  final String category;
  final bool isFixed;

  Faq({
    required this.subject,
    required this.content,
    required this.category,
    required this.isFixed,
  });
}

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqScreen> {
  String selectedCategory = '전체';

  // 저장된 카테고리
  final Map<String, GlobalKey> _categoryKeys = {
    '전체': GlobalKey(),
    '계정/보안': GlobalKey(),
    '기능': GlobalKey(),
    '보안': GlobalKey(),
    '전환/전송': GlobalKey(),
    '기타': GlobalKey(),
  };

  void _selectCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  // 가져온 FAQ 리스트
  final List<Faq> _faqs = [
    Faq(
        subject: '앱을 삭제했다가 재설치 했습니다. 처음 부여받은 개인키는 계속 사용할 수 있나요?',
        category: '계정/보안',
        content:
            '<p><img src="https://fanc-wallet.s3.ap-northeast-2.amazonaws.com/images/2024/03/65fcce0b9ebd8_20240322091715.png"></p><p><br></p><p>팬시포인트에서 토큰으로 전환하는 과정에서</p><p>이더리움 (ETH) 수수료가 필요하게 됩니다.</p><p>하지만 이더리움 네트워크 기반의 ETH 코인에</p><p>많은 사용자가 동시에 해당 코인을 사용하거나</p><p>코인의 가격이 상승하게 되면서</p><p>이런 네트워크의 병목현상과 같은 상황에 따라</p><p>전환되기까지의 시간이 소요될 수 있습니다.</p>',
        isFixed: true),
    Faq(
        subject: 'PIN 비밀번호를 변경하고 싶어요.',
        category: '보안',
        content:
            '<p><img src="https://fanc-wallet.s3.ap-northeast-2.amazonaws.com/images/2024/03/65fcce0b9ebd8_20240322091715.png"></p><p><br></p><p>팬시포인트에서 토큰으로 전환하는 과정에서</p><p>이더리움 (ETH) 수수료가 필요하게 됩니다.</p><p>하지만 이더리움 네트워크 기반의 ETH 코인에</p><p>많은 사용자가 동시에 해당 코인을 사용하거나</p><p>코인의 가격이 상승하게 되면서</p><p>이런 네트워크의 병목현상과 같은 상황에 따라</p><p>전환되기까지의 시간이 소요될 수 있습니다.</p><p><img src="https://fanc-wallet.s3.ap-northeast-2.amazonaws.com/images/2024/03/65fcce0b9ebd8_20240322091715.png"></p><p><br></p><p>팬시포인트에서 토큰으로 전환하는 과정에서</p><p>이더리움 (ETH) 수수료가 필요하게 됩니다.</p><p>하지만 이더리움 네트워크 기반의 ETH 코인에</p><p>많은 사용자가 동시에 해당 코인을 사용하거나</p><p>코인의 가격이 상승하게 되면서</p><p>이런 네트워크의 병목현상과 같은 상황에 따라</p><p>전환되기까지의 시간이 소요될 수 있습니다.</p>',
        isFixed: true),
    Faq(
        subject: '내 지갑에 팬시코가 수량이 보이지 않아요.',
        category: '전환/전송',
        content:
            '<p><img src="https://fanc-wallet.s3.ap-northeast-2.amazonaws.com/images/2024/03/65fcce0b9ebd8_20240322091715.png"></p><p><br></p><p>팬시포인트에서 토큰으로 전환하는 과정에서</p><p>이더리움 (ETH) 수수료가 필요하게 됩니다.</p><p>하지만 이더리움 네트워크 기반의 ETH 코인에</p><p>많은 사용자가 동시에 해당 코인을 사용하거나</p><p>코인의 가격이 상승하게 되면서</p><p>이런 네트워크의 병목현상과 같은 상황에 따라</p><p>전환되기까지의 시간이 소요될 수 있습니다.</p>',
        isFixed: true),
    Faq(
        subject: '다른 디바이스에서 로그인이 필요해요. 지금 그대로 사용할 수 있나요?',
        category: '계정/보안',
        content:
            '<p><img src="https://fanc-wallet.s3.ap-northeast-2.amazonaws.com/images/2024/03/65fcce0b9ebd8_20240322091715.png"></p><p><br></p><p>팬시포인트에서 토큰으로 전환하는 과정에서</p><p>이더리움 (ETH) 수수료가 필요하게 됩니다.</p><p>하지만 이더리움 네트워크 기반의 ETH 코인에</p><p>많은 사용자가 동시에 해당 코인을 사용하거나</p><p>코인의 가격이 상승하게 되면서</p><p>이런 네트워크의 병목현상과 같은 상황에 따라</p><p>전환되기까지의 시간이 소요될 수 있습니다.</p>',
        isFixed: true),
    Faq(
        subject: '복구 구문을 찾을 수 없어요.',
        category: '계정/보안',
        content:
            '<p><img src="https://fanc-wallet.s3.ap-northeast-2.amazonaws.com/images/2024/03/65fcce0b9ebd8_20240322091715.png"></p><p><br></p><p>팬시포인트에서 토큰으로 전환하는 과정에서</p><p>이더리움 (ETH) 수수료가 필요하게 됩니다.</p><p>하지만 이더리움 네트워크 기반의 ETH 코인에</p><p>많은 사용자가 동시에 해당 코인을 사용하거나</p><p>코인의 가격이 상승하게 되면서</p><p>이런 네트워크의 병목현상과 같은 상황에 따라</p><p>전환되기까지의 시간이 소요될 수 있습니다.</p>',
        isFixed: false),
    Faq(
        subject: '복구 구문을 찾을 수 없어요2.',
        category: '계정/보안',
        content:
            '<p><img src="https://fanc-wallet.s3.ap-northeast-2.amazonaws.com/images/2024/03/65fcce0b9ebd8_20240322091715.png"></p><p><br></p><p>팬시포인트에서 토큰으로 전환하는 과정에서</p><p>이더리움 (ETH) 수수료가 필요하게 됩니다.</p><p>하지만 이더리움 네트워크 기반의 ETH 코인에</p><p>많은 사용자가 동시에 해당 코인을 사용하거나</p><p>코인의 가격이 상승하게 되면서</p><p>이런 네트워크의 병목현상과 같은 상황에 따라</p><p>전환되기까지의 시간이 소요될 수 있습니다.</p>',
        isFixed: false),
    Faq(
        subject: '복구 구문을 찾을 수 없어요3.',
        category: '계정/보안',
        content:
            '<p><img src="https://fanc-wallet.s3.ap-northeast-2.amazonaws.com/images/2024/03/65fcce0b9ebd8_20240322091715.png"></p><p><br></p><p>팬시포인트에서 토큰으로 전환하는 과정에서</p><p>이더리움 (ETH) 수수료가 필요하게 됩니다.</p><p>하지만 이더리움 네트워크 기반의 ETH 코인에</p><p>많은 사용자가 동시에 해당 코인을 사용하거나</p><p>코인의 가격이 상승하게 되면서</p><p>이런 네트워크의 병목현상과 같은 상황에 따라</p><p>전환되기까지의 시간이 소요될 수 있습니다.</p>',
        isFixed: false),
    Faq(
        subject: '복구 구문을 찾을 수 없어요4.',
        category: '계정/보안',
        content:
            '<p><img src="https://fanc-wallet.s3.ap-northeast-2.amazonaws.com/images/2024/03/65fcce0b9ebd8_20240322091715.png"></p><p><br></p><p>팬시포인트에서 토큰으로 전환하는 과정에서</p><p>이더리움 (ETH) 수수료가 필요하게 됩니다.</p><p>하지만 이더리움 네트워크 기반의 ETH 코인에</p><p>많은 사용자가 동시에 해당 코인을 사용하거나</p><p>코인의 가격이 상승하게 되면서</p><p>이런 네트워크의 병목현상과 같은 상황에 따라</p><p>전환되기까지의 시간이 소요될 수 있습니다.</p>',
        isFixed: false),
    Faq(
        subject: '팬시포인트를 어떻게 팬시토큰으로 전환하나요?',
        category: '기능',
        content:
            '<p><img src="https://fanc-wallet.s3.ap-northeast-2.amazonaws.com/images/2024/03/65fcce0b9ebd8_20240322091715.png"></p><p><br></p><p>팬시포인트에서 토큰으로 전환하는 과정에서</p><p>이더리움 (ETH) 수수료가 필요하게 됩니다.</p><p>하지만 이더리움 네트워크 기반의 ETH 코인에</p><p>많은 사용자가 동시에 해당 코인을 사용하거나</p><p>코인의 가격이 상승하게 되면서</p><p>이런 네트워크의 병목현상과 같은 상황에 따라</p><p>전환되기까지의 시간이 소요될 수 있습니다.</p>',
        isFixed: false),
    Faq(
        subject: '내 지갑에 팬시토큰 수량이 표시되지 않아요.',
        category: '기능',
        content:
            '<p><img src="https://fanc-wallet.s3.ap-northeast-2.amazonaws.com/images/2024/03/65fcce0b9ebd8_20240322091715.png"></p><p><br></p><p>팬시포인트에서 토큰으로 전환하는 과정에서</p><p>이더리움 (ETH) 수수료가 필요하게 됩니다.</p><p>하지만 이더리움 네트워크 기반의 ETH 코인에</p><p>많은 사용자가 동시에 해당 코인을 사용하거나</p><p>코인의 가격이 상승하게 되면서</p><p>이런 네트워크의 병목현상과 같은 상황에 따라</p><p>전환되기까지의 시간이 소요될 수 있습니다.</p>',
        isFixed: false),
    Faq(
        subject: '분실된 지갑의 자산을 복구할 수 있나요?',
        category: '보안',
        content:
            '<p><img src="https://fanc-wallet.s3.ap-northeast-2.amazonaws.com/images/2024/03/65fcce0b9ebd8_20240322091715.png"></p><p><br></p><p>팬시포인트에서 토큰으로 전환하는 과정에서</p><p>이더리움 (ETH) 수수료가 필요하게 됩니다.</p><p>하지만 이더리움 네트워크 기반의 ETH 코인에</p><p>많은 사용자가 동시에 해당 코인을 사용하거나</p><p>코인의 가격이 상승하게 되면서</p><p>이런 네트워크의 병목현상과 같은 상황에 따라</p><p>전환되기까지의 시간이 소요될 수 있습니다.</p>',
        isFixed: false),
    Faq(
        subject: '지갑 잠금 기능이 있나요?',
        category: '보안',
        content:
            '<p><img src="https://fanc-wallet.s3.ap-northeast-2.amazonaws.com/images/2024/03/65fcce0b9ebd8_20240322091715.png"></p><p><br></p><p>팬시포인트에서 토큰으로 전환하는 과정에서</p><p>이더리움 (ETH) 수수료가 필요하게 됩니다.</p><p>하지만 이더리움 네트워크 기반의 ETH 코인에</p><p>많은 사용자가 동시에 해당 코인을 사용하거나</p><p>코인의 가격이 상승하게 되면서</p><p>이런 네트워크의 병목현상과 같은 상황에 따라</p><p>전환되기까지의 시간이 소요될 수 있습니다.</p>',
        isFixed: false),
  ];

  @override
  Widget build(BuildContext context) {
    // 카테고리별 FAQ 섹션
    Widget _buildCategoryFAQSection(
        BuildContext context, String category, List<Faq> faqs) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(category,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                    )),
                selectedCategory == '전체'
                    ? TextButton(
                        onPressed: () {
                          // 해당 카테고리 선택
                          _selectCategory(category);
                        },
                        child: const Text('더 보기 > ',
                            style: TextStyle(color: AppColors.textSecondary)),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          const SizedBox(height: 8),
          ListView.builder(
            itemCount: selectedCategory == '전체' ? 3 : faqs.length,
            itemBuilder: (context, index) {
              if (faqs.length <= index) return const SizedBox.shrink();
              return Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.borderSecondary,
                      width: 0.3,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: _buildFaqListItem(context, faqs[index]),
                ),
              );
            },
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          ),
        ],
      );
    }

    return DefaultLayout(
      leader: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          RouterService.instance.router.pop();
        },
      ),
      customTitleWidget: const Text(
        '자주 묻는 질문',
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 18.0,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/faq_cover.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            Column(
              // align이 start로 되도록
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 여기에 실질적인 FAQ 화면을 그리면 됨
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 20.0),
                  child: BuildInput(
                    context,
                    labelText: '',
                    inputWidget: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          icon: SvgPicture.asset('assets/search_icon.svg'),
                          onPressed: () {},
                        ),
                        filled: true,
                        fillColor: AppColors.backgroundSecondary,
                        hintText: '검색어를 입력하세요',
                        hintStyle: const TextStyle(
                          fontWeight: AppFonts.fontWeight400,
                          fontSize: AppFonts.fontSize14,
                          color: AppColors.textTertiary,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1.0,
                            color: AppColors.borderPrimary,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Wrap(
                    runSpacing: 10.0,
                    spacing: 10.0,
                    children: _categoryKeys.keys.map((category) {
                      return ElevatedButton(
                        // button no shadow
                        style: ElevatedButton.styleFrom(
                          splashFactory: NoSplash.splashFactory,
                          elevation: 0.0,
                          textStyle: const TextStyle(
                            fontWeight: AppFonts.fontWeight400,
                            fontSize: AppFonts.fontSize14,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 10.0,
                          ),
                          foregroundColor: selectedCategory == category
                              ? AppColors.white
                              : AppColors.textBlack,
                          // background Color 연한 회색
                          backgroundColor: selectedCategory == category
                              ? AppColors.buttonPrimary
                              : const Color(0xFFF9F9F9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () => {
                          _selectCategory(category),
                        },
                        child: Text(category),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20),
                //전체일 때만 fixed FAQ 렌더링
                selectedCategory == '전체'
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: _buildFixedFAQSection('자주 묻는 질문',
                            _faqs.where((element) => element.isFixed).toList()),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(height: 20),
                selectedCategory == '전체'
                    ? Column(
                        // 전체일 경우 모든 카테고리의 faq를 3개까지 렌더링 한다
                        children: _categoryKeys.keys.map((category) {
                          if (category == '전체') return const SizedBox.shrink();
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: _buildCategoryFAQSection(
                                context,
                                category,
                                _faqs
                                    .where((element) =>
                                        element.category == category)
                                    .toList()),
                          );
                        }).toList(),
                      )
                    // 선택된 카테고리만 렌더링, 개선 필요
                    : _buildCategoryFAQSection(
                        context,
                        selectedCategory,
                        _faqs
                            .where((element) =>
                                element.category == selectedCategory)
                            .toList()),
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    '더 자세한 문의가 필요하신가요?',
                    style: TextStyle(
                      color: AppColors.textBlack,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: _buildInquiryButton(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 1:1 문의 버튼
  Widget _buildInquiryButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          foregroundColor: AppColors.textBlack,
          backgroundColor: const Color(0xFFF9F9F9),
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: () {
          // TODO: 1:1 문의 페이지로 이동
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Bootstrap.chat_dots),
                SizedBox(width: 20.0),
                Text('1:1 문의'),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.textSecondary,
            ),
          ],
        ));
  }
}

// FAQ 리스트 아이템
Widget _buildFaqListItem(BuildContext context, Faq faq) {
  return ListTile(
    leading: const Text('Q',
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 18.0,
        )),
    title: Text(faq.subject,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14.0,
        )),
    onTap: () {
      // 여기에 모달 창 표시 코드 추가
      openFaqModal(context, faq);
    },
  );
}


// FAQ 상세 모달 위젯
Widget _buildFaqContentModal(BuildContext context, Faq faq) {
  return Material(
    type: MaterialType.transparency,
    child: Center(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.7,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  alignment: Alignment.topRight,
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    // openDialog 닫기
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                ),
              ],
            ),
            Text(faq.category,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    )),
            const SizedBox(height: 10.0),
            Text(faq.subject,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w700,
                    )),
            const SizedBox(height: 10.0),
            const Divider(color: Color(0xFFE0E0E0), thickness: 1.0, height: 20.0),
            const SizedBox(height: 10.0),
            Expanded(
              child: SingleChildScrollView(
                // 공지사항 과 같이 widget from widget 으로 추후 변경
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: BuildWidgetFromHtml(htmlContent: faq.content),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// 고정 FAQ 섹션
Widget _buildFixedFAQSection(String title, List<Faq> faqs) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('자주 묻는 질문',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
          )),
      const SizedBox(height: 16),
      GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          return Card(
            color: AppColors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(color: Colors.grey.shade400, width: 0.5)),
            elevation: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(faqs[index].category,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        color: AppColors.textPrimary,
                      )),
                ),
                subtitle: Text(faqs[index].subject,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0,
                    )),
                onTap: () {
                  openFaqModal(context, faqs[index]);
                },
              ),
            ),
          );
        },
      ),
    ],
  );
}

// FAQ 상세 모달
void openFaqModal(BuildContext context, Faq faq) {
  ModalService.openGeneralDialog(context,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierDismissible: true,
      child: _buildFaqContentModal(context, faq));
}