PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
INSERT INTO django_migrations VALUES(1,'contenttypes','0001_initial','2019-11-26 10:30:16.443075');
INSERT INTO django_migrations VALUES(2,'auth','0001_initial','2019-11-26 10:30:16.555773');
INSERT INTO django_migrations VALUES(3,'admin','0001_initial','2019-11-26 10:30:16.734290');
INSERT INTO django_migrations VALUES(4,'admin','0002_logentry_remove_auto_add','2019-11-26 10:30:16.850817');
INSERT INTO django_migrations VALUES(5,'admin','0003_logentry_add_action_flag_choices','2019-11-26 10:30:16.953100');
INSERT INTO django_migrations VALUES(6,'contenttypes','0002_remove_content_type_name','2019-11-26 10:30:17.113852');
INSERT INTO django_migrations VALUES(7,'auth','0002_alter_permission_name_max_length','2019-11-26 10:30:17.258133');
INSERT INTO django_migrations VALUES(8,'auth','0003_alter_user_email_max_length','2019-11-26 10:30:17.382486');
INSERT INTO django_migrations VALUES(9,'auth','0004_alter_user_username_opts','2019-11-26 10:30:17.554361');
INSERT INTO django_migrations VALUES(10,'auth','0005_alter_user_last_login_null','2019-11-26 10:30:17.679246');
INSERT INTO django_migrations VALUES(11,'auth','0006_require_contenttypes_0002','2019-11-26 10:30:17.792921');
INSERT INTO django_migrations VALUES(12,'auth','0007_alter_validators_add_error_messages','2019-11-26 10:30:17.876234');
INSERT INTO django_migrations VALUES(13,'auth','0008_alter_user_username_max_length','2019-11-26 10:30:18.012619');
INSERT INTO django_migrations VALUES(14,'auth','0009_alter_user_last_name_max_length','2019-11-26 10:30:18.186786');
INSERT INTO django_migrations VALUES(15,'auth','0010_alter_group_name_max_length','2019-11-26 10:30:18.399831');
INSERT INTO django_migrations VALUES(16,'auth','0011_update_proxy_permissions','2019-11-26 10:30:18.534465');
INSERT INTO django_migrations VALUES(17,'iotd','0001_initial','2019-11-26 10:30:18.642916');
INSERT INTO django_migrations VALUES(18,'sessions','0001_initial','2019-11-26 10:30:18.750938');
CREATE TABLE IF NOT EXISTS "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "action_time" datetime NOT NULL, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "action_flag" smallint unsigned NOT NULL CHECK ("action_flag" >= 0));
INSERT INTO django_admin_log VALUES(1,'2019-11-26 11:07:54.347396','1','Item object (1)','',1,1,3);
INSERT INTO django_admin_log VALUES(2,'2019-11-27 01:03:05.823981','4','Item object (4)','',1,1,3);
INSERT INTO django_admin_log VALUES(3,'2019-11-27 01:03:05.964576','3','Item object (3)','',1,1,3);
INSERT INTO django_admin_log VALUES(4,'2019-11-27 01:03:06.027271','2','Item object (2)','',1,1,3);
CREATE TABLE IF NOT EXISTS "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
INSERT INTO django_content_type VALUES(1,'iotd','item');
INSERT INTO django_content_type VALUES(2,'admin','logentry');
INSERT INTO django_content_type VALUES(3,'auth','permission');
INSERT INTO django_content_type VALUES(4,'auth','group');
INSERT INTO django_content_type VALUES(5,'auth','user');
INSERT INTO django_content_type VALUES(6,'contenttypes','contenttype');
INSERT INTO django_content_type VALUES(7,'sessions','session');
CREATE TABLE IF NOT EXISTS "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
INSERT INTO auth_permission VALUES(1,1,'add_item','Can add item');
INSERT INTO auth_permission VALUES(2,1,'change_item','Can change item');
INSERT INTO auth_permission VALUES(3,1,'delete_item','Can delete item');
INSERT INTO auth_permission VALUES(4,1,'view_item','Can view item');
INSERT INTO auth_permission VALUES(5,2,'add_logentry','Can add log entry');
INSERT INTO auth_permission VALUES(6,2,'change_logentry','Can change log entry');
INSERT INTO auth_permission VALUES(7,2,'delete_logentry','Can delete log entry');
INSERT INTO auth_permission VALUES(8,2,'view_logentry','Can view log entry');
INSERT INTO auth_permission VALUES(9,3,'add_permission','Can add permission');
INSERT INTO auth_permission VALUES(10,3,'change_permission','Can change permission');
INSERT INTO auth_permission VALUES(11,3,'delete_permission','Can delete permission');
INSERT INTO auth_permission VALUES(12,3,'view_permission','Can view permission');
INSERT INTO auth_permission VALUES(13,4,'add_group','Can add group');
INSERT INTO auth_permission VALUES(14,4,'change_group','Can change group');
INSERT INTO auth_permission VALUES(15,4,'delete_group','Can delete group');
INSERT INTO auth_permission VALUES(16,4,'view_group','Can view group');
INSERT INTO auth_permission VALUES(17,5,'add_user','Can add user');
INSERT INTO auth_permission VALUES(18,5,'change_user','Can change user');
INSERT INTO auth_permission VALUES(19,5,'delete_user','Can delete user');
INSERT INTO auth_permission VALUES(20,5,'view_user','Can view user');
INSERT INTO auth_permission VALUES(21,6,'add_contenttype','Can add content type');
INSERT INTO auth_permission VALUES(22,6,'change_contenttype','Can change content type');
INSERT INTO auth_permission VALUES(23,6,'delete_contenttype','Can delete content type');
INSERT INTO auth_permission VALUES(24,6,'view_contenttype','Can view content type');
INSERT INTO auth_permission VALUES(25,7,'add_session','Can add session');
INSERT INTO auth_permission VALUES(26,7,'change_session','Can change session');
INSERT INTO auth_permission VALUES(27,7,'delete_session','Can delete session');
INSERT INTO auth_permission VALUES(28,7,'view_session','Can view session');
CREATE TABLE IF NOT EXISTS "auth_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "first_name" varchar(30) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "last_name" varchar(150) NOT NULL);
INSERT INTO auth_user VALUES(1,'pbkdf2_sha256$150000$G1Iyx93mK7UM$1edLPn68tmX8Al0XqHF4DYR9tkeEtN0fIRwSLuvyKJs=','2019-11-27 01:04:39.871454',1,'admin','','admin@email.com',1,1,'2019-11-26 10:31:04.426512','');
CREATE TABLE IF NOT EXISTS "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(150) NOT NULL UNIQUE);
CREATE TABLE IF NOT EXISTS "iotd_item" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "modelnum" text NOT NULL, "productName" text NOT NULL, "retailer" text NOT NULL, "link" text NOT NULL, "thumbnail_url" text NULL, "price" text NOT NULL, "reviewnum" text NULL, "rating" text NULL);
INSERT INTO iotd_item VALUES(5,'model_1','[루이까또즈_넥타이(남성)]그레이 투톤 스트라이프 넥타이 LWA09ST22E75','11번가','http://www.11st.co.kr/product/SellerProductDetail.tmall?method=getSellerProductDetail&prdNo=2249971842&trTypeCd=21&trCtgrNo=585021','http://i.011st.com/ex_t/R/400x400/1/85/0/src/pd/19/9/7/1/8/4/2/mrRAH/2249971842_B.jpg','29,640원','리뷰 0건','판매자 평점 별5개 중 0.0개');
INSERT INTO iotd_item VALUES(6,'model_2','Jbans Classic도트패턴 데님넥타이 C1602 AT109 SKB','Coupang','https://www.coupang.com/vp/products/23568874?itemId=91670979&vendorItemId=3159684570&q=%ED%95%98%EB%8A%98%EC%83%89+%EB%8F%84%ED%8A%B8+%EB%84%A5%ED%83%80%EC%9D%B4&itemsCount=36&searchId=31b2804bd00a4373a75159995469b5fd&rank=12&isAddedCart=','https://thumbnail13.coupangcdn.com/thumbnails/remote/492x492ex/image/vendor_inventory/e95c/74be86cb1c5d4b0cba9c0c1a1af5232b58edd24204f1f8ee2150072b6225.jpg','26,040원','리뷰 0건','판매자 평점 별5개 중 0.0개');
INSERT INTO iotd_item VALUES(7,'model_2','[해외] M328389572U72 싱글 사이즈 남성 페이즐리 넥타이 (실크소재)','Coupang','https://www.coupang.com/vp/products/183865826?itemId=526515868&vendorItemId=4367078200&q=%ED%95%98%EB%8A%98%EC%83%89+%EB%8F%84%ED%8A%B8+%EB%84%A5%ED%83%80%EC%9D%B4&itemsCount=36&searchId=625547b946164af682273224888d9e9a&rank=65&isAddedCart=','https://thumbnail11.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/images/2019/02/08/17/2/fcb2f57b-1ef5-4564-a9fa-c5329a70cf04.jpg','21,000원','리뷰 0건','판매자 평점 별5개 중 0.0개');
INSERT INTO iotd_item VALUES(8,'model_2','젠틀안트 스카이블루체인사슬패턴 수동넥타이 CT-3105','Coupang','https://www.coupang.com/vp/products/323528377?itemId=1035883789&vendorItemId=5574636486&q=%ED%95%98%EB%8A%98%EC%83%89+%EB%8F%84%ED%8A%B8+%EB%84%A5%ED%83%80%EC%9D%B4&itemsCount=31&searchId=54332fc26f4f4f5e9567ac7c343dfa3b&rank=97&isAddedCart=','https://thumbnail13.coupangcdn.com/thumbnails/remote/492x492ex/image/vendor_inventory/c57d/d5a5e2a13af284e39106a3bff396909d945dfed5c413135fe34c1fc10ef5.jpg','30,360원','리뷰 0건','판매자 평점 별5개 중 0.0개');
INSERT INTO iotd_item VALUES(9,'model_5','남자를위한 연필 스트라이프 넥타이 - 짠 넥타이 - 노란색 / w 네이비 블루','Coupang','https://www.coupang.com/vp/products/279790760?itemId=888136624&vendorItemId=5236125562&q=%EB%85%B8%EB%9E%80+%EC%8A%A4%ED%8A%B8%EB%9D%BC%EC%9D%B4%ED%94%84+%EB%84%A5%ED%83%80%EC%9D%B4&itemsCount=36&searchId=811caef5ecc24d388de5ae7527a538ca&rank=33&isAddedCart=','https://thumbnail13.coupangcdn.com/thumbnails/remote/492x492ex/image/vendor_inventory/baa2/4bdefba3bbbfe736594a4c515612eccf1ee1a893e59d78ebe99778fff3f6.jpg','25,000원','리뷰 0건','판매자 평점 별5개 중 0.0개');
INSERT INTO iotd_item VALUES(10,'model_5','[젠틀안트 넥타이]네이비&옐로우심플사선수동넥타이(넥타이폭8cm) 05-1086','11번가','http://www.11st.co.kr/product/SellerProductDetail.tmall?method=getSellerProductDetail&prdNo=2211854568&trTypeCd=21&trCtgrNo=585021','http://i.011st.com/ex_t/R/400x400/1/85/0/src/pd/18/8/5/4/5/6/8/HZtAy/2211854568_B.jpg','20,800원','리뷰 0건','판매자 평점 별5개 중 0.0개');
INSERT INTO iotd_item VALUES(11,'model_5','레노마넥타이 (VHSTR1078-YE 심플한스트라이프넥타이)레노마넥타이','11번가','http://www.11st.co.kr/product/SellerProductDetail.tmall?method=getSellerProductDetail&prdNo=1751768200&trTypeCd=21&trCtgrNo=585021&lCtgrNo=1001306&mCtgrNo=1001788','http://i.011st.com/ex_t/R/400x400/1/85/0/src/pd/19/7/6/8/2/0/0/ZSjnB/1751768200_B.jpg','78,200원','리뷰 0건','판매자 평점 별5개 중 0.0개');
INSERT INTO iotd_item VALUES(12,'model_6','엑스트라 롱 퍼플과 네이비 스트라이프 실크 타이','Coupang','https://www.coupang.com/vp/products/311361192?itemId=982785722&vendorItemId=5401832058&q=%EB%84%A4%EC%9D%B4%EB%B9%84+%ED%8D%BC%ED%94%8C+%EB%84%A5%ED%83%80%EC%9D%B4&itemsCount=36&searchId=8d53d61ee9884eb6904a929a1b7d54fb&rank=65&isAddedCart=','https://thumbnail15.coupangcdn.com/thumbnails/remote/492x492ex/image/vendor_inventory/4ee7/7b6de85ed35f76340b1d8431933fe0718d26ec91579b062762158634688a.jpg','76,900원','리뷰 0건','판매자 평점 별5개 중 0.0개');
INSERT INTO iotd_item VALUES(13,'model_6','니트 퍼플네이비사선 수동넥타이05-3107 패션소품 기본','Coupang','https://www.coupang.com/vp/products/250247212?itemId=790685378&vendorItemId=5006162555&q=%EB%84%A4%EC%9D%B4%EB%B9%84+%ED%8D%BC%ED%94%8C+%EB%84%A5%ED%83%80%EC%9D%B4&itemsCount=36&searchId=a7bf72d91b8a481195e65a2e36c3f166&rank=8&isAddedCart=','https://thumbnail12.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/99e2/5e0a73e95c8df0b28bf36134f294168a665ff260bebc77ca9b82f0ef45cd.jpg','25,820원','리뷰 0건','판매자 평점 별5개 중 0.0개');
INSERT INTO iotd_item VALUES(14,'model_6','블랙 퍼플 스트라이프 자동넥타이 GA5078 수동넥타이','Coupang','https://www.coupang.com/vp/products/292084576?itemId=923553918&vendorItemId=5297099676&q=%EB%B3%B4%EB%9D%BC+%EC%8A%A4%ED%8A%B8%EB%9D%BC%EC%9D%B4%ED%94%84+%EB%84%A5%ED%83%80%EC%9D%B4&itemsCount=36&searchId=7e8295b830864613b1118315eda0783d&rank=54&isAddedCart=','https://thumbnail14.coupangcdn.com/thumbnails/remote/492x492ex/image/vendor_inventory/db67/272b1e110e176d7442a8539057f8a313911a81d7e4ab6a51dc43760d21d5.jpg','13,800원','리뷰 0건','판매자 평점 별5개 중 0.0개');
INSERT INTO iotd_item VALUES(15,'model_8','아테스토니 베이직솔리드 넥타이 HNBTM10021','Coupang','https://www.coupang.com/vp/products/176577403?itemId=504792403&vendorItemId=4442287454&q=%EB%84%A5%ED%83%80%EC%9D%B4&itemsCount=36&searchId=8d260b34b5fa4ac9a39e8179da084f63&rank=99&isAddedCart=','https://thumbnail13.coupangcdn.com/thumbnails/remote/492x492ex/image/retail/images/2019/02/28/14/1/0b0743ad-2fc2-4a44-a228-f87e23caa6e7.jpg','85,680원','리뷰 1건','판매자 평점 별5개 중 3.0개');
INSERT INTO iotd_item VALUES(16,'model_8','어버너 넥타이 행커치프 세트 500 브라운','Coupang','https://www.coupang.com/vp/products/288466835?itemId=913641018&vendorItemId=3739221287&q=%EB%B8%8C%EB%9D%BC%EC%9A%B4+%EB%84%A5%ED%83%80%EC%9D%B4&itemsCount=36&searchId=d8ae891b87cf4af0b54aaf135100a102&rank=9&isAddedCart=','https://thumbnail15.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/images/2018/06/01/15/6/74290d52-5826-4147-87a8-02874a21a05e.jpg','16,500원','리뷰 1건','판매자 평점 별5개 중 5.0개');
INSERT INTO iotd_item VALUES(17,'model_8','[레노마_넥타이(남성)]슬림솔리드브라운넥타이(VHFTR1186BW)','11번가','http://www.11st.co.kr/product/SellerProductDetail.tmall?method=getSellerProductDetail&prdNo=2499971231&trTypeCd=21&trCtgrNo=585021&lCtgrNo=1001306&mCtgrNo=1001788','http://i.011st.com/ex_t/R/400x400/1/85/0/src/pd/19/9/7/1/2/3/1/eGxrL/2499971231_B.jpg','57,500원','리뷰 0건','판매자 평점 별5개 중 0.0개');
INSERT INTO iotd_item VALUES(18,'model_9','레디핏 협력사 단색 스카이블루 수동 넥타이 GM8014 수동넥타이','Coupang','https://www.coupang.com/vp/products/292083361?itemId=923552184&vendorItemId=5297094709&q=%ED%95%98%EB%8A%98%EC%83%89+%EB%84%A5%ED%83%80%EC%9D%B4&itemsCount=36&searchId=fee70cc69ab84ad7b3a6a6b237233429&rank=11&isAddedCart=','https://thumbnail12.coupangcdn.com/thumbnails/remote/492x492ex/image/vendor_inventory/dae9/6314f58c7e6ef19db8a06442763af1c83fa70a9bb06766ae86aa5010d358.jpg','14,500원','리뷰 0건','판매자 평점 별5개 중 0.0개');
INSERT INTO iotd_item VALUES(19,'model_9','남자 무지 스카이블루 넥타이','Coupang','https://www.coupang.com/vp/products/298170364?itemId=938972273&vendorItemId=5323926298&q=%ED%95%98%EB%8A%98%EC%83%89+%EB%84%A5%ED%83%80%EC%9D%B4&itemsCount=36&searchId=fee70cc69ab84ad7b3a6a6b237233429&rank=6&isAddedCart=','https://thumbnail12.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/b8cc/cf1ddfd99efc69281f6dfc103f7a325c3bb668ceaf78904fe8743adde957.jpg','23,000원','리뷰 0건','판매자 평점 별5개 중 0.0개');
INSERT INTO iotd_item VALUES(20,'model_9','KissTies 남성 청록 파란색 넥타이 솔리드 결혼식 넥타이 + 선물 상자','Coupang','https://www.coupang.com/vp/products/278512662?itemId=882906750&vendorItemId=5225161538&q=%ED%8C%8C%EB%9E%80%EC%83%89+%EB%84%A5%ED%83%80%EC%9D%B4&itemsCount=36&searchId=0b908eb7243941d28f28b2c70cf62034&rank=37&isAddedCart=','https://thumbnail13.coupangcdn.com/thumbnails/remote/492x492ex/image/vendor_inventory/567e/8173878e455759eb06de81d57379edfb4d86b06a69c4681e2376ebb6a710.jpg','25,000원','리뷰 0건','판매자 평점 별5개 중 0.0개');
INSERT INTO iotd_item VALUES(21,'model_10','Soophen 폴리 남성 Soild 컬러 넥타이 은색 ...','Coupang','https://www.coupang.com/vp/products/320145655?itemId=1024417358&vendorItemId=5466344432&q=%EC%9D%80%EC%83%89+%EB%84%A5%ED%83%80%EC%9D%B4&itemsCount=36&searchId=d1e8d1e4eaed464f8dca3f420eaff9a1&rank=5&isAddedCart=','https://thumbnail14.coupangcdn.com/thumbnails/remote/492x492ex/image/vendor_inventory/bdea/b5eeeaef07aa6f56dfd84effc10f6c5016b02b1dca65ac09c53f30893162.jpg','25,000원','리뷰 0건','판매자 평점 별5개 중 0.0개');
INSERT INTO iotd_item VALUES(22,'model_10','[메멘토모리][85SESD18] KING TWILL SOLID SILVER GRAY 킹트윌 솔리드 실버 그레이','11번가','http://www.11st.co.kr/product/SellerProductDetail.tmall?method=getSellerProductDetail&prdNo=1975064766&trTypeCd=21&trCtgrNo=585021&lCtgrNo=1001306&mCtgrNo=1001788','http://i.011st.com/ex_t/R/400x400/1/85/0/src/pd/19/0/6/4/7/6/6/BaTSA/1975064766_B.jpg','83,000원','리뷰 0건','판매자 평점 별5개 중 0.0개');
INSERT INTO iotd_item VALUES(23,'model_10','[페어팩스] 솔리드 새틴 넥타이 SLD02 실버 F','11번가','http://www.11st.co.kr/product/SellerProductDetail.tmall?method=getSellerProductDetail&prdNo=2412672607&trTypeCd=21&trCtgrNo=585021&lCtgrNo=8286&mCtgrNo=10032','http://i.011st.com/ex_t/R/400x400/1/85/0/src/pd/19/6/7/2/6/0/7/tCVoz/2412672607_B.jpg','181,100원','리뷰 0건','판매자 평점 별5개 중 0.0개');
INSERT INTO iotd_item VALUES(24,'model_15','[mars]남자 고퀄리티 심플 클래식 직장인 넥타이 k02 [mars]남자 고퀄리티 심플 클래식 직장인 넥타이 k02 39968253433','Coupang','https://www.coupang.com/vp/products/265814494?itemId=833195910&vendorItemId=5121237080&q=%EB%84%A5%ED%83%80%EC%9D%B4&itemsCount=36&searchId=af0efc7616da433f98b000dcf9db30eb&rank=296&isAddedCart=','https://thumbnail14.coupangcdn.com/thumbnails/remote/492x492ex/image/vendor_inventory/6314/3c26524a5a303b3b898daa2ee29ad73394d203f95606a12ad589b73ae4a5.png','20,900원','리뷰 0건','판매자 평점 별5개 중 0.0개');
INSERT INTO iotd_item VALUES(25,'model_15','[현대백화점]루이까또즈넥타이 LW412 ST12 린넨멋스러운 두줄스트라이프 타이','Coupang','https://www.coupang.com/vp/products/272493905?itemId=858033016&vendorItemId=5190586622&sourceType=srp_product_ads&q=%EB%84%A4%EC%9D%B4%EB%B9%84+%EC%8A%A4%ED%8A%B8%EB%9D%BC%EC%9D%B4%ED%94%84+%EB%84%A5%ED%83%80%EC%9D%B4&itemsCount=36&searchId=2c9792ef61fd447a992c7d3171f5e924&rank=0&isAddedCart=','https://thumbnail14.coupangcdn.com/thumbnails/remote/492x492ex/image/vendor_inventory/02ea/2037567e06ed9d8d58f2a0ab53fd616570930c108e13f5d3d9948f9cd70e.JPG','28,080원','리뷰 0건','판매자 평점 별5개 중 0.0개');
INSERT INTO iotd_item VALUES(26,'model_15','채현스토어 화이트블루 스트라이프 넥타이 남성','Coupang','https://www.coupang.com/vp/products/343049125?itemId=1090404578&vendorItemId=5603090630&q=%EB%B8%94%EB%A3%A8+%EC%8A%A4%ED%8A%B8%EB%9D%BC%EC%9D%B4%ED%94%84+%EB%84%A5%ED%83%80%EC%9D%B4&itemsCount=36&searchId=0e85a1d86348483c8b36138a39183588&rank=1&isAddedCart=','https://thumbnail11.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/b1c6/4454cfe37270b3c4fec4f3e7af8686f8b6fc8250ed1b22a67669327df566.jpg','17,090원','리뷰 0건','판매자 평점 별5개 중 0.0개');
INSERT INTO iotd_item VALUES(27,'model_18','[텐바이텐] 그랜드 미스틱 도트 넥타이 [5컬러]','Coupang','https://www.coupang.com/vp/products/257830238?itemId=808826387&vendorItemId=5057122470&q=%ED%9A%8C%EC%83%89+%EB%95%A1%EB%95%A1%EC%9D%B4+%EB%84%A5%ED%83%80%EC%9D%B4&itemsCount=36&searchId=ffd6ff4b0ee5468a9ad5fe6dbc57deec&rank=33&isAddedCart=','https://thumbnail14.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/27a9/616f618c904050712432a1826419e01bdc58302ccdc9bbbef00f8401a3d4.jpg','15,000원','리뷰 0건','판매자 평점 별5개 중 0.0개');
INSERT INTO iotd_item VALUES(28,'model_18','젠틀안트 블랙빈티지도트 수동넥타이CT-3026 칼라실크넥타이 실크타이 기하학무늬타이 남성직장인넥타이 기','11번가','http://www.11st.co.kr/product/SellerProductDetail.tmall?method=getSellerProductDetail&prdNo=2529454240&trTypeCd=21&trCtgrNo=585021&lCtgrNo=1001322&mCtgrNo=1001965','http://i.011st.com/ex_t/R/400x400/1/85/0/src/pd/19/4/5/4/2/4/0/lxanr/2529454240_B.jpg','29,490원','리뷰 0건','판매자 평점 별5개 중 0.0개');
INSERT INTO iotd_item VALUES(29,'model_18','젠틀안트 블랙빅 도트수동넥타이05-2002 고급타이 정장실크넥타이 넥타이 칼라넥타이 기하무늬넥타이','11번가','http://www.11st.co.kr/product/SellerProductDetail.tmall?method=getSellerProductDetail&prdNo=2505214280&trTypeCd=21&trCtgrNo=585021&lCtgrNo=1001322&mCtgrNo=1001965','http://i.011st.com/ex_t/R/400x400/1/85/0/src/pd/19/2/1/4/2/8/0/LCUGl/2505214280_B.jpg','26,920원','리뷰 0건','판매자 평점 별5개 중 0.0개');
INSERT INTO iotd_item VALUES(30,'model_19','[루이까또즈_넥타이(남성)]신상 디자인이 예쁜 버건디 퍼플 컬러의 슬림 넥','11번가','http://www.11st.co.kr/product/SellerProductDetail.tmall?method=getSellerProductDetail&prdNo=2571362634&trTypeCd=21&trCtgrNo=585021&lCtgrNo=1001306&mCtgrNo=1001788','http://i.011st.com/ex_t/R/400x400/1/85/0/src/pd/19/3/6/2/6/3/4/ZXoSS/2571362634_B.jpg','29,640원','리뷰 0건','판매자 평점 별5개 중 0.0개');
INSERT INTO iotd_item VALUES(31,'model_19','[질스튜어트뉴욕] 남성 버건디 입체패턴 실크혼방 넥타이 JNNE8F302D2','11번가','http://www.11st.co.kr/product/SellerProductDetail.tmall?method=getSellerProductDetail&prdNo=2272476035&trTypeCd=21&trCtgrNo=585021&lCtgrNo=1001296&mCtgrNo=1001713','http://i.011st.com/ex_t/R/400x400/1/85/0/src/pd/19/4/7/6/0/3/5/KhzMh/2272476035_B.jpg','66,300원','리뷰 0건','판매자 평점 별5개 중 0.0개');
INSERT INTO iotd_item VALUES(32,'model_19','[에르메스] 넥타이 실크 버건디 606041 H`CHEAL','11번가','http://www.11st.co.kr/product/SellerProductDetail.tmall?method=getSellerProductDetail&prdNo=2624037031&trTypeCd=21&trCtgrNo=585021','http://i.011st.com/ex_t/R/400x400/1/85/0/src/pd/19/0/3/7/0/3/1/nboyK/2624037031_B.jpg','427,120원','리뷰 0건','판매자 평점 별5개 중 0.0개');
INSERT INTO iotd_item VALUES(33,'model_20','두이터 남자 무지 라이트그레이 넥타이','Coupang','https://www.coupang.com/vp/products/303118029?itemId=953384706&vendorItemId=5348969212&q=%EA%B7%B8%EB%A0%88%EC%9D%B4+%EB%84%A5%ED%83%80%EC%9D%B4&itemsCount=36&searchId=dcdbc52436bb4b6fa669f1b291e869af&rank=56&isAddedCart=','https://thumbnail15.coupangcdn.com/thumbnails/remote/492x492ex/image/vendor_inventory/3b23/0bdf613fbfe99707633262a94cb8a1935d5c14ed04fd958f6cc0acd32146.jpg','23,000원','리뷰 0건','판매자 평점 별5개 중 0.0개');
INSERT INTO iotd_item VALUES(34,'model_20','솔리드 장타이_그레이_MW7063 솔리드그레이넥타이 고','11번가','http://www.11st.co.kr/product/SellerProductDetail.tmall?method=getSellerProductDetail&prdNo=2615679110&trTypeCd=21&trCtgrNo=585021&lCtgrNo=1001322&mCtgrNo=1001965','http://i.011st.com/ex_t/R/400x400/1/85/0/src/pd/19/6/7/9/1/1/0/BhQha/2615679110_B.jpg','21,080원','리뷰 0건','판매자 평점 별5개 중 0.0개');
INSERT INTO iotd_item VALUES(35,'model_20','남자타이 솔리드 그레이 넥타이 졸업넥타이 플라워넥타이 킹스맨 면접넥타이 남자넥타이 타이 극세사넥타이 20대넥타이 패션넥타이 패턴넥타이 정장넥타이','Coupang','https://www.coupang.com/vp/products/60971599?itemId=209060605&vendorItemId=3550387274&q=%EC%86%94%EB%A6%AC%EB%93%9C+%EA%B7%B8%EB%A0%88%EC%9D%B4+%EB%84%A5%ED%83%80%EC%9D%B4&itemsCount=36&searchId=9ae3d1c25be84104b39d209b35d63298&rank=22&isAddedCart=','https://thumbnail11.coupangcdn.com/thumbnails/remote/492x492ex/image/vendor_inventory/images/2018/01/22/23/5/9a9e11d7-8fac-4a5c-acca-aea4c938ae2a.jpg','18,220원','리뷰 0건','판매자 평점 별5개 중 0.0개');
CREATE TABLE IF NOT EXISTS "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('django_migrations',18);
INSERT INTO sqlite_sequence VALUES('django_admin_log',4);
INSERT INTO sqlite_sequence VALUES('django_content_type',7);
INSERT INTO sqlite_sequence VALUES('auth_permission',28);
INSERT INTO sqlite_sequence VALUES('auth_user',1);
INSERT INTO sqlite_sequence VALUES('auth_group',0);
INSERT INTO sqlite_sequence VALUES('iotd_item',35);
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");
CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" ("user_id", "group_id");
CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_groups_group_id_97559544" ON "auth_user_groups" ("group_id");
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" ("user_id", "permission_id");
CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" ("permission_id");
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");
COMMIT;
