
package com.myproject.elearning.dagger.component;

import android.app.Application;
import android.content.Context;

import com.myproject.elearning.App;
import com.myproject.elearning.data.DataManager;
import com.myproject.elearning.dagger.ApplicationContext;
import com.myproject.elearning.dagger.module.ApplicationModule;
import com.myproject.elearning.service.SyncService;

import javax.inject.Singleton;

import dagger.Component;

/**
 * Created by Nhat on 12/13/17.
 */


@Singleton
@Component(modules = ApplicationModule.class)
public interface ApplicationComponent {

    void inject(App app);

    void inject(SyncService service);

    @ApplicationContext
    Context context();

    Application application();

    DataManager getDataManager();
}