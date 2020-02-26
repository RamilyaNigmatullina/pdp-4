import React from 'react';
import PropTypes from 'prop-types';
import Loader from 'react-loader-spinner';
import { Waypoint } from 'react-waypoint';

class InfiniteScrolling extends React.Component {
  loadMoreButton() {
    const { loadItems, isLastPage } = this.props;

    if (isLastPage) return null;

    return <Waypoint onEnter={loadItems} >
      <div className="text-center">
        <Loader type="TailSpin" color="#E2E2E2" height={20} width={20} />
      </div>
    </Waypoint>;
  }

  render() {
    const { items, renderItem } = this.props;

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
