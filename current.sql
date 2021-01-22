-- MariaDB dump 10.18  Distrib 10.4.17-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: textBoard
-- ------------------------------------------------------
-- Server version	10.4.17-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `title` char(200) NOT NULL,
  `body` text NOT NULL,
  `memberId` int(10) unsigned NOT NULL,
  `boardId` int(10) unsigned NOT NULL,
  `likesCount` int(10) unsigned NOT NULL,
  `commentsCount` int(10) unsigned NOT NULL,
  `hitCount` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'2020-12-17 20:55:32','2021-01-22 17:02:16','java 문자열에서 부분 추출하기','# 자바 문자열 분리해서 추출하기\r\n\r\n```java\r\n    // charAt(문장 중에 인덱스 위치에 해당문자 추출)\r\n    \r\n    //인덱스 범위 0~6\r\n    String aaa = \\\"가나다라마바사\\\";\r\n    \r\n    // 인덱스3을 출력하면 \\\"라\\\"가 출력됩니다.\r\n    char data = aaa.charAt(3);    \r\n\r\n    System.out.println(data);\r\n    //출력값 : 라\r\n\r\n    //subString (원하는 범위만큼 문자열 추출)\r\n\r\n    // 인덱스 범위 0~6\r\n    String aaa = \"가나다라마바사\";\r\n    \r\n    //2~5에 해당되는 문자열 부분 추출   \r\n    String data = aaa.substring(2,5);    \r\n    \r\n    System.out.println(data);\r\n    //출력값: 다라마\r\n\r\n    //split(주어진 문자로 분리하여 배열에 저장)\r\n\r\n    // 띄어쓰기를 포함한 문장\r\n    String aaa = \"가나 다라마 바 사\";\r\n\r\n    //split으로 띄어쓰기를 구분하여 배열에 저장\r\n    String[] data = aaa.split(\" \");\r\n\r\n    //구분된 배열을 배열의 길이만큼 출력\r\n    for (int i = 0; i < data.length; i++) {\r\n    System.out.println(data[i]);\r\n    }\r\n    \r\n    //출력값: 가나\r\n             다라 \r\n             바\r\n             사   \r\n    \r\n\r\n\r\n    //split 2탄\r\n\r\n        //구분은 &와 ,(쉼표)와 -로 구분\r\n        String aaa = \"안녕&하세요,반갑-습니다\";\r\n		\r\n        \r\n        // &와 ,(쉼표)와 -로 구분해보면\r\n        String[] data = aaa.split(\"&|,|-\");\r\n\r\n		for (int i = 0; i < data.length; i++) {\r\n			System.out.println(data[i]);\r\n		}\r\n\r\n        //출력값: 안녕\r\n                 하세요\r\n                 반갑\r\n                 습니다\r\n\r\n\r\n```\r\n ',1,3,0,0,6),(2,'2020-12-17 20:55:14','2021-01-22 17:02:16','java 문자열에서 숫자만 추출','# java 문자열에서 숫자만 추출\r\n\r\n```java\r\n\r\n    //정규표현식으로 Integer 추출\r\n\r\n\r\n    String str = \"aaa1234, ^&*2233pp\";\r\n\r\n    //replaceAll()에 인자로 정규표현식과 변환할 문자열을 전달\r\n    String intStr = str.replaceAll(\"[^0-9]\", \"\");\r\n    //\"[^0-9]\"는 0~9의 숫자가 아닌 문자열을 의미 (숫자가 아닌 문자들을 공백(\"\"))\r\n\r\n    System.out.println(intStr);\r\n    \r\n    // 출력값: 12342233\r\n\r\n\r\n    //replaceAll2탄\r\n\r\n    String str = \"aaa1234, ^&*2233pp\";\r\n\r\n    //\"^\\\\d\"는 \"[^0-9]\"의 축약형으로 의미가 동일(\"[^0-9]\" 대신 \"^\\\\d\"사용)\r\n    String intStr = str.replaceAll(\"[^\\\\d]\", \"\");\r\n    \r\n    System.out.println(intStr);\r\n    \r\n    // 출력값: 12342233\r\n    \r\n\r\n    //for문으로 숫자 추출\r\n\r\n    String str = \"aaa1234, ^&*2233pp\";\r\n    \r\n    String intStr = \"\";\r\n    \r\n    for (int i = 0; i < str.length(); i++) {\r\n        char ch = str.charAt(i);\r\n\r\n    //  48은 ASCII에서 숫자 0을 의미하고, 57은 ASCII에서 숫자 9를 의미(0~9까지 숫자만 추출)\r\n    if (48 <= ch && ch <= 57) {\r\n        intStr += ch;\r\n    }\r\n    }\r\n    System.out.println(intStr); \r\n\r\n    // 출력값: 12342233\r\n\r\n\r\n```',1,3,1,1,10),(3,'2020-12-21 09:10:55','2021-01-22 17:02:15','java String값 한글자씩 배열에 저장하기','# java String값 한글자씩 배열에 저장하기\r\n\r\n```java\r\n        \r\n            //Split함수를 활용하여 단어를 String 배열에 한글자씩 저장하기\r\n        \r\n            //스트링 문자:word\r\n   		String 단어 = \"word\";\r\n    \r\n            // String을 담을 배열\r\n		String[] 단어들;\r\n\r\n            //배열에 한글자씩 저장\r\n		단어들 = 단어.split(\"\");\r\n    \r\n		for (int i = 0; i < 단어들.length; i++) {\r\n			System.out.println(단어들[i]);\r\n		}\r\n\r\n        }\r\n        \r\n        출력값: w\r\n               o \r\n               r\r\n               d\r\n \r\n```',1,3,0,0,0),(4,'2020-12-21 09:11:14','2021-01-22 17:02:15','java ArrayList 사용하기','# java ArrayList란\r\n\r\n```java\r\n            //ArrayList를 사용하는데 필수로 넣어야 합니다.\r\n            import java.util.ArrayList;\r\n    \r\n        	// 저장할 타입이 있으면 넣어야 합니다.\r\n		// (ex.ArrayList<String>군것질 = new ArrayList<String>():<>꺽쇠 안에 넣어주기)\r\n		ArrayList 군것질 = new ArrayList<>();\r\n\r\n		// 객체를 담을 메소드 add()\r\n		군것질.add(\"과자\");\r\n		군것질.add(\"초콜릿\");\r\n		군것질.add(\"사탕\");\r\n		군것질.add(\"음료수\");\r\n		군것질.add(\"고구마\");\r\n\r\n		// size를 사용해서 ArrayList의 크기를 정수로 반환\r\n		for (int i = 0; i < 군것질.size(); i++) {\r\n			// get()를 사용해서 ArrayList에 저장된 위치 반환\r\n			// ex. 군것질.get(0)--> 과자가 출력\r\n			System.out.println(군것질.get(i));\r\n		}\r\n\r\n	}\r\n\r\n\r\n        출력값 : 과자\r\n                초콜릿\r\n                사탕\r\n                음료수\r\n                고구마\r\n\r\n\r\n \r\n```',1,3,0,0,0),(5,'2020-12-21 09:11:59','2021-01-22 17:02:14','java 공백제거','# java 공백제거\r\n\r\n```java\r\n\r\n	//공백제거 전		\r\n		String a = \" 공백을 제거합시다. \";\r\n		System.out.println(a);\r\n		\r\n		a = a.trim();\r\n		// trim() 사용 후\r\n		System.out.println(a);\r\n\r\n                    \r\n        출력 값 :  공백을 제거합시다. //<= 사용 전 \r\n                 공백을 제거합시다. // <= 사용 후\r\n\r\n```',1,3,0,0,3),(6,'2020-12-21 11:13:07','2021-01-22 17:02:13','java 문자열 붙이기','# java 문자열 붙이기\r\n\r\n```java\r\n        \r\n        // concat을 사용해서 문자열 붙이기\r\n        String a = \"안녕\";\r\n		String b = \"하세요.\";\r\n    \r\n        // a+b =안녕 + 하세요.\r\n		System.out.println(a.concat(b));\r\n        \r\n        출력값: 안녕하세요.\r\n\r\n\r\n        //문자열이 2개 이상일 때는 Concat보다 Append를 사용하기\r\n		StringBuilder sb = new StringBuilder(\"안녕\");\r\n		\r\n		sb.append(\"하세요.\");\r\n		sb.append(\"저는 홍길동입니다.\");\r\n\r\n		System.out.println(sb);\r\n    \r\n        출력값: 안녕하세요. 저는 홍길동입니다.\r\n\r\n\r\n```',1,3,0,0,5),(7,'2020-12-21 11:25:45','2021-01-22 17:02:13','java 문자열 치환','# java 문자열 치환\r\n\r\n```java\r\n        \r\n           //replace([기존문자],[바꿀문자])\r\n		String a =\"문자를 어떻게 바꾼다고\";\r\n\r\n		a = a.replace(\"어떻게\", \"이렇게\");\r\n		\r\n		 System.out.println(a);\r\n\r\n         // 출력값: 문자를 이렇게 바꾼다고\r\n\r\n\r\n        //replaceAll([정규식],[바꿀문자])\r\n		String a =\"문자를 어떻게 바꾼다고\";\r\n\r\n		a = a.replace(\"어떻게\", \"이렇게\");\r\n		\r\n		 System.out.println(a);\r\n\r\n         // 출력값: 문자를 이렇게 바꾼다고\r\n\r\n            \r\n        //이렇게 보면 replace와 replaceAll이 똑같아 보입니다. \r\n        // 하지만 둘은 차이점이 있습니다.\r\n\r\n        //replace 사용\r\n		String a =\"가.나.다.라.마.바.사\";\r\n\r\n		a = a.replace(\".\", \"/\");\r\n		\r\n		 System.out.println(a);\r\n\r\n        // replace는 인자값만을 변환해줍니다.\r\n        출력값 : 가/나/다/라/마/바/사\r\n\r\n        \r\n    \r\n        	//replaceAll 사용\r\n		String a =\"가.나.다.라.마.바.사\";\r\n\r\n		a = a.replaceAll(\".\", \"/\");\r\n		\r\n		 System.out.println(a);\r\n        \r\n        // replaceAll은 정규식이기 때문에 .(마침표)가 모든 문자를 의미하기에 둘은 다릅니다.\r\n        출력값://///////////\r\n        \r\n        \r\n        // replaceFirst와 replace,replaceAll의 차이점\r\n        \r\n        //replaceFirst 사용(첫번째 값만 바뀝니다.\r\n		String a =\"문자는 문자가 있어야지만 바뀌지\";\r\n\r\n		a = a.replaceFirst(\"문자\", \"단어\");\r\n		\r\n		 System.out.println(a);\r\n    \r\n         출력값: 단어는 문자가 있어야지만 바뀌지\r\n\r\n        //replace replaceAll사용\r\n		String a =\"문자는 문자가 있어야지만 바뀌지\";\r\n\r\n		a = a.replace(\"문자\", \"단어\");\r\n		\r\n		 System.out.println(a);\r\n    \r\n         출력값: 단어는 단어가 있어야지만 바뀌지\r\n\r\n\r\n```',1,3,0,0,11),(8,'2020-12-23 10:10:38','2021-01-22 17:02:13','자유게시판입니다~😄','# 이곳은 자유게시판입니다~\r\n모두 편하게 하고 싶으신 말씀을 적어주시길 바랍니다~\r\n단! 서로의 입장을 생각해주시고 적어주시면 감사하겠습니다~',1,2,0,0,3),(9,'2020-12-23 10:11:42','2021-01-22 17:02:12','공지사항 안내😓','# 이곳은 공지사항입니다~\r\n공지사항이 있을 시 참고해주시면 감사하겠습니다~',1,1,0,0,0),(10,'2021-01-06 23:42:54','2021-01-22 17:02:12','공지사항 안내😄','# 앞으로 일주일에 하나씩 게시물을 올리도록 하겠습니다~\r\n잘 부탁드립니다~',1,1,1,1,0),(11,'2021-01-06 23:44:51','2021-01-22 17:02:11','java 문자열 함수들😄','# java 문자열 함수들\r\n\r\n```java\r\n        \r\n  -startWith: 문자열이 지정한 문자로 시작하는지 판단. 같으면 true 아니면 false를 반환 (대소문자 구별)\r\n\r\n \r\n\r\n  -endWith: 문자열 마지막에 지정한 문자가 있는지를 판단후 있으면 true, 없으면 false를 반환(대소문자 구별)\r\n\r\n \r\n\r\n  -equlas : 두 개의 String에 값만을 비교해서 같으면 true 다르면 false(대소문자 구별)\r\n\r\n \r\n\r\n  -indexOf: 지정한 문자가 문자열에 몇번째에 있는지를 반환한다. (int)\r\n\r\n \r\n\r\n   -lastindexOf: 문자열에 지정한 문자가 마지막 몇 번째에 있는지를 반환한다. (int)\r\n\r\n \r\n\r\n  -length: 문자열의 길이를 반환.\r\n\r\n \r\n\r\n  -replace: 문자열에 지정한 문자가 있으면 새로 지정한 문자로 바꿔서 출력\r\n\r\n \r\n\r\n  -replaceAll: 정규표현식을 지정한 문자로 바꿔서 출력한다.\r\n\r\n \r\n\r\n  -split : 지정한 문자로 문자열을 나눌 수 있다. (배열로 반환)\r\n\r\n \r\n\r\n  -substring: 문자열에 지정한 범위에 속하는 문자열을 반환한다(시작범위에 값은 포함, ★끝나는 범위에 값은 미포함★)\r\n\r\n \r\n\r\n  -toLowerCase, toupperCase: 문자열에 대문자를 소문자로 또는 소문자를 대문자로 변환한다.\r\n\r\n \r\n\r\n  -trim: 문자열에 첫 공백과 마지막 공백을 없애준다.\r\n\r\n \r\n  -valueOf: 다른 자료형의 변수를 문자열로 변환하기.\r\n\r\n  -compareTo: 두 개의 String을 앞에서부터 순서적으로 비교.\r\n\r\n                -문자열의 길이가 다른 경우: ( 길이.lengh - 길이2.length)를 반환\r\n\r\n                -문자열이 다른 부분이 i라면 (길이.charAt(i) - 길이.charAt(i))를 반환\r\n\r\n \r\n\r\n   -contains: 두 개의 String을 비교해서 비교대상 String을 포함하고 있으면 true 다르면 false를 반환\r\n\r\n \r\n\r\n  -charAt: 지정한 index번째에 문자를 반환\r\n\r\n \r\n\r\n  -concat: 문자열과 문자열을 결합해준다.\r\n\r\n \r\n\r\n  -format: 서식 문자열을 이용해서 서식화된 문자열을 반환한다. (뒤에 인수는 객체 배열이어야 함)\r\n\r\n \r\n\r\n  -matches: 지정한 정규 표현과 일치할 때 true를 반환\r\n\r\n \r\n\r\n  -replaceFirst: 문자열에 지정한 문자가 있으면 첫번째만 지정한 문자로 바꿔서 출력.\r\n\r\n \r\n\r\n```',1,3,0,0,5),(12,'2021-01-13 19:49:33','2021-01-22 17:02:11','java 공부에 참고하기 좋은 유튜브강의','# 참고영상\r\n```youtube\r\n1b0MeXeG2VU\r\n```',1,3,0,0,0),(13,'2021-01-13 20:08:46','2021-01-22 17:02:11','java 코드팬으로 공부하기','# codepen으로 자바스크립트 테스트\r\n```codepen\r\nhttps://codepen.io/LHG313/embed/zYKmvoG?height=300&theme-id=light&default-tab=js,result&editable=true\r\n```',1,3,0,0,8),(14,'2021-01-13 22:58:03','2021-01-22 17:02:10','조카영상[올려보기]','# 조카영상[유튜브 적용에 실험해보기]\r\n```youtube\r\nzWtJ-_MZQSc\r\n```',1,2,0,0,0),(15,'2021-01-14 21:16:47','2021-01-22 17:02:09','java playground로 공부하기','# java playground로 기사실기 공부\r\n\r\n```codepen\r\nhttps://code.sololearn.com/cA6A19a722a7?height=500\r\n```',1,3,0,0,6),(16,'2021-01-15 20:04:35','2021-01-22 17:02:09','java 피보나치 수열','# java 피보나치 수열\r\n\r\n```sololearn \r\nhttps://code.sololearn.com/cA9A1041A252/#?height=500\r\n```',1,3,0,0,0),(17,'2021-01-15 20:28:00','2021-01-22 17:02:09','java 연산자 문제','# java 연산자 문제\r\n```sololearn \r\nhttps://code.sololearn.com/cA88A6a267a0/#?height=500\r\n```',1,3,0,0,0),(18,'2021-01-20 20:22:48','2021-01-22 17:02:08','jsp-community 개발일지 1일','# 개발일지 1일 \r\n```html\r\n-로그인, 회원가입[O]\r\n-게시물 CRUD [O]\r\n-권한체크 [O]\r\n\r\n개선해야 할 부분\r\n-로그아웃을 로그인 부분에 설정\r\n-CSS 디자인 더 창의적으로 설정\r\n-게시물 공지사항 게시물만 아닌 자유게시판 등등의 게시물 추가하기\r\n\r\n```\r\n\r\n```youtube\r\ntCVdMABKhzY\r\n```\r\n',1,3,0,0,0),(19,'2021-01-20 20:57:37','2021-01-22 17:02:07','c 언어 1에서 10까지 덧셈 while문','# C언어 while문 덧셈\r\n\r\n```sololearn \r\nhttps://code.sololearn.com/ca23a141a2a0/#/#?height=500\r\n```',1,4,0,0,0);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `name` char(20) NOT NULL,
  `code` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'2020-12-23 10:07:23','2020-12-23 10:07:23','공지사항','notice'),(2,'2020-12-23 10:07:44','2020-12-23 10:07:44','자유게시판','free'),(3,'2020-12-17 20:03:15','2020-12-17 20:03:15','JAVA','java'),(4,'2021-01-20 20:52:45','2021-01-20 20:52:45','c언어','c');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ga4DataPagePath`
--

DROP TABLE IF EXISTS `ga4DataPagePath`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ga4DataPagePath` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `pagePath` char(100) NOT NULL,
  `hit` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pagePath` (`pagePath`)
) ENGINE=InnoDB AUTO_INCREMENT=961 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ga4DataPagePath`
--

LOCK TABLES `ga4DataPagePath` WRITE;
/*!40000 ALTER TABLE `ga4DataPagePath` DISABLE KEYS */;
INSERT INTO `ga4DataPagePath` VALUES (249,'2021-01-07 00:01:51','2021-01-07 00:01:51','/article_detail_5.html',3),(250,'2021-01-07 00:01:51','2021-01-07 00:01:51','/article_detail_8.html',3),(650,'2021-01-13 23:04:49','2021-01-13 23:04:49','/article_detail_6.html',5),(780,'2021-01-17 21:57:27','2021-01-17 21:57:27','/article_detail_11.html',5),(951,'2021-01-22 17:02:21','2021-01-22 17:02:21','/',58),(952,'2021-01-22 17:02:21','2021-01-22 17:02:21','/article_list_java_1.html',34),(953,'2021-01-22 17:02:21','2021-01-22 17:02:21','/article_list_free_1.html',14),(954,'2021-01-22 17:02:21','2021-01-22 17:02:21','/article_search.html',13),(955,'2021-01-22 17:02:21','2021-01-22 17:02:21','/article_detail_7.html',11),(956,'2021-01-22 17:02:21','2021-01-22 17:02:21','/article_list_notice_1.html',11),(957,'2021-01-22 17:02:21','2021-01-22 17:02:21','/article_detail_2.html',10),(958,'2021-01-22 17:02:21','2021-01-22 17:02:21','/article_detail_13.html',8),(959,'2021-01-22 17:02:21','2021-01-22 17:02:21','/article_detail_1.html',6),(960,'2021-01-22 17:02:21','2021-01-22 17:02:21','/article_detail_15.html',6);
/*!40000 ALTER TABLE `ga4DataPagePath` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `loginId` char(30) NOT NULL,
  `loginPw` varchar(50) NOT NULL,
  `name` char(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'2020-12-17 20:04:19','2020-12-17 20:04:19','admin','admin','이회구');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `relTypeCode` char(20) NOT NULL,
  `relId` int(10) unsigned NOT NULL,
  `body` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `relTypeCode_2` (`relTypeCode`,`relId`,`body`),
  KEY `relTypeCode` (`relTypeCode`,`body`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'2021-01-16 20:19:37','2021-01-16 20:19:37','article',2,'SQL'),(2,'2021-01-16 20:19:37','2021-01-16 20:19:37','article',2,'INSERT'),(3,'2021-01-16 20:19:37','2021-01-16 20:19:37','article',2,'DB'),(4,'2021-01-16 20:19:52','2021-01-16 20:19:52','article',1,'DB'),(5,'2021-01-16 20:19:52','2021-01-16 20:19:52','article',1,'SELECT'),(6,'2021-01-16 20:19:52','2021-01-16 20:19:52','article',1,'SQL');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-22 17:05:40
