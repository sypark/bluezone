package com.bluezone.bil.service.cust;

import com.bluezone.bil.constant.CommonConstant.CUST_SEX;

public class CustUtil {

	public static String getCustSex(String str){
		String sexNm = "";
		if(CUST_SEX.M.toString().equals(str)){
			sexNm = "남성";
		}else if(CUST_SEX.F.toString().equals(str)){
			sexNm = "여성";
		}
		return sexNm;
	}
}
