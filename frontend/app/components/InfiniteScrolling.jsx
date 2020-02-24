import React from 'react';
import PropTypes from 'prop-types';
import { Waypoint } from 'react-waypoint';

class InfiniteScrolling extends React.Component {
  loadMoreButton() {
    const { loadItems, isLastPage } = this.props;

    if (isLastPage) return null;

    return <Waypoint onEnter={loadItems} >
      <div className="text-center">
        <a href="#" className="text-muted" onClick={loadItems}>loading...</a>
      </div>
    </Waypoint>;
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
  isLastPage: PropTypes.bool.isRequired,
  items: PropTypes.array.isRequired,
  loadItems: PropTypes.func.isRequired,
  renderItem: PropTypes.func.isRequired,
};

export default InfiniteScrolling;
