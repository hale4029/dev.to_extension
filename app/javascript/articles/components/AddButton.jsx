import { h, Component } from 'preact';
import PropTypes from 'prop-types';
import { articlePropTypes } from '../../src/components/common-prop-types';

export class AddButton extends Component {
  componentDidMount() {
    const { isBookmarked } = this.props;
    this.setState({ buttonText: isBookmarked ? '-' : '+' });
  }

  render() {
    const { buttonText } = this.state;
    const { article, isBookmarked, onClick } = this.props;
    const mouseOut = _e => {
      this.setState({ buttonText: isBookmarked ? '-' : '+' });
    };
    const mouseOver = _e => {
      if (isBookmarked) {
        this.setState({ buttonText: 'UNSAVE' });
      }
    };

    if (article.class_name === 'Article') {
      return (
        <button
          type="button"
          className={`article-engagement-count engage-button_2 collection-button ${
            isBookmarked ? 'selected' : ''
          }`}
          data-initial-feed
          data-reactable-id={article.id}
          onClick={onClick}
          onMouseOver={mouseOver}
          onFocus={mouseOver}
          onMouseout={mouseOut}
          onBlur={mouseOut}
        >
          <span className={isBookmarked ? 'collection-success' : 'collection-initial'}>
            {buttonText}
          </span>
        </button>
      );
    }
    if (article.class_name === 'User') {
      return (
        <button
          type="button"
          style={{ width: '122px' }}
          className="article-engagement-count engage-button_2 follow-action-button"
          data-info={`{"id":${article.id},"className":"User"}`}
          data-follow-action-button
        >
          &nbsp;
        </button>
      );
    }

    return null;
  }
}

AddButton.propTypes = {
  article: articlePropTypes.isRequired,
  isBookmarked: PropTypes.bool.isRequired,
  onClick: PropTypes.func.isRequired,
};

AddButton.displayName = 'AddButton';
