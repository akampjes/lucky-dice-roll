import React from "react"
import PropTypes from "prop-types"
import Roll from './Roll'

class Play extends React.Component {

  rolls() {
    this.props.rolls.map((roll) => {
      return (
        <Roll roll={roll.result} success={roll.success}>
        </Roll>
      );
    });
  }

  point_difference() {
    return this.props.current_points - this.props.start_points;
  }

  roll() {
    console.log('clicked roll');
  }

  render () {
    console.log(this.props);

    return (
      <div>
        <div>Flybuys Number: {this.props.flybuys_number}</div>
        <div>Start points: {this.props.current_points}</div>
        <div>Current points: {this.props.current_points}</div>
        <div>Points difference: {this.point_difference()}</div>
        <div>Bet: {this.props.bet}</div>
        {this.rolls()}
        <button onClick={() => this.roll() } >Roll me</button>
      </div>
    );
  }
}

Play.propTypes = {
  flybuysNumber: PropTypes.string
};
export default Play
