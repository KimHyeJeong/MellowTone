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
       return "Search Critera [��������="+ getPage() 
                         +", �������� �����="+ getPerPageNum()
    		             + ", �˻�����="+searchType+"]";
     }


}
