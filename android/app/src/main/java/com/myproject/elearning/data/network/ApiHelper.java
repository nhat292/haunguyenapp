
package com.myproject.elearning.data.network;

import com.myproject.elearning.data.network.model.BlogResponse;
import com.myproject.elearning.data.network.model.LoginRequest;
import com.myproject.elearning.data.network.model.LoginResponse;

import io.reactivex.Observable;

/**
 * Created by Nhat on 12/13/17.
 */


public interface ApiHelper {

    ApiHeader getApiHeader();

    Observable<LoginResponse> doGoogleLoginApiCall(LoginRequest.GoogleLoginRequest request);

    Observable<LoginResponse> doFacebookLoginApiCall(LoginRequest.FacebookLoginRequest request);

    Observable<LoginResponse> doServerLoginApiCall(LoginRequest.ServerLoginRequest request);

    Observable<BlogResponse> getBlogApiCall();

}
