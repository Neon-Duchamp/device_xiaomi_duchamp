/*
 * SPDX-FileCopyrightText: 2024 The LineageOS Project
 * SPDX-License-Identifier: Apache-2.0
 */

package org.lineageos.sofod.duchamp;

import android.app.Service;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.SystemProperties;
import android.os.UserHandle;
import android.provider.Settings.Secure;

public class SOFODServiceDuchamp extends Service {
    private static final String TAG = "SOFODServiceDuchamp";
    private static final String SOFOD_SETTING = "screen_off_udfps_enabled";
    private static final String PROP_SO_FOD_ENABLED = "persist.sys.duchamp.sofod";

    private Context mContext;
    private Handler mHandler;
    private CustomSettingsObserver mCustomSettingsObserver;

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public void onDestroy() {
        if (mCustomSettingsObserver != null) {
            mContext.getContentResolver().unregisterContentObserver(mCustomSettingsObserver);
        }
        super.onDestroy();
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        mContext = this;
        mHandler = new Handler(Looper.getMainLooper());
        mCustomSettingsObserver = new CustomSettingsObserver(mHandler);
        mCustomSettingsObserver.observe();
        mCustomSettingsObserver.update();
        return START_STICKY;
    }

    private class CustomSettingsObserver extends ContentObserver {
        CustomSettingsObserver(Handler handler) {
            super(handler);
        }

        void observe() {
            ContentResolver resolver = mContext.getContentResolver();
            resolver.registerContentObserver(
                Secure.getUriFor(SOFOD_SETTING),
                false,
                this,
                UserHandle.USER_CURRENT
            );
        }

        void update() {
            int value = Secure.getInt(mContext.getContentResolver(), SOFOD_SETTING, 0);
            boolean enabled = value == 1;
            SystemProperties.set(PROP_SO_FOD_ENABLED, enabled ? "1" : "0");
        }

        @Override
        public void onChange(boolean selfChange, Uri uri) {
            if (uri.equals(Secure.getUriFor(SOFOD_SETTING))) {
                update();
            }
        }
    }
}
