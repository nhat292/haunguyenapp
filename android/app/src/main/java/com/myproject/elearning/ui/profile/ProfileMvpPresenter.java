
package com.myproject.elearning.ui.profile;


import com.myproject.elearning.dagger.PerActivity;
import com.myproject.elearning.ui.base.MvpPresenter;

/**
 * Created by Nhat on 12/13/17.
 */


@PerActivity
public interface ProfileMvpPresenter<V extends ProfileBaseView> extends MvpPresenter<V> {

}
