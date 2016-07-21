package im.actor.sdk.view.emoji.keyboard;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.net.Uri;
import android.os.Build;
import android.provider.Settings;
import android.support.annotation.NonNull;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.view.Gravity;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.TextView;

import im.actor.sdk.R;
import im.actor.runtime.Log;

public class BaseKeyboard implements
        ViewTreeObserver.OnGlobalLayoutListener {


    private static final String TAG = "BaseKeyboard";
    protected Activity activity;
    private View decorView;
    private boolean softKeyboardListeningEnabled = true;
    private InputMethodManager inputMethodManager;
    private View emojiKeyboardView;
    protected EditText messageBody;
    public static final int OVERLAY_PERMISSION_REQ_CODE = 735;


    private KeyboardStatusListener keyboardStatusListener;

    final WindowManager windowManager;
    int keyboardHeight = 0;

    private boolean showing;
    private boolean dismissed;
    private boolean softwareKeyboardShowing;

    public BaseKeyboard(Activity activity) {
        this.activity = activity;
        this.windowManager = activity.getWindowManager();
        this.inputMethodManager = (InputMethodManager) activity.getSystemService(Context.INPUT_METHOD_SERVICE);
        this.decorView = activity.getWindow().getDecorView();
        decorView.getViewTreeObserver().addOnGlobalLayoutListener(this);
        keyboardHeight = (int) activity.getResources().getDimension(R.dimen.keyboard_height);
    }


    public int getHeight() {
        return keyboardHeight;
    }

    public void setKeyboardStatusListener(KeyboardStatusListener keyboardStatusListener) {
        this.keyboardStatusListener = keyboardStatusListener;
    }


    public void show(EditText messageBody) {
        this.messageBody = messageBody;

        showing = true;
        dismissed = false;
        inputMethodManager.showSoftInput(messageBody, InputMethodManager.SHOW_IMPLICIT);
        if (softwareKeyboardShowing) {
            showInternal();
        } else {
            messageBody.setFocusableInTouchMode(true);
            messageBody.requestFocus();
            inputMethodManager.showSoftInput(messageBody, InputMethodManager.SHOW_IMPLICIT);
        }

    }

    private void showInternal() {
        //Check
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if (!Settings.canDrawOverlays(activity)) {
                Intent intent = new Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
                        Uri.parse("package:" + activity.getPackageName()));
                activity.startActivityForResult(intent, OVERLAY_PERMISSION_REQ_CODE);
            } else {
                showChecked();
            }
        } else {
            showChecked();
        }
    }

    public void showChecked() {
        if (showing == (emojiKeyboardView != null)) {
            return;
        }
        emojiKeyboardView = createView();
        WindowManager.LayoutParams params = new WindowManager.LayoutParams(
                WindowManager.LayoutParams.MATCH_PARENT,
                keyboardHeight,
                WindowManager.LayoutParams.TYPE_PHONE,
                WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE,
                PixelFormat.TRANSLUCENT);

        params.gravity = Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL;
        windowManager.addView(emojiKeyboardView, params);

        if (keyboardStatusListener != null)
            keyboardStatusListener.onShow();
        onShow();
    }

    private void update() {
        if (emojiKeyboardView != null) {
            WindowManager.LayoutParams params = new WindowManager.LayoutParams(
                    WindowManager.LayoutParams.MATCH_PARENT,
                    (keyboardHeight),
                    WindowManager.LayoutParams.TYPE_PHONE,
                    WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE,
                    PixelFormat.TRANSLUCENT);
            params.gravity = Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL;
            windowManager.updateViewLayout(emojiKeyboardView, params);
        } else {

        }
    }

    public void dismiss() {
        dismissed = true;
        showing = false;
        dismissInternally();
    }

    private void dismissInternally() {
        if (dismissed && emojiKeyboardView != null) {
            final View emojiKeyboardViewCopy = emojiKeyboardView;
            emojiKeyboardViewCopy.setVisibility(View.GONE);
            windowManager.removeView(emojiKeyboardViewCopy);
            showing = false;
            emojiKeyboardView = null;
            if (keyboardStatusListener != null)
                keyboardStatusListener.onDismiss();
            onDismiss();
        }
    }


    public void toggle(EditText messageBody) {
        if (isShowing()) {
            dismiss();
        } else {
            show(messageBody);
        }
    }

    public boolean isShowing() {
        return emojiKeyboardView != null;
    }


    public void destroy() {
        showing = false;
        dismissed = true;
        if (emojiKeyboardView != null) {
            windowManager.removeView(emojiKeyboardView);
            emojiKeyboardView = null;
        }
        if (keyboardStatusListener != null) {
            keyboardStatusListener.onDismiss();
        }
    }

    @Override
    public void onGlobalLayout() {
        Log.d(TAG, "onGlobalLayout");
        if (!softKeyboardListeningEnabled) {
            return;
        }
        Rect r = new Rect();
        decorView.getWindowVisibleDisplayFrame(r);

        int screenHeight = decorView.getRootView()
                .getHeight();
        int heightDifference = screenHeight
                - (r.bottom - r.top);
        int resourceId = activity.getResources()
                .getIdentifier("status_bar_height",
                        "dimen", "android");
        if (resourceId > 0) {
            heightDifference -= activity.getResources()
                    .getDimensionPixelSize(resourceId);
        }
        int orientation = activity.getResources().getConfiguration().orientation;

        int id = activity.getResources().getIdentifier("config_showNavigationBar", "bool", "android");
        if (id > 0) {
            if (activity.getResources().getBoolean(id)) {
                int navbarResId = activity.getResources()
                        .getIdentifier(
                                orientation == Configuration.ORIENTATION_PORTRAIT ? "navigation_bar_height" : "navigation_bar_height_landscape",
                                "dimen", "android");
                if (navbarResId > 0) {
                    heightDifference -= activity.getResources()
                            .getDimensionPixelSize(navbarResId);
                }
            }
        }

        if (heightDifference > 100) {
            Log.d(TAG, "onGlobalLayout: " + heightDifference);
            softwareKeyboardShowing = true;
            keyboardHeight = heightDifference;
            Log.d(TAG, "onGlobalLayout: " + "showing");

            showInternal();
        } else {
            Log.d(TAG, "onGlobalLayout: " + heightDifference);
            Log.d(TAG, "onGlobalLayout: " + "dismiss?");
            softwareKeyboardShowing = false;
            dismissed = true;
            dismissInternally();
        }
    }

    public Activity getActivity() {
        return activity;
    }

    protected void onDismiss() {
    }

    protected void onShow() {
    }

    protected View createView() {
        TextView view = new TextView(activity);
        view.setText("");
        view.setGravity(Gravity.CENTER);
        view.setBackgroundColor(0xffdadddf);
        return view;
    }
}
