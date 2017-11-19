import React from "react"
import PropTypes from "prop-types"
import Roll from './Roll'
import NewPlay from './NewPlay'

class Play extends React.Component {

  rolls() {
    return this.props.rolls.map(roll => {
      return (
        <Roll result={roll.result} success={roll.success} />
      );
    });
  }

  point_difference() {
    return this.props.current_points - this.props.start_points;
  }

  roll() {
    console.log('clicked roll');
    let data = {};

    Rails.ajax({
      type: "POST",
      url: "/roll.json",
      data: data,
      success: function(response){
        //console.log("SUCCESS!!");
        window.location.reload();
      },
      error: function(repsonse){
        console.log("There was an error");
        console.log(response);
      }
    })

  }

  finished() {
    if(this.props.finished) {
      return(
        <div>
          <div>Game Over</div>
          <NewPlay/>
        </div>
      );
    } else {
      return(
        <button onClick={() => this.roll() } >Roll me</button>
      );
    }
  }

  render () {
    console.log(this.props);

    return (
      <div>
        <div>Flybuys Number: {this.props.flybuys_number}</div>
        <div>Start points: {this.props.start_points}</div>
        <div>Current points: {this.props.current_points}</div>
        <div>Points difference: {this.point_difference()}</div>
        <div>Bet: {this.props.bet}</div>
        {this.rolls()}
        {this.finished()}
      </div>
    );
  }
}

Play.propTypes = {
  flybuysNumber: PropTypes.string
};
export default Play
