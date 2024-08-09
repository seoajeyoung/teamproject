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
		return "AdminDTO [email_list=" + email_list + ", email_subject=" + email_subject + ", email_content="
				+ email_content + "]";
	}
	
	
	
// ===========================================================================================================================
	
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
    private String audiAcc;
    private String themeSong;
    private String soundtrack;
    private String Awards1;
    private Date releaseDte;
    
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
}
    
    



