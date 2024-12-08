package com.example.animationexample;

import android.animation.LayoutTransition;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import java.util.Random;

public class MainActivity extends AppCompatActivity {

    boolean clicked = false;
    Button btn;
    Button btnAdd;
    Button btnMove;
    private LinearLayout container;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        overridePendingTransition(R.anim.silde_in_right, R.anim.slide_out_left);

        container = (LinearLayout) findViewById(R.id.activity_main);
        LayoutTransition l = new LayoutTransition();
        l.enableTransitionType(LayoutTransition.CHANGING);
        container.setLayoutTransition(l);

        btnAdd = (Button) findViewById(R.id.btn_add);
        btnAdd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                container.addView(new Button(MainActivity.this));
            }
        });


        btn = findViewById(R.id.btn_second_activity);
        btnMove = findViewById(R.id.btn_move);

        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(MainActivity.this, SecondActivity.class);
                startActivity(intent);
            }
        });

        btnMove.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (!clicked){
                    btnMove.animate().translationX(100).withLayer();
                    clicked = true;
                }else {
                    btnMove.animate().translationX(0).withLayer();
                    clicked = false;
                }
            }
        });
    }
}