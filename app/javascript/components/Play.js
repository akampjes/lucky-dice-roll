import React from "react"
import PropTypes from "prop-types"
class Play extends React.Component {
  render () {
    console.log(this.props);

    return (
      <div>
        <div>Flybuys Number: {this.props.flybuys_number}</div>
        <div>Current points: {this.props.points}</div>
        <button>Roll me</button>
      </div>
    );
  }
}

Play.propTypes = {
  flybuysNumber: PropTypes.string
};
export default Play
