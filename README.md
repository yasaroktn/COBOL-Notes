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

```vbnet
01 AGE PIC 9(3).
01 NAME PIC X(20).
```

Yukarıdaki örnekte, "AGE" adında üç basamaklı bir sayıyı ve "NAME" adında 20 karakterlik bir metni saklamak için iki değişken tanımlanmıştır.

Dizeler için Örnek verecek olursak;

```vbnet
01 GRADES OCCURS 10 TIMES PIC 9(2).
01 BOOK-TITLES OCCURS 50 TIMES PIC X(30).
```

Yukarıdaki örnekte, "GRADES" adında 10 elemanlı bir sayısal dizi ve "BOOK-TITLES" adında 50 elemanlı bir metinsel dizi tanımlanmıştır.

Sabitler için Örnek verecek olursak;

```vbnet
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

```vbnet
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

**Ek Bilgi :** Eğer ki bir değişken tanımlanıyorken tek bir değişken tanımlanıyorsa yani ortada bir gruplandırma söz konusu değilse, bu durumda **77** düzeyini kullanabiliriz. Eğer ki böyle bir durumda **01** seviye numarasını kullanırsak hiyerarşik bir veri öğesi grubu oluşturuyormuşuz gibi bir algı oluşabilir. Syntax açısından iki kullanımda doğrudur lakin hiyerarşi göz edikmeksizin oluşturulan tek bir değişkenin tanımlandığı değişkenlerde yaygın kullanım **77** düzeyinin kullanılmasıdır.

Örnek;

```vbnet
77 STUDENT-ID PIC 9(5).
77 STUDENT-NAME PIC X(30).
```

### PIC ve OCCURS nedir?

PIC(Picture Clause) ve OCCURS programa dilinde veri tanımlaması yapılırken kullanılan iki önemli belirteçtir:

1. **PIC** : PIC belirteci, bir veri öğesinin veri türünü ve formatını belirlemede kullanılır. PIC belirteci veri öğesinin sayısal veyahut metinsel bir değeri nasıl temsil ettiğini belirler.  Örneğin bir sayıyı temsil etmek için **PIC 9** kullanılırken, metinsel bir değeri temsil etmek için **PIC X** kullanılır. PIC belirteci aynı zamanda verinin uzunluğunu, basamak sayısını ve diğer özelliklerini belirtebilir.

Örneğin;

- **PIC 9(5)** Beş basamaklı bir sayıyı temsil eder.
- **PIC X(20)** 20 karakterlik bir metini temsil eder.

1. **OCCURS** : OCCURS belirteci, bir dizi tanımlamak için kullanılır. OCCURS belirteci, dizinin eleman sayısını ve herbir elemanının veri tipini belirtir. 

Örneğin;

- **01 GRADES OCCURS 10 TIMES PIC 9(2)** “GRADES” adında 10 elemanlı bir array tanımlar ve bu arrayin içersinde ki her eleman 2 basamaklı sayıları temsil eder.
- **01 DAYS OCCURS 7 TIMES PIC X(10)** “DAYS” adında 7 elemanlı bir array tanımlar ve her elemanı 10 karakterlik bir metni temsil eder.

Bu belirteçler, COBOL'da veri tanımlarken kullanılan önemli yapısal unsurlardır. PIC belirteci veri tipini ve formatını belirtirken, OCCURS belirteci dizilerin boyutunu ve elemanlarının veri tipini belirtir.

### X ve 9 nedir ?

Aslında buraya kadar yazıyı takip eden herkesin tahmin edebileceği üzere **X** bu verinin metinsel karakterler barındıracağı ve **9** karakteri ise bu verinin sayısal bir karakter barındıracağının bilgisini vermektedir. 

Tabii ki bu veri türleri sayısal ve metinsel veri türlerinden ibaret değildir. Sayısal ve Metinsel veri türleri dışında diğer veri türlerini temsil eden özel karakterler şöyledir ;

- **A**: Metinsel karakteri temsil eder.  **X** ile aynı işlevi görür.
- **V**: Varyanslı alfanumerik karakteri temsil eder. Değişken uzunlukta metinleri ifade etmek için kullanılır. Örneğin, **V(50)** maksimum 50 karakterlik bir metni temsil eder.
- **S**: İşaret karakterini temsil eder. Pozitif veya negatif sayıları ifade etmek için kullanılır.
- **P**: Ondalık ayırıcı karakterini temsil eder. Ondalık sayıları ifade etmek için kullanılır.

Bu sorulara da cevap bulduktan sonra WORKING-STORAGE SECTION bölümünü sonlandırabiliriz. Detaylı bir giriş olmasada diğer sectionlar hakkında da bir kaç temel bilgiyi paylaşıcam böylece en azından FILE SECTION ve LINKAGE SECTION’nın temelde hangi amaçlar doğrultusunda kullanıldığı hakkında bilgi sahibi olabileceğiz.

### FİLE SECTION

Temel anlamda file section için, programın giriş/çıkış işlemleri için kullanılacağı dosyaların tanımlanması için kullanılan bölümdür diyebiliriz. Dosyalara erişim, okuma ve yazma işlemleri gibi temel dosya işlemlerinin öğrenilmesi için önemlidir.

### LINKAGE SECTION

LINKAGE SECTION programın başka programlara veya modüllere veri aktarımı yapması için kullanılan veri alanlarını tanımlar. İki program arasında veri paylaşımı yapabilmek amacıyla kullanılmaktadır.

Kanaatimce COBOL programlama diline başlarken WORKING-STORAGE SECTION’ ı öğrenmek ve temel veri türlerini, değişken tanımlamalarını ve diğer atama işlemlerini benimsemek önceliğimiz olmalıdır. Daha sonrasında diğer dosya işlemleri gibi bölümlere geçiş yapmamız gerekmektedir.

Böylece DATA DIVISION. bölümünü bitirip PROCEDURE DIVISION. Bölümüne geçiş yapmaya başlayabiliriz bu bölüm programın çalışma mantığını temsil eden bölüm olacaktır.

### PROCEDURE DIVISION.

PROCEDURE DIVISION, COBOL gerçek işlemlerin ve iş mantığının tanımlandığı bölümdür. Bu bölümde programın çalışma sürecinde gerçekleşecekler ve gerçekleşicek olan işlem adımları belirlenmektedir.

PROCEDURE DIVISION şu unsurlardan oluşmaktadır:

1. **PERFORM** : PERFORM ifadesi, belirli bir işlem veya işlemlerin yürütülmesini sağlamaktadır. PERFORM İfadesi şu işlevlere sahiptir;
    - **İşlem Gruplarını Tekrarlama** : PERFORM ifadesi, belirli bir işlem grubunu tekrar etmek için kullanılabilmektedir. Bu aynı işlem grubunun birden fazla kez yürütülmesini sağlar. Örneğin:
        
        ```vbnet
        PERFORM 5 TIMES
        	DISPLAY "Hello, World!"
        END-PERFORM.
        ```
        
        Yukarıda ki örnekte “Hello, World!” ifadesi 5 kere ekrana yazılmaktadır.
        
    - **Alt Programları Çağırma** : PERFORM ifadesi, başka bir prosedür veyahut alt programın çağrılmasında da kullanılabilmektedir. Bu programın işlemlerinin yürütülmesini ve ardından programın ana akışına geri dönülebilmesine olanak tanır. Örneğin:
        
        ```vbnet
        PERFORM process-data.
        ```
        
    
    Yukarıdaki örnekte “process-data” adlı bir prosedür çağrılır ve işlemler yürütülür.
    
    - **Döngü Yapma** : PERFORM ifadesi, bir döngü oluşturmak içinde kullanılabilinmektedir. PERFORM UNTİL veya PERFORM VARYING kullanarak belirli bir koşula kadar veya belirlemiş olduğumuz bir sayac değişkenini değiştirerek işlemleri tekrarlayabilir ve o koşul gerçekleşmeyi sonlandırdığı an işlemleri sonlandırabiliriz. Örneğin:
        
        ```vbnet
        PERFORM UNTIL COUNT < 10 
        	...
        	İşlemler
        	...
        	ADD 1 TO COUNT
        END-PERFORM.
        ```
        
    
    Yukarıda vermiş olduğum örnekte count değişkeni 10’dan küçükken işlemler gerçekleşecek bu belirlenmiş olan koşul artık gerçekleşmediği zamanda işlem tekrarı sonlanmış olacaktır.
    
2. **IF-ELSE** : IF-ELSE ifadesi, bir koşulun doğru veya yanlış olmasına karşılık farklı işlemler yapılmasını sağlar. IF ifadesi, belirli bir koşulu değerlendirir ve koşul gerçekleşiyorsa belirtilen kod bloğunu yürütür. ELSE ifadesi, IF  koşulunun yanlış olması halinde yürütülecek olan işlem bloğudur. Örneğin:
    
    ```vbnet
    IF TOTAL > 1000
    	DISPLAY "Total is greater than 1000"
    ELSE 
    	DISPLAY "Total is less than or equal to 1000"
    END-IF.
    ```
    

1. **MOVE** : MOVE ifadesi, bir değişkenin veya sabit bir değerin başka bir değişkene atamasını yaparken kullanılır. Örneğin:
    
    ```vbnet
    MOVE 10 TO COUNT.
    MOVE "Hello" TO MASSAGE.
    ```
    

1. **COMPUTE** : COMPUTE ifadesi, matematiksel veya aritmatiksel işlemlerin gerçekleşmesi için kullanılmaktadır. Bu ifade, belirli bir formül veya işlemi kullanarak bir veya daha fazla değişkenin değerini hesaplayabilir.
    
    ```vbnet
    COMPUTE TOTAL = PRICE * QUANTITY.
    COMPUTE AVERAGE = (MARKS1 + MARKS2 + MARKS3) / 3.
    ```
    
2. **DISPLAY** : DISPLAY ifadesi, bir metin veya değişkenin değerini çıktı olarak ekrana veya başka bir çıktı cihazına göndermek için kullanılmaktadır. Örneğin :
    
    ```vbnet
    DISPLAY "Hello, World!".
    DISPLAY "Total: " TOTAL.
    ```
    
3. **ACCEPT** : ACCEPT ifadesi, kullanıcıdan girdi almak için kullanılır. Örneğin:
    
    ```vbnet
    DISPLAY "Hello, What is your name? : ".
    ACCEPT NAME.
    
    DISPLAY "Nice to meet you " NAME .
    ```
Bu aşamada başlangıç seviyesinde bir proje yapmayı denedim [buradan](https://github.com/yasaroktn/COBOL-Notes/blob/master/first.cob) ulaşabilirsiniz.