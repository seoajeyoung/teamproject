package com.itwillbs.domain;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


public class AdminDTO {
	
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
	
	@Override
	public String toString() {
		return "AdminDTO [ST_NUM=" + ST_NUM + ", ST_NAME=" + ST_NAME + ", ST_DETAIL=" + ST_DETAIL + ", ST_PRICE="
				+ ST_PRICE + ", ST_PICTURE=" + ST_PICTURE + ", ST_TYPE=" + ST_TYPE + "]";
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

  //===========================================================================================================================
    
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
	
	private String SP_NUM;
	private String SP_SEAT;
	private String member_id;
	private String SC_TIME;
	private String SC_TIME_END;
	private String TP_NUM;
	private String TOTAL_PRICE;
	
	
	
	public String getTP_NUM() {
		return TP_NUM;
	}
	public void setTP_NUM(String TP_NUM) {
		this.TP_NUM = TP_NUM;
	}
	public String getTOTAL_PRICE() {
		return TOTAL_PRICE;
	}
	public void setTOTAL_PRICE(String TOTAL_PRICE) {
		this.TOTAL_PRICE = TOTAL_PRICE;
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
	public String getSP_NUM() {
		return SP_NUM;
	}
	public void setSP_NUM(String SP_NUM) {
		this.SP_NUM = SP_NUM;
	}
	public String getSP_SEAT() {
		return SP_SEAT;
	}
	public void setSP_SEAT(String SP_SEAT) {
		this.SP_SEAT = SP_SEAT;
	}

	
		
	
	
    
}



    



