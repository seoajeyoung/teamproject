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
    private String audiAcc;
    private String plot;
    private String runtime;
    private String rating;
    private String themsSong;
    private String soundtrack;
    private String Awards1;
    private LocalDate targetDt;
    private String rank;
    private String movieNm;
    private String show;
    private int rn;
    
    
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
	@Override
	public String toString() {
		return "MovieDTO [movieNum=" + movieNum + ", title=" + title + ", titleEng=" + titleEng + ", direcotrNm="
				+ direcotrNm + ", actorNm=" + actorNm + ", nation=" + nation + ", genre=" + genre + ", posterUrl="
				+ posterUrl + ", audiAcc=" + audiAcc + ", plot=" + plot + ", runtime=" + runtime + ", rating=" + rating
				+ ", themsSong=" + themsSong + ", soundtrack=" + soundtrack + ", Awards1=" + Awards1 + ", targetDt="
				+ targetDt + ", rank=" + rank + ", movieNm=" + movieNm + ", releaseDate=" + releaseDate
				+ ", releaseDts=" + releaseDts + ", releaseDte=" + releaseDte + ", MOVIE_NUM=" + MOVIE_NUM
				+ ", getMOVIE_NUM()=" + getMOVIE_NUM() + ", getMovieNum()=" + getMovieNum() + ", getTitle()="
				+ getTitle() + ", getTitleEng()=" + getTitleEng() + ", getDirecotrNm()=" + getDirecotrNm()
				+ ", getActorNm()=" + getActorNm() + ", getNation()=" + getNation() + ", getGenre()=" + getGenre()
				+ ", getReleaseDate()=" + getReleaseDate() + ", getPosterUrl()=" + getPosterUrl() + ", getAudiAcc()="
				+ getAudiAcc() + ", getPlot()=" + getPlot() + ", getRuntime()=" + getRuntime() + ", getRating()="
				+ getRating() + ", getThemsSong()=" + getThemsSong() + ", getSoundtrack()=" + getSoundtrack()
				+ ", getAwards1()=" + getAwards1() + ", getReleaseDts()=" + getReleaseDts() + ", getReleaseDte()="
				+ getReleaseDte() + ", getTargetDt()=" + getTargetDt() + ", getRank()=" + getRank() + ", getMovieNm()="
				+ getMovieNm() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
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
	public String getThemsSong() {
		return themsSong;
	}
	public void setThemsSong(String themsSong) {
		this.themsSong = themsSong;
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
    
    
	
	
}
