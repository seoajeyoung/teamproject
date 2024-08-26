package com.itwillbs.domain;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class AdminDTO {
	
	
	private String MEM_NUM;
	private String MEM_ID;
	private String MEM_PASS;
	private String MEM_NAME;
	private String MEM_NICKNAME;
	private String MEM_GENDER;
	private String MEM_PHONE;
	private Timestamp MEM_INPUT;
	private Timestamp MEM_RESPITE;
	private Timestamp MEM_OUT;
	private String MEM_STATUS;
	private String MEM_ADMIN;
	private String MEM_GRADE;
	private String MEM_BIRTH;
	private String MEM_EMAIL;
	private String MEM_SNS;
	
	
	private int PO_CURP;
	private int PO_CUMP;
	private int sPoint;
	private String PO_HIS;
	
	
	
	
	
	// ===========================================================================================================================
	
	

	public String getMEM_NUM() {
		return MEM_NUM;
	}

	public void setMEM_NUM(String MEM_NUM) {
		this.MEM_NUM = MEM_NUM;
	}

	public String getMEM_ID() {
		return MEM_ID;
	}

	public void setMEM_ID(String MEM_ID) {
		this.MEM_ID = MEM_ID;
	}

	public String getMEM_PASS() {
		return MEM_PASS;
	}

	public void setMEM_PASS(String MEM_PASS) {
		this.MEM_PASS = MEM_PASS;
	}

	public String getMEM_NAME() {
		return MEM_NAME;
	}

	public void setMEM_NAME(String MEM_NAME) {
		this.MEM_NAME = MEM_NAME;
	}

	public String getMEM_NICKNAME() {
		return MEM_NICKNAME;
	}

	public void setMEM_NICKNAME(String MEM_NICKNAME) {
		this.MEM_NICKNAME = MEM_NICKNAME;
	}

	public String getMEM_GENDER() {
		return MEM_GENDER;
	}

	public void setMEM_GENDER(String MEM_GENDER) {
		this.MEM_GENDER = MEM_GENDER;
	}

	public String getMEM_PHONE() {
		return MEM_PHONE;
	}

	public void setMEM_PHONE(String MEM_PHONE) {
		this.MEM_PHONE = MEM_PHONE;
	}

	public Timestamp getMEM_INPUT() {
		return MEM_INPUT;
	}

	public void setMEM_INPUT(Timestamp MEM_INPUT) {
		this.MEM_INPUT = MEM_INPUT;
	}

	public Timestamp getMEM_RESPITE() {
		return MEM_RESPITE;
	}

	public void setMEM_RESPITE(Timestamp MEM_RESPITE) {
		this.MEM_RESPITE = MEM_RESPITE;
	}

	public Timestamp getMEM_OUT() {
		return MEM_OUT;
	}

	public void setMEM_OUT(Timestamp MEM_OUT) {
		this.MEM_OUT = MEM_OUT;
	}

	public String getMEM_STATUS() {
		return MEM_STATUS;
	}

	public void setMEM_STATUS(String MEM_STATUS) {
		this.MEM_STATUS = MEM_STATUS;
	}

	public String getMEM_ADMIN() {
		return MEM_ADMIN;
	}

	public void setMEM_ADMIN(String MEM_ADMIN) {
		this.MEM_ADMIN = MEM_ADMIN;
	}

	public String getMEM_GRADE() {
		return MEM_GRADE;
	}

	public void setMEM_GRADE(String MEM_GRADE) {
		this.MEM_GRADE = MEM_GRADE;
	}

	public String getMEM_BIRTH() {
		return MEM_BIRTH;
	}

	public void setMEM_BIRTH(String MEM_BIRTH) {
		this.MEM_BIRTH = MEM_BIRTH;
	}

	public String getMEM_EMAIL() {
		return MEM_EMAIL;
	}

	public void setMEM_EMAIL(String MEM_EMAIL) {
		this.MEM_EMAIL = MEM_EMAIL;
	}

	public String getMEM_SNS() {
		return MEM_SNS;
	}

	public void setMEM_SNS(String MEM_SNS) {
		this.MEM_SNS = MEM_SNS;
	}

	public int getPO_CURP() {
		return PO_CURP;
	}

	public void setPO_CURP(int PO_CURP) {
		this.PO_CURP = PO_CURP;
	}

	public int getPO_CUMP() {
		return PO_CUMP;
	}

	public void setPO_CUMP(int PO_CUMP) {
		this.PO_CUMP = PO_CUMP;
	}

	public int getsPoint() {
		return sPoint;
	}

	public void setsPoint(int sPoint) {
		this.sPoint = sPoint;
	}

	public String getPO_HIS() {
		return PO_HIS;
	}

	public void setPO_HIS(String PO_HIS) {
		this.PO_HIS = PO_HIS;
	}

	private String email_list;
	private String email_subject;
	private String email_content;

	public String getEmail_list() {
		return email_list;
	}

	public void setEmail_list(String email_list) {
		this.email_list = email_list;
	}

	public String getEmail_subject() {
		return email_subject;
	}

	public void setEmail_subject(String email_subject) {
		this.email_subject = email_subject;
	}

	public String getEmail_content() {
		return email_content;
	}

	public void setEmail_content(String email_content) {
		this.email_content = email_content;
	}

// ===========================================================================================================================

	private String MOVIE_NUM;
	private String title;
	private String titleEng;
	private String directorNm;
	private String actorNm;
	private String nation;
	private String genre;
	private String plot;
	private String runtime;
	private String rating;
	private String posterUrl;
	private String stillUrl;
	private String vodUrl;
	private String audiAcc;
	private String themeSong;
	private String soundtrack;
	private String Awards1;
	private Date releaseDte;
	private String movieNm;
	private String rank;

	public String getMovieNm() {
		return movieNm;
	}

	public void setMovieNm(String movieNm) {
		this.movieNm = movieNm;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getVodUrl() {
		return vodUrl;
	}

	public void setVodUrl(String vodUrl) {
		this.vodUrl = vodUrl;
	}

	public String getMOVIE_NUM() {
		return MOVIE_NUM;
	}

	public void setMOVIE_NUM(String MOVIE_NUM) {
		this.MOVIE_NUM = MOVIE_NUM;
	}

	public String getStillUrl() {
		return stillUrl;
	}

	public void setStillUrl(String stillUrl) {
		this.stillUrl = stillUrl;
	}

	public Date getReleaseDte() {
		return releaseDte;
	}

	public void setReleaseDte(Date releaseDte) {
		this.releaseDte = releaseDte;
	}

	private String releaseDateStr; // JSON에서 받은 날짜 문자열
	private Date releaseDate; // 유효성 검사를 통과한 날짜

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitleEng() {
		return titleEng;
	}

	public void setTitleEng(String titleEng) {
		this.titleEng = titleEng;
	}

	public String getDirectorNm() {
		return directorNm;
	}

	public void setDirectorNm(String directorNm) {
		this.directorNm = directorNm;
	}

	public String getActorNm() {
		return actorNm;
	}

	public void setActorNm(String actorNm) {
		this.actorNm = actorNm;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getPlot() {
		return plot;
	}

	public void setPlot(String plot) {
		this.plot = plot;
	}

	public String getRuntime() {
		return runtime;
	}

	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public String getReleaseDateStr() {
		return releaseDateStr;
	}

	public void setReleaseDateStr(String releaseDateStr) {
		this.releaseDateStr = releaseDateStr;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public boolean isReleaseDateValid() {
		if (releaseDateStr != null && releaseDateStr.matches("\\d{8}")) {
			try {
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
				this.releaseDate = formatter.parse(releaseDateStr);
				return true;
			} catch (ParseException e) {
				return false;
			}
		}
		return false;
	}

	public String getPosterUrl() {
		return posterUrl;
	}

	public void setPosterUrl(String posterUrl) {
		this.posterUrl = posterUrl;
	}

	public String getAudiAcc() {
		return audiAcc;
	}

	public void setAudiAcc(String audiAcc) {
		this.audiAcc = audiAcc;
	}

	public String getThemeSong() {
		return themeSong;
	}

	public void setThemeSong(String themeSong) {
		this.themeSong = themeSong;
	}

	public String getSoundtrack() {
		return soundtrack;
	}

	public void setSoundtrack(String soundtrack) {
		this.soundtrack = soundtrack;
	}

	public String getAwards1() {
		return Awards1;
	}

	public void setAwards1(String Awards1) {
		this.Awards1 = Awards1;
	}

	// ===========================================================================================================================

	private String TH_NUM;
	private String TH_NAME;
	private String TH_REGION;
	private String TH_ADDR;
	private int TH_ORDER;
	private String TH_REGIONEng;
	private String TH_NAMEEng;
	private String TH_NUMBER;

	public String getTH_NUMBER() {
		return TH_NUMBER;
	}

	public void setTH_NUMBER(String tH_NUMBER) {
		TH_NUMBER = tH_NUMBER;
	}

	public String getTH_NUM() {
		return TH_NUM;
	}

	public void setTH_NUM(String TH_NUM) {
		this.TH_NUM = TH_NUM;
	}

	public String getTH_NAME() {
		return TH_NAME;
	}

	public void setTH_NAME(String TH_NAME) {
		this.TH_NAME = TH_NAME;
	}

	public String getTH_REGION() {
		return TH_REGION;
	}

	public void setTH_REGION(String TH_REGION) {
		this.TH_REGION = TH_REGION;
	}

	public String getTH_ADDR() {
		return TH_ADDR;
	}

	public void setTH_ADDR(String TH_ADDR) {
		this.TH_ADDR = TH_ADDR;
	}

	public int getTH_ORDER() {
		return TH_ORDER;
	}

	public void setTH_ORDER(int TH_ORDER) {
		this.TH_ORDER = TH_ORDER;
	}

	public String getTH_REGIONEng() {
		return TH_REGIONEng;
	}

	public void setTH_REGIONEng(String TH_REGIONEng) {
		this.TH_REGIONEng = TH_REGIONEng;
	}

	public String getTH_NAMEEng() {
		return TH_NAMEEng;
	}

	public void setTH_NAMEEng(String TH_NAMEEng) {
		this.TH_NAMEEng = TH_NAMEEng;
	}

//===========================================================================================================================

	private String ST_NUM;
	private String ST_NAME;
	private String ST_DETAIL;
	private String ST_PRICE;
	private String ST_PICTURE;
	private String ST_TYPE;
	private String detail_value;

	public String getDetail_value() {
		return detail_value;
	}

	public void setDetail_value(String detail_value) {
		this.detail_value = detail_value;
	}

	public String getST_NUM() {
		return ST_NUM;
	}

	public void setST_NUM(String ST_NUM) {
		this.ST_NUM = ST_NUM;
	}

	public String getST_NAME() {
		return ST_NAME;
	}

	public void setST_NAME(String ST_NAME) {
		this.ST_NAME = ST_NAME;
	}

	public String getST_DETAIL() {
		return ST_DETAIL;
	}

	public void setST_DETAIL(String ST_DETAIL) {
		this.ST_DETAIL = ST_DETAIL;
	}

	public String getST_PRICE() {
		return ST_PRICE;
	}

	public void setST_PRICE(String ST_PRICE) {
		this.ST_PRICE = ST_PRICE;
	}

	public String getST_PICTURE() {
		return ST_PICTURE;
	}

	public void setST_PICTURE(String ST_PICTURE) {
		this.ST_PICTURE = ST_PICTURE;
	}

	public String getST_TYPE() {
		return ST_TYPE;
	}

	public void setST_TYPE(String ST_TYPE) {
		this.ST_TYPE = ST_TYPE;
	}

//===========================================================================================================================

	private String TP_SEAT;
	private String member_id;
	private String SC_TIME;
	private String SC_TIME_END;
	private String TP_NUM;
	private String TP_PRICE;
	private String TP_TYPE;
	private String TP_PAYMENT;
	private String TP_TIME;
	

	public String getTP_TIME() {
		return TP_TIME;
	}

	public void setTP_TIME(String TP_TIME) {
		this.TP_TIME = TP_TIME;
	}

	public String getTP_TYPE() {
		return TP_TYPE;
	}

	public void setTP_TYPE(String TP_TYPE) {
		this.TP_TYPE = TP_TYPE;
	}

	public String getTP_PAYMENT() {
		return TP_PAYMENT;
	}

	public void setTP_PAYMENT(String TP_PAYMENT) {
		this.TP_PAYMENT = TP_PAYMENT;
	}

	public String getTP_NUM() {
		return TP_NUM;
	}

	public void setTP_NUM(String TP_NUM) {
		this.TP_NUM = TP_NUM;
	}

	public String getTP_PRICE() {
		return TP_PRICE;
	}

	public void setTP_PRICE(String TP_PRICE) {
		this.TP_PRICE = TP_PRICE;
	}

	public String getSC_TIME() {
		return SC_TIME;
	}

	public void setSC_TIME(String SC_TIME) {
		this.SC_TIME = SC_TIME;
	}

	public String getSC_TIME_END() {
		return SC_TIME_END;
	}

	public void setSC_TIME_END(String SC_TIME_END) {
		this.SC_TIME_END = SC_TIME_END;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getTP_SEAT() {
		return TP_SEAT;
	}

	public void setTP_SEAT(String TP_SEAT) {
		this.TP_SEAT = TP_SEAT;
	}

//===========================================================================================================================	

	private String sp_num;
	private String payment_total_price;
	private String payment_date;
	private String ST_CONST;
	private String ST_PERIOD;

	public String getST_PERIOD() {
		return ST_PERIOD;
	}

	public void setST_PERIOD(String ST_PERIOD) {
		this.ST_PERIOD = ST_PERIOD;
	}

	public String getSp_num() {
		return sp_num;
	}

	public void setSp_num(String sp_num) {
		this.sp_num = sp_num;
	}

	public String getPayment_total_price() {
		return payment_total_price;
	}

	public void setPayment_total_price(String payment_total_price) {
		this.payment_total_price = payment_total_price;
	}

	public String getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}

	public String getST_CONST() {
		return ST_CONST;
	}

	public void setST_CONST(String ST_CONST) {
		this.ST_CONST = ST_CONST;
	}

	// ===========================================================================================================================

	private String SALES_DATE;
	private BigDecimal STORE_TOTALSALES;
	private BigDecimal MOVIE_TOTALSALES;
	private BigDecimal ALL_TOTALSALES;
	
	public BigDecimal getALL_TOTALSALES() {
		return ALL_TOTALSALES;
	}

	public void setALL_TOTALSALES(BigDecimal ALL_TOTALSALES) {
		this.ALL_TOTALSALES = ALL_TOTALSALES;
	}

	public BigDecimal getMOVIE_TOTALSALES() {
		return MOVIE_TOTALSALES;
	}

	public void setMOVIE_TOTALSALES(BigDecimal mOVIE_TOTALSALES) {
		MOVIE_TOTALSALES = mOVIE_TOTALSALES;
	}

	public String getSALES_DATE() {
		return SALES_DATE;
	}

	public void setSALES_DATE(String SALES_DATE) {
		this.SALES_DATE = SALES_DATE;
	}

	public BigDecimal getSTORE_TOTALSALES() {
		return STORE_TOTALSALES;
	}

	public void setSTORE_TOTALSALES(BigDecimal STORE_TOTALSALES) {
		this.STORE_TOTALSALES = STORE_TOTALSALES;
	}

	// ===========================================================================================================================
	
	private String JOINMONTH;
	private int JOINMEMBER_COUNT;
	private String AGE_GROUP;
	private int AGE_GROUP_COUNT;
	private String member_input;
	private String member_birth;
	
	

	public String getMember_input() {
		return member_input;
	}

	public void setMember_input(String member_input) {
		this.member_input = member_input;
	}

	public String getMember_birth() {
		return member_birth;
	}

	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}

	public String getJOINMONTH() {
		return JOINMONTH;
	}

	public void setJOINMONTH(String JOINMONTH) {
		this.JOINMONTH = JOINMONTH;
	}

	public int getJOINMEMBER_COUNT() {
		return JOINMEMBER_COUNT;
	}

	public void setJOINMEMBER_COUNT(int JOINMEMBER_COUNT) {
		this.JOINMEMBER_COUNT = JOINMEMBER_COUNT;
	}

	public String getAGE_GROUP() {
		return AGE_GROUP;
	}

	public void setAGE_GROUP(String AGE_GROUP) {
		this.AGE_GROUP = AGE_GROUP;
	}

	public int getAGE_GROUP_COUNT() {
		return AGE_GROUP_COUNT;
	}

	public void setAGE_GROUP_COUNT(int AGE_GROUP_COUNT) {
		this.AGE_GROUP_COUNT = AGE_GROUP_COUNT;
	}

	@Override
	public String toString() {
		return "AdminDTO [MEM_NUM=" + MEM_NUM + ", MEM_ID=" + MEM_ID + ", MEM_PASS=" + MEM_PASS + ", MEM_NAME="
				+ MEM_NAME + ", MEM_NICKNAME=" + MEM_NICKNAME + ", MEM_GENDER=" + MEM_GENDER + ", MEM_PHONE="
				+ MEM_PHONE + ", MEM_INPUT=" + MEM_INPUT + ", MEM_RESPITE=" + MEM_RESPITE + ", MEM_OUT=" + MEM_OUT
				+ "]";
	}

	

	
	
	
}
	
	
