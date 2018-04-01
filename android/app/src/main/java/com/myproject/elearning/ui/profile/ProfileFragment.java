
package com.myproject.elearning.ui.profile;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.design.widget.TextInputEditText;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.myproject.elearning.R;
import com.myproject.elearning.dagger.component.ActivityComponent;
import com.myproject.elearning.ui.base.BaseFragment;
import com.myproject.elearning.ui.main.MainActivity;

import javax.inject.Inject;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;

import static com.myproject.elearning.utils.KeyboardUtils.showSoftInput;


/**
 * Created by Nhat on 12/13/17.
 */


public class ProfileFragment extends BaseFragment implements ProfileBaseView {

    public static final String TAG = "ProfileFragment";

    @Inject
    ProfileMvpPresenter<ProfileBaseView> mPresenter;

    public static ProfileFragment newInstance() {
        Bundle args = new Bundle();
        ProfileFragment fragment = new ProfileFragment();
        fragment.setArguments(args);
        return fragment;
    }

    @BindView(R.id.editPhone)
    TextInputEditText editPhone;
    @BindView(R.id.editAddress)
    TextInputEditText editAddress;
    @BindView(R.id.editVipDue)
    TextInputEditText editVipDue;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container,
                             @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_profile, container, false);

        ActivityComponent component = getActivityComponent();
        if (component != null) {
            component.inject(this);
            setUnBinder(ButterKnife.bind(this, view));
            mPresenter.onAttach(this);
        }

        return view;
    }

    @Override
    protected void setUp(View view) {

    }

    @Override
    public void onDestroyView() {
        mPresenter.onDetach();
        super.onDestroyView();
    }

    @OnClick(R.id.llPhoneNumber)
    public void onPhoneClick() {
        editPhone.requestFocus();
        showSoftInput(editPhone, getActivity());
    }

    @OnClick(R.id.llAddress)
    public void onAddressClick() {
        editAddress.requestFocus();
        showSoftInput(editAddress, getActivity());
    }

    @OnClick(R.id.btnBuyVip)
    public void onBuyVipClick() {

    }

    @OnClick(R.id.btnSave)
    public void onSaveClick() {

    }

    @OnClick(R.id.imgMenu)
    public void onMenuClick() {
        ((MainActivity) getActivity()).openMenu();
    }
}
