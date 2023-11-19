//
//  ContentView.swift
//  FirstSwiftUIApp
//
//  Created by Kaan Ezerrtaş on 9.10.





import SwiftUI

struct ContentView: View {
   
   

    var body: some View {
         
      Home()
        }
        
    }
    

    struct ContentView_Previews: PreviewProvider{
        static var previews: some View{
            ContentView()
        }
    }

struct Home : View{
    @State var width = UIScreen.main.bounds.width //Bu kod ile width adında bir değişken oluşturup cihazın ekran genişliğini alıyoruz.@State özellikli bir değişken ise GÖRÜNÜMLERİ OTOMATİK OLARAK YENİDEN ÇİZİLMESİNİ SAĞLAR,EKRANDA YENİDEN DÜZENLENMESİNİ SAĞLAR.
    
    //Bir yapı içindeki değerleri değiştirmemize izin vermek için @State kullanılır,yani STRUTCH içine yazdığımız değerler..
    @State var data = [
        
        //Veri Tipi Belirlemek,İçeriğini oluşturmak
        DataType(name: "Muz", price: "₺25/Kg", content: "Kan basıncını düzenlemede yardımcı olan besin, böbrekleri korur ve kemik yapısını güçlendirir. Bulundurduğu mineraller ile birlikte; A, B6 ve B12 vitaminleri başta olmak üzere farklı vitaminleri de bulundurmaktadır.", calories: "88.7kcal", expand: ["0.3 g", "23 g", "1.1 g"], color: Color(.yellow), image: "muzu"),

        //Veri Tipi Belirlemek,İçeriğini oluşturmak
        DataType(name: "Avokado", price: "₺32/Kg", content: "Günde bir avokado tüketmenin kalp sağlığına faydasını gösteren bilimsel çalışmalar var. Avokado tüketimi kolesterol azaltıcı orta yağ içerikli bir diyet ile kötü kolesterol seviyelerini düşürmeye yardımcı olabiliyor.", calories: "373.5kcal", expand: ["2.3 g", "27 g", "3.3 g"], color: Color(.systemGreen), image: "avak"),

        //Veri Tipi Belirlemek,İçeriğini oluşturmak
        DataType(name: "Çilek", price: "₺47/Kg", content: "Farklı vitamin ve mineralleri içeren çilek, C vitamini, manganez, folat (B9 vitamini) ve potasyum açısından zengindir. C vitamini sayesinde bağışıklık sistemi ve cilt sağlığını korur.", calories: "32.5kcal", expand: ["1.3 g", "16 g", "1.8 g"], color: Color(.systemPink), image: "cilek")



        ]

    @State var index = 0 //index başlangıç değeri 0
   
    
    var body: some View{
        ZStack(alignment: .top){ //Her iki eksendede hizalamak,yukarı
            VStack{
                HStack{
                    Button(action: { //Buttona tıklandığında bir işlem yapmayacağımız için içeriği boş bırakıldı
                        
                    })  {
                        HStack(spacing: 10){
                            Image("back")//Resim eklemek
                                .renderingMode(.original) //Görüntüyü olduğu gibi almak,başka bir mod eklemedik
                            
                            Text("Back") //Text Oluşturmak
                                .fontWeight(.bold) //Font genişiliği
                                .foregroundColor(.black)
                        }
                    }
                    Spacer()  //Bileşenler arasında esnek bir boşluk oluşturmak.
                    
                    Button(action: {
                        
                    }) {
                        Image("alisveris") //Image eklemek
                            .resizable() //Görüntüyü özelleştirebilmek için .resizable kullanmamız gerekiyor
                            .scaledToFit() //En boy oranını koruyarak ölçeklendirme için kullanılır
                            .frame(width: 20, height: 20) //yükseklik ve genişlik vermek
                    }

                }
                .padding()
                
                HStack{
                    Button(action: { //Sol butona tıklandığında yapılacak işlemler
                        
                        if self.index != 0{ //Eğer sol butona tıklandığında index 0 a eşit değilse;
                            self.index -= 1 //index değerini 1 azalt
                        } //Bu if bloğu sol butona tıklandığında sayfalar arası geçiş işlemi yapar
                        
                    }) {
                        Image("left")     //Sola gitme resmi
                            .resizable()      //Görüntüyü özelleştirebilmek için .resizable kullanmamız gerekiyor
                            .scaledToFit()    //En boy oranını koruyarak ölçeklendirme için kullanılır
                            .frame(width: 20, height: 20)     //yükseklik ve genişlik vermek
                    }
                    
                    .opacity(self.index != 0 ? 1 : 0.5)  //İndex değerinin data dizisinin İLK elemanına göre ayarlayarak opaklık değerini kontrol etmek için kullanılıyor
                    .disabled(self.index != 0 ? false : true) //İndex değerinini data dizisinin İLK elemanına göre ayarlayarak etkinlik değerinin kontrol etmek için kullanılıyor
                    
                    // Bu kod parçacıkları kısaca SOL butona tıklandığında bir sonraki eleman var mı yok mu kontrol eder ve butonların görünüşü,opaklığını belirler
                    
                    Image(self.data[self.index].image) //Image, veri tipimizdeki resim(image) çekmek
                        .resizable()
                        .frame(width: 200, height: 200) //yükseklik genişlik ayarlamak
                    
                    Button(action: {         //Sağ butona tıklandığında yapılacak işlemler
                        if self.index != self.data.count - 1{         //index değeri, veri tiplerimizin içindeki sayılara eşit değilse
                            self.index += 1         //index değerini 1 arttırmak
                        }   //Bu if bloğu sayfalar arası geçişi sağlar
                    }) {
                        Image("right")                     //Sağ butonuna eklenen resim
                            .resizable()                    //Görüntüyü özelleştirebilmek için .resizable kullanmamız gerekiyor
                            .scaledToFit()                           //En boy oranını koruyarak ölçeklendirme için kullanılır
                            .frame(width: 20, height: 20)         //yükseklik ve genişlik vermek
                    }
                    .opacity(self.index != self.data.count - 1 ? 1: 0.5) //İndex değerinin data dizisinin SON elemanına göre ayarlayarak opaklık değerini kontrol etmek için kullanılıyor
                    .disabled(self.index != self.data.count - 1 ? false : true) //İndex değerinini data dizisinin SON elemanına göre ayarlayarak etkinlik değerinin kontrol etmek için kullanılıyor
                } // Bu kod parçacıkları kısaca SAĞ butona tıklandığında bir sonraki eleman var mı yok mu kontrol eder ve butonların görünüşü,opaklığını belirler
                .padding(.top, 0) //Üstten boşluk ekleme
                
                VStack(spacing: 20){ //spacing parametresi bu VSTack içindeki elemanlar arasındaki boşluğu belirler,20 birim
                    Text(self.data[self.index].name) //Text dosyasına,veri tiplerinden isim(name) olanı göstermek
                        .fontWeight(.bold)
                        .font(.title)
                    
                    Text(self.data[self.index].price) //Text dosyasına,veri tiplerinden fiyat(price) olanı çekmek
                        .fontWeight(.bold)
                        .font(.title3)
                    
                    Text(self.data[self.index].content) //Text dosyasına,veri tiplerinden içerik(content) olanı çekmek
                        .multilineTextAlignment(.center) //Eğer bir metin birden fazla satıra yayılıyosa bu kod ile hizalayabiliriz.
                        .foregroundColor(.gray) //Metnin rengi
                    
                    Text("Beslenme Değeri") //Text Eklemek
                        .font(.title) //font özelliği
                        .fontWeight(.bold) //font özelliği-kalınlık eklemek
                        .padding(.top) //Üstten boşluk eklemek,default değer
                    
                    HStack{
                        Image(systemName: "flame.fill") //Resim eklemek
                            .resizable() //Görüntünün yeniden boyutlandırılabilmesi için bu kodu kullanıyoruz
                            .frame(width: 25, height: 35) //Resime görünüm-yükseklik-genişlik vermek
                            .foregroundColor(.white)
                        
                        VStack(alignment: .leading, spacing: 4){
                            Text(self.data[self.index].calories) // Text dosyasına,veri tiplerinden içerik kalori(caloreis) olanı çekme
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                            Text("Kalori") //Text dosyası eklemek
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                            
                        }
                        .padding(.leading, 25) //Sol kenardan 25 birimlik boşluk eklemek
                    }
                    
                    .padding() //Default boşluk eklemek
                    .background(Color.purple) //Arka plan rengini mor yapmak
                    .cornerRadius(10) //Köşe kenarlarını yuvarlama,estetik görünüm için
                }
                
                HStack{
                    
                    VStack(alignment: .center, spacing: 10){
                        Text(self.data[self.index].expand[0]) //ilk belirlenen veri tipini çekmek,yani yazdığımız (yağ) verisini göstermek
                            .fontWeight(.bold)
                        
                      Text("Yağ")
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    
                    VStack(alignment: .center, spacing: 10){ //Bu VStack elemanlarının içindeki öğeleri dikey olarak ortalamak(alignment.center) ve elemanlarının arasındakş boşluk(spacing) belirler
                        Text(self.data[self.index].expand[1]) // İkinci belirlenen veri tipini çekmek,yani yazdığımız (karbonhidrat) verisini göstermek
                            .fontWeight(.bold)
                        
                      Text("Karbonhidrat")
                            .foregroundColor(.gray)
                    }
                    Spacer()  //Bileşenler arasında esnek bir boşluk oluşturmak.
                    
                    VStack(alignment: .center, spacing: 10){
                        Text(self.data[self.index].expand[2]) //Üçüncü yazdığımız veri tipini çekmek,yani yazdığımız (protein) verisini göstermek
                            .fontWeight(.bold)
                        
                      Text("Protein") //Text dosyası
                            .foregroundColor(.gray) //Renk belirlemek
                    }
                }
                .padding(.horizontal) //Yatay yönde boşluk eklemek-Default değer
                .padding(.top, 20) //Üst boşluk 20 birim
                
                .padding(.horizontal, 20) //Yatay yönde boşluk eklemek-20 birim
                
                Spacer()  //Bileşenler arasında esnek bir boşluk oluşturmak.
                
                Button(action: {
                    
                }) {
                    Text("Sepete Ekle") //Text eklemek
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical) //Dikey yönde boşluk-default değer
                        .frame(width: self.width - 50)
                        .background(Color.purple) //Arka plan rengi (mor)
                        .clipShape(Capsule()) //Kırpma işlemi olarak geçer.Capsule(), şekli bir kapsül gibi yuvarlatılmış ve oval bir şekle sokar.
                }
                .padding(.bottom, 25) //Alt kısımnda 25 birim boşluk bırakmak

            }
            .zIndex(1) //Görünümlerin katman sıralamasını belirlemek.Hangi görünümün üst veya altta kalacağını belirlemek için kullanılır
            
            Circle() //Meyvelerin üst kısmında görünen yuvarlak renk öğesi
                .fill(self.data[self.index].color)
                .frame(width: self.width + 150, height: self.width + 150) //görünüme yer tayin etmek
                .padding(.horizontal, -100)
                .offset(y: -self.width) //Görünümün dikey yönde ekran üzerindeki konumunu yukarı doğru değiştirmek,EKRAN DEĞERİ KADAR(YUKARIDA EKRAN DEĞİŞKENİ TANIMLAMIŞTIK!)
            
            
            
        }
        .animation(.default) //Animasyonları etkinleştirmek, .default değeri ise standart animasyon süresini belirler.Yumuşak geçişler için kullanılır
    }
    
}

//Birden fazla veri deopolamak için strutch kullanıyoruz,içine gördüğümüz gibi veri tiplerini yazıyoruz.
struct DataType{
    var name: String //İsim bu değişkende tutulacak
    var price: String //Fiyat verisi bu değişkende tutulacak
    var content: String //Öğrenin içerik verisi bu değişkende tutulacak
    var calories: String //Öğe kalorisi bu değişkende tutulacak
    var expand: [String] //Ürünün yağ,kalori gibi içerikleri bu değişkende tutulacak
    var color: Color //Renk verisi bu değişkende tutulacak
    var image: String //Resim öğelerimiz bu değişkenin içinde tutulacak
}

