import React from 'react';
import PropTypes from 'prop-types';
import { Waypoint } from 'react-waypoint';

class InfiniteScrolling extends React.Component {
  loadMoreButton() {
    const { loadItems, isLastPage } = this.props;

    if (isLastPage) return null;

    return <Waypoint onEnter={loadItems} />;
  }

  render() {
    const { items, renderItem } = this.props;

    if (items.length === 0) { return null; }

    return (
      <>
        { items.map((item, index) => renderItem(item, index)) }

        { this.loadMoreButton() }
      </>
    );
  }
}

InfiniteScrolling.propTypes = {
  isLastPage: PropTypes.bool,
  items: PropTypes.array,
  loadItems: PropTypes.func,
  renderItem: PropTypes.func,
};

export default InfiniteScrolling;
