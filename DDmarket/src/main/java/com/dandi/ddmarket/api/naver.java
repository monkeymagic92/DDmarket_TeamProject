package com.dandi.ddmarket.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.dandi.ddmarket.user.model.UserPARAM;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class naver {

	public static String getAccessToken(String code, String state) throws UnsupportedEncodingException {
		String redirectURI = URLEncoder.encode(SNSInfo.getNaverRedirectUri(),"UTF-8");
				
		StringBuffer apiURL = new StringBuffer();
		apiURL.append("https://nid.naver.com/oauth2.0/token?grant_type=authorization_code");
		apiURL.append("&"+SNSInfo.getNaverClientId());
		apiURL.append("&"+SNSInfo.getNaverClientSecret());
		apiURL.append("&redirect_uri=" + redirectURI);
		apiURL.append("&code=" + code);
		apiURL.append("&state=" + state);
		String access_token = "";
				
		try { 
			  URL url = new URL(apiURL.toString());
		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
		      con.setRequestMethod("GET");
		      int responseCode = con.getResponseCode();
		      BufferedReader br;
		      
		      if(responseCode==200) {
		    	System.out.println("정상 호출");
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		      } else {  // 에러 발생
		    	System.out.println("에러 호출");
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      
		      String inputLine;
		      StringBuffer res = new StringBuffer();
		      
		      while ((inputLine = br.readLine()) != null) {
		        res.append(inputLine);
		      }
		      br.close();
		      if(responseCode==200) {
	    		JSONParser parsing = new JSONParser();
	    		Object obj = parsing.parse(res.toString());
	    		JSONObject jsonObj = (JSONObject)obj;
	    			        
	    		access_token = (String)jsonObj.get("access_token");
		      }
		    } catch (Exception e) {
		    }
		return access_token;
	}
	
	public static UserPARAM getUserInfo(String access_token) throws IOException {
		String apiurl = "https://openapi.naver.com/v1/nid/me";
		URL url = new URL(apiurl);
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
		con.setRequestMethod("POST");
		con.setRequestProperty("Authorization", "Bearer " + access_token);
		
		BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		
		String line = "";
        String result = "";
        
        while ((line = br.readLine()) != null) {result += line;}
        
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(result);
		
		JsonObject property = element.getAsJsonObject().get("response").getAsJsonObject();
		String user_id = property.getAsJsonObject().get("id").getAsString();
		String profile_img = property.getAsJsonObject().get("profile_image").getAsString();
		String email = property.getAsJsonObject().get("email").getAsString();
		String name = property.getAsJsonObject().get("name").getAsString();
		String nickname = property.getAsJsonObject().get("nickname").getAsString();
		
		UserPARAM userInfo = new UserPARAM();
		userInfo.setNick(nickname);
		userInfo.setUser_id(user_id);
        userInfo.setUser_pw(user_id);
		userInfo.setNm(name);
		userInfo.setProfile_img(profile_img);
		userInfo.setEmail(email);
		userInfo.setJoinPass(3);
		return userInfo;
	}
}
