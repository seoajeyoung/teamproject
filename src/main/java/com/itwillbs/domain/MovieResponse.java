package com.itwillbs.domain;

public class MovieResponse {
    private String title;
    private String titleEng;
    private String directorNm;
    private String actorNm;
    private String nation;
    private String genre;
    private String plot;
    private String runtime;
    private String rating;
    private String releaseDate;
    private String posterUrl;
    private String stillUrl;
    private String vodUrl;
    private String audiAcc;
    private String themeSong;
    private String soundtrack;
    private String Awards1;
    private String movieNm;
	private String rank;
	
	
	

	@Override
	public String toString() {
		return "MovieResponse [title=" + title + "]";
	}

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

    // Getters and Setters
    // ...
    
    
    
    public String getVodUrl() {
		return vodUrl;
	}


	public void setVodUrl(String vodUrl) {
		this.vodUrl = vodUrl;
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

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getPosterUrl() {
        return posterUrl;
    }

    public void setPosterUrl(String posterUrl) {
        this.posterUrl = posterUrl;
    }
    
    
    public String getStillUrl() {
		return stillUrl;
	}

	public void setStillUrl(String stillUrl) {
		this.stillUrl = stillUrl;
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
