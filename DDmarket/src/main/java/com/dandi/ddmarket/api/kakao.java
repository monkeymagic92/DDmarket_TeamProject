package com.dandi.ddmarket.api;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import com.dandi.ddmarket.user.model.UserPARAM;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class kakao {
	
	public static UserPARAM getUserInfo (String access_Token) throws Exception {
	    UserPARAM param = new UserPARAM();
	    String reqURL = "https://kapi.kakao.com/v2/user/me";
	    
	    
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        
	        //요청에 필요한 Header에 포함될 내용
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String line = "", result = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result);
	        
	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	        
	        String user_id = element.getAsJsonObject().get("id").getAsString();
	        String nickname = "", profile_image ="", email = "";

	        nickname = properties.getAsJsonObject().get("nickname").getAsString();
	        email = kakao_account.getAsJsonObject().get("email").getAsString();
//	        profile_image = properties.getAsJsonObject().get("profile_image").getAsString();
	       
	        try {
	        	profile_image = properties.getAsJsonObject().get("profile_image").getAsString();
	        } catch (Exception e) {
	        	profile_image = "";
	        }
	        
	        
	        param.setUser_id(user_id);
	        param.setUser_pw(user_id);
	        param.setJoinPass(2);
	       
	        
	        if(!"".equals(email)) {param.setEmail(email);}
	        if(!"".equals(nickname)) {param.setNick(nickname);}
	        if(!"".equals(profile_image)) {
	        	param.setProfile_img(profile_image);
//	        	param.setChkProfile(param.getU_profile().substring(0, 4));
	        }  
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    return param;
	}
	
	public static String getAccessToken(String authorize_code) {
		String access_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&"+SNSInfo.getKakaoClientId());
			sb.append("&redirect_uri="+SNSInfo.getKakaoRedirectUri());
			sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();
            
            //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {result += line;}
            
            //Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            
            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            
            br.close();
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        } 
        return access_Token;
	}
	
}
