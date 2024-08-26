package com.itwillbs.domain;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;


public class MovieDTO {
	private String MOVIE_NUM;
	private String movieNum;
    private String title;
    private String titleEng;
	private String direcotrNm;
    private String actorNm;
    private String nation;
    private String genre;
    private String posterUrl;
    private String stillUrl;
    private String vodUrl;
	private String audiAcc;
    private String plot;
    private String runtime;
    private String rating;
    private String themeSong;
    private String soundtrack;
    private String Awards1;
    private LocalDate targetDt;
    private String rank;
    private String movieNm;
    private String show;
    private int rn;
    private Integer dDay;
    
    
    @Override
	public String toString() {
		return "MovieDTO [MOVIE_NUM=" + MOVIE_NUM + ", movieNum=" + movieNum + ", title=" + title + ", titleEng="
				+ titleEng + ", direcotrNm=" + direcotrNm + ", actorNm=" + actorNm + ", nation=" + nation + ", genre="
				+ genre + ", posterUrl=" + posterUrl + ", stillUrl=" + stillUrl + ", vodUrl=" + vodUrl + ", audiAcc="
				+ audiAcc + ", plot=" + plot + ", runtime=" + runtime + ", rating=" + rating + ", themeSong="
				+ themeSong + ", soundtrack=" + soundtrack + ", Awards1=" + Awards1 + ", targetDt=" + targetDt
				+ ", rank=" + rank + ", movieNm=" + movieNm + ", show=" + show + ", rn=" + rn + ", dDay=" + dDay
				+ ", releaseDate=" + releaseDate + ", releaseDts=" + releaseDts + ", releaseDte=" + releaseDte + "]";
	}

	public Integer getdDay() {
		return dDay;
	}

	public void setdDay(Integer dDay) {
		this.dDay = dDay;
	}

    
	public String getVodUrl() {
		return vodUrl;
	}
	public void setVodUrl(String vodUrl) {
		this.vodUrl = vodUrl;
	}
    public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	@DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate releaseDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate releaseDts;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate releaseDte;
    
	public String getMOVIE_NUM() {
		return MOVIE_NUM;
	}
	public void setMOVIE_NUM(String MOVIE_NUM) {
		this.MOVIE_NUM = MOVIE_NUM;
	}
	public String getMovieNum() {
		return movieNum;
	}
	public void setMovieNum(String movieNum) {
		this.movieNum = movieNum;
	}
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
	public String getDirecotrNm() {
		return direcotrNm;
	}
	public void setDirecotrNm(String direcotrNm) {
		this.direcotrNm = direcotrNm;
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
	public LocalDate getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(LocalDate releaseDate) {
		this.releaseDate = releaseDate;
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
	public void setAwards1(String awards1) {
		Awards1 = awards1;
	}
	public LocalDate getReleaseDts() {
		return releaseDts;
	}
	public void setReleaseDts(LocalDate releaseDts) {
		this.releaseDts = releaseDts;
	}
	public LocalDate getReleaseDte() {
		return releaseDte;
	}
	public void setReleaseDte(LocalDate releaseDte) {
		this.releaseDte = releaseDte;
	}
	public LocalDate getTargetDt() {
		return targetDt;
	}
	public void setTargetDt(LocalDate targetDt) {
		this.targetDt = targetDt;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getMovieNm() {
		return movieNm;
	}
	public void setMovieNm(String movieNm) {
		this.movieNm = movieNm;
	}
    public String getStillUrl() {
		return stillUrl;
	}
	public void setStillUrl(String stillUrl) {
		this.stillUrl = stillUrl;
	}
    
	
	
}
