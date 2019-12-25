package com.example.flutter_apistudy;

import android.content.Intent;
import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

import android.text.TextUtils;
import android.util.Log;
import android.widget.Toast;

public class MainActivity extends FlutterActivity {
    private String sharedText;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        // TODO: 2019-12-25 处理fluter外部intent
        Intent intent = getIntent();
        String action = intent.getAction();
        String type = intent.getType();

        if (Intent.ACTION_SEND.equals(action) && type != null) {
            if ("text/plain".equals(type)) {
                handleSendText(intent); // Handle text being sent
            }
        }

        new MethodChannel(getFlutterView(), "app.channel.shared.data").setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                        if (call.method.contentEquals("getSharedText")) {
                            result.success(sharedText);
                            if(!TextUtils.isEmpty(sharedText)) {
                                Log.e("handleSendText","handleText onMethodCall--->" + sharedText);
                            }
                            sharedText = null;
                        }
                    }
                });
    }

    void handleSendText(Intent intent) {
        sharedText = intent.getStringExtra(Intent.EXTRA_TEXT);

        if(!TextUtils.isEmpty(sharedText)) {
//            Toast.makeText(this,sharedText,Toast.LENGTH_LONG).show();
            Log.e("handleSendText","handleText --->" + sharedText);
        }
    }
}
