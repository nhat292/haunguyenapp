
package com.myproject.elearning.dagger.component;

import com.myproject.elearning.dagger.PerService;
import com.myproject.elearning.dagger.module.ServiceModule;
import com.myproject.elearning.service.SyncService;

import dagger.Component;

/**
 * Created by Nhat on 12/13/17.
 */


@PerService
@Component(dependencies = ApplicationComponent.class, modules = ServiceModule.class)
public interface ServiceComponent {

    void inject(SyncService service);

}
