
package com.myproject.elearning.ui.dialog.language;

import android.os.Bundle;
import android.support.v4.app.FragmentManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RadioButton;

import com.myproject.elearning.dagger.component.ActivityComponent;
import com.myproject.elearning.R;
import com.myproject.elearning.ui.base.BaseDialog;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;

/**
 * Created by Nhat on 12/13/17.
 */


public class LanguageDialog extends BaseDialog {

    public static final String TAG = "AppDialog";


    public static LanguageDialog newInstance() {
        LanguageDialog fragment = new LanguageDialog();
        Bundle bundle = new Bundle();
        fragment.setArguments(bundle);
        return fragment;
    }

    @BindView(R.id.radioVietnamese)
    RadioButton radioVietnamese;
    @BindView(R.id.radioEnglish)
    RadioButton radioEnglish;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View view = inflater.inflate(R.layout.dialog_language, container, false);

        ActivityComponent component = getActivityComponent();
        if (component != null) {
            setUnBinder(ButterKnife.bind(this, view));
        }

        return view;
    }


    public void show(FragmentManager fragmentManager) {
        super.show(fragmentManager, TAG);
    }


    @Override
    protected void setUp(View view) {

    }

    @OnClick(R.id.radioVietnamese)
    public void onVietnameseClick() {
        mCallback.onPositive(this, getString(R.string.vi_lang));
    }

    @OnClick(R.id.radioEnglish)
    public void onEnglishClick() {
        mCallback.onPositive(this, getString(R.string.en_lang));
    }
}