package com.cc.cw.search.search;

import java.io.IOException;

public interface SearchService {
	 public SearchResult search(String queryString, int startPos, int endPos) throws IOException ;
}
