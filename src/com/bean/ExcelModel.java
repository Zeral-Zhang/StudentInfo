package com.bean;

import java.lang.reflect.Field;
import java.lang.reflect.Method;


public class ExcelModel {

	private Method setMethod;

	private Field field;
	
	private String excelHead;

	public Method getSetMethod() {
		return setMethod;
	}

	public void setSetMethod(Method set) {
		this.setMethod = set;
	}

	public Field getField() {
		return field;
	}

	public void setField(Field field) {
		this.field = field;
	}

	public String getExcelHead() {
		return excelHead;
	}

	public void setExcelHead(String excelHead) {
		this.excelHead = excelHead;
	}

	
}
