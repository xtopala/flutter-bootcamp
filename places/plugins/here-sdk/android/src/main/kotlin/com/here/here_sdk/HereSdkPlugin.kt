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

package com.here.here_sdk

import android.content.Context
import android.os.Build
import androidx.annotation.RequiresApi
import com.here.sdk.mapview.MapController
import com.here.sdk.mapview.MapView
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry.Registrar
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory


@RequiresApi(Build.VERSION_CODES.ICE_CREAM_SANDWICH)
class HereSdkPlugin(private val registrar: Registrar) :
        PlatformViewFactory(StandardMessageCodec.INSTANCE),
        MethodChannel.MethodCallHandler {
    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "com.here.flutter/here_sdk")

            val hereSdkPlugin = HereSdkPlugin(registrar)
            channel.setMethodCallHandler(hereSdkPlugin)
            registrar.platformViewRegistry()
                    .registerViewFactory("com.here.flutter/here_sdk", hereSdkPlugin)
        }
    }


    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        return MapController(viewId, registrar, MapView(context))
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            else -> result.notImplemented()
        }
    }
}
