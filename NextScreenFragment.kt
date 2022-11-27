package com.example.myappkotlinclassapp

import android.os.Bundle
import android.view.View
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.navArgs
import kotlinx.android.synthetic.main.fragment_next_screen.*

class NextScreenFragment : Fragment(R.layout.fragment_next_screen) {

        private val args: NextScreenFragmentArgs by navArgs()


        override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
            super.onViewCreated(view, savedInstanceState)

            textView.text = args.result
    }
}