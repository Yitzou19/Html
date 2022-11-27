package com.example.myappkotlinclassapp

import android.os.Bundle
import android.view.View
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.findNavController
import kotlinx.android.synthetic.main.fragment_home.*

class HomeFragment : Fragment(R.layout.fragment_home){
    var num=0

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        btn_add.setOnClickListener {
            num=num.inc()
            tv_result.text = num.toString()

        }
        btn_minus.setOnClickListener {
            num=num.dec()
            tv_result.text = num.toString()
        }

        btn_next_screen.setOnClickListener {
            val result = tv_result.text.toString()
            val action = HomeFragmentDirections.actionHomeFragmentToNextScreenFragment(result)
            findNavController().navigate(action)
        }
    }

}