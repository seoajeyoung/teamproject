package com.itwillbs.domain;


public class ScheduleDTO {
    private String TH_REGION;
    private String TH_NAME;
    private String CI_NUMBER;
    private String title;  
    private String SC_TIME;
    private String SC_TIME_END;
    

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

    public String getCI_NUMBER() {
        return CI_NUMBER;
    }

    public void setCI_NUMBER(String CI_NUMBER) {
        this.CI_NUMBER = CI_NUMBER;
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

	@Override
	public String toString() {
		return "ScheduleDTO [TH_REGION=" + TH_REGION + ", TH_NAME=" + TH_NAME + ", CI_NUMBER=" + CI_NUMBER + ", title="
				+ title + ", SC_TIME=" + SC_TIME + ", SC_TIME_END=" + SC_TIME_END + "]";
	}

    

    
}
