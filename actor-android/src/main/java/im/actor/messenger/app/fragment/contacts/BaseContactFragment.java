package im.actor.messenger.app.fragment.contacts;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.SearchView;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import im.actor.messenger.R;
import im.actor.messenger.app.activity.HelpActivity;
import im.actor.messenger.app.fragment.DisplayListFragment;
import im.actor.messenger.app.view.Fonts;
import im.actor.messenger.app.view.OnItemClickedListener;
import im.actor.messenger.util.Screen;
import im.actor.model.android.view.BindedListAdapter;
import im.actor.model.entity.Contact;
import im.actor.model.mvvm.BindedDisplayList;

import static im.actor.messenger.app.Core.messenger;

/**
 * Created by ex3ndr on 23.09.14.
 */
public abstract class BaseContactFragment extends DisplayListFragment<Contact, ContactHolder> {

    private final boolean useCompactVersion;
    private final boolean userSearch;

    public BaseContactFragment(boolean useCompactVersion, boolean userSearch) {
        this.useCompactVersion = useCompactVersion;
        this.userSearch = userSearch;
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View res = inflate(inflater, container, R.layout.fragment_base_contacts, messenger().buildContactDisplayList());

        if (useCompactVersion) {
            View header = new View(getActivity());
            header.setLayoutParams(new RecyclerView.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Screen.dp(4)));
            addHeaderView(header);
        } else {
            TextView header = new TextView(getActivity());
            header.setBackgroundColor(getResources().getColor(R.color.bg_grey));
            header.setText(R.string.contacts_title);
            header.setTypeface(Fonts.bold());
            header.setPadding(Screen.dp(16), 0, 0, 0);
            header.setGravity(Gravity.LEFT | Gravity.CENTER_VERTICAL);
            header.setTextSize(16);
            header.setTextColor(getResources().getColor(R.color.text_subheader));

            LinearLayout headerCont = new LinearLayout(getActivity());
            headerCont.setBackgroundColor(getResources().getColor(R.color.bg_light));
            headerCont.setOrientation(LinearLayout.VERTICAL);
            headerCont.addView(header, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Screen.dp(48)));
            headerCont.setLayoutParams(new RecyclerView.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            addHeaderView(headerCont);

            FrameLayout footer = new FrameLayout(getActivity());
            footer.setBackgroundColor(getResources().getColor(R.color.bg_grey));
            footer.setLayoutParams(new RecyclerView.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Screen.dp(112)));
            ImageView shadow = new ImageView(getActivity());
            shadow.setImageResource(R.drawable.card_shadow_bottom);
            shadow.setScaleType(ImageView.ScaleType.FIT_XY);
            shadow.setLayoutParams(new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Screen.dp(4)));
            footer.addView(shadow);

            addFooterView(footer);
        }

        return res;
    }

    @Override
    protected BindedListAdapter<Contact, ContactHolder> onCreateAdapter(BindedDisplayList<Contact> displayList, Activity activity) {
        return new ContactsAdapter(displayList, activity, false, new OnItemClickedListener<Contact>() {
            @Override
            public void onClicked(Contact item) {
                onItemClicked(item);
            }

            @Override
            public boolean onLongClicked(Contact item) {
                return onItemLongClicked(item);
            }
        });
    }

    public void onItemClicked(Contact contact) {

    }

    public boolean onItemLongClicked(Contact contact) {
        return false;
    }

    // Search menu

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        super.onCreateOptionsMenu(menu, inflater);
        if (userSearch) {
            inflater.inflate(R.menu.compose, menu);

            SearchView searchView = (SearchView) menu.findItem(R.id.search).getActionView();

            searchView.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
                @Override
                public boolean onQueryTextSubmit(String query) {
                    return false;
                }

                @Override
                public boolean onQueryTextChange(String newText) {
                    String normalized = newText.trim();
                    if (normalized.length() == 0) {
                        getDisplayList().initTop(false);
                    } else {
                        getDisplayList().initSearch(normalized, false);
                    }
                    ((ContactsAdapter) getAdapter()).setQuery(normalized.toLowerCase());
                    return true;
                }
            });
        }
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (userSearch) {
            if (item.getItemId() == R.id.help) {
                startActivity(new Intent(getActivity(), HelpActivity.class));
                return true;
            }
        }
        return super.onOptionsItemSelected(item);
    }
}
