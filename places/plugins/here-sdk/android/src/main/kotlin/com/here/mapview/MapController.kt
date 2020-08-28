/*
 * Copyright (c) 2018-2020 HERE Global B.V. and its affiliate(s).
 * All rights reserved.
 *
 * This software and other materials contain proprietary information
 * controlled by HERE and are protected by applicable copyright legislation.
 * Any use and utilization of this software and other materials and
 * disclosure to any third parties is conditional upon having a separate
 * agreement with HERE for the access, use, utilization or disclosure of this
 * software. In the absence of such agreement, the use of the software is not
 * allowed.
 */

package com.here.sdk.mapview

import android.app.Activity
import android.app.Application
import android.os.Bundle
import android.view.View
import android.util.Log
import com.here.NativeBase
import com.here.sdk.mapview.MapView
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugin.platform.PlatformView
import java.lang.reflect.Field
import java.lang.reflect.Method


class MapController(private val id: Int,
                    private val registrar: PluginRegistry.Registrar,
                    private val mapView: MapView) : MethodChannel.MethodCallHandler, PlatformView,  Application.ActivityLifecycleCallbacks {

    init {
        val channel = MethodChannel(registrar.messenger(), "com.here.flutter/here_sdk_$id")
        channel.setMethodCallHandler(this)
        mapView.onCreate(null)
        mapView.onResume()
        registrar.activity().application.registerActivityLifecycleCallbacks(this)
    }

    fun getMapViewInternalPointer(): Long {
        var pointer: Long = 0;
        try {
            val mapviewInternalField: Field = mapView::class.java.getDeclaredField("mMapViewInternal")
            mapviewInternalField.isAccessible = true
            val mapViewInternal: NativeBase = mapviewInternalField.get(mapView) as NativeBase
            val nativeHandleField: Field = NativeBase::class.java.getDeclaredField("nativeHandle")
            nativeHandleField.isAccessible = true
            pointer = nativeHandleField.get(mapViewInternal) as Long;
        }
        catch (t: Throwable) {
            Log.e("HERE_SDK", "Internal error when trying to initialize map: ${t.message}", t)
            // just return 0
        }
        finally {
            return pointer;
        }
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "initialize") {
            result.success(getMapViewInternalPointer());
        } else {
            result.notImplemented()
        }
    }

    override fun getView(): View {
        return mapView
    }

    override fun dispose() {
        mapView.onDestroy()
        registrar.activity().application.unregisterActivityLifecycleCallbacks(this)
    }

    override fun onActivityPaused(activity: Activity?) {
        mapView.onPause()
    }

    override fun onActivityResumed(activity: Activity?) {
        mapView.onResume()
    }

    override fun onActivityStarted(activity: Activity?) {
        // (re)create rendering surface
        mapView.createSurface()
    }

    override fun onActivityDestroyed(activity: Activity?) {
        // mapView.onDestroy() is called in dispose() already
    }

    override fun onActivitySaveInstanceState(activity: Activity?, bundle: Bundle?) {
        mapView.onSaveInstanceState(bundle)
    }

    override fun onActivityStopped(activity: Activity?) {
        // destroy rendering surface
        mapView.destroySurface()
    }

    override fun onActivityCreated(activity: Activity?, bundle: Bundle?) {
        mapView.onCreate(bundle)
    }
}