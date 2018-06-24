package com.example.lenovo.calendarandroid;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public static void main(String[] args){

        String url = "https://lumos-calendar-api-deneme.herokuapp.com/calendars";

        try{

            DefaultHttpClient httpClient = new DefaultHttpClient();
            HttpGet get = new HttpGet(url);
            HttpEntity httpEntity = httpClient.execute(get).getEntity();

            if (httpEntity != null) {
                InputStream inputStream = httpEntity.getContent();
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
                StringBuilder stringBuilder = new StringBuilder();
                String line = null;

                while((line= bufferedReader.readLine()) != null){
                    stringBuilder.append(line+"n");
                }
                inputStream.close();
                System.out.println(stringBuilder.toString());

            }



        }catch(Exception e){

        }



    }

}
