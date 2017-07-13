package com.linkode.generator;

import java.util.ArrayList;
import java.util.List;

public class Table {
	String name;
	List<String> fieldNames, fieldTypes, originalNames;
	
	public Table() {
		name = "null-name";
		fieldNames = new ArrayList<String>();
		fieldTypes = new ArrayList<String>();
		originalNames = new ArrayList<String>();
	}
}
