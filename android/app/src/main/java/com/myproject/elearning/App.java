
package com.myproject.elearning;

import android.app.Application;

import com.androidnetworking.AndroidNetworking;
import com.androidnetworking.interceptors.HttpLoggingInterceptor.Level;
import com.myproject.elearning.dagger.component.ApplicationComponent;
import com.myproject.elearning.dagger.component.DaggerApplicationComponent;
import com.myproject.elearning.dagger.module.ApplicationModule;
import com.myproject.elearning.data.DataManager;
import com.myproject.elearning.utils.AppLogger;

import javax.inject.Inject;


/**
 * Created by Nhat on 12/13/17.
 */


public class App extends Application {

    @Inject
    DataManager mDataManager;

    //@Inject
    //CalligraphyConfig mCalligraphyConfig;

    private ApplicationComponent mApplicationComponent;

    @Override
    public void onCreate() {
        super.onCreate();

        mApplicationComponent = DaggerApplicationComponent.builder()
                .applicationModule(new ApplicationModule(this)).build();

        mApplicationComponent.inject(this);

        AppLogger.init();

        AndroidNetworking.initialize(getApplicationContext());
        if (BuildConfig.DEBUG) {
            AndroidNetworking.enableLogging(Level.BODY);
        }

        //CalligraphyConfig.initDefault(mCalligraphyConfig);
    }

    public ApplicationComponent getComponent() {
        return mApplicationComponent;
    }


    // Needed to replace the component with a test specific one
    public void setComponent(ApplicationComponent applicationComponent) {
        mApplicationComponent = applicationComponent;
    }
}
