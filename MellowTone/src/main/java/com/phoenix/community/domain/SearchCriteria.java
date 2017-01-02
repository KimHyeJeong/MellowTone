package com.phoenix.community.domain;

public class SearchCriteria extends Criteria{
	private String searchType;

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	 @Override
     public String toString() {
       return "Search Critera [현페이지="+ getPage() 
                         +", 페이지당 출력행="+ getPerPageNum()
    		             + ", 검색조건="+searchType+"]";
     }


}
