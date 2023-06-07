# COBOL NOTLARIM

### INDENTIFICATION DIVISION.

Bu satır, programın kimlik bilgilerini tanımlayan bölümü temsil eder.

### PROGRAM-ID ILK_PROGRAM.

bu satırda programın benzersiz kimliği belirlenir yani bu kod bloğuna göre bu programın adı “ILK_PROGRAM”dır.

### DATA DIVISION.

Bu satır, programda kullanılacak olan verilerin tanımlandığı bölümdür.

Data division bölümü için COBOL eğitimine yeni başlamış birinin WORKING-STORAGE SECTİON. bölümünü öğrenmesi ve bu bölümde kullanılacak olan temel veri türlerini, değişken tanımlamalarını ve değer atama işlemlerini anlaması çok önem arz etmektedir. Bunlar dışında başlangıç seviyelerinde öğrenilmesi gereken sectionlar arasında  FILE SECTION. ve LINKAGE SECTION gelmektedir. Şu aşamada bu 3 section’ı bilmemiz yeterli olacaktır.

### WORKING-STORAGE SECTION.

Bu bölümde  programda kullanılacak olan geçici veriler tanımlanır. Bu veriler Değişkenler, Diziler, Sabit değerlerdir.

Bunlara Kod üzerinde örnek verecek olursak. 

```jsx
01 AGE PIC 9(3).
01 NAME PIG X(20).
```

Yukarıdaki örnekte, "AGE" adında üç basamaklı bir sayıyı ve "NAME" adında 20 karakterlik bir metni saklamak için iki değişken tanımlanmıştır.

Dizeler için Örnek verecek olursak;

```jsx
01 GRADES OCCURS 10 TIMES PIC 9(2).
01 BOOK-TITLES OCCURS 50 TIMES PIC X(30).
```

Yukarıdaki örnekte, "GRADES" adında 10 elemanlı bir sayısal dizi ve "BOOK-TITLES" adında 50 elemanlı bir metinsel dizi tanımlanmıştır.

Sabitler için Örnek verecek olursak;

```jsx
01 TAX-RATE PIC 9(3) VALUE 18.
01 MASSAGE PIC X(30) VALUE "Welcome to the program!".
```

Yukarıdaki örnekte, "TAX-RATE" adında bir sayısal sabit değer ve "MESSAGE" adında bir metinsel sabit değer tanımlanmıştır.

Bu aşamada aklımıza bazı soruların takılması normaldir.

Bu sorular;

1. Baştaki 01 neyi temsil etmektedir?
2. PIC ve OCCURS nedir ?
3. X ve 9 nedir ?

Bu sorulara yanıt arayalım.

### Baştaki 01 neyi temsil etmektedir ?

COBOL verileri tanımlarken, veri hiyerarşisini ve ilişkilerini belirlemek için seviye numaralarını kullanır. Bu seri numaraları veri öğesinin düzeyini ve ilişkisini gösterir.

**01** seviye numarası en üst düzeyde bir veri öğesi tanımladığımızı belirtmektedir. Bu seviye numarası genelde bir kayıdın veya yapısal veri öğesinin tanımında kullanılır. Örneğin bir müşteri kaydını veya bir veri yapısını kaydederken **01** seviye numarasını kullanabiliriz.

örnek;

```jsx
01 CUSTOMER-RECORD.
   05 CUSTOMER-ID PIC 9(5).
   05 CUSTOMER-NAME PIC X(30).
   05 CUSTOMER-ADDRESS.
      10 STREET PIC X(20).
      10 CITY PIC X(15).
      10 STATE PIC X(2).
```

Yukarıdaki örnekte, CUSTOMER-RECORD adında bir kayıt tanımlanmıştır ve bu kaydın **01** seviye numarasıyla başladığı görülmektedir. Daha sonra **05** seviye numaraları ile kayıt içindeki alanlar belirtilmiştir.

Bu şekilde, **01** seviye numarası, COBOL'da veri tanımlarken hiyerarşiyi ve ilişkileri belirlemek için kullanılan bir işaretçidir.

Tam şu esnada aklımıza neden 2. düzey ve 3. düzey veri öğelerinin **02 03** olarak değilde **05 10** olarak numaralandırıldığı sorusu geliyor olabilir bunun sebebi diğer seviye numaraları olan (02, 03, vb.), COBOL'da kullanılan yaygın seviye numaraları olmayıp daha düşük düzeylerde özel durumlar için kullanılabilir. Ancak, genel uygulama, 01 seviyesinin en üst düzey tanımı olduğu, 05 seviyesinin ikinci düzey tanımları temsil ettiği ve 10 seviyesinin alt bileşenleri temsil ettiğinin bilinmesi başlangıç seviyesinde yeterli bir bilgi olacaktır.

### PIC ve OCCURS nedir?

PIC(Picture Clause) ve OCCURS programa dilinde veri tanımlaması yapılırken kullanılan iki önemli belirteçtir:

1. **PIC** : PIC belirteci, bir veri öğesinin veri türünü ve formatını belirlemede kullanılır. PIC belirteci veri öğesinin sayısal veyahut metinsel bir değeri nasıl temsil ettiğini belirler.  Örneğin bir sayıyı temsil etmek için **PIC 9** kullanılırken, metinsel bir değeri temsil etmek için **PIC X** kullanılır. PIC belirteci aynı zamanda verinin uzunluğunu, basamak sayısını ve diğer özelliklerini belirtebilir.

Örneğin;

- **PIC 9(5)** Beş basamaklı bir sayıyı temsil eder.
- **PIC X(20)** 20 karakterlik bir metini temsil eder.

1. **OCCURS** : OCCURS belirteci, bir dizi tanımlamak için kullanılır. OCCURS belirteci, dizinin eleman sayısını ve herbir elemanının veri tipini belirtir. 

Örneğin;

- **01 GRADES OCCURS 10 TIMES PIC 9(2)** “GRADES” adında 10 elemanlı bir array tanımlar ve bu arrayin içersinde ki her eleman 2 basamaklı sayıları temsil eder.
- **01 DAYS OCCURS 7 TIMES PIC X(10) “DAYS” adında 7 elemanlı bir array tanımlar ve her elemanı 10 karakterlik bir metni temsil eder.

Bu belirteçler, COBOL'da veri tanımlarken kullanılan önemli yapısal unsurlardır. PIC belirteci veri tipini ve formatını belirtirken, OCCURS belirteci dizilerin boyutunu ve elemanlarının veri tipini belirtir.

### X ve 9 nedir ?

Aslında buraya kadar yazıyı takip eden herkesin tahmin edebileceği üzere **X** bu verinin metinsel karakterler barındıracağı ve **9** karakteri ise bu verinin sayısal bir karakter barındıracağının bilgisini vermektedir. 

Tabii ki bu veri türleri sayısal ve metinsel veri türlerinden ibaret değildir. Sayısal ve Metinsel veri türleri dışında diğer veri türlerini temsil eden özel karakterler şöyledir ;

- **A**: Sayısal karakteri temsil eder.  **X** ile aynı işlevi görür.
- **V**: Varyanslı alfanumerik karakteri temsil eder. Değişken uzunlukta metinleri ifade etmek için kullanılır. Örneğin, **V(50)** maksimum 50 karakterlik bir metni temsil eder.
- **S**: İşaret karakterini temsil eder. Pozitif veya negatif sayıları ifade etmek için kullanılır.
- **P**: Ondalık ayırıcı karakterini temsil eder. Ondalık sayıları ifade etmek için kullanılır.
