import { h, render } from 'preact';
import { getUserDataAndCsrfToken } from '../chat/util';
// load reading list PORO
import { ReadingList } from '../readingList/readingList';

// load user's reading list and tags associated with them
function loadElement() {
  getUserDataAndCsrfToken().then(({ currentUser }) => {
    const root = document.getElementById('reading-list');
    if (root) {
      render(
        <ReadingList
          availableTags={currentUser.followed_tag_names}
          statusView={root.dataset.view}
        />,
        root,
        root.firstElementChild,
      );
    }
  });
}

window.InstantClick.on('change', () => {
  loadElement();
});

loadElement();
