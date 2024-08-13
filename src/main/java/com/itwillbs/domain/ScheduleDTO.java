package com.itwillbs.domain;


public class ScheduleDTO {
    private String TH_REGION;
    private String TH_NAME;
    private String TH_NUMBER;
    private String title;  
    private String SC_TIME;
    private String SC_TIME_END;
    private String CI_NUM;
    

    public String getCI_NUM() {
		return CI_NUM;
	}

	public void setCI_NUM(String CI_NUM) {
		this.CI_NUM = CI_NUM;
	}

	// Getters and Setters
    public String getTH_REGION() {
        return TH_REGION;
    }

    public void setTH_REGION(String TH_REGION) {
        this.TH_REGION = TH_REGION;
    }

    public String getTH_NAME() {
        return TH_NAME;
    }

    public void setTH_NAME(String TH_NAME) {
        this.TH_NAME = TH_NAME;
    }

    public String getTH_NUMBER() {
        return TH_NUMBER;
    }

    public void setTH_NUMBER(String TH_NUMBER) {
        this.TH_NUMBER = TH_NUMBER;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

	public String getSC_TIME() {
		return SC_TIME;
	}

	public void setSC_TIME(String sC_TIME) {
		SC_TIME = sC_TIME;
	}

	public String getSC_TIME_END() {
		return SC_TIME_END;
	}

	public void setSC_TIME_END(String sC_TIME_END) {
		SC_TIME_END = sC_TIME_END;
	}

	

    

    
}
