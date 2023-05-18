class Newss {
  String imageUrl;
  String newstitle;
  String newsdate;
  String description;

  Newss({
    required this.imageUrl,
    required this.newstitle,
    required this.newsdate,
    required this.description,
  });
}

List<Newss> newsss = [
  Newss(
    imageUrl: 'assets/images/sabeng.jpg',
    newstitle: 'ด้านบริการโดยสาร',
    newsdate: '05/12/2022',
    description:
        'การรถไฟฯ พร้อมให้บริการ “ตู้เสบียง” จำหน่ายอาหาร และเครื่องดื่ม บนขบวนรถด่วนพิเศษ ชุด 115 คัน 8 ขบวน 4 เส้นทาง เตรียมเปิดประมูลให้บริการบนขบวนรถด่วน-รถด่วนพิเศษ อีก 10 ขบวน เดือนมกราคม 66 คาดได้ผู้เช่าสิทธิ เดือนเมษายน 2566',
  ),
  Newss(
    imageUrl: 'assets/images/ramasix.jpg',
    newstitle: 'ด้านการเดินรถ',
    newsdate: '06/09/2022',
    description:
        'การรถไฟฯ ประกาศเปิดใช้งานสะพานพระราม 6 ได้ตามปกติ ตั้งแต่วันที่ 25 ก.พ.65 เป็นต้นไป หลังเข้าปรับปรุงโครงสร้างด้านวิศวกรรมทุกจุดให้ได้ตามมาตรฐานความปลอดภัยสูงสุด ทำให้ขบวนรถในเส้นทางสายใต้กลับมาใช้สถานีต้นทาง-ปลายทาง ได้ตามเดิม',
  ),
];
