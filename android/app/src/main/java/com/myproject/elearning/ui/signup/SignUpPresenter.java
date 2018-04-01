
package com.myproject.elearning.ui.signup;

import com.myproject.elearning.data.DataManager;
import com.myproject.elearning.ui.base.BasePresenter;
import com.myproject.elearning.utils.rx.SchedulerProvider;

import javax.inject.Inject;

import io.reactivex.disposables.CompositeDisposable;

/**
 * Created by Nhat on 12/13/17.
 */


public class SignUpPresenter<V extends SignUpBaseView> extends BasePresenter<V>
        implements SignUpMvpPresenter<V> {

    private static final String TAG = "LoginPresenter";

    @Inject
    public SignUpPresenter(DataManager dataManager,
                           SchedulerProvider schedulerProvider,
                           CompositeDisposable compositeDisposable) {
        super(dataManager, schedulerProvider, compositeDisposable);
    }

}
