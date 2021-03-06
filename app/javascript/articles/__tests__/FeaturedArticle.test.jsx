import { h } from 'preact';
import render from 'preact-render-to-json';
import { featuredArticle, assetPath } from './utilities/articleUtilities';
import '../../../assets/javascripts/lib/xss';
import '../../../assets/javascripts/utilities/timeAgo';
import { FeaturedArticle } from '../FeaturedArticle';

const commonProps = {
  reactionsIcon: assetPath('reactions-stack.png'),
  commentsIcon: assetPath('comments-bubble.png'),
};

describe('<FeaturedArticle /> component', () => {
  it('should render a standard article', () => {
    const tree = render(
      <FeaturedArticle
        {...commonProps}
        isBookmarked={false}
        article={featuredArticle}
        currentTag="javascript"
      />,
    );
    expect(tree).toMatchSnapshot();
  });

  it('should render a bookmarked featured article', () => {
    const tree = render(
      <FeaturedArticle
        {...commonProps}
        isBookmarked
        article={featuredArticle}
        currentTag="javascript"
      />,
    );
    expect(tree).toMatchSnapshot();
  });
});
