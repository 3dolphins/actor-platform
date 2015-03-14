package im.actor.messenger.app.fragment.contacts;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.FrameLayout;
import android.widget.TextView;

import im.actor.messenger.R;
import im.actor.messenger.app.view.AvatarDrawable;
import im.actor.messenger.app.view.AvatarView;
import im.actor.messenger.app.view.Fonts;
import im.actor.messenger.util.Screen;
import im.actor.model.entity.Contact;

/**
 * Created by ex3ndr on 15.03.15.
 */
public class ContactHolder extends RecyclerView.ViewHolder {

    private int padding = Screen.dp(16);

    private AvatarView avatar;
    private TextView title;

    private TextView fastTitle;

    private CheckBox isSelected;

    private FrameLayout cont;

    private Context context;
    private boolean isSelectable;

    public ContactHolder(FrameLayout fl, boolean isSelectable, Context context) {
        super(fl);

        this.context = context;
        this.isSelectable = isSelectable;

        fl.setBackgroundColor(context.getResources().getColor(R.color.bg_light));

        cont = new FrameLayout(context);

        {
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Screen.dp(64));
            layoutParams.leftMargin = Screen.dp(40);
            fl.addView(cont, layoutParams);
        }

        cont.setBackgroundResource(R.drawable.selector);

        avatar = new AvatarView(context);
        {
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(Screen.dp(52), Screen.dp(52));
            layoutParams.leftMargin = Screen.dp(6);
            layoutParams.topMargin = Screen.dp(6);
            layoutParams.bottomMargin = Screen.dp(6);
            layoutParams.gravity = Gravity.CENTER_VERTICAL | Gravity.LEFT;
            cont.addView(avatar, layoutParams);
        }

        fastTitle = new TextView(context);
        fastTitle.setTextColor(context.getResources().getColor(R.color.primary));
        fastTitle.setTextSize(18);
        fastTitle.setGravity(Gravity.CENTER);
        fastTitle.setTypeface(Fonts.regular());
        {
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(Screen.dp(40), ViewGroup.LayoutParams.WRAP_CONTENT);
            layoutParams.leftMargin = Screen.dp(6);
            layoutParams.gravity = Gravity.CENTER_VERTICAL;
            fl.addView(fastTitle, layoutParams);
        }

        title = new TextView(context);
        title.setTextColor(context.getResources().getColor(R.color.text_primary));
        title.setPadding(Screen.dp(72), 0, (isSelectable ? Screen.dp(64) : 0) + Screen.dp(8), 0);
        title.setTextSize(16);
        title.setSingleLine(true);
        title.setEllipsize(TextUtils.TruncateAt.END);
        title.setTypeface(Fonts.regular());
        {
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            layoutParams.gravity = Gravity.CENTER_VERTICAL;
            layoutParams.topMargin = padding;
            layoutParams.bottomMargin = padding;
            cont.addView(title, layoutParams);
        }

        if (isSelectable) {
            isSelected = new CheckBox(context);
            isSelected.setClickable(false);
            isSelected.setFocusable(false);
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            layoutParams.gravity = Gravity.CENTER_VERTICAL | Gravity.RIGHT;
            layoutParams.rightMargin = padding;
            cont.addView(isSelected, layoutParams);
        }

        View div = new View(context);
        div.setBackgroundColor(context.getResources().getColor(R.color.divider));
        {
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                    context.getResources().getDimensionPixelSize(R.dimen.div_size));
            layoutParams.gravity = Gravity.BOTTOM;
            layoutParams.leftMargin = Screen.dp(72);
            cont.addView(div, layoutParams);
        }
    }

    public void bind(Contact data) {
        String shortName = getFastName(data.getName());

        fastTitle.setVisibility(View.VISIBLE);
        fastTitle.setText(shortName);
//        if (position == 0) {
//            fastTitle.setVisibility(View.VISIBLE);
//            fastTitle.setText(shortName);
//        } else {
//            Contact contact = getUiList().getItem(position - 1);
//            String prevShortName = getFastName(contact.getName());
//            if (shortName.equals(prevShortName)) {
//                fastTitle.setVisibility(View.GONE);
//            } else {
//                fastTitle.setVisibility(View.VISIBLE);
//                fastTitle.setText(shortName);
//            }
//        }

        avatar.setEmptyDrawable(new AvatarDrawable(data.getName(),
                data.getUid(), 24, context));

        if (data.getAvatar() != null) {
            avatar.bindAvatar(Screen.dp(54), data.getAvatar());
        } else {
            avatar.unbind();
        }

        title.setText(data.getName());

//        if (query.length() > 0) {
//            title.setText(SearchHighlight.highlightQuery(data.getName(), query, 0xff0277bd));
//        } else {
//            title.setText(data.getName());
//        }
//
//        if (selectable) {
//            isSelected.setChecked(selectedUsers.contains(data.getUid()));
//        }

//        cont.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//                onItemClickedListener.onClicked(data);
//            }
//        });
//
//        if (onItemLongClickedListener != null) {
//            cont.setOnLongClickListener(new View.OnLongClickListener() {
//                @Override
//                public boolean onLongClick(View v) {
//                    onItemLongClickedListener.onClicked(data);
//                    return true;
//                }
//            });
//        }
    }

    public void unbind() {
        avatar.unbind();
    }

    private static String getFastName(String name) {
        if (name.length() > 1) {
            if (Character.isLetter(name.charAt(0))) {
                return name.substring(0, 1).toUpperCase();
            } else {
                return "#";
            }
        } else {
            return "#";
        }
    }
}
