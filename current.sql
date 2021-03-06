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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'2020-12-17 20:55:32','2021-02-18 00:05:52','java 문자열에서 부분 추출하기','# 자바 문자열 분리해서 추출하기\r\n\r\n```java\r\n    // charAt(문장 중에 인덱스 위치에 해당문자 추출)\r\n    \r\n    //인덱스 범위 0~6\r\n    String aaa = \\\"가나다라마바사\\\";\r\n    \r\n    // 인덱스3을 출력하면 \\\"라\\\"가 출력됩니다.\r\n    char data = aaa.charAt(3);    \r\n\r\n    System.out.println(data);\r\n    //출력값 : 라\r\n\r\n    //subString (원하는 범위만큼 문자열 추출)\r\n\r\n    // 인덱스 범위 0~6\r\n    String aaa = \"가나다라마바사\";\r\n    \r\n    //2~5에 해당되는 문자열 부분 추출   \r\n    String data = aaa.substring(2,5);    \r\n    \r\n    System.out.println(data);\r\n    //출력값: 다라마\r\n\r\n    //split(주어진 문자로 분리하여 배열에 저장)\r\n\r\n    // 띄어쓰기를 포함한 문장\r\n    String aaa = \"가나 다라마 바 사\";\r\n\r\n    //split으로 띄어쓰기를 구분하여 배열에 저장\r\n    String[] data = aaa.split(\" \");\r\n\r\n    //구분된 배열을 배열의 길이만큼 출력\r\n    for (int i = 0; i < data.length; i++) {\r\n    System.out.println(data[i]);\r\n    }\r\n    \r\n    //출력값: 가나\r\n             다라 \r\n             바\r\n             사   \r\n    \r\n\r\n\r\n    //split 2탄\r\n\r\n        //구분은 &와 ,(쉼표)와 -로 구분\r\n        String aaa = \"안녕&하세요,반갑-습니다\";\r\n		\r\n        \r\n        // &와 ,(쉼표)와 -로 구분해보면\r\n        String[] data = aaa.split(\"&|,|-\");\r\n\r\n		for (int i = 0; i < data.length; i++) {\r\n			System.out.println(data[i]);\r\n		}\r\n\r\n        //출력값: 안녕\r\n                 하세요\r\n                 반갑\r\n                 습니다\r\n\r\n\r\n```\r\n ',1,3,0,0,7),(2,'2020-12-17 20:55:14','2021-02-18 00:05:52','java 문자열에서 숫자만 추출','# java 문자열에서 숫자만 추출\r\n\r\n```java\r\n\r\n    //정규표현식으로 Integer 추출\r\n\r\n\r\n    String str = \"aaa1234, ^&*2233pp\";\r\n\r\n    //replaceAll()에 인자로 정규표현식과 변환할 문자열을 전달\r\n    String intStr = str.replaceAll(\"[^0-9]\", \"\");\r\n    //\"[^0-9]\"는 0~9의 숫자가 아닌 문자열을 의미 (숫자가 아닌 문자들을 공백(\"\"))\r\n\r\n    System.out.println(intStr);\r\n    \r\n    // 출력값: 12342233\r\n\r\n\r\n    //replaceAll2탄\r\n\r\n    String str = \"aaa1234, ^&*2233pp\";\r\n\r\n    //\"^\\\\d\"는 \"[^0-9]\"의 축약형으로 의미가 동일(\"[^0-9]\" 대신 \"^\\\\d\"사용)\r\n    String intStr = str.replaceAll(\"[^\\\\d]\", \"\");\r\n    \r\n    System.out.println(intStr);\r\n    \r\n    // 출력값: 12342233\r\n    \r\n\r\n    //for문으로 숫자 추출\r\n\r\n    String str = \"aaa1234, ^&*2233pp\";\r\n    \r\n    String intStr = \"\";\r\n    \r\n    for (int i = 0; i < str.length(); i++) {\r\n        char ch = str.charAt(i);\r\n\r\n    //  48은 ASCII에서 숫자 0을 의미하고, 57은 ASCII에서 숫자 9를 의미(0~9까지 숫자만 추출)\r\n    if (48 <= ch && ch <= 57) {\r\n        intStr += ch;\r\n    }\r\n    }\r\n    System.out.println(intStr); \r\n\r\n    // 출력값: 12342233\r\n\r\n\r\n```',1,3,1,1,10),(3,'2020-12-21 09:10:55','2021-02-18 00:05:52','java String값 한글자씩 배열에 저장하기','# java String값 한글자씩 배열에 저장하기\r\n\r\n```java\r\n        \r\n            //Split함수를 활용하여 단어를 String 배열에 한글자씩 저장하기\r\n        \r\n            //스트링 문자:word\r\n   		String 단어 = \"word\";\r\n    \r\n            // String을 담을 배열\r\n		String[] 단어들;\r\n\r\n            //배열에 한글자씩 저장\r\n		단어들 = 단어.split(\"\");\r\n    \r\n		for (int i = 0; i < 단어들.length; i++) {\r\n			System.out.println(단어들[i]);\r\n		}\r\n\r\n        }\r\n        \r\n        출력값: w\r\n               o \r\n               r\r\n               d\r\n \r\n```',1,3,0,0,1),(4,'2020-12-21 09:11:14','2021-02-18 00:05:51','java ArrayList 사용하기','# java ArrayList란\r\n\r\n```java\r\n            //ArrayList를 사용하는데 필수로 넣어야 합니다.\r\n            import java.util.ArrayList;\r\n    \r\n        	// 저장할 타입이 있으면 넣어야 합니다.\r\n		// (ex.ArrayList<String>군것질 = new ArrayList<String>():<>꺽쇠 안에 넣어주기)\r\n		ArrayList 군것질 = new ArrayList<>();\r\n\r\n		// 객체를 담을 메소드 add()\r\n		군것질.add(\"과자\");\r\n		군것질.add(\"초콜릿\");\r\n		군것질.add(\"사탕\");\r\n		군것질.add(\"음료수\");\r\n		군것질.add(\"고구마\");\r\n\r\n		// size를 사용해서 ArrayList의 크기를 정수로 반환\r\n		for (int i = 0; i < 군것질.size(); i++) {\r\n			// get()를 사용해서 ArrayList에 저장된 위치 반환\r\n			// ex. 군것질.get(0)--> 과자가 출력\r\n			System.out.println(군것질.get(i));\r\n		}\r\n\r\n	}\r\n\r\n\r\n        출력값 : 과자\r\n                초콜릿\r\n                사탕\r\n                음료수\r\n                고구마\r\n\r\n\r\n \r\n```',1,3,0,0,2),(5,'2020-12-21 09:11:59','2021-02-18 00:05:51','java 공백제거','# java 공백제거\r\n\r\n```java\r\n\r\n	//공백제거 전		\r\n		String a = \" 공백을 제거합시다. \";\r\n		System.out.println(a);\r\n		\r\n		a = a.trim();\r\n		// trim() 사용 후\r\n		System.out.println(a);\r\n\r\n                    \r\n        출력 값 :  공백을 제거합시다. //<= 사용 전 \r\n                 공백을 제거합시다. // <= 사용 후\r\n\r\n```',1,3,0,0,4),(6,'2020-12-21 11:13:07','2021-02-18 00:05:50','java 문자열 붙이기','# java 문자열 붙이기\r\n\r\n```java\r\n        \r\n        // concat을 사용해서 문자열 붙이기\r\n        String a = \"안녕\";\r\n		String b = \"하세요.\";\r\n    \r\n        // a+b =안녕 + 하세요.\r\n		System.out.println(a.concat(b));\r\n        \r\n        출력값: 안녕하세요.\r\n\r\n\r\n        //문자열이 2개 이상일 때는 Concat보다 Append를 사용하기\r\n		StringBuilder sb = new StringBuilder(\"안녕\");\r\n		\r\n		sb.append(\"하세요.\");\r\n		sb.append(\"저는 홍길동입니다.\");\r\n\r\n		System.out.println(sb);\r\n    \r\n        출력값: 안녕하세요. 저는 홍길동입니다.\r\n\r\n\r\n```',1,3,0,0,6),(7,'2020-12-21 11:25:45','2021-02-18 00:05:50','java 문자열 치환','# java 문자열 치환\r\n\r\n```java\r\n        \r\n           //replace([기존문자],[바꿀문자])\r\n		String a =\"문자를 어떻게 바꾼다고\";\r\n\r\n		a = a.replace(\"어떻게\", \"이렇게\");\r\n		\r\n		 System.out.println(a);\r\n\r\n         // 출력값: 문자를 이렇게 바꾼다고\r\n\r\n\r\n        //replaceAll([정규식],[바꿀문자])\r\n		String a =\"문자를 어떻게 바꾼다고\";\r\n\r\n		a = a.replace(\"어떻게\", \"이렇게\");\r\n		\r\n		 System.out.println(a);\r\n\r\n         // 출력값: 문자를 이렇게 바꾼다고\r\n\r\n            \r\n        //이렇게 보면 replace와 replaceAll이 똑같아 보입니다. \r\n        // 하지만 둘은 차이점이 있습니다.\r\n\r\n        //replace 사용\r\n		String a =\"가.나.다.라.마.바.사\";\r\n\r\n		a = a.replace(\".\", \"/\");\r\n		\r\n		 System.out.println(a);\r\n\r\n        // replace는 인자값만을 변환해줍니다.\r\n        출력값 : 가/나/다/라/마/바/사\r\n\r\n        \r\n    \r\n        	//replaceAll 사용\r\n		String a =\"가.나.다.라.마.바.사\";\r\n\r\n		a = a.replaceAll(\".\", \"/\");\r\n		\r\n		 System.out.println(a);\r\n        \r\n        // replaceAll은 정규식이기 때문에 .(마침표)가 모든 문자를 의미하기에 둘은 다릅니다.\r\n        출력값://///////////\r\n        \r\n        \r\n        // replaceFirst와 replace,replaceAll의 차이점\r\n        \r\n        //replaceFirst 사용(첫번째 값만 바뀝니다.\r\n		String a =\"문자는 문자가 있어야지만 바뀌지\";\r\n\r\n		a = a.replaceFirst(\"문자\", \"단어\");\r\n		\r\n		 System.out.println(a);\r\n    \r\n         출력값: 단어는 문자가 있어야지만 바뀌지\r\n\r\n        //replace replaceAll사용\r\n		String a =\"문자는 문자가 있어야지만 바뀌지\";\r\n\r\n		a = a.replace(\"문자\", \"단어\");\r\n		\r\n		 System.out.println(a);\r\n    \r\n         출력값: 단어는 단어가 있어야지만 바뀌지\r\n\r\n\r\n```',1,3,0,0,11),(8,'2020-12-23 10:10:38','2021-02-18 00:05:49','자유게시판입니다~😄','# 이곳은 자유게시판입니다~\r\n모두 편하게 하고 싶으신 말씀을 적어주시길 바랍니다~\r\n단! 서로의 입장을 생각해주시고 적어주시면 감사하겠습니다~',1,2,0,0,5),(9,'2020-12-23 10:11:42','2021-02-18 00:05:49','공지사항 안내😓','# 이곳은 공지사항입니다~\r\n공지사항이 있을 시 참고해주시면 감사하겠습니다~',1,1,0,0,3),(10,'2021-01-06 23:42:54','2021-02-18 00:05:48','공지사항 안내😄','# 앞으로 일주일에 하나씩 게시물을 올리도록 하겠습니다~\r\n잘 부탁드립니다~',1,1,1,1,3),(11,'2021-01-06 23:44:51','2021-02-18 00:05:48','java 문자열 함수들😄','# java 문자열 함수들\r\n\r\n```java\r\n        \r\n  -startWith: 문자열이 지정한 문자로 시작하는지 판단. 같으면 true 아니면 false를 반환 (대소문자 구별)\r\n\r\n \r\n\r\n  -endWith: 문자열 마지막에 지정한 문자가 있는지를 판단후 있으면 true, 없으면 false를 반환(대소문자 구별)\r\n\r\n \r\n\r\n  -equlas : 두 개의 String에 값만을 비교해서 같으면 true 다르면 false(대소문자 구별)\r\n\r\n \r\n\r\n  -indexOf: 지정한 문자가 문자열에 몇번째에 있는지를 반환한다. (int)\r\n\r\n \r\n\r\n   -lastindexOf: 문자열에 지정한 문자가 마지막 몇 번째에 있는지를 반환한다. (int)\r\n\r\n \r\n\r\n  -length: 문자열의 길이를 반환.\r\n\r\n \r\n\r\n  -replace: 문자열에 지정한 문자가 있으면 새로 지정한 문자로 바꿔서 출력\r\n\r\n \r\n\r\n  -replaceAll: 정규표현식을 지정한 문자로 바꿔서 출력한다.\r\n\r\n \r\n\r\n  -split : 지정한 문자로 문자열을 나눌 수 있다. (배열로 반환)\r\n\r\n \r\n\r\n  -substring: 문자열에 지정한 범위에 속하는 문자열을 반환한다(시작범위에 값은 포함, ★끝나는 범위에 값은 미포함★)\r\n\r\n \r\n\r\n  -toLowerCase, toupperCase: 문자열에 대문자를 소문자로 또는 소문자를 대문자로 변환한다.\r\n\r\n \r\n\r\n  -trim: 문자열에 첫 공백과 마지막 공백을 없애준다.\r\n\r\n \r\n  -valueOf: 다른 자료형의 변수를 문자열로 변환하기.\r\n\r\n  -compareTo: 두 개의 String을 앞에서부터 순서적으로 비교.\r\n\r\n                -문자열의 길이가 다른 경우: ( 길이.lengh - 길이2.length)를 반환\r\n\r\n                -문자열이 다른 부분이 i라면 (길이.charAt(i) - 길이.charAt(i))를 반환\r\n\r\n \r\n\r\n   -contains: 두 개의 String을 비교해서 비교대상 String을 포함하고 있으면 true 다르면 false를 반환\r\n\r\n \r\n\r\n  -charAt: 지정한 index번째에 문자를 반환\r\n\r\n \r\n\r\n  -concat: 문자열과 문자열을 결합해준다.\r\n\r\n \r\n\r\n  -format: 서식 문자열을 이용해서 서식화된 문자열을 반환한다. (뒤에 인수는 객체 배열이어야 함)\r\n\r\n \r\n\r\n  -matches: 지정한 정규 표현과 일치할 때 true를 반환\r\n\r\n \r\n\r\n  -replaceFirst: 문자열에 지정한 문자가 있으면 첫번째만 지정한 문자로 바꿔서 출력.\r\n\r\n \r\n\r\n```',1,3,0,0,5),(12,'2021-01-13 19:49:33','2021-02-18 00:05:47','java 공부에 참고하기 좋은 유튜브강의','# 참고영상\r\n```youtube\r\n1b0MeXeG2VU\r\n```',1,3,0,0,5),(13,'2021-01-13 20:08:46','2021-02-18 00:05:47','java 코드팬으로 공부하기','# codepen으로 자바스크립트 테스트\r\n```codepen\r\nhttps://codepen.io/LHG313/embed/zYKmvoG?height=300&theme-id=light&default-tab=js,result&editable=true\r\n```',1,3,0,0,8),(14,'2021-01-13 22:58:03','2021-02-18 00:05:46','조카영상[올려보기]','# 조카영상[유튜브 적용에 실험해보기]\r\n```youtube\r\nzWtJ-_MZQSc\r\n```',1,2,0,0,5),(15,'2021-01-14 21:16:47','2021-02-18 00:05:46','java playground로 공부하기','# java playground로 기사실기 공부\r\n\r\n```codepen\r\nhttps://code.sololearn.com/cA6A19a722a7?height=500\r\n```',1,3,0,0,6),(16,'2021-01-15 20:04:35','2021-02-18 00:05:46','java 피보나치 수열','# java 피보나치 수열\r\n\r\n```sololearn \r\nhttps://code.sololearn.com/cA9A1041A252/#?height=500\r\n```',1,3,0,0,6),(17,'2021-01-15 20:28:00','2021-02-18 00:05:45','java 연산자 문제','# java 연산자 문제\r\n```sololearn \r\nhttps://code.sololearn.com/cA88A6a267a0/#?height=500\r\n```',1,3,0,0,5),(18,'2021-01-20 20:22:48','2021-02-18 00:05:45','jsp-community 개발일지 1일','# 개발일지 1일 \r\n\r\n\r\n- [X] 로그인, 회원가입\r\n- [X] 게시물 CRUD \r\n- [X] 권한체크 \r\n\r\n개선해야 할 부분\r\n- 로그아웃을 로그인 부분에 설정\r\n- CSS 디자인 더 창의적으로 설정\r\n- 게시물 공지사항 게시물만 아닌 자유게시판 등등의 게시물 추가하기\r\n\r\n\r\n```youtube\r\ntCVdMABKhzY\r\n```\r\n',1,6,0,0,5),(19,'2021-01-20 20:57:37','2021-02-18 00:05:44','c 언어 1에서 10까지 덧셈 while문','# C언어 while문 덧셈\r\n\r\n```sololearn \r\nhttps://code.sololearn.com/ca23a141a2a0/#/#?height=500\r\n```',1,4,0,0,6),(20,'2021-01-23 19:48:21','2021-02-18 00:05:44','c 언어 return 문제','# C언어 17년 기사 실기 기출문제 -return\r\n\r\n```sololearn \r\nhttps://code.sololearn.com/cA12a19a25a2/#?height=500\r\n```\r\n```html\r\n<--!문제에 대한 해석-->\r\n\r\n#include <stdio.h>\r\n\r\n4) 4를 함수를 호출한 곳 (res30)으로 반환\r\nint res10(){\r\n    return 4;                                                   \r\n}\r\n\r\n3) 30에 res10 함수를 호출한 다음 돌려받은 값을 더해서 함수를 호출한 곳 res200으로 반환\r\nint res30(){\r\n    return 30 + res10() <---(5) 4를 함수를 호출한 곳 res30으로 반환);\r\n                                 \r\n}\r\n\r\n2) res200함수 호출한 다음 돌려 받을 값을 더해서 함수를 main으로 반환\r\nint res200(){\r\n    return 200 + res30() <--(6)30+4 =34;\r\n}\r\n\r\n1) 순서 무조건 main부터 실행\r\n(res200함수를 호출한 다음 돌려받은 값을 result에 저장)\r\nint main(){\r\nint result;\r\nresult = res200()<--(7)200+34);\r\nprintf(\"%d\\n\", result); <--출력값: 234\r\n}\r\n\r\n\r\n\r\n```',1,4,0,0,2),(21,'2021-01-23 20:22:07','2021-02-18 00:05:43','c 언어 return 문제 2탄','# C언어 17년 기사 실기 기출문제 -return 2탄\r\n\r\n```sololearn \r\nhttps://code.sololearn.com/ca2a4A16A250/#?height=500\r\n```\r\n```html\r\n<--!문제에 대한 해석-->\r\n1)무조건 main부터 시작: 2와 10을 인수로 하여 power 함수를 호출한 다음\r\n돌려받은 값을 정수형으로 출력\r\n-main에서 return 0: 프로그램 정상적인 종료(생략가능)\r\n\r\n2) data=2, exp: 10 입력\r\n-for문이 실행되어 i가 1씩 증가 exp가 10이니 10 미만까지 result = result * data\r\n\r\n디버깅하는 법 \r\n예시) 맨처음 data:2 exp:10 result:1 i:0(1씩 증가) i<exp:(i가 exp보다 작은 동안 T(true) 크면 F(false)) \r\n           i가 1로 증가되면서  result =1 --> result(1) * data(2) =2 \r\n           2가 result에 저장됩니다. \r\n           그 후에  i가 2로 증가되면서 아까 저장된 result(2) *data(2) = 4 그러므로 result는 4!!\r\n           이렇게 계속 반복되다가 i가 10이 되면(i(10)<exp(10)) 딱 반복문 종료되면서 값이 1024가 됩니다. \r\n\r\n           <--!직접해보시면 더 자세히 알 수 있습니다--> \r\n\r\n```',1,4,0,0,3),(22,'2021-01-23 21:08:07','2021-02-18 00:05:43','c 언어 주사위 랜덤문제','# C언어 18년 기사 실기 기출문제 -주사위 랜덤문제\r\n\r\n```sololearn \r\nhttps://code.sololearn.com/ca22A24a17A1/#?height=600\r\n```\r\n```html\r\n<--!문제에 대한 해석-->\r\n\r\n*주사위를 100번 던져서 나오는 숫자의 발생횟수를 구하는 프로그램\r\n\r\n*rand():랜덤하게 숫자를 만드는 함수\r\n-이 함수를 사용하려면 stdlib.h를 먼저 실행해야 합니다.\r\n\r\nhist 배열함수\r\nhist가 방번호라고 생각하면 int hist[6]은 6개의 방 \r\n방을 기준으로 할 때는 1번부터가 아닌 0번부터 0~5번까지 이므로 첫번째 빈칸은 hist[n-1]이고,\r\n두번쨰는 i가 6보다 작을 때까지 반복하므로 hist[i]를 넣으면 0번방부터 5번방까지 넣어지므로 답이 완성됩니다.\r\n\r\n```',1,4,0,0,5),(23,'2021-01-26 21:21:33','2021-02-18 00:05:42','c 언어 역순 출력 문제','# C언어 19년 기사 실기 기출문제 -역순 출력 문제\r\n\r\n```sololearn \r\nhttps://code.sololearn.com/c89a9A14A20a/#?height=600\r\n```\r\n```html\r\n<--!문제에 대한 해석-->\r\n\r\n답안: ch ==\'0\'\r\n-ch가 문자형 변수이므로 0을 따옴표로 묶어야 함, 0을 입력 받으면 break 되는 조건\r\n\r\n*0이 입력된 위치를 찾아 이전 배열 값들은 역순으로 저장됩니다.\r\n\r\n*for(i =0;i<6;i++)에서 i=4 일 때 ch값이 0입니다.(0번지)\r\n따라서 첨자 i가 0,1,2,3 인 값에서 A[0]과 A[3]을 교환, A[1] 과 A[2]을 교환합니다. \r\n\r\n\r\n\r\n```',1,4,0,0,2),(24,'2021-01-26 21:25:51','2021-02-18 00:05:42','c 언어 stack문제','# C언어 18년 기사 실기 기출문제 -stack\r\n\r\n```sololearn \r\nhttps://code.sololearn.com/ca19A719a7a2/#?height=800\r\n```\r\n```html\r\n<--!문제에 대한 해석-->\r\n\r\n   1)#define: 반복되는 명령이나 수식을 프로그래머가 별도의 이름을 부여하여 치환\r\n    (매크로 정의라고도 합니다.)\r\n    -MAX_STACK_SIZE를 10으로 정의\r\n    -매크로명은 변수명 만드는 규칙과 동일하나 일반 변수와 구별하기 위하여 대문자로 사용하는 것이 관례\r\n    (보기에는 변수 선언과 비슷해 보이지만, #define은 함수 개념이 들어갈 수 있다는 점의 차이점이 있습니다.)\r\n    -문장과는 달리 마지막에 세미클론(;)을 사용하지 않습니다.(#define MAX_STACK_SIZE 10)\r\n\r\n *push()\r\n    3)정수형 item 20을 입력 받아 처리 -> stack[0]=20\r\n       -vod: 리턴 값이 없다. - ++top: 1 증가 후 사용\r\n       -stack[1]=30 -stack[2]=40\r\n\r\n *pop()\r\n    11)top= 2 -> return stack[2] -> 40 return\r\n       - top--: 사용 후 1 감소\r\n    16)top=1 -> return stack[1] -> 30 return\r\n    21)top=0 -> return stack[0] -> 20 return\r\n    9)top=2 -> return 0\r\n    14)top=1 -> return 0\r\n    19)top=0 -> return 0\r\n    24)top=-1 -> return 1\r\n\r\n  *main()에서 시작\r\n    2)push 함수로 인수 20을 전달\r\n    4)push 함수로 인수 30을 전달\r\n    6)push 함수로 인수 40을 전달\r\n    8)isempty 함수 호출 -> return 0\r\n    10)!isempty가 참이므로 반복 수행 -> pop 함수 호출\r\n\r\n    12)출력 40\r\n    13)isempty 함수 호출 -> return 0\r\n    15)!isempty가 참이므로 반복 수행 -> pop 함수 호출\r\n\r\n    17)출력 30\r\n    18)isempty 함수 호출 -> return 0\r\n    20)!isempty가 참이므로 반복 수행 -> pop 함수 호출\r\n\r\n    22)출력 20\r\n    23)isempty 함수 호출 -> return 1\r\n    25)!isempty가 거짓이므로 main() 종료\r\n\r\n    \r\n    빈칸 \r\n    1번 답: MAX_STACK_SIZE -1 또는 9 => #define MAX_STACK_SIZE 가 10이므로 \r\n    2번 답: item\r\n    3번 답: -1\r\n    4번 답: top--\r\n\r\n\r\n```',1,4,0,0,1),(25,'2021-01-26 22:05:58','2021-02-18 00:05:41','c 언어 재귀함수 문제','# C언어 17년 기사 실기 기출문제 -재귀함수\r\n\r\n```sololearn \r\nhttps://code.sololearn.com/ca13A13A6a25/#?height=500\r\n```\r\n```html\r\n<--!문제에 대한 해석-->\r\n\r\n[재귀 호출 과정 디버깅]                return 값으로 계산\r\n                                    /출력 후 다시 return \r\n                                            \r\n    ^    |recursive(0) return 2 |       |\r\n    |    | 2 * recursive(0) + 1 | 5     |    \r\n    |    | 2 * recursive(1) + 1 | 11    |  \r\n    |    | 2 * recursive(2) + 1 | 23    |\r\n    |    | 2 * recursive(3) + 1 | 47    |\r\n    |    | 2 * recursive(4) + 1 | 95   \\ /\r\n 재귀 호출                                  \r\n\r\n```',1,4,0,0,2),(26,'2021-01-26 22:19:57','2021-02-18 00:05:41','c 언어 재귀함수 문제 2탄','# C언어 17년 기사 실기 기출문제 -재귀함수 2탄\r\n\r\n```sololearn \r\nhttps://code.sololearn.com/ca3a26A12a4a/#?height=500\r\n```\r\n```html\r\n<--!문제에 대한 해석-->\r\n\r\n[n=3일 때 재귀 호출 과정 디버깅]                \r\n                                return 값으로 계산\r\n    ^         \r\n    |    | 1 * recursive(0)  | 1       |\r\n    |    | 2 * recursive(1)  | 2*1     |\r\n    |    | 3 * recursive(2)  | 3*2*1  \\ /\r\n 재귀 호출                                  \r\n\r\n답안: (1): n==1 또는 n<=1 \r\n       -> 0!,1! 는 결과가 1 \r\n\r\n      (2): n * factorial(n-1)  \r\n\r\n```',1,4,0,0,3),(27,'2021-01-26 22:28:19','2021-02-18 00:05:40','c 언어 재귀함수 문제 3탄','# C언어 17년 기사 실기 기출문제 -재귀함수 3탄\r\n\r\n```sololearn \r\nhttps://code.sololearn.com/cA18357a244a/#?height=500\r\n```\r\n```html\r\n<--!문제에 대한 해석-->\r\n\r\n피보나치 수열: 다음 피보나치 수는 바로 앞의 두 피보나치 수의 합이 됩니다. \r\nex) 2 2 4 = 2+2 =4\r\n\r\n답안: 빈칸 (1): 1, 빈칸 (2): n-2\r\n\r\n\r\n\r\n```',1,4,0,0,3),(28,'2021-02-09 23:43:00','2021-02-18 00:05:39','phython 기사실기 연습문제1','# python 기사 실기 기출문제\r\n\r\n```sololearn \r\nhttps://code.sololearn.com/c3A71a2A230a?height=500\r\n```\r\n```html\r\n<--!문제에 대한 해석-->\r\n\r\ndata1, data2: \'7\'= 문자형\r\ndata3, data4 = 7+7 =14 정수형\r\n(int) <-- 정수형으로 변환 \r\n(str) <-- 문자형으로 변환\r\n\r\n답안:  77\r\n      14  \r\n      14  \r\n      77  \r\n\r\n```',1,5,0,0,2),(29,'2021-02-09 23:51:13','2021-02-18 00:05:39','phython 기사실기 연습문제2','# python 기사 실기 기출문제2\r\n\r\n```sololearn \r\nhttps://code.sololearn.com/c4A5a11A1389?height=500\r\n```\r\n```html\r\n<--!문제에 대한 해석-->\r\n\r\n문자열 관련 메소드\r\n\r\n-upper():대문자로 변경\r\n\r\n-lower():소문자로 변경\r\n\r\n-find(값):처음 검색된 값의 위치. (못 찾으면 -1로 반환)\r\n\r\n-index(값):find()와 동일하나 못 찾으면 오류 발생\r\n\r\n-count(값): 값의 개수\r\n답안:  1\r\n      -1  \r\n       8  \r\n       2  \r\n\r\n```',1,5,0,0,3),(30,'2021-02-17 23:28:56','2021-02-18 00:05:39','jsp-community 개발일지 2일','# 개발일지 2일 \r\n\r\n\r\n- [X] 로그인 수정\r\n- [X] 로그아웃\r\n- [X] 게시물 CRUD \r\n- [X] 권한체크 \r\n- [X] CSS 디자인 수정 완료\r\n\r\n개선해야 할 부분\r\n- 게시물 공지사항 게시물만 아닌 자유게시판 등등의 게시물 추가하기\r\n- 비밀번호 찾고 이메일에서 임시 비밀번호 받고 로그인으로 바로 연결하기 \r\n\r\n```youtube\r\nkacmF_ohUcM\r\n```\r\n',1,6,0,0,0),(31,'2021-02-17 23:37:20','2021-02-18 00:05:38','jsp-community 개발일지 3일','# 개발일지 3일 \r\n\r\n- [x] 리눅스를 통해서 블로그 생성\r\n- [X] 로그인 \r\n- [X] 로그아웃\r\n- [x] 회원가입\r\n- [X] 게시물 CRUD \r\n- [X] 권한체크 \r\n- [X] CSS 디자인 수정 완료\r\n\r\n개선해야 할 부분\r\n- 게시물 공지사항 게시물만 아닌 자유게시판 등등의 게시물 추가하기\r\n- 비밀번호 찾고 이메일에서 임시 비밀번호 받고 로그인으로 바로 연결하기 (연결 잘못함)\r\n\r\n```youtube\r\nZHLmyTORzmc\r\n```\r\n',1,6,0,0,0),(32,'2021-02-17 23:41:28','2021-02-18 00:05:38','jsp-community 개발일지 4일','# 개발일지 4일 \r\n\r\n- [x] 리눅스를 통해서 블로그 생성\r\n- [X] 로그인 \r\n- [X] 로그아웃\r\n- [x] 회원가입\r\n- [X] 게시물 CRUD \r\n- [X] 권한체크 \r\n- [X] CSS 디자인 수정 완료\r\n- [X] 모바일 버전 성공\r\n- [X] 비밀번호 찾고 이메일에서 임시 비밀번호 받고 로그인으로 바로 연결하기\r\n\r\n개선해야 할 부분\r\n- 게시물 공지사항 게시물만 아닌 자유게시판 등등의 게시물 추가하기\r\n- 댓글 CRUD \r\n- 좋아요, 싫어요 \r\n\r\n```youtube\r\n1vBPhM-esnU\r\n```\r\n',1,6,0,0,0),(33,'2021-02-17 23:45:30','2021-02-18 00:05:38','jsp-community 개발일지 5일','# 개발일지 5일 \r\n\r\n- [x] 리눅스를 통해서 블로그 생성\r\n- [X] 로그인 \r\n- [X] 로그아웃\r\n- [x] 회원가입\r\n- [X] 게시물 CRUD \r\n- [X] 권한체크 \r\n- [X] CSS 디자인 수정 완료\r\n- [X] 모바일 버전 성공\r\n- [X] 비밀번호 찾고 이메일에서 임시 비밀번호 받고 로그인으로 바로 연결하기\r\n- [x] 댓글 CRD (U..하는 중)\r\n- [x] 좋아요, 싫어요\r\n\r\n개선해야 할 부분\r\n- 게시물 공지사항 게시물만 아닌 자유게시판 등등의 게시물 추가하기(거의 다함)\r\n- 댓글 CRUD (수정 작업중)\r\n\r\n\r\n```youtube\r\nTZ0v92adwZY\r\n```\r\n',1,6,0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'2020-12-23 10:07:23','2020-12-23 10:07:23','공지사항','notice'),(2,'2020-12-23 10:07:44','2020-12-23 10:07:44','자유게시판','free'),(3,'2020-12-17 20:03:15','2020-12-17 20:03:15','JAVA','java'),(4,'2021-01-20 20:52:45','2021-01-20 20:52:45','c언어','c'),(5,'2021-02-10 00:01:12','2021-02-10 00:01:12','파이썬','phython'),(6,'2021-02-17 23:54:53','2021-02-17 23:54:53','개발일지','개발일지');
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
) ENGINE=InnoDB AUTO_INCREMENT=2021 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ga4DataPagePath`
--

LOCK TABLES `ga4DataPagePath` WRITE;
/*!40000 ALTER TABLE `ga4DataPagePath` DISABLE KEYS */;
INSERT INTO `ga4DataPagePath` VALUES (1981,'2021-02-18 00:05:55','2021-02-18 00:05:55','/',75),(1982,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_list_java_1.html',37),(1983,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_list_free_1.html',17),(1984,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_search.html',14),(1985,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_list_notice_1.html',13),(1986,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_detail_7.html',11),(1987,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_detail_2.html',10),(1988,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_list_c_1.html',10),(1989,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_detail_13.html',8),(1990,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_detail_1.html',7),(1991,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_detail_15.html',6),(1992,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_detail_16.html',6),(1993,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_detail_19.html',6),(1994,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_detail_6.html',6),(1995,'2021-02-18 00:05:55','2021-02-18 00:05:55','/index.html',6),(1996,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_detail_11.html',5),(1997,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_detail_12.html',5),(1998,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_detail_14.html',5),(1999,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_detail_17.html',5),(2000,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_detail_18.html',5),(2001,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_detail_22.html',5),(2002,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_detail_8.html',5),(2003,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_detail_5.html',4),(2004,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_list_phython_1.html',4),(2005,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_detail_10.html',3),(2006,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_detail_21.html',3),(2007,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_detail_26.html',3),(2008,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_detail_27.html',3),(2009,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_detail_29.html',3),(2010,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_detail_9.html',3),(2011,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_detail_20.html',2),(2012,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_detail_23.html',2),(2013,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_detail_25.html',2),(2014,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_detail_28.html',2),(2015,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_detail_4.html',2),(2016,'2021-02-18 00:05:55','2021-02-18 00:05:55','/?fbclid=IwAR0VzL9DVs0YuMA6a55ucQ9q2FyN3VHS2C8nuV1lT-FBU5rs5My3CFMZmpo',1),(2017,'2021-02-18 00:05:55','2021-02-18 00:05:55','/?fbclid=IwAR1BdSm8oxXyIx0YuAsnRwiuCOPLVzyeTAoEKVU5ZUXE-49rbJTgR8pLvLU',1),(2018,'2021-02-18 00:05:55','2021-02-18 00:05:55','/?fbclid=IwAR2Hu_e9C5nc8Su8GUukXrgt2ZWmcwzV1QvTf6sNq_2vKuSMKnjls8P0VU4',1),(2019,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_detail_24.html',1),(2020,'2021-02-18 00:05:55','2021-02-18 00:05:55','/article_detail_3.html',1);
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

-- Dump completed on 2021-02-18  0:06:31
