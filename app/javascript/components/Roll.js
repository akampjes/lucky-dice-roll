import React from "react"
import PropTypes from "prop-types"
class Roll extends React.Component {
  render () {
    return (
      <div>
        <div>Result: {this.props.result}</div>
      </div>
    );
  }
}

Roll.propTypes = {
  result: PropTypes.number,
  success: PropTypes.bool
};
export default Roll
